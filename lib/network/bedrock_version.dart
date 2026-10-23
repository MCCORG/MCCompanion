import 'package:shared_preferences/shared_preferences.dart';

const int bedrockProtocolVersion = 2193;

const String bedrockGameVersion = '1.26.50';

class BedrockVersion {
  BedrockVersion._();

  static const String _protocolKey = 'bedrock_protocol';
  static const String _versionKey = 'bedrock_game_version';
  static final RegExp _versionPattern = RegExp(r'^\d+(\.\d+){1,3}$');

  static int protocol = bedrockProtocolVersion;
  static String gameVersion = bedrockGameVersion;

  static Future<void> loadCached() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cachedProtocol = prefs.getInt(_protocolKey);
      final cachedVersion = prefs.getString(_versionKey);
      if (cachedProtocol != null &&
          cachedVersion != null &&
          _valid(cachedProtocol, cachedVersion)) {
        protocol = cachedProtocol;
        gameVersion = cachedVersion;
      }
    } catch (_) {}
  }

  static Future<void> update({
    required int protocol,
    required String gameVersion,
  }) async {
    if (!_valid(protocol, gameVersion)) return;
    BedrockVersion.protocol = protocol;
    BedrockVersion.gameVersion = gameVersion;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_protocolKey, protocol);
      await prefs.setString(_versionKey, gameVersion);
    } catch (_) {}
  }

  static bool _valid(int protocol, String gameVersion) =>
      protocol > 0 && _versionPattern.hasMatch(gameVersion);
}
