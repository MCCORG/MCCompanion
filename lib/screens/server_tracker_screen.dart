import 'dart:async';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/tracked_server_model.dart';
import '../services/auth_service.dart';
import '../services/server_tracker_service.dart';
import '../services/tracker_api_service.dart';
import '../theme/app_theme.dart';
import '../widgets/components/app_toast.dart';
import '../widgets/tracked_server_card.dart';
import 'paywall_screen.dart';

class ServerTrackerScreen extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback? onGoToLogin;

  const ServerTrackerScreen({
    super.key,
    required this.onBack,
    this.onGoToLogin,
  });

  @override
  State<ServerTrackerScreen> createState() => _ServerTrackerScreenState();
}

class _ServerTrackerScreenState extends State<ServerTrackerScreen> {
  StreamSubscription<List<TrackedServer>>? _sub;
  StreamSubscription<TrackerSlots?>? _slotsSub;
  StreamSubscription? _authSub;

  List<TrackedServer> _servers = [];
  TrackerSlots? _slots;
  bool _loading = true;
  bool _isLoggedIn = false;
  bool _refreshing = false;
  int _countdown = ServerTrackerService.pollInterval.inSeconds;
  Timer? _countdownTimer;

  @override
  void initState() {
    super.initState();
    _checkAuth();
    _startCountdown();
    _authSub = AuthService.userStream.listen((_) => _checkAuth());
  }

