import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/player_lookup_model.dart';
import 'api_client_base.dart';
import '../constants/app_constants.dart';

enum LookupError { notFound, network, bedrockUnavailable, failed }

class PlayerLookupService {
  static const String _base = AppConstants.apiBase;
  static const Duration _timeout = Duration(seconds: 12);

  static Future<({JavaProfile? profile, LookupError? error})> lookupJava(
    String identifier,
  ) async {
    try {
      final res = await http
          .get(
            Uri.parse(
              '$_base/api/lookup/java/${Uri.encodeComponent(identifier)}',
            ),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 404) {
        return (profile: null, error: LookupError.notFound);
      }
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        return (profile: JavaProfile.fromJson(body), error: null);
      }
      return (
        profile: null,
        error: LookupError.failed,
      );
    } catch (e) {
      return (profile: null, error: LookupError.network);
    }
  }

  static Future<({CombinedProfile? result, LookupError? error})> lookupCombined(
    String identifier,
  ) async {
    try {
      final res = await http
          .get(
            Uri.parse(
              '$_base/api/lookup/bedrock-java/${Uri.encodeComponent(identifier)}',
            ),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 404) {
        return (result: null, error: LookupError.notFound);
      }
      if (res.statusCode == 503) {
        return (
          result: null,
          error: LookupError.bedrockUnavailable,
        );
      }
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        return (result: CombinedProfile.fromJson(body), error: null);
      }
      return (
        result: null,
        error: LookupError.failed,
      );
    } catch (e) {
      return (result: null, error: LookupError.network);
    }
  }

  static Future<({BedrockProfile? profile, LookupError? error})> lookupBedrock(
    String identifier,
  ) async {
    try {
      final res = await http
          .get(
            Uri.parse(
              '$_base/api/lookup/bedrock/${Uri.encodeComponent(identifier)}',
            ),
            headers: await ApiClientBase.headers(),
          )
          .timeout(_timeout);
      if (res.statusCode == 404) {
        return (profile: null, error: LookupError.notFound);
      }
      if (res.statusCode == 503) {
        return (
          profile: null,
          error: LookupError.bedrockUnavailable,
        );
      }
      if (res.statusCode == 200) {
        final body = jsonDecode(res.body) as Map<String, dynamic>;
        return (profile: BedrockProfile.fromJson(body), error: null);
      }
      return (
        profile: null,
        error: LookupError.failed,
      );
    } catch (e) {
      return (profile: null, error: LookupError.network);
    }
  }
}
