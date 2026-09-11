import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/tracked_server_model.dart';
import '../services/tracker_api_service.dart';
import '../theme/app_theme.dart';
import '../design/design.dart';
import '../theme/app_tokens.dart';
import '../widgets/components/app_toast.dart';

class TrackedServerCard extends StatefulWidget {
  final TrackedServer server;
  final VoidCallback onDelete;
  final void Function(TrackedServer updated) onUpdated;

  const TrackedServerCard({
    super.key,
    required this.server,
    required this.onDelete,
    required this.onUpdated,
  });

  @override
  State<TrackedServerCard> createState() => _TrackedServerCardState();
}

class _TrackedServerCardState extends State<TrackedServerCard> {
  bool _togglingNotif = false;

  Color get _statusColor => switch (widget.server.lastStatus) {
    'online' => AppTheme.success,
    'offline' => AppTheme.error,
    _ => AppTheme.textMuted,
  };

  String _statusLabel(BuildContext context) =>
      switch (widget.server.lastStatus) {
        'online' => AppLocalizations.of(context)!.statusOnline,
        'offline' => AppLocalizations.of(context)!.statusOffline,
        _ => AppLocalizations.of(context)!.statusChecking,
      };

  Future<void> _toggleNotifications() async {
    if (_togglingNotif) return;
    setState(() => _togglingNotif = true);

    final newValue = !widget.server.notificationsEnabled;
    final ok = await TrackerApiService.updateServer(
      widget.server.id,
      notificationsEnabled: newValue,
    );

    if (!mounted) return;
    setState(() => _togglingNotif = false);

    if (ok != null) {
      widget.onUpdated(widget.server.copyWith(notificationsEnabled: newValue));
    } else {
      AppToast.show(
        context,
        message: AppLocalizations.of(context)!.failedUpdateNotifications,
        color: AppTheme.error,
      );
    }
  }

