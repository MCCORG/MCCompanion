import 'package:flutter/material.dart';
import 'featured_server_hero.dart';
import '../util/partners_servers.dart';

class FeaturedServerBanner extends StatelessWidget {
  final Future<List<FeaturedServer>>? partnerServersFuture;
  final TextEditingController ipController;
  final TextEditingController portController;
  final bool broadcasting;
  final VoidCallback? onSelected;
  final double bottomInset;

  const FeaturedServerBanner({
    super.key,
    required this.partnerServersFuture,
    required this.ipController,
    required this.portController,
    this.broadcasting = false,
    this.onSelected,
    this.bottomInset = 0,
  });

  @override
  Widget build(BuildContext context) {
    return FeaturedServerHero(
      partnerServersFuture: partnerServersFuture,
      ipController: ipController,
      portController: portController,
      broadcasting: broadcasting,
      onSelected: onSelected,
      borderRadius: BorderRadius.zero,
      topInset: 0,
      bottomInset: bottomInset,
    );
  }
}
