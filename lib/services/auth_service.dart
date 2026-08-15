import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart';
import 'user_service.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart'
    show SignInWithApple, AppleIDAuthorizationScopes;

class AuthUser {
  final String uid;
  final String? email;
  final User? _sdkUser;

  const AuthUser._({required this.uid, this.email, User? sdkUser})
    : _sdkUser = sdkUser;

  Future<void> delete() async {
    if (_sdkUser != null) {
      await _sdkUser.delete();
    } else {
      await AuthService._desktopDeleteAccount();
    }
  }
}

class AuthService {
  static const _desktopApiKey = 'AIzaSyDagxbLCjjUSnEG-KpiPyrXVKSb9i6cxXQ';

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    serverClientId:
        '670852401318-1g70oikt58ouipfc09re6ik60odu5vhs.apps.googleusercontent.com',
  );

  static final _desktopUserCtrl = StreamController<AuthUser?>.broadcast();
  static AuthUser? _desktopUser;
  static String? _desktopIdToken;
  static String? _desktopRefreshToken;
  static DateTime? _desktopTokenExpiry;

  static bool get _usesDesktopAuth => Platform.isWindows || Platform.isLinux;

  static const _linuxGoogleClientId = String.fromEnvironment(
    'GOOGLE_DESKTOP_CLIENT_ID',
    defaultValue:
        '670852401318-8hcni7869tgj4fhl2oolbqnrqqhc6qop.apps.googleusercontent.com',
  );
  static const _linuxCallbackPort = 8123;

  static bool get linuxGoogleAvailable => _linuxGoogleClientId.isNotEmpty;

  static Stream<AuthUser?> get userStream {
    if (_usesDesktopAuth) {
      return Stream<AuthUser?>.multi((controller) {
        controller.add(_desktopUser);
        final sub = _desktopUserCtrl.stream.listen(
          controller.add,
          onError: controller.addError,
          onDone: controller.close,
        );
        controller.onCancel = sub.cancel;
      });
    }
    return _auth.authStateChanges().map(
      (u) =>
          u == null ? null : AuthUser._(uid: u.uid, email: u.email, sdkUser: u),
    );
  }

  static AuthUser? get currentUser {
    if (_usesDesktopAuth) return _desktopUser;
    final u = _auth.currentUser;
    return u == null
        ? null
        : AuthUser._(uid: u.uid, email: u.email, sdkUser: u);
  }

  static Future<String?> getIdToken() async {
    if (_usesDesktopAuth) {
      if (_desktopIdToken != null &&
          _desktopTokenExpiry != null &&
          DateTime.now().isAfter(
            _desktopTokenExpiry!.subtract(const Duration(minutes: 5)),
          )) {
        await _desktopRefreshIdToken();
      }
      return _desktopIdToken;
    }
    try {
      return await _auth.currentUser?.getIdToken();
    } catch (_) {
      return null;
    }
  }

  static Future<void> signInWithEmail(String email, String password) async {
    if (_usesDesktopAuth) {
      await _desktopEmailAuth(email, password, signUp: false);
      return;
    }
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> createAccountWithEmail(
    String email,
    String password,
  ) async {
    if (_usesDesktopAuth) {
      await _desktopEmailAuth(email, password, signUp: true);
      return;
    }
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> signInWithGoogle() async {
    if (Platform.isLinux) return _linuxGoogleSignIn();
    if (_usesDesktopAuth) {
      final provider = GoogleAuthProvider();
      final result = await _auth.signInWithProvider(provider);
      final user = result.user;
      if (user == null) return;
      _desktopIdToken = await user.getIdToken();
      _desktopRefreshToken = null;
      _desktopTokenExpiry = DateTime.now().add(const Duration(hours: 1));
      _desktopUser = AuthUser._(
        uid: user.uid,
        email: user.email,
        sdkUser: user,
      );
      _desktopUserCtrl.add(_desktopUser);
      return;
    }
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _auth.signInWithCredential(credential);
  }

  static String _randomVerifier() {
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';
    final rnd = Random.secure();
    return List.generate(64, (_) => chars[rnd.nextInt(chars.length)]).join();
  }

  static Future<void> _linuxGoogleSignIn() async {
    if (_linuxGoogleClientId.isEmpty) {
      throw Exception('google-signin-unavailable');
    }

    final verifier = _randomVerifier();
    final challenge = base64Url
        .encode(sha256.convert(ascii.encode(verifier)).bytes)
        .replaceAll('=', '');
    final redirectUri = 'http://localhost:$_linuxCallbackPort';

    final authUrl = Uri.https('accounts.google.com', '/o/oauth2/v2/auth', {
      'client_id': _linuxGoogleClientId,
      'redirect_uri': redirectUri,
      'response_type': 'code',
      'scope': 'openid email profile',
      'code_challenge': challenge,
      'code_challenge_method': 'S256',
      'prompt': 'select_account',
    });

    final result = await FlutterWebAuth2.authenticate(
      url: authUrl.toString(),
      callbackUrlScheme: redirectUri,
    );

    final params = Uri.parse(result).queryParameters;
    final code = params['code'];
    if (code == null) {
      if (params['error'] != null) throw Exception('google-signin-cancelled');
      return;
    }

    final res = await http
        .post(
          Uri.parse('${AppConstants.apiBase}/api/auth/desktop/google'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'code': code,
            'codeVerifier': verifier,
            'redirectUri': redirectUri,
          }),
        )
        .timeout(const Duration(seconds: 20));

    if (res.statusCode != 200) throw Exception('google-signin-failed');
    final body = jsonDecode(res.body) as Map<String, dynamic>;

    _desktopIdToken = body['idToken'] as String?;
    _desktopRefreshToken = body['refreshToken'] as String?;
    final expiresIn = int.tryParse(body['expiresIn']?.toString() ?? '') ?? 3600;
    _desktopTokenExpiry = DateTime.now().add(Duration(seconds: expiresIn));
    _desktopUser = AuthUser._(
      uid: body['localId'] as String,
      email: body['email'] as String?,
    );
    _desktopUserCtrl.add(_desktopUser);
  }

  static Future<void> signInWithApple() async {
    if (_usesDesktopAuth) {
      final provider = OAuthProvider('apple.com')
        ..addScope('email')
        ..addScope('name');
      final result = await _auth.signInWithProvider(provider);
      final user = result.user;
      if (user == null) return;
      _desktopIdToken = await user.getIdToken();
      _desktopRefreshToken = null;
      _desktopTokenExpiry = DateTime.now().add(const Duration(hours: 1));
      _desktopUser = AuthUser._(
        uid: user.uid,
        email: user.email,
        sdkUser: user,
      );
      _desktopUserCtrl.add(_desktopUser);
      return;
    }
    final rawNonce = _generateNonce();
    final nonce = _sha256(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final credential = OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
      rawNonce: rawNonce,
    );

    await _auth.signInWithCredential(credential);
  }

  static String _generateNonce([int length = 32]) {
    const chars =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => chars[random.nextInt(chars.length)],
    ).join();
  }

  static String _sha256(String input) {
    final bytes = utf8.encode(input);
    return sha256.convert(bytes).toString();
  }

  static Future<bool> sendPasswordResetEmail(String email) async {
    try {
      final res = await http
          .post(
            Uri.parse('${AppConstants.apiBase}/api/auth/password-reset'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'email': email.trim()}),
          )
          .timeout(const Duration(seconds: 10));
      return res.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  static Future<void> signOut() async {
    UserService.invalidateMe();
    if (_usesDesktopAuth) {
      _desktopUser = null;
      _desktopIdToken = null;
      _desktopRefreshToken = null;
      _desktopTokenExpiry = null;
      _desktopUserCtrl.add(null);
      return;
    }
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  static Future<void> _desktopEmailAuth(
    String email,
    String password, {
    required bool signUp,
  }) async {
    final endpoint = signUp ? 'accounts:signUp' : 'accounts:signInWithPassword';

    final res = await http
        .post(
          Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/$endpoint?key=$_desktopApiKey',
          ),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }),
        )
        .timeout(const Duration(seconds: 15));

    final body = jsonDecode(res.body) as Map<String, dynamic>;

    if (res.statusCode != 200) {
      final message =
          ((body['error'] as Map<String, dynamic>?)?['message'] as String?) ??
          '';
      throw _mapRestError(message, signUp: signUp);
    }

    _desktopIdToken = body['idToken'] as String?;
    _desktopRefreshToken = body['refreshToken'] as String?;
    final expiresIn = int.tryParse(body['expiresIn']?.toString() ?? '') ?? 3600;
    _desktopTokenExpiry = DateTime.now().add(Duration(seconds: expiresIn));
    _desktopUser = AuthUser._(
      uid: body['localId'] as String,
      email: (body['email'] as String?) ?? email,
    );
    _desktopUserCtrl.add(_desktopUser);
  }

  static Future<void> _desktopRefreshIdToken() async {
    final sdkUser = _desktopUser?._sdkUser;
    if (sdkUser != null) {
      try {
        _desktopIdToken = await sdkUser.getIdToken(true);
        _desktopTokenExpiry = DateTime.now().add(const Duration(hours: 1));
      } catch (_) {}
      return;
    }

    final refreshToken = _desktopRefreshToken;
    if (refreshToken == null) return;
    try {
      final res = await http
          .post(
            Uri.parse(
              'https://securetoken.googleapis.com/v1/token?key=$_desktopApiKey',
            ),
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body:
                'grant_type=refresh_token&refresh_token=${Uri.encodeComponent(refreshToken)}',
          )
          .timeout(const Duration(seconds: 15));
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        _desktopIdToken = body['id_token'] as String?;
        _desktopRefreshToken = body['refresh_token'] as String?;
        final expiresIn =
            int.tryParse(body['expires_in']?.toString() ?? '') ?? 3600;
        _desktopTokenExpiry = DateTime.now().add(Duration(seconds: expiresIn));
      }
    } catch (_) {}
  }

  static Future<void> _desktopDeleteAccount() async {
    final token = _desktopIdToken;
    if (token == null) return;
    try {
      await http
          .post(
            Uri.parse(
              'https://identitytoolkit.googleapis.com/v1/accounts:delete?key=$_desktopApiKey',
            ),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'idToken': token}),
          )
          .timeout(const Duration(seconds: 15));
    } catch (_) {}
    _desktopUser = null;
    _desktopIdToken = null;
    _desktopRefreshToken = null;
    _desktopTokenExpiry = null;
    _desktopUserCtrl.add(null);
  }

  static FirebaseAuthException _mapRestError(
    String message, {
    required bool signUp,
  }) {
    if (signUp) {
      if (message == 'EMAIL_EXISTS') {
        return FirebaseAuthException(code: 'email-already-in-use');
      }
      if (message.startsWith('WEAK_PASSWORD')) {
        return FirebaseAuthException(code: 'weak-password');
      }
      if (message == 'INVALID_EMAIL') {
        return FirebaseAuthException(code: 'invalid-email');
      }
      return FirebaseAuthException(code: 'unknown', message: message);
    }
    return switch (message) {
      'EMAIL_NOT_FOUND' ||
      'INVALID_PASSWORD' ||
      'INVALID_LOGIN_CREDENTIALS' ||
      'USER_NOT_FOUND' => FirebaseAuthException(code: 'invalid-credential'),
      'USER_DISABLED' => FirebaseAuthException(code: 'user-disabled'),
      'TOO_MANY_ATTEMPTS_TRY_LATER' => FirebaseAuthException(
        code: 'too-many-requests',
      ),
      'INVALID_EMAIL' => FirebaseAuthException(code: 'invalid-email'),
      _ => FirebaseAuthException(code: 'unknown', message: message),
    };
  }
}
