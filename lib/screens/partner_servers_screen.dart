import 'dart:math';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../util/partners_servers.dart';
import '../widgets/components/app_toast.dart';
import '../widgets/partner_server_card.dart';

class PartnerServersScreen extends StatefulWidget {
  const PartnerServersScreen({
    super.key,
    required this.partnerServersFuture,
    required this.ipController,
    required this.portController,
    required this.onBack,
    this.onPlay,
  });

  final Future<List<FeaturedServer>>? partnerServersFuture;
  final TextEditingController ipController;
  final TextEditingController portController;
  final VoidCallback onBack;
  final VoidCallback? onPlay;

  @override
  State<PartnerServersScreen> createState() => _PartnerServersScreenState();
}

class _PartnerServersScreenState extends State<PartnerServersScreen> {
  List<FeaturedServer>? _shuffled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppTheme.surface,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: AppTheme.textPrimary,
                      ),
                      onPressed: widget.onBack,
                    ),
                    const Text(
                      'Partner Servers',
                      style: TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1, color: AppTheme.borderGray),
            ],
          ),
        ),

        Expanded(
          child: FutureBuilder<List<FeaturedServer>>(
            future: widget.partnerServersFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      color: AppTheme.textMuted,
                    ),
                  ),
                );
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceRaised,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppTheme.borderGray),
                        ),
                        child: const Icon(
                          Icons.handshake_outlined,
                          size: 24,
                          color: AppTheme.textMuted,
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'No partner servers available yet.',
                        style: TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Check back later.',
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              }

              _shuffled ??= List.from(snapshot.data!)..shuffle(Random());
              final servers = _shuffled!;

              return ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: servers.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, i) => PartnerServerCard(
                  server: servers[i],
                  onPlay: () {
                    widget.ipController.text = servers[i].address;
                    widget.portController.text = servers[i].port.toString();
                    AppToast.show(
                      context,
                      message: AppLocalizations.of(
                        context,
                      )!.selectedFeaturedServer(servers[i].name),
                      icon: Icons.play_arrow_rounded,
                      color: AppTheme.success,
                      duration: const Duration(seconds: 2),
                    );
                    (widget.onPlay ?? widget.onBack)();
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
