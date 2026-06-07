import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../util/partners_servers.dart';
import '../services/server_status_service.dart';

class PartnerServerCard extends StatefulWidget {
  const PartnerServerCard({
    super.key,
    required this.server,
    required this.onPlay,
  });

  final FeaturedServer server;
  final VoidCallback onPlay;

  @override
  State<PartnerServerCard> createState() => _PartnerServerCardState();
}

class _PartnerServerCardState extends State<PartnerServerCard>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late final AnimationController _animController;
  late final Animation<double> _expandAnimation;

  bool get _hasIcon =>
      widget.server.iconUrl != null && widget.server.iconUrl!.isNotEmpty;
  bool get _hasDescription => widget.server.description.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    if (!_hasDescription) return;
    setState(() => _expanded = !_expanded);
    if (_expanded) {
      _animController.forward();
    } else {
      _animController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          if (_hasIcon)
            Positioned.fill(
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
                child: Image.network(
                  widget.server.iconUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _solidBg(),
                ),
              ),
            )
          else
            Positioned.fill(child: _solidBg()),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppTheme.surface.withValues(alpha: 0.92),
                    AppTheme.surface.withValues(alpha: 0.75),
                  ],
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.borderGray),
              ),
            ),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: _hasDescription ? _toggleExpanded : null,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SizedBox(
                          width: 56,
                          height: 56,
                          child: _hasIcon
                              ? Image.network(
                                  widget.server.iconUrl!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => _iconFallback(),
                                )
                              : _iconFallback(),
                        ),
                      ),
                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.server.name,
                                    style: TextStyle(
                                      color: AppTheme.textPrimary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (_hasDescription) ...[
                                  const SizedBox(width: 4),
                                  AnimatedRotation(
                                    turns: _expanded ? 0.5 : 0,
                                    duration: const Duration(milliseconds: 250),
                                    child: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      size: 16,
                                      color: AppTheme.textMuted,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            const SizedBox(height: 4),

                            ServerStatusBadge(
                              address: widget.server.address,
                              port: widget.server.port,
                            ),
                            const SizedBox(height: 3),

                            Text(
                              '${widget.server.address}:${widget.server.port}',
                              style: TextStyle(
                                color: AppTheme.textMuted,
                                fontSize: 10,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),

                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: widget.onPlay,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 9,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.accent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.play_arrow_rounded,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Play',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (widget.server.websiteUrl != null) ...[
                            const SizedBox(height: 6),
                            GestureDetector(
                              onTap: () => launchUrl(
                                Uri.parse(widget.server.websiteUrl!),
                                mode: LaunchMode.externalApplication,
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: AppTheme.surfaceRaised.withValues(alpha: 
                                    0.80,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppTheme.borderGray,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.language_rounded,
                                      size: 12,
                                      color: AppTheme.textSecondary,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Website',
                                      style: TextStyle(
                                        color: AppTheme.textSecondary,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              if (_hasDescription)
                SizeTransition(
                  sizeFactor: _expandAnimation,
                  axisAlignment: -1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Divider(height: 1, color: AppTheme.borderGray),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                        child: Text(
                          widget.server.description,
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 12,
                            height: 1.6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _solidBg() => Container(color: AppTheme.surface);

  Widget _iconFallback() => Container(
    color: AppTheme.surfaceRaised,
    child: Icon(Icons.dns_rounded, size: 24, color: AppTheme.textMuted),
  );
}

class ServerStatusBadge extends StatefulWidget {
  final String address;
  final int port;
  const ServerStatusBadge({
    super.key,
    required this.address,
    required this.port,
  });

  @override
  State<ServerStatusBadge> createState() => _ServerStatusBadgeState();
}

class _ServerStatusBadgeState extends State<ServerStatusBadge> {
  late Future<ServerStatus> _statusFuture;

  @override
  void initState() {
    super.initState();
    _statusFuture = ServerStatusService.getStatus(widget.address, widget.port);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ServerStatus>(
      future: _statusFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return _pill(dot: AppTheme.textMuted, label: '...');
        final status = snapshot.data!;
        if (!status.isOnline)
          return _pill(dot: AppTheme.textMuted, label: 'Offline');
        final sub = (status.players != null && status.maxPlayers != null)
            ? ' ${status.players}/${status.maxPlayers}'
            : '';
        return _pill(dot: AppTheme.success, label: 'Online$sub');
      },
    );
  }

  Widget _pill({required Color dot, required String label}) {
    final online = dot == AppTheme.success;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: online
            ? AppTheme.success.withValues(alpha: 0.10)
            : AppTheme.surfaceRaised.withValues(alpha: 0.80),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: online
              ? AppTheme.success.withValues(alpha: 0.35)
              : AppTheme.borderGray,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: online ? AppTheme.success : AppTheme.textMuted,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
