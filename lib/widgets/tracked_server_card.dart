import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/tracked_server_model.dart';
import '../services/tracker_api_service.dart';
import '../theme/app_theme.dart';
import '../widgets/components/app_painters.dart';
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
            Container(width: 36, height: 4, decoration: BoxDecoration(color: AppTheme.borderGray, borderRadius: BorderRadius.circular(2))),
            const SizedBox(height: 16),
            _MenuTile(icon: Icons.edit_rounded, label: l.editLabel, onTap: () { Navigator.pop(context); _openEditSheet(); }),
            const SizedBox(height: 4),
            _MenuTile(icon: Icons.delete_outline_rounded, label: l.delete, color: AppTheme.error, onTap: () { Navigator.pop(context); widget.onDelete(); }),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = _statusColor;
    final s = widget.server;
    final hasPlayers = s.players != null && s.maxPlayers != null;
    final playerFraction = hasPlayers ? (s.players! / s.maxPlayers!).clamp(0.0, 1.0) : 0.0;
    final isOnline = s.lastStatus == 'online';
    final isJava = s.platform == 'java';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned.fill(child: Container(color: AppTheme.surfaceRaised)),
            Positioned.fill(child: Container(color: color.withValues(alpha: 0.06))),
            Positioned.fill(
              child: CustomPaint(
                painter: AppNoisePainter(color: color, opacity: 0.035, seed: s.id.hashCode & 0xFFFF, count: 120),
              ),
            ),
            if (isOnline)
              Positioned.fill(
                child: CustomPaint(
                  painter: AppWavePainter(waves: [
                    WaveConfig(yFraction: 0.55, amplitude: 8, frequency: 3.0, phase: 0.4, color: color, opacity: 0.10, strokeWidth: 1.2),
                    WaveConfig(yFraction: 0.75, amplitude: 5, frequency: 4.8, phase: 2.1, color: color, opacity: 0.05, strokeWidth: 0.9),
                  ]),
                ),
              ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: color.withValues(alpha: 0.28)),
                ),
              ),
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 14, 10, 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.10),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: color.withValues(alpha: 0.22)),
                        ),
                        child: Center(
                          child: Icon(
                            isJava ? Icons.computer_rounded : Icons.sports_esports_rounded,
                            color: color,
                            size: 22,
                          ),
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
                                    s.name,
                                    style: TextStyle(color: AppTheme.textPrimary, fontSize: 15, fontWeight: FontWeight.w700),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${s.ip}:${s.port}',
                              style: TextStyle(color: AppTheme.textMuted, fontSize: 11),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Container(
                                  width: 7, height: 7,
                                  decoration: BoxDecoration(color: color, shape: BoxShape.circle,
                                    boxShadow: isOnline ? [BoxShadow(color: color.withValues(alpha: 0.5), blurRadius: 4, spreadRadius: 1)] : null),
                                ),
                                const SizedBox(width: 5),
                                Text(_statusLabel(context), style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600)),
                                const SizedBox(width: 8),
                                _Badge(label: s.platform.toUpperCase(), color: color),
                                if (s.version != null) ...[
                                  const SizedBox(width: 5),
                                  _Badge(label: s.version!, color: AppTheme.textMuted, bg: AppTheme.borderDim),
                                ],
                                if (s.gameMode != null) ...[
                                  const SizedBox(width: 5),
                                  _Badge(label: s.gameMode!.toUpperCase(), color: AppTheme.textMuted, bg: AppTheme.borderDim),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),

                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _togglingNotif
                              ? const SizedBox(width: 36, height: 36, child: Center(child: SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))))
                              : IconButton(
                                  onPressed: _toggleNotifications,
                                  icon: Icon(
                                    s.notificationsEnabled ? Icons.notifications_active_rounded : Icons.notifications_off_outlined,
                                    color: s.notificationsEnabled ? color : AppTheme.textDisabled,
                                    size: 20,
                                  ),
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                                ),
                          IconButton(
                            onPressed: _openMoreMenu,
                            icon: Icon(Icons.more_vert_rounded, color: AppTheme.textMuted, size: 20),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                if (hasPlayers) ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.people_outline_rounded, color: AppTheme.textMuted, size: 11),
                            const SizedBox(width: 4),
                            Text(
                              AppLocalizations.of(context)!.playersCount(s.players!, s.maxPlayers!),
                              style: TextStyle(color: AppTheme.textMuted, fontSize: 11),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: playerFraction,
                            backgroundColor: color.withValues(alpha: 0.12),
                            valueColor: AlwaysStoppedAnimation(color),
                            minHeight: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;
  final Color? bg;
  const _Badge({required this.label, required this.color, this.bg});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
    decoration: BoxDecoration(
      color: bg ?? color.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w700, letterSpacing: 0.4)),
  );
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;
  const _MenuTile({required this.icon, required this.label, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    final c = color ?? AppTheme.textSecondary;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppTheme.surfaceRaised,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: c, size: 18),
            const SizedBox(width: 12),
            Text(label, style: TextStyle(color: c, fontSize: 14, fontWeight: FontWeight.w500)),
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
    _ipCtrl   = TextEditingController(text: widget.server.ip);
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
    final ip   = _ipCtrl.text.trim();
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

    setState(() { _saving = true; _error = null; });

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
      AppToast.show(context, message: AppLocalizations.of(context)!.serverRenamed);
    } else {
      setState(() {
        _saving = false;
        _error = AppLocalizations.of(context)!.failedSave;
      });
    }
  }

  Widget _label(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(text, style: TextStyle(color: AppTheme.textMuted, fontSize: 12, fontWeight: FontWeight.w600)),
  );

  Widget _field(TextEditingController ctrl, {String? hint, TextInputType? keyboardType}) => TextField(
    controller: ctrl,
    keyboardType: keyboardType,
    style: TextStyle(color: AppTheme.textPrimary, fontSize: 14),
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: AppTheme.textDisabled),
      filled: true,
      fillColor: AppTheme.surfaceLight,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
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
                  style: TextStyle(color: AppTheme.textPrimary, fontSize: 17, fontWeight: FontWeight.w700),
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
            _field(_nameCtrl, hint: AppLocalizations.of(context)!.serverNameHint),
            const SizedBox(height: 12),
            _label(AppLocalizations.of(context)!.ipAddressFieldLabel),
            _field(_ipCtrl, hint: AppLocalizations.of(context)!.serverAddressExampleHint),
            const SizedBox(height: 12),
            _label(AppLocalizations.of(context)!.portFieldLabel),
            _field(_portCtrl, hint: '19132', keyboardType: TextInputType.number),
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
              Text(_error!, style: const TextStyle(color: AppTheme.error, fontSize: 13)),
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: _saving
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black))
                    : Text(AppLocalizations.of(context)!.save, style: const TextStyle(fontWeight: FontWeight.w700)),
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

  const _PlatformChip({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected ? AppTheme.brand.withValues(alpha: 0.15) : AppTheme.surfaceLight,
          borderRadius: BorderRadius.circular(10),
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
