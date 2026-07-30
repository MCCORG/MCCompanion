import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'api_client_base.dart';
import 'feedback_service.dart';
import '../constants/app_constants.dart';
import '../models/user_model.dart';

typedef SocialInit = ({
  UserModel? user,
  List<FriendModel> friends,
  List<FriendRequest> friendRequests,
  int unreadMessageCount,
  int unreadNotifCount,
});

class UserService {
  static const String _base = AppConstants.apiBase;
  static const Duration _timeout = Duration(seconds: 8);

  static bool _isAdmin = false;
  static bool get isAdmin => _isAdmin;

  static UserModel? _cachedMe;
  static DateTime? _cachedMeAt;
  static Future<UserModel?>? _meInFlight;

  static const _meCacheTtl = Duration(seconds: 30);

  static Future<UserModel?> getMe({bool forceRefresh = false}) {
    if (!forceRefresh) {
      final at = _cachedMeAt;
      if (_cachedMe != null &&
          at != null &&
          DateTime.now().difference(at) < _meCacheTtl) {
        return Future.value(_cachedMe);
      }
      final pending = _meInFlight;
      if (pending != null) return pending;
    }

    final future = _fetchMe();
    _meInFlight = future;
    return future.whenComplete(() {
      if (identical(_meInFlight, future)) _meInFlight = null;
    });
  }

