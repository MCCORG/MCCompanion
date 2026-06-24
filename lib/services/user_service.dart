import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'auth_service.dart';
import '../constants/app_constants.dart';
import '../models/user_model.dart';

class UserService {
  static const String _base = AppConstants.apiBase;
  static const Duration _timeout = Duration(seconds: 8);

  static Future<Map<String, String>> _headers() async {
    final token = await AuthService.getIdToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  static Future<UserModel?> getMe() async {
    try {
      final res = await http
          .get(Uri.parse('$_base/api/users/me'), headers: await _headers())
          .timeout(_timeout);
      if (res.statusCode == 200) {
        return UserModel.fromJson(
          (jsonDecode(res.body) as Map<String, dynamic>)['user']
              as Map<String, dynamic>,
        );
      }
    } catch (_) {}
    return null;
  }

  static Future<({UserModel? user, String? error})> register({
    required String username,
    String? displayName,
  }) async {
    try {
      final res = await http
          .post(
            Uri.parse('$_base/api/users/register'),
            headers: await _headers(),
            body: jsonEncode({
              'username': username,
              if (displayName?.isNotEmpty == true) 'displayName': displayName,
            }),
          )
          .timeout(_timeout);
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      if (res.statusCode == 201) {
        return (
          user: UserModel.fromJson(body['user'] as Map<String, dynamic>),
          error: null,
        );
      }
      return (user: null, error: body['error'] as String?);
    } catch (_) {
      return (user: null, error: 'network_error');
    }
  }

  static Future<UserModel?> updateMe({
    String? displayName,
    String? avatarUrl,
    String? bio,
    bool? appearOffline,
  }) async {
    try {
      final res = await http
          .patch(
            Uri.parse('$_base/api/users/me'),
            headers: await _headers(),
            body: jsonEncode({
              if (displayName != null) 'displayName': displayName,
              if (avatarUrl != null) 'avatarUrl': avatarUrl,
              if (bio != null) 'bio': bio,
              if (appearOffline != null) 'appearOffline': appearOffline,
            }),
          )
          .timeout(_timeout);
      if (res.statusCode == 200) {
        return UserModel.fromJson(
          (jsonDecode(res.body) as Map<String, dynamic>)['user']
              as Map<String, dynamic>,
        );
      }
    } catch (_) {}
    return null;
  }

  static Future<({UserModel? user, String? error})> uploadAvatar(File file) async {
    try {
      final ext = file.path.split('.').last.toLowerCase();
      final mime = switch (ext) {
        'png' => 'image/png',
        'webp' => 'image/webp',
        'gif' => 'image/gif',
        _ => 'image/jpeg',
      };

      final presignRes = await http.post(
        Uri.parse('$_base/api/users/me/avatar/presign'),
        headers: await _headers(),
        body: jsonEncode({'mime': mime}),
      ).timeout(_timeout);
      if (presignRes.statusCode != 200) {
        final b = jsonDecode(presignRes.body) as Map<String, dynamic>;
        return (user: null, error: b['message'] as String? ?? 'presign_failed');
      }
      final presignBody = jsonDecode(presignRes.body) as Map<String, dynamic>;
      final uploadUrl = presignBody['uploadUrl'] as String;
      final r2Key = presignBody['r2Key'] as String;

      final bytes = await file.readAsBytes();
      final putRes = await http.put(
        Uri.parse(uploadUrl),
        headers: {'Content-Type': mime},
        body: bytes,
      ).timeout(const Duration(seconds: 60));
      if (putRes.statusCode != 200) {
        return (user: null, error: 'upload_failed');
      }

      final confirmRes = await http.post(
        Uri.parse('$_base/api/users/me/avatar/confirm'),
        headers: await _headers(),
        body: jsonEncode({'r2Key': r2Key}),
      ).timeout(_timeout);
      final confirmBody = jsonDecode(confirmRes.body) as Map<String, dynamic>;
      if (confirmRes.statusCode == 200) {
        return (user: UserModel.fromJson(confirmBody['user'] as Map<String, dynamic>), error: null);
      }
      return (user: null, error: confirmBody['message'] as String? ?? 'confirm_failed');
    } catch (_) {
      return (user: null, error: 'network_error');
    }
  }

  static Future<UserModel?> removeAvatar() async {
    try {
      final res = await http
          .delete(Uri.parse('$_base/api/users/me/avatar'), headers: await _headers())
          .timeout(_timeout);
      if (res.statusCode == 200) {
        return UserModel.fromJson(
          (jsonDecode(res.body) as Map<String, dynamic>)['user'] as Map<String, dynamic>,
        );
      }
    } catch (_) {}
    return null;
  }

  static Future<
    ({String? userCode, String? verificationUri, int? expiresIn, String? error})
  >
  startXboxLink() async {
    try {
      final res = await http
          .post(
            Uri.parse('$_base/api/users/me/xbox/start'),
            headers: await _headers(),
          )
          .timeout(const Duration(seconds: 35));
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      if (res.statusCode == 200) {
        return (
          userCode: body['userCode'] as String?,
          verificationUri: body['verificationUri'] as String?,
          expiresIn: body['expiresIn'] as int?,
          error: null,
        );
      }
      return (
        userCode: null,
        verificationUri: null,
        expiresIn: null,
        error: body['error'] as String?,
      );
    } catch (_) {
      return (
        userCode: null,
        verificationUri: null,
        expiresIn: null,
        error: 'network_error',
      );
    }
  }

  static Future<({String status, String? gamertag, String? error})>
  getXboxStatus() async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/users/me/xbox/status'),
            headers: await _headers(),
          )
          .timeout(_timeout);
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      return (
        status: body['status'] as String? ?? 'none',
        gamertag: body['gamertag'] as String?,
        error: body['error'] as String?,
      );
    } catch (_) {
      return (status: 'error', gamertag: null, error: 'network_error');
    }
  }

  static Future<bool> unlinkXbox() async {
    try {
      final res = await http
          .delete(
            Uri.parse('$_base/api/users/me/xbox'),
            headers: await _headers(),
          )
          .timeout(_timeout);
      return res.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  static Future<bool> unlinkBedrockAccount(String xuid) async {
    try {
      final res = await http
          .delete(
            Uri.parse('$_base/api/users/me/xbox/${Uri.encodeComponent(xuid)}'),
            headers: await _headers(),
          )
          .timeout(_timeout);
      return res.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  static Future<
    ({String? userCode, String? verificationUri, int? expiresIn, String? error})
  >
  startJavaLink() async {
    try {
      final res = await http
          .post(
            Uri.parse('$_base/api/users/me/java/start'),
            headers: await _headers(),
          )
          .timeout(const Duration(seconds: 35));
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      if (res.statusCode == 200) {
        return (
          userCode: body['userCode'] as String?,
          verificationUri: body['verificationUri'] as String?,
          expiresIn: body['expiresIn'] as int?,
          error: null,
        );
      }
      return (
        userCode: null,
        verificationUri: null,
        expiresIn: null,
        error: body['error'] as String?,
      );
    } catch (_) {
      return (
        userCode: null,
        verificationUri: null,
        expiresIn: null,
        error: 'network_error',
      );
    }
  }

  static Future<
    ({String status, String? javaUsername, String? javaUuid, String? error})
  >
  getJavaStatus() async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/users/me/java/status'),
            headers: await _headers(),
          )
          .timeout(_timeout);
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      return (
        status: body['status'] as String? ?? 'none',
        javaUsername: body['javaUsername'] as String?,
        javaUuid: body['javaUuid'] as String?,
        error: body['error'] as String?,
      );
    } catch (_) {
      return (
        status: 'error',
        javaUsername: null,
        javaUuid: null,
        error: 'network_error',
      );
    }
  }

  static Future<bool> unlinkJava() async {
    try {
      final res = await http
          .delete(
            Uri.parse('$_base/api/users/me/java'),
            headers: await _headers(),
          )
          .timeout(_timeout);
      return res.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  static Future<bool> unlinkJavaAccount(String javaUuid) async {
    try {
      final res = await http
          .delete(
            Uri.parse(
              '$_base/api/users/me/java/${Uri.encodeComponent(javaUuid)}',
            ),
            headers: await _headers(),
          )
          .timeout(_timeout);
      return res.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  static Future<List<FriendModel>> getFriends() async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/users/me/friends'),
            headers: await _headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 200) {
        final list =
            (jsonDecode(res.body) as Map<String, dynamic>)['friends']
                as List<dynamic>;
        return list
            .map((e) => FriendModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    } catch (_) {}
    return [];
  }

  static Future<List<FriendRequest>> getFriendRequests() async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/users/me/friend-requests'),
            headers: await _headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 200) {
        final list =
            (jsonDecode(res.body) as Map<String, dynamic>)['requests']
                as List<dynamic>;
        return list
            .map((e) => FriendRequest.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    } catch (_) {}
    return [];
  }

  static Future<String?> sendFriendRequest(String username) async {
    try {
      final res = await http
          .post(
            Uri.parse('$_base/api/users/me/friends/$username'),
            headers: await _headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 201) return null;
      return (jsonDecode(res.body) as Map<String, dynamic>)['error'] as String?;
    } catch (_) {
      return 'network_error';
    }
  }

  static Future<bool> acceptFriendRequest(String username) async {
    try {
      final res = await http
          .patch(
            Uri.parse('$_base/api/users/me/friends/$username/accept'),
            headers: await _headers(),
          )
          .timeout(_timeout);
      return res.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  static Future<bool> removeFriend(String username) async {
    try {
      final res = await http
          .delete(
            Uri.parse('$_base/api/users/me/friends/$username'),
            headers: await _headers(),
          )
          .timeout(_timeout);
      return res.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  static Future<UserModel?> getProfile(String username) async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/users/$username'),
            headers: await _headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 200) {
        return UserModel.fromJson(
          (jsonDecode(res.body) as Map<String, dynamic>)['user']
              as Map<String, dynamic>,
        );
      }
    } catch (_) {}
    return null;
  }

  static Future<String> getFriendshipStatus(String username) async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/users/me/friendship/$username'),
            headers: await _headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 200) {
        return (jsonDecode(res.body) as Map<String, dynamic>)['status']
                as String? ??
            'none';
      }
    } catch (_) {}
    return 'none';
  }

  static Future<List<UserModel>> searchUsers(String query) async {
    try {
      final uri = Uri.parse(
        '$_base/api/users/search',
      ).replace(queryParameters: {'q': query});
      final res = await http
          .get(uri, headers: await _headers())
          .timeout(_timeout);
      if (res.statusCode == 200) {
        final list =
            (jsonDecode(res.body) as Map<String, dynamic>)['users']
                as List<dynamic>;
        return list
            .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    } catch (_) {}
    return [];
  }

  static Future<bool> deleteAccount() async {
    try {
      final res = await http
          .delete(Uri.parse('$_base/api/users/me'), headers: await _headers())
          .timeout(_timeout);
      return res.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  static Future<bool> blockUser(String username) async {
    try {
      final res = await http
          .post(
            Uri.parse('$_base/api/users/me/block/$username'),
            headers: await _headers(),
          )
          .timeout(_timeout);
      return res.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  static Future<void> registerFcmToken(String token) async {
    try {
      await http
          .post(
            Uri.parse('$_base/api/users/me/fcm-token'),
            headers: await _headers(),
            body: jsonEncode({'token': token}),
          )
          .timeout(_timeout);
    } catch (_) {}
  }

  static Future<void> unregisterFcmToken(String token) async {
    try {
      await http
          .delete(
            Uri.parse('$_base/api/users/me/fcm-token'),
            headers: await _headers(),
            body: jsonEncode({'token': token}),
          )
          .timeout(_timeout);
    } catch (_) {}
  }
}
