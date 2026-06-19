import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../util/user_servers.dart';
import '../../services/server_status_service.dart';
import '../../l10n/app_localizations.dart';

class MyServersTab extends StatefulWidget {
  const MyServersTab({
    super.key,
    required this.savedServers,
    required this.ipController,
    required this.portController,
    required this.onServerSelected,
    required this.broadcasting,
    this.onDelete,
  });

  final List<UserServer> savedServers;
  final TextEditingController ipController;
  final TextEditingController portController;
  final Function(UserServer) onServerSelected;
  final bool broadcasting;
  final Function(int index)? onDelete;

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
      physics: const ClampingScrollPhysics(),
      itemCount: widget.savedServers.length,
      itemBuilder: (context, i) {
        final server = widget.savedServers[i];
        final isLast = i == widget.savedServers.length - 1;
        final isSelected =
            _selectedServer?.address == server.address &&
            _selectedServer?.port == server.port;

        final tile = _ServerTile(
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

        if (widget.onDelete == null || widget.broadcasting) return tile;

        return Dismissible(
          key: ValueKey('${server.address}:${server.port}'),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            color: AppTheme.error.withValues(alpha: 0.85),
            child: const Icon(Icons.delete_outline_rounded, color: Colors.white, size: 22),
          ),
          onDismissed: (_) => widget.onDelete!(i),
          child: tile,
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
          Icon(Icons.dns_outlined, size: 26, color: AppTheme.textMuted),
          const SizedBox(height: 10),
          Text(
            loc.noServerYet,
            textAlign: TextAlign.center,
            style: TextStyle(
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
    return GestureDetector(
      onTap: broadcasting ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: isSelected
            ? AppTheme.accent.withValues(alpha: 0.07)
            : Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    width: 3,
                    height: 32,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppTheme.accent
                          : AppTheme.accent.withValues(alpha: 0),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                server.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: isSelected ? AppTheme.accent : AppTheme.textPrimary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            _StatusDot(address: server.address, port: server.port, isJava: server.isJava),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '${server.address}:${server.port}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Right: play button
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: broadcasting
                          ? AppTheme.surfaceRaisedSolid
                          : isSelected
                          ? AppTheme.accent
                          : AppTheme.accent.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: broadcasting
                            ? AppTheme.borderGray
                            : isSelected
                            ? AppTheme.accent
                            : AppTheme.accent.withValues(alpha: 0.30),
                      ),
                    ),
                    child: Icon(
                      Icons.play_arrow_rounded,
                      size: 18,
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
            if (!isLast)
              const Divider(height: 1, thickness: 1, indent: 16, endIndent: 16, color: AppTheme.borderDim),
          ],
        ),
      ),
    );
  }
}

class _StatusDot extends StatefulWidget {
  final String address;
  final int port;
  final bool isJava;
  const _StatusDot({required this.address, required this.port, this.isJava = false});

  @override
  State<_StatusDot> createState() => _StatusDotState();
}

class _StatusDotState extends State<_StatusDot> {
  late Future<ServerStatus> _statusFuture;

  @override
  void initState() {
    super.initState();
    _statusFuture = ServerStatusService.getStatus(widget.address, widget.port, isJava: widget.isJava);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ServerStatus>(
      future: _statusFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox(width: 6, height: 6);
        }
        final status = snapshot.data!;
        final online = status.isOnline;
        final color = online ? AppTheme.success : AppTheme.textMuted.withValues(alpha: 0.4);
        final label = online
            ? (status.players != null && status.maxPlayers != null
                ? '${status.players}/${status.maxPlayers}'
                : null)
            : null;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            if (label != null) ...[
              const SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(
                  color: AppTheme.success.withValues(alpha: 0.7),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
