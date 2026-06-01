import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
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
      await AuthService._windowsDeleteAccount();
    }
  }
}

class AuthService {
  static const _windowsApiKey = 'AIzaSyDagxbLCjjUSnEG-KpiPyrXVKSb9i6cxXQ';

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    serverClientId: Platform.isAndroid
        ? null
        : '670852401318-1g70oikt58ouipfc09re6ik60odu5vhs.apps.googleusercontent.com',
  );

  static final _windowsUserCtrl = StreamController<AuthUser?>.broadcast();
  static AuthUser? _windowsUser;
  static String? _windowsIdToken;
  static String? _windowsRefreshToken;
  static DateTime? _windowsTokenExpiry;

  static Stream<AuthUser?> get userStream {
    if (Platform.isWindows) return _windowsUserCtrl.stream;
    return _auth.authStateChanges().map(
      (u) =>
          u == null ? null : AuthUser._(uid: u.uid, email: u.email, sdkUser: u),
    );
  }

  static AuthUser? get currentUser {
    if (Platform.isWindows) return _windowsUser;
    final u = _auth.currentUser;
    return u == null
        ? null
        : AuthUser._(uid: u.uid, email: u.email, sdkUser: u);
  }

  /// Returns a fresh Firebase ID token for use in API calls.
  /// On Windows, automatically refreshes the token when within 5 minutes
  /// of expiry (Firebase ID tokens last 1 hour).
  static Future<String?> getIdToken() async {
    if (Platform.isWindows) {
      if (_windowsIdToken != null &&
          _windowsTokenExpiry != null &&
          DateTime.now().isAfter(
            _windowsTokenExpiry!.subtract(const Duration(minutes: 5)),
          )) {
        await _windowsRefreshIdToken();
      }
      return _windowsIdToken;
    }
    try {
      return await _auth.currentUser?.getIdToken();
    } catch (_) {
      return null;
    }
  }

  static Future<void> signInWithEmail(String email, String password) async {
    if (Platform.isWindows) {
      await _windowsEmailAuth(email, password, signUp: false);
      return;
    }
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  static Future<void> createAccountWithEmail(
    String email,
    String password,
  ) async {
    if (Platform.isWindows) {
      await _windowsEmailAuth(email, password, signUp: true);
      return;
    }
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _auth.signInWithCredential(credential);
  }

  static Future<void> signInWithApple() async {
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

  static Future<void> sendPasswordResetEmail(String email) async {
    if (Platform.isWindows) {
      await _windowsSendPasswordReset(email);
      return;
    }
    await _auth.sendPasswordResetEmail(email: email);
  }

  static Future<void> signOut() async {
    if (Platform.isWindows) {
      _windowsUser = null;
      _windowsIdToken = null;
      _windowsRefreshToken = null;
      _windowsTokenExpiry = null;
      _windowsUserCtrl.add(null);
      return;
    }
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  static Future<void> _windowsSendPasswordReset(String email) async {
    final res = await http
        .post(
          Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=$_windowsApiKey',
          ),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'requestType': 'PASSWORD_RESET', 'email': email}),
        )
        .timeout(const Duration(seconds: 15));

    if (res.statusCode != 200) {
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      final message =
          ((body['error'] as Map<String, dynamic>?)?['message'] as String?) ??
          '';
      throw switch (message) {
        'EMAIL_NOT_FOUND' => FirebaseAuthException(code: 'user-not-found'),
        'INVALID_EMAIL' => FirebaseAuthException(code: 'invalid-email'),
        _ => FirebaseAuthException(code: 'unknown', message: message),
      };
    }
  }

  static Future<void> _windowsEmailAuth(
    String email,
    String password, {
    required bool signUp,
  }) async {
    final endpoint = signUp ? 'accounts:signUp' : 'accounts:signInWithPassword';

    final res = await http
        .post(
          Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/$endpoint?key=$_windowsApiKey',
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

    _windowsIdToken = body['idToken'] as String?;
    _windowsRefreshToken = body['refreshToken'] as String?;
    final expiresIn = int.tryParse(body['expiresIn']?.toString() ?? '') ?? 3600;
    _windowsTokenExpiry = DateTime.now().add(Duration(seconds: expiresIn));
    _windowsUser = AuthUser._(
      uid: body['localId'] as String,
      email: (body['email'] as String?) ?? email,
    );
    _windowsUserCtrl.add(_windowsUser);
  }

  static Future<void> _windowsRefreshIdToken() async {
    final refreshToken = _windowsRefreshToken;
    if (refreshToken == null) return;
    try {
      final res = await http
          .post(
            Uri.parse(
              'https://securetoken.googleapis.com/v1/token?key=$_windowsApiKey',
            ),
            headers: {'Content-Type': 'application/x-www-form-urlencoded'},
            body:
                'grant_type=refresh_token&refresh_token=${Uri.encodeComponent(refreshToken)}',
          )
          .timeout(const Duration(seconds: 15));
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        _windowsIdToken = body['id_token'] as String?;
        _windowsRefreshToken = body['refresh_token'] as String?;
        final expiresIn =
            int.tryParse(body['expires_in']?.toString() ?? '') ?? 3600;
        _windowsTokenExpiry = DateTime.now().add(Duration(seconds: expiresIn));
      }
    } catch (_) {
      // Silently fail — caller will use the (possibly stale) token
    }
  }

  static Future<void> _windowsDeleteAccount() async {
    final token = _windowsIdToken;
    if (token == null) return;
    try {
      await http
          .post(
            Uri.parse(
              'https://identitytoolkit.googleapis.com/v1/accounts:delete?key=$_windowsApiKey',
            ),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'idToken': token}),
          )
          .timeout(const Duration(seconds: 15));
    } catch (_) {}
    _windowsUser = null;
    _windowsIdToken = null;
    _windowsRefreshToken = null;
    _windowsTokenExpiry = null;
    _windowsUserCtrl.add(null);
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