  void _openEditSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) =>
          _EditServerSheet(server: widget.server, onSaved: widget.onUpdated),
    );
  }

  void _openMoreMenu() {
    final l = AppLocalizations.of(context)!;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppTheme.borderGray,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            _MenuTile(
              icon: Icons.edit_rounded,
              label: l.editLabel,
              onTap: () {
                Navigator.pop(context);
                _openEditSheet();
              },
            ),
            const SizedBox(height: 4),
            _MenuTile(
              icon: Icons.delete_outline_rounded,
              label: l.delete,
              color: AppTheme.error,
              onTap: () {
                Navigator.pop(context);
                widget.onDelete();
              },
            ),
          ],
        ),
      ),
    );
  }

  String _checkedLabel(AppLocalizations l) {
    final at = widget.server.lastCheckedAt;
    if (at == null) return '';
    final diff = DateTime.now().difference(at.toLocal());
    if (diff.inMinutes < 2) return l.justNow;
    if (diff.inMinutes < 60) return l.minutesAgo(diff.inMinutes);
    if (diff.inHours < 24) return l.hoursAgo(diff.inHours);
    return l.daysAgo(diff.inDays);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final color = _statusColor;
    final s = widget.server;
    final hasPlayers = s.players != null && s.maxPlayers != null;
    final playerFraction = hasPlayers
        ? (s.players! / s.maxPlayers!).clamp(0.0, 1.0)
        : 0.0;
    final isJava = s.platform == 'java';

    final meta = [
      isJava ? l.labelJava : l.bedrockLabel,
      if (s.version != null) s.version!,
      if (s.gameMode != null) s.gameMode!,
    ].join('  ·  ');

    return Padding(
      padding: const EdgeInsets.only(bottom: DsSpace.sm),
      child: Container(
        decoration: BoxDecoration(
          color: DsColor.surface,
          borderRadius: DsRadius.cardR,
          border: Border.all(color: DsColor.line),
        ),
        padding: const EdgeInsets.all(DsSpace.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(DsRadius.control - 2),
                  ),
                  child: Icon(
                    isJava
                        ? Icons.computer_rounded
                        : Icons.sports_esports_rounded,
                    color: color,
                    size: 18,
                  ),
                ),
                const SizedBox(width: DsSpace.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        s.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: DsType.bodyStrong,
                      ),
                      const SizedBox(height: DsSpace.xxs),
                      Text(
                        '${s.ip}:${s.port}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: DsType.caption,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: DsSpace.sm),
                DsBadge(label: _statusLabel(context), color: color, dot: true),
              ],
            ),
            const SizedBox(height: DsSpace.md),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (hasPlayers) ...[
                        Row(
                          children: [
                            Text(
                              '${s.players}',
                              style: DsType.bodyStrong.copyWith(
                                fontFeatures: const [
                                  FontFeature.tabularFigures(),
                                ],
                              ),
                            ),
                            Text(
                              ' / ${s.maxPlayers}  ${l.serverStatPlayers.toLowerCase()}',
                              style: DsType.caption,
                            ),
                          ],
                        ),
                        const SizedBox(height: DsSpace.sm - 2),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: LinearProgressIndicator(
                            value: playerFraction,
                            backgroundColor: DsColor.inset,
                            valueColor: AlwaysStoppedAnimation(color),
                            minHeight: 4,
                          ),
                        ),
                        const SizedBox(height: DsSpace.sm),
                      ],
                      Text(
                        meta,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: DsType.caption,
                      ),
                      if (s.lastCheckedAt != null) ...[
                        const SizedBox(height: DsSpace.xxs),
                        Text(_checkedLabel(l), style: DsType.caption),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: DsSpace.md),
                _togglingNotif
                    ? const SizedBox(
                        width: 36,
                        height: 36,
                        child: Center(
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                      )
                    : DsIconButton(
                        icon: s.notificationsEnabled
                            ? Icons.notifications_active_rounded
                            : Icons.notifications_off_outlined,
                        size: 36,
                        color: s.notificationsEnabled
                            ? DsColor.accent
                            : DsColor.textFaint,
                        onPressed: _toggleNotifications,
                      ),
                const SizedBox(width: DsSpace.sm - 2),
                DsIconButton(
                  icon: Icons.more_horiz_rounded,
                  size: 36,
                  onPressed: _openMoreMenu,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;
  const _MenuTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppTheme.textSecondary;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppTheme.surfaceRaised,
          borderRadius: AppRadius.medium,
        ),
        child: Row(
          children: [
            Icon(icon, color: c, size: 18),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                color: c,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EditServerSheet extends StatefulWidget {
  final TrackedServer server;
  final void Function(TrackedServer) onSaved;
  const _EditServerSheet({required this.server, required this.onSaved});

  @override
  State<_EditServerSheet> createState() => _EditServerSheetState();
}

class _EditServerSheetState extends State<_EditServerSheet> {
  late final TextEditingController _nameCtrl;
  late final TextEditingController _ipCtrl;
  late final TextEditingController _portCtrl;
  late String _platform;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.server.name);
    _ipCtrl = TextEditingController(text: widget.server.ip);
    _portCtrl = TextEditingController(text: widget.server.port.toString());
    _platform = widget.server.platform;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _ipCtrl.dispose();
    _portCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final name = _nameCtrl.text.trim();
    final ip = _ipCtrl.text.trim();
    final port = int.tryParse(_portCtrl.text.trim());

    final l = AppLocalizations.of(context)!;
    if (name.isEmpty || name.length > 50) {
      setState(() => _error = l.nameValidationError);
      return;
    }
    if (ip.isEmpty) {
      setState(() => _error = l.ipRequiredError);
      return;
    }
    if (port == null || port < 1 || port > 65535) {
      setState(() => _error = l.portRangeError);
      return;
    }

    setState(() {
      _saving = true;
      _error = null;
    });

    final updated = await TrackerApiService.updateServer(
      widget.server.id,
      name: name,
      ip: ip,
      port: port,
      platform: _platform,
    );
    if (!mounted) return;

    if (updated != null) {
      widget.onSaved(updated);
      Navigator.of(context).pop();
      AppToast.show(
        context,
        message: AppLocalizations.of(context)!.serverRenamed,
      );
    } else {
      setState(() {
        _saving = false;
        _error = AppLocalizations.of(context)!.failedSave;
      });
    }
  }

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(
      text,
      style: TextStyle(
        color: AppTheme.textMuted,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  Widget _field(
    TextEditingController ctrl, {
    String? hint,
    TextInputType? keyboardType,
  }) => TextField(
    controller: ctrl,
    keyboardType: keyboardType,
    style: TextStyle(color: AppTheme.textPrimary, fontSize: 14),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: AppTheme.textDisabled),
      filled: true,
      fillColor: AppTheme.surfaceLight,
      border: OutlineInputBorder(
        borderRadius: AppRadius.small,
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20 + bottom),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.editServerTitle,
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(Icons.close_rounded, color: AppTheme.textMuted),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _label(AppLocalizations.of(context)!.nameLabel),
            _field(
              _nameCtrl,
              hint: AppLocalizations.of(context)!.serverNameHint,
            ),
            const SizedBox(height: 12),
            _label(AppLocalizations.of(context)!.ipAddressFieldLabel),
            _field(
              _ipCtrl,
              hint: AppLocalizations.of(context)!.serverAddressExampleHint,
            ),
            const SizedBox(height: 12),
            _label(AppLocalizations.of(context)!.portFieldLabel),
            _field(
              _portCtrl,
              hint: '19132',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            _label(AppLocalizations.of(context)!.platformFieldLabel),
            Row(
              children: [
                Expanded(
                  child: _PlatformChip(
                    label: AppLocalizations.of(context)!.bedrockLabel,
                    selected: _platform == 'bedrock',
                    onTap: () => setState(() => _platform = 'bedrock'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _PlatformChip(
                    label: AppLocalizations.of(context)!.labelJava,
                    selected: _platform == 'java',
                    onTap: () => setState(() => _platform = 'java'),
                  ),
                ),
              ],
            ),
            if (_error != null) ...[
              const SizedBox(height: 10),
              Text(
                _error!,
                style: const TextStyle(color: AppTheme.error, fontSize: 13),
              ),
            ],
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _saving ? null : _save,
                style: FilledButton.styleFrom(
                  backgroundColor: AppTheme.brand,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: _saving
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.black,
                        ),
                      )
                    : Text(
                        AppLocalizations.of(context)!.save,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlatformChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _PlatformChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? AppTheme.brand.withValues(alpha: 0.15)
              : AppTheme.surfaceLight,
          borderRadius: AppRadius.small,
          border: Border.all(
            color: selected ? AppTheme.brand : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selected ? AppTheme.brand : AppTheme.textMuted,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
