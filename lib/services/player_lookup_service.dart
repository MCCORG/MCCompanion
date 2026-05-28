import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/player_lookup_model.dart';
import 'auth_service.dart';
import '../constants/app_constants.dart';

class PlayerLookupService {
  static const String _base = AppConstants.apiBase;
  static const Duration _timeout = Duration(seconds: 12);

  static Future<Map<String, String>> _headers() async {
    final token = await AuthService.getIdToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  static Future<({JavaProfile? profile, String? error})> lookupJava(
    String identifier,
  ) async {
    try {
      final res = await http
          .get(
            Uri.parse(
              '$_base/api/lookup/java/${Uri.encodeComponent(identifier)}',
            ),
            headers: await _headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 404) {
        return (profile: null, error: 'Player not found.');
      }
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        return (profile: JavaProfile.fromJson(body), error: null);
      }
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      return (
        profile: null,
        error: body['message'] as String? ?? 'Lookup failed.',
      );
    } catch (e) {
      return (profile: null, error: 'Network error. Please try again.');
    }
  }

  static Future<({CombinedProfile? result, String? error})> lookupCombined(
    String identifier,
  ) async {
    try {
      final res = await http
          .get(
            Uri.parse(
              '$_base/api/lookup/bedrock-java/${Uri.encodeComponent(identifier)}',
            ),
            headers: await _headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 404) {
        return (result: null, error: 'Player not found.');
      }
      if (res.statusCode == 503) {
        return (
          result: null,
          error: 'Bedrock lookup is currently unavailable.',
        );
      }
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        return (result: CombinedProfile.fromJson(body), error: null);
      }
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      return (
        result: null,
        error: body['message'] as String? ?? 'Lookup failed.',
      );
    } catch (e) {
      return (result: null, error: 'Network error. Please try again.');
    }
  }

  static Future<({BedrockProfile? profile, String? error})> lookupBedrock(
    String identifier,
  ) async {
    try {
      final res = await http
          .get(
            Uri.parse(
              '$_base/api/lookup/bedrock/${Uri.encodeComponent(identifier)}',
            ),
            headers: await _headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 404) {
        return (profile: null, error: 'Player not found.');
      }
      if (res.statusCode == 503) {
        return (
          profile: null,
          error: 'Bedrock lookup is currently unavailable.',
        );
      }
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        return (profile: BedrockProfile.fromJson(body), error: null);
      }
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      return (
        profile: null,
        error: body['message'] as String? ?? 'Lookup failed.',
      );
    } catch (e) {
      return (profile: null, error: 'Network error. Please try again.');
    }
  }
}
