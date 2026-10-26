import 'package:flutter/material.dart';

class ClientSectionItem {
  final String id;
  final String label;
  final VoidCallback onTap;

  const ClientSectionItem({
    required this.id,
    required this.label,
    required this.onTap,
  });
}

class ClientSection {
  final String id;
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final List<ClientSectionItem> items;
  final int badge;

  const ClientSection({
    required this.id,
    required this.icon,
    required this.label,
    required this.onTap,
    this.items = const [],
    this.badge = 0,
  });
}
