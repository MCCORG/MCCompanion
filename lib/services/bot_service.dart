import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart';
import '../models/bot_model.dart';

class BotRegionData {
  final List<BotModel> eu;
  final List<BotModel> us;

  const BotRegionData({required this.eu, required this.us});
}

class BotService {
  static Future<BotRegionData> fetchAllBots() async {
    final relays = AppConstants.relayServers;
    final euBase = relays.firstWhere(
      (r) => r['name']!.toLowerCase().contains('eu'),
      orElse: () => relays.first,
    )['base']!;
    final usBase = relays.firstWhere(
      (r) => r['name']!.toLowerCase().contains('us'),
      orElse: () => relays.last,
    )['base']!;

    final results = await Future.wait([
      _fetchFromNode('$euBase/api/bots', 'eu'),
      _fetchFromNode('$usBase/api/bots', 'us'),
    ]);

    return BotRegionData(eu: results[0], us: results[1]);
  }

  static Future<List<BotModel>> _fetchFromNode(String url, String region) async {
    try {
      final res = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 6));
      if (res.statusCode != 200) return [];
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      final list = (data['bots'] as List<dynamic>? ?? []);
      final bots = list
          .map((e) => BotModel.fromJson(e as Map<String, dynamic>, region))
          .toList();
      bots.sort((a, b) {
        if (a.isOnline && !b.isOnline) return -1;
        if (!a.isOnline && b.isOnline) return 1;
        return (a.friendCount ?? 0).compareTo(b.friendCount ?? 0);
      });
      return bots;
    } catch (e) {
      debugPrint('[BotService._fetchFromNode] $e');
      return [];
    }
  }
}
