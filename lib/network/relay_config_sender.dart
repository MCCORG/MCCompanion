import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

import 'broadcast_mode.dart';

class RelayConfigResult {
  final bool success;
  final int statusCode;
  final String body;

  RelayConfigResult({
    required this.success,
    required this.statusCode,
    required this.body,
  });
}

class RelayConfigSender {
  static Future<RelayConfigResult> sendConfigSimple({
    required String remoteServerIp,
    required int remoteServerPort,
    required BroadcastMode mode,
    required String base,
    String? bedrockGamertag,
    String? authToken,
    String? resourcePackUrl,
  }) async {
    final uri = Uri.parse('${base.replaceAll(RegExp(r'/$'), '')}/api/route');

    final body = jsonEncode({
      'remoteIP': remoteServerIp,
      'remotePort': remoteServerPort,
      'mode': broadcastModeToString(mode),
      if (bedrockGamertag != null) 'bedrockGamertag': bedrockGamertag,
      if (resourcePackUrl != null) 'resourcePackUrl': resourcePackUrl,
    });

    HttpClient? client;
    try {
      client = HttpClient();
      client.connectionTimeout = const Duration(seconds: 5);

      final req = await client.postUrl(uri).timeout(const Duration(seconds: 5));
      req.headers.set(
        HttpHeaders.contentTypeHeader,
        'application/json; charset=utf-8',
      );
      if (authToken != null) {
        req.headers.set(HttpHeaders.authorizationHeader, 'Bearer $authToken');
      }
      req.add(utf8.encode(body));

      final response = await req.close().timeout(const Duration(seconds: 5));
      final respBody = await response.transform(utf8.decoder).join();

      if (response.statusCode == 200) {
        return RelayConfigResult(
          success: true,
          statusCode: 200,
          body: respBody,
        );
      } else {
        debugPrint(
          'Router rejected route (status ${response.statusCode}): $respBody',
        );
        return RelayConfigResult(
          success: false,
          statusCode: response.statusCode,
          body: respBody,
        );
      }
    } on TimeoutException catch (te) {
      debugPrint('Timeout sending config to router: $te');
      return RelayConfigResult(success: false, statusCode: -1, body: 'timeout');
    } catch (e, st) {
      debugPrint('Error sending config to router: $e\n$st');
      return RelayConfigResult(
        success: false,
        statusCode: -1,
        body: e.toString(),
      );
    } finally {
      try {
        client?.close(force: true);
      } catch (_) {}
    }
  }
}
