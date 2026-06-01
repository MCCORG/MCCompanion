import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../util/user_servers.dart';
import '../../services/server_status_service.dart';
import '../../l10n/app_localizations.dart';
import '../components/app_painters.dart';

class MyServersTab extends StatefulWidget {
  const MyServersTab({
    super.key,
    required this.savedServers,
    required this.ipController,
    required this.portController,
    required this.onServerSelected,
    required this.broadcasting,
  });

  final List<UserServer> savedServers;
  final TextEditingController ipController;
  final TextEditingController portController;
  final Function(UserServer) onServerSelected;
  final bool broadcasting;

  @override
  State<MyServersTab> createState() => _MyServersTabState();
}

class _MyServersTabState extends State<MyServersTab> {
  UserServer? _selectedServer;

  @override
  Widget build(BuildContext context) {
    if (widget.savedServers.isEmpty) return _emptyState(context);

    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: widget.savedServers.length,
      itemBuilder: (context, i) {
        final server = widget.savedServers[i];
        final isLast = i == widget.savedServers.length - 1;
        final isSelected =
            _selectedServer?.address == server.address &&
            _selectedServer?.port == server.port;

        return _ServerTile(
          server: server,
          isSelected: isSelected,
          isLast: isLast,
          broadcasting: widget.broadcasting,
          onTap: widget.broadcasting
              ? null
              : () {
                  setState(() => _selectedServer = server);
                  widget.onServerSelected(server);
                  widget.ipController.text = server.address;
                  widget.portController.text = server.port.toString();
                },
        );
      },
    );
  }

  Widget _emptyState(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.dns_outlined, size: 26, color: AppTheme.textMuted),
          const SizedBox(height: 10),
          Text(
            loc.noServerYet,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppTheme.textMuted,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _ServerTile extends StatelessWidget {
  const _ServerTile({
    required this.server,
    required this.isSelected,
    required this.isLast,
    required this.broadcasting,
    required this.onTap,
  });

  final UserServer server;
  final bool isSelected;
  final bool isLast;
  final bool broadcasting;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final tileColor = isSelected ? AppTheme.accent : AppTheme.textMuted;
    final tileOpacity = isSelected ? 0.035 : 0.018;

    return GestureDetector(
      onTap: broadcasting ? null : onTap,
      child: ClipRect(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: isSelected
                    ? AppTheme.accent.withOpacity(0.06)
                    : Colors.transparent,
              ),
            ),

            Positioned.fill(
              child: CustomPaint(
                painter: AppNoisePainter(
                  color: tileColor,
                  opacity: tileOpacity,
                  seed: server.address.hashCode,
                  count: 120,
                ),
              ),
            ),

            if (isSelected)
              Positioned.fill(
                child: CustomPaint(
                  painter: AppWavePainter(
                    waves: [
                      WaveConfig(
                        yFraction: 0.35,
                        amplitude: 4,
                        frequency: 3.5,
                        phase: 0.6,
                        color: AppTheme.accent,
                        opacity: 0.10,
                        strokeWidth: 1.0,
                      ),
                      WaveConfig(
                        yFraction: 0.70,
                        amplitude: 3,
                        frequency: 5.0,
                        phase: 1.8,
                        color: AppTheme.accent,
                        opacity: 0.06,
                        strokeWidth: 0.8,
                      ),
                    ],
                  ),
                ),
              ),

            if (!isLast)
              const Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: AppTheme.borderDim,
                ),
              ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
              child: Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppTheme.accent.withOpacity(0.12)
                          : AppTheme.surfaceRaisedSolid,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected
                            ? AppTheme.accent.withOpacity(0.30)
                            : AppTheme.borderGray,
                      ),
                    ),
                    child: Icon(
                      Icons.dns_rounded,
                      size: 17,
                      color: isSelected ? AppTheme.accent : AppTheme.textMuted,
                    ),
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          server.name,
                          style: const TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${server.address}:${server.port}',
                          style: const TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _StatusBadge(address: server.address, port: server.port),
                      const SizedBox(width: 8),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: broadcasting
                              ? AppTheme.surfaceRaisedSolid
                              : isSelected
                              ? AppTheme.accent
                              : AppTheme.accent.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: broadcasting
                                ? AppTheme.borderGray
                                : isSelected
                                ? AppTheme.accent
                                : AppTheme.accent.withOpacity(0.35),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.play_arrow_rounded,
                              size: 13,
                              color: broadcasting
                                  ? AppTheme.textDisabled
                                  : isSelected
                                  ? Colors.white
                                  : AppTheme.accent,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Play',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: broadcasting
                                    ? AppTheme.textDisabled
                                    : isSelected
                                    ? Colors.white
                                    : AppTheme.accent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatefulWidget {
  final String address;
  final int port;
  const _StatusBadge({required this.address, required this.port});

  @override
  State<_StatusBadge> createState() => _StatusBadgeState();
}

class _StatusBadgeState extends State<_StatusBadge> {
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
        if (!snapshot.hasData) {
          return _pill(dot: AppTheme.textMuted, label: '...', sub: null);
        }
        final status = snapshot.data!;
        if (!status.isOnline) {
          return _pill(dot: AppTheme.textMuted, label: 'Offline', sub: null);
        }
        final playerText = (status.players != null && status.maxPlayers != null)
            ? '${status.players}/${status.maxPlayers}'
            : null;
        return _pill(dot: AppTheme.success, label: 'Online', sub: playerText);
      },
    );
  }

  Widget _pill({
    required Color dot,
    required String label,
    required String? sub,
  }) {
    final online = dot == AppTheme.success;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: online
            ? AppTheme.success.withOpacity(0.08)
            : AppTheme.surfaceRaisedSolid,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: online
              ? AppTheme.success.withOpacity(0.30)
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
          if (sub != null) ...[
            const SizedBox(width: 4),
            Text(
              sub,
              style: TextStyle(
                color: AppTheme.success.withOpacity(0.70),
                fontSize: 10,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