  static Future<UserModel?> _fetchMe() async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/users/me'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        _isAdmin = body['isAdmin'] as bool? ?? false;
        final user = UserModel.fromJson(body['user'] as Map<String, dynamic>);
        _cachedMe = user;
        _cachedMeAt = DateTime.now();
        return user;
      }
    } catch (e) {
      debugPrint('[UserService.getMe] $e');
    }
    return null;
  }

  static void invalidateMe() {
    _cachedMe = null;
    _cachedMeAt = null;
    _cachedSocial = null;
    _cachedSocialAt = null;
  }

  static Future<({UserModel? user, String? error})> register({
    required String username,
    String? displayName,
  }) async {
    try {
      final res = await http
          .post(
            Uri.parse('$_base/api/users/register'),
            headers: await ApiClientBase.headers(),
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
    } catch (e) {
      debugPrint('[UserService.register] $e');
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
            headers: await ApiClientBase.headers(),
            body: jsonEncode({
              if (displayName != null) 'displayName': displayName,
              if (avatarUrl != null) 'avatarUrl': avatarUrl,
              if (bio != null) 'bio': bio,
              if (appearOffline != null) 'appearOffline': appearOffline,
            }),
          )
          .timeout(_timeout);
      if (res.statusCode == 200) {
        final user = UserModel.fromJson(
          (jsonDecode(res.body) as Map<String, dynamic>)['user']
              as Map<String, dynamic>,
        );

        _cachedMe = user;
        _cachedMeAt = DateTime.now();
        return user;
      }
    } catch (e) {
      debugPrint('[UserService.updateMe] $e');
    }
    return null;
  }

  static Future<({UserModel? user, String? error})> uploadAvatar(
    File file,
  ) async {
    try {
      final ext = file.path.split('.').last.toLowerCase();
      final mime = switch (ext) {
        'png' => 'image/png',
        'webp' => 'image/webp',
        'gif' => 'image/gif',
        _ => 'image/jpeg',
      };

      final presignRes = await http
          .post(
            Uri.parse('$_base/api/users/me/avatar/presign'),
            headers: await ApiClientBase.headers(),
            body: jsonEncode({'mime': mime}),
          )
          .timeout(_timeout);
      if (presignRes.statusCode != 200) {
        final b = jsonDecode(presignRes.body) as Map<String, dynamic>;
        return (user: null, error: b['message'] as String? ?? 'presign_failed');
      }
      final presignBody = jsonDecode(presignRes.body) as Map<String, dynamic>;
      final uploadUrl = presignBody['uploadUrl'] as String;
      final r2Key = presignBody['r2Key'] as String;

      final bytes = await file.readAsBytes();
      final putRes = await http
          .put(
            Uri.parse(uploadUrl),
            headers: {'Content-Type': mime},
            body: bytes,
          )
          .timeout(const Duration(seconds: 60));
      if (putRes.statusCode != 200) {
        return (user: null, error: 'upload_failed');
      }

      final confirmRes = await http
          .post(
            Uri.parse('$_base/api/users/me/avatar/confirm'),
            headers: await ApiClientBase.headers(),
            body: jsonEncode({'r2Key': r2Key}),
          )
          .timeout(_timeout);
      final confirmBody = jsonDecode(confirmRes.body) as Map<String, dynamic>;
      if (confirmRes.statusCode == 200) {
        return (
          user: UserModel.fromJson(confirmBody['user'] as Map<String, dynamic>),
          error: null,
        );
      }
      return (
        user: null,
        error: confirmBody['message'] as String? ?? 'confirm_failed',
      );
    } catch (e) {
      debugPrint('[UserService.uploadAvatar] $e');
      return (user: null, error: 'network_error');
    }
  }

  static Future<UserModel?> removeAvatar() async {
    try {
      final res = await http
          .delete(
            Uri.parse('$_base/api/users/me/avatar'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 200) {
        return UserModel.fromJson(
          (jsonDecode(res.body) as Map<String, dynamic>)['user']
              as Map<String, dynamic>,
        );
      }
    } catch (e) {
      debugPrint('[UserService.removeAvatar] $e');
    }
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
            headers: await ApiClientBase.headers(),
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
    } catch (e) {
      debugPrint('[UserService.startXboxLink] $e');
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
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      return (
        status: body['status'] as String? ?? 'none',
        gamertag: body['gamertag'] as String?,
        error: body['error'] as String?,
      );
    } catch (e) {
      debugPrint('[UserService.getXboxStatus] $e');
      return (status: 'error', gamertag: null, error: 'network_error');
    }
  }

  static Future<bool> unlinkXbox() async {
    try {
      final res = await http
          .delete(
            Uri.parse('$_base/api/users/me/xbox'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      return res.statusCode == 200;
    } catch (e) {
      debugPrint('[UserService.unlinkXbox] $e');
      return false;
    }
  }

  static Future<bool> unlinkBedrockAccount(String xuid) async {
    try {
      final res = await http
          .delete(
            Uri.parse('$_base/api/users/me/xbox/${Uri.encodeComponent(xuid)}'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      return res.statusCode == 200;
    } catch (e) {
      debugPrint('[UserService.unlinkBedrockAccount] $e');
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
            headers: await ApiClientBase.headers(),
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
    } catch (e) {
      debugPrint('[UserService.startJavaLink] $e');
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
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      return (
        status: body['status'] as String? ?? 'none',
        javaUsername: body['javaUsername'] as String?,
        javaUuid: body['javaUuid'] as String?,
        error: body['error'] as String?,
      );
    } catch (e) {
      debugPrint('[UserService.getJavaStatus] $e');
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
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      return res.statusCode == 200;
    } catch (e) {
      debugPrint('[UserService.unlinkJava] $e');
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
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      return res.statusCode == 200;
    } catch (e) {
      debugPrint('[UserService.unlinkJavaAccount] $e');
      return false;
    }
  }

  static SocialInit? _cachedSocial;
  static DateTime? _cachedSocialAt;
  static Future<SocialInit?>? _socialInFlight;

  static const _socialCacheTtl = Duration(seconds: 30);

  static Future<SocialInit?> getSocialInit({bool forceRefresh = false}) {
    if (!forceRefresh) {
      final at = _cachedSocialAt;
      if (_cachedSocial != null &&
          at != null &&
          DateTime.now().difference(at) < _socialCacheTtl) {
        return Future.value(_cachedSocial);
      }
      final pending = _socialInFlight;
      if (pending != null) return pending;
    }

    final future = _fetchSocialInit();
    _socialInFlight = future;
    return future.whenComplete(() {
      if (identical(_socialInFlight, future)) _socialInFlight = null;
    });
  }

  static Future<void> warmSocialInit() async {
    try {
      await getSocialInit();
    } catch (_) {}
  }

  static Future<SocialInit?> _fetchSocialInit() async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/users/me/social-init'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        _isAdmin = body['isAdmin'] as bool? ?? false;
        FeedbackService.unreadTickets.value =
            (body['unreadTicketCount'] as num?)?.toInt() ?? 0;
        final result = (
          user: body['user'] != null
              ? UserModel.fromJson(body['user'] as Map<String, dynamic>)
              : null,
          friends: (body['friends'] as List<dynamic>)
              .map((e) => FriendModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          friendRequests: (body['friendRequests'] as List<dynamic>)
              .map((e) => FriendRequest.fromJson(e as Map<String, dynamic>))
              .toList(),
          unreadMessageCount:
              (body['unreadMessageCount'] as num?)?.toInt() ?? 0,
          unreadNotifCount: (body['unreadNotifCount'] as num?)?.toInt() ?? 0,
        );
        _cachedSocial = result;
        _cachedSocialAt = DateTime.now();
        return result;
      }
    } catch (e) {
      debugPrint('[UserService.getSocialInit] $e');
    }
    return null;
  }

  static Future<List<FriendModel>> getFriends() async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/users/me/friends'),
            headers: await ApiClientBase.headers(),
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
    } catch (e) {
      debugPrint('[UserService.getFriends] $e');
    }
    return [];
  }

  static Future<List<FriendRequest>> getFriendRequests() async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/users/me/friend-requests'),
            headers: await ApiClientBase.headers(),
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
    } catch (e) {
      debugPrint('[UserService.getFriendRequests] $e');
    }
    return [];
  }

  static Future<String?> sendFriendRequest(String username) async {
    try {
      final res = await http
          .post(
            Uri.parse('$_base/api/users/me/friends/$username'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 201) return null;
      return (jsonDecode(res.body) as Map<String, dynamic>)['error'] as String?;
    } catch (e) {
      debugPrint('[UserService.sendFriendRequest] $e');
      return 'network_error';
    }
  }

  static Future<bool> acceptFriendRequest(String username) async {
    try {
      final res = await http
          .patch(
            Uri.parse('$_base/api/users/me/friends/$username/accept'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      return res.statusCode == 200;
    } catch (e) {
      debugPrint('[UserService.acceptFriendRequest] $e');
      return false;
    }
  }

  static Future<bool> removeFriend(String username) async {
    try {
      final res = await http
          .delete(
            Uri.parse('$_base/api/users/me/friends/$username'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      return res.statusCode == 200;
    } catch (e) {
      debugPrint('[UserService.removeFriend] $e');
      return false;
    }
  }

  static Future<UserModel?> getProfile(String username) async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/users/$username/profile'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 200) {
        return UserModel.fromJson(
          (jsonDecode(res.body) as Map<String, dynamic>)['user']
              as Map<String, dynamic>,
        );
      }
    } catch (e) {
      debugPrint('[UserService.getProfile] $e');
    }
    return null;
  }

  static Future<String> getFriendshipStatus(String username) async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/users/me/friendship/$username'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 200) {
        return (jsonDecode(res.body) as Map<String, dynamic>)['status']
                as String? ??
            'none';
      }
    } catch (e) {
      debugPrint('[UserService.getFriendshipStatus] $e');
    }
    return 'none';
  }

  static Future<
    ({
      UserModel? user,
      String friendshipStatus,
      String targetUid,
      bool isTargetAdmin,
    })
  >
  getProfileWithFriendship(String username) async {
    try {
      final res = await http
          .get(
            Uri.parse('$_base/api/users/$username/profile'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        return (
          user: body['user'] != null
              ? UserModel.fromJson(body['user'] as Map<String, dynamic>)
              : null,
          friendshipStatus: body['friendshipStatus'] as String? ?? 'none',
          targetUid: body['targetUid'] as String? ?? '',
          isTargetAdmin: body['isAdmin'] as bool? ?? false,
        );
      }
    } catch (e) {
      debugPrint('[UserService.getProfileWithFriendship] $e');
    }
    return (
      user: null,
      friendshipStatus: 'none',
      targetUid: '',
      isTargetAdmin: false,
    );
  }

  static Future<List<UserModel>> searchUsers(String query) async {
    try {
      final uri = Uri.parse(
        '$_base/api/users/search',
      ).replace(queryParameters: {'q': query});
      final res = await http
          .get(uri, headers: await ApiClientBase.headers())
          .timeout(_timeout);
      if (res.statusCode == 200) {
        final list =
            (jsonDecode(res.body) as Map<String, dynamic>)['users']
                as List<dynamic>;
        return list
            .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    } catch (e) {
      debugPrint('[UserService.searchUsers] $e');
    }
    return [];
  }

  static Future<bool> deleteAccount() async {
    try {
      final res = await http
          .delete(
            Uri.parse('$_base/api/users/me'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      return res.statusCode == 200;
    } catch (e) {
      debugPrint('[UserService.deleteAccount] $e');
      return false;
    }
  }

  static Future<bool> blockUser(String username) async {
    try {
      final res = await http
          .post(
            Uri.parse('$_base/api/users/me/block/$username'),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      return res.statusCode == 200;
    } catch (e) {
      debugPrint('[UserService.blockUser] $e');
      return false;
    }
  }

  static Future<void> registerFcmToken(String token) async {
    try {
      await http
          .post(
            Uri.parse('$_base/api/users/me/fcm-token'),
            headers: await ApiClientBase.headers(),
            body: jsonEncode({'token': token}),
          )
          .timeout(_timeout);
    } catch (e) {
      debugPrint('[UserService.registerFcmToken] $e');
    }
  }

  static Future<void> unregisterFcmToken(String token) async {
    try {
      await http
          .delete(
            Uri.parse('$_base/api/users/me/fcm-token'),
            headers: await ApiClientBase.headers(),
            body: jsonEncode({'token': token}),
          )
          .timeout(_timeout);
    } catch (e) {
      debugPrint('[UserService.unregisterFcmToken] $e');
    }
  }
}