  void _startCountdown() {
    _countdown = ServerTrackerService.pollInterval.inSeconds;
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _countdown = ServerTrackerService.pollInterval.inSeconds;
        }
      });
    });
  }

  Future<void> _manualRefresh() async {
    if (_refreshing) return;
    setState(() => _refreshing = true);
    await ServerTrackerService.instance.refresh();
    if (!mounted) return;
    setState(() {
      _refreshing = false;
      _countdown = ServerTrackerService.pollInterval.inSeconds;
    });
  }

  void _checkAuth() {
    final user = AuthService.currentUser;
    _isLoggedIn = user != null;
    if (_isLoggedIn) _startListening();
    setState(() {});
  }

  void _startListening() {
    _sub = ServerTrackerService.instance.serversStream.listen((servers) {
      if (mounted)
        setState(() {
          _servers = servers;
          _loading = false;
          _countdown = ServerTrackerService.pollInterval.inSeconds;
        });
    });
    _slotsSub = ServerTrackerService.instance.slotsStream.listen((slots) {
      if (mounted) setState(() => _slots = slots);
    });
    final cached = ServerTrackerService.instance.servers;
    if (cached.isNotEmpty) {
      _servers = cached;
      _slots = ServerTrackerService.instance.slots;
      _loading = false;
    } else {
      ServerTrackerService.instance.refresh();
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    _slotsSub?.cancel();
    _authSub?.cancel();
    _countdownTimer?.cancel();
    super.dispose();
  }

  Future<void> _deleteServer(TrackedServer server) async {
    final confirmed = await showDialog<bool>(
      context: context,
      barrierColor: Colors.black.withOpacity(0.65),
      builder: (_) => AlertDialog(
        backgroundColor: AppTheme.surfaceRaised,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          AppLocalizations.of(context)!.removeServerTitle,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          AppLocalizations.of(context)!.removeServerConfirm(server.name),
          style: const TextStyle(color: AppTheme.textMuted, fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              AppLocalizations.of(context)!.cancel,
              style: const TextStyle(color: AppTheme.textMuted),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              AppLocalizations.of(context)!.delete,
              style: const TextStyle(
                color: AppTheme.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
    if (confirmed != true || !mounted) return;

    final ok = await TrackerApiService.deleteServer(server.id);
    if (!mounted) return;
    if (ok) {
      AppToast.show(
        context,
        message: AppLocalizations.of(context)!.serverRemoved(server.name),
      );
      await ServerTrackerService.instance.refresh();
    } else {
      AppToast.show(
        context,
        message: AppLocalizations.of(context)!.removeServerFailed,
        color: AppTheme.error,
      );
    }
  }

  void _openPaywall() {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => PaywallScreen(
          onSuccess: () async {
            await Future.delayed(const Duration(seconds: 2));
            await ServerTrackerService.instance.refresh();
          },
        ),
      ),
    );
  }

  void _openAddSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _AddServerSheet(
        onAdded: () => ServerTrackerService.instance.refresh(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppTheme.surface,
            border: Border(
              bottom: BorderSide(color: AppTheme.borderGray, width: 0.5),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppTheme.textSecondary,
                  size: 18,
                ),
                onPressed: widget.onBack,
              ),
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.serverTrackerTitle,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (_isLoggedIn && _slots != null)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Text(
                    '${_slots!.used}/${_slots!.total}',
                    style: TextStyle(
                      color: _slots!.remaining == 0
                          ? AppTheme.warning
                          : AppTheme.textMuted,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              if (_isLoggedIn && !_loading && _servers.isNotEmpty) ...[
                _CountdownLabel(countdown: _countdown),
                _refreshing
                    ? SizedBox(
                        width: 36,
                        height: 36,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppTheme.brand,
                          ),
                        ),
                      )
                    : IconButton(
                        icon: const Icon(
                          Icons.refresh_rounded,
                          color: AppTheme.textSecondary,
                          size: 20,
                        ),
                        onPressed: _manualRefresh,
                        tooltip: AppLocalizations.of(context)!.refreshStatus,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 36,
                          minHeight: 36,
                        ),
                      ),
              ],
              if (_isLoggedIn)
                IconButton(
                  icon: Icon(
                    Icons.add_rounded,
                    color: _slots != null && _slots!.remaining == 0
                        ? AppTheme.textDisabled
                        : AppTheme.brand,
                    size: 24,
                  ),
                  onPressed: _slots != null && _slots!.remaining == 0
                      ? _openPaywall
                      : _openAddSheet,
                  tooltip: AppLocalizations.of(context)!.addServer,
                ),
            ],
          ),
        ),

        if (_slots != null && _slots!.remaining == 0 && !_loading && _isLoggedIn)
          Container(
            margin: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.orange.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.orange.withValues(alpha: 0.4)),
            ),
            child: Row(
              children: [
                const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'You\'ve reached your server limit. Upgrade to track more servers.',
                    style: TextStyle(
                      color: Colors.orange.shade300,
                      fontSize: 12,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _openPaywall,
                  child: Text(
                    'Upgrade',
                    style: TextStyle(
                      color: AppTheme.brand,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),

        Expanded(
          child: !_isLoggedIn
              ? _NotLoggedIn(onLogin: widget.onGoToLogin)
              : _loading
              ? Center(child: CircularProgressIndicator(color: AppTheme.brand))
              : _servers.isEmpty
              ? _EmptyState(onAdd: _openAddSheet)
              : RefreshIndicator(
                  color: AppTheme.brand,
                  onRefresh: ServerTrackerService.instance.refresh,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    itemCount: _servers.length,
                    itemBuilder: (_, i) => TrackedServerCard(
                      server: _servers[i],
                      onDelete: () => _deleteServer(_servers[i]),
                      onUpdated: (updated) {
                        setState(() {
                          _servers = [
                            for (final s in _servers)
                              if (s.id == updated.id) updated else s,
                          ];
                        });
                      },
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}

class _NotLoggedIn extends StatelessWidget {
  final VoidCallback? onLogin;
  const _NotLoggedIn({this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.lock_outline_rounded,
              color: AppTheme.textMuted,
              size: 52,
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.trackerSignInRequired,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.trackerSignInSubtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppTheme.textMuted,
                fontSize: 13,
                height: 1.5,
              ),
            ),
            if (onLogin != null) ...[
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onLogin,
                style: FilledButton.styleFrom(
                  backgroundColor: AppTheme.brand,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 13,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.login_rounded),
                label: Text(
                  AppLocalizations.of(context)!.signIn,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final VoidCallback onAdd;
  const _EmptyState({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.radar_rounded,
              color: AppTheme.textMuted,
              size: 52,
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.noServersTracked,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.trackerEmptySubtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppTheme.textMuted,
                fontSize: 13,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onAdd,
              style: FilledButton.styleFrom(
                backgroundColor: AppTheme.brand,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 13,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.add_rounded),
              label: Text(
                AppLocalizations.of(context)!.addServer,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddServerSheet extends StatefulWidget {
  final VoidCallback onAdded;
  const _AddServerSheet({required this.onAdded});

  @override
  State<_AddServerSheet> createState() => _AddServerSheetState();
}

class _AddServerSheetState extends State<_AddServerSheet> {
  final _nameCtrl = TextEditingController();
  final _ipCtrl = TextEditingController();
  final _portCtrl = TextEditingController(text: '19132');
  String _platform = 'bedrock';
  bool _saving = false;
  String? _error;

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
    final port = int.tryParse(_portCtrl.text.trim()) ?? 0;

    if (name.isEmpty || ip.isEmpty || port <= 0) {
      setState(() => _error = AppLocalizations.of(context)!.fillAllFields);
      return;
    }

    setState(() {
      _saving = true;
      _error = null;
    });

    final result = await TrackerApiService.addServer(
      name: name,
      ip: ip,
      port: port,
      platform: _platform,
    );

    if (!mounted) return;

    if (result.server != null) {
      widget.onAdded();
      Navigator.of(context).pop();
      AppToast.show(
        context,
        message: AppLocalizations.of(context)!.serverAdded(name),
      );
    } else {
      setState(() {
        _saving = false;
        _error = result.error == 'no_slots'
            ? AppLocalizations.of(context)!.slotUsedUpgrade
            : AppLocalizations.of(context)!.addServerFailed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20 + bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.addServer,
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.close_rounded,
                  color: AppTheme.textMuted,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _Field(
            label: AppLocalizations.of(context)!.serverNameLabel,
            controller: _nameCtrl,
            hint: 'e.g. My Server',
          ),
          const SizedBox(height: 12),
          _Field(
            label: AppLocalizations.of(context)!.ipAddressLabel,
            controller: _ipCtrl,
            hint: 'e.g. play.hypixel.net',
          ),
          const SizedBox(height: 12),
          _Field(
            label: AppLocalizations.of(context)!.portLabel,
            controller: _portCtrl,
            hint: '19132',
            keyboard: TextInputType.number,
          ),
          const SizedBox(height: 12),
          Text(
            AppLocalizations.of(context)!.platformLabel,
            style: const TextStyle(
              color: AppTheme.textMuted,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              _PlatformChip(
                label: AppLocalizations.of(context)!.bedrockLabel,
                value: 'bedrock',
                selected: _platform,
                onTap: (v) => setState(() => _platform = v),
              ),
              const SizedBox(width: 8),
              _PlatformChip(
                label: AppLocalizations.of(context)!.labelJava,
                value: 'java',
                selected: _platform,
                onTap: (v) => setState(() => _platform = v),
              ),
            ],
          ),
          if (_error != null) ...[
            const SizedBox(height: 12),
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
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
                      AppLocalizations.of(context)!.addLabel,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboard;
  const _Field({
    required this.label,
    required this.controller,
    required this.hint,
    this.keyboard = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppTheme.textMuted,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          keyboardType: keyboard,
          style: const TextStyle(color: AppTheme.textPrimary, fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppTheme.textDisabled),
            filled: true,
            fillColor: AppTheme.surfaceLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class _CountdownLabel extends StatelessWidget {
  final int countdown;
  const _CountdownLabel({required this.countdown});

  @override
  Widget build(BuildContext context) {
    final m = (countdown ~/ 60).toString().padLeft(2, '0');
    final s = (countdown % 60).toString().padLeft(2, '0');
    return Text(
      '$m:$s',
      style: const TextStyle(
        color: AppTheme.textDisabled,
        fontSize: 11,
        fontFamily: 'monospace',
      ),
    );
  }
}

class _PlatformChip extends StatelessWidget {
  final String label, value, selected;
  final void Function(String) onTap;
  const _PlatformChip({
    required this.label,
    required this.value,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selected == value;
    return GestureDetector(
      onTap: () => onTap(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.brand.withOpacity(0.15)
              : AppTheme.surfaceLight,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppTheme.brand : AppTheme.borderGray,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppTheme.brand : AppTheme.textMuted,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
