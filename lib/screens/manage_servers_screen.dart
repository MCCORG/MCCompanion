import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../design/design.dart';
import '../theme/app_tokens.dart';
import '../util/user_servers.dart';
import '../util/user_servers_storage.dart';
import '../l10n/app_localizations.dart';
import '../widgets/components/app_toast.dart';
import '../widgets/components/swipe_back.dart';

class ManageServersScreen extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onAddServer;
  final void Function(int index) onEditServer;

  const ManageServersScreen({
    super.key,
    required this.onBack,
    required this.onAddServer,
    required this.onEditServer,
  });

  @override
  State<ManageServersScreen> createState() => ManageServersScreenState();
}

class ManageServersScreenState extends State<ManageServersScreen> {
  List<UserServer> _servers = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    reload();
  }

  Future<void> reload() async {
    final servers = await UserServersStorage.loadServers();
    if (mounted) {
      setState(() {
        _servers = servers;
        _loading = false;
      });
    }
  }

  Future<void> _reorderItem(int oldIndex, int newIndex) async {
    setState(() {
      final moved = _servers.removeAt(oldIndex);
      _servers.insert(newIndex, moved);
    });
    await UserServersStorage.saveServers(_servers);
  }

  Future<void> _deleteServer(int index) async {
    final loc = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.65),
      builder: (_) =>
          _ConfirmDeleteDialog(serverName: _servers[index].name, loc: loc),
    );
    if (confirmed == true) {
      await UserServersStorage.removeServer(index);
      reload();
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return SwipeBack(
      onBack: widget.onBack,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DsHeader(
                title: loc.manageServers,
                actions: [
                  DsButton(
                    label: loc.addServer,
                    icon: Icons.add_rounded,
                    tone: DsButtonTone.neutral,
                    size: DsButtonSize.small,
                    onPressed: widget.onAddServer,
                  ),
                ],
              ),
              Expanded(
                child: _loading
                    ? Center(
                        child: SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 1.8,
                            color: DsColor.textFaint,
                          ),
                        ),
                      )
                    : _servers.isEmpty
                    ? _EmptyState(loc: loc, onAdd: widget.onAddServer)
                    : ReorderableListView.builder(
                        padding: const EdgeInsets.fromLTRB(
                          DsSpace.gutter,
                          0,
                          DsSpace.gutter,
                          DsSpace.xxxl,
                        ),
                        itemCount: _servers.length,
                        buildDefaultDragHandles: false,
                        onReorderItem: _reorderItem,
                        proxyDecorator: (child, index, animation) =>
                            Material(color: Colors.transparent, child: child),
                        itemBuilder: (_, i) => Padding(
                          key: ValueKey(
                            '${_servers[i].address}:${_servers[i].port}:$i',
                          ),
                          padding: const EdgeInsets.only(bottom: DsSpace.sm),
                          child: _ServerCard(
                            server: _servers[i],
                            index: i,
                            onEdit: () => widget.onEditServer(i),
                            onDelete: () => _deleteServer(i),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddEditServerScreen extends StatefulWidget {
  final int? editingIndex;
  final VoidCallback onSaved;
  final VoidCallback onCancel;

  const AddEditServerScreen({
    super.key,
    required this.editingIndex,
    required this.onSaved,
    required this.onCancel,
  });

  @override
  State<AddEditServerScreen> createState() => _AddEditServerScreenState();
}

class _AddEditServerScreenState extends State<AddEditServerScreen> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _addressCtrl = TextEditingController();
  final TextEditingController _portCtrl = TextEditingController(text: '19132');
  final TextEditingController _descCtrl = TextEditingController();
  bool _isJava = false;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _loadIfEditing();
  }

  Future<void> _loadIfEditing() async {
    if (widget.editingIndex == null) {
      setState(() => _loaded = true);
      return;
    }
    final servers = await UserServersStorage.loadServers();
    if (!mounted) return;
    if (widget.editingIndex! < servers.length) {
      final s = servers[widget.editingIndex!];
      _nameCtrl.text = s.name;
      _addressCtrl.text = s.address;
      _portCtrl.text = s.port.toString();
      _descCtrl.text = s.description ?? '';
      _isJava = s.isJava;
    }
    setState(() => _loaded = true);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _addressCtrl.dispose();
    _portCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final loc = AppLocalizations.of(context)!;
    final name = _nameCtrl.text.trim();
    final address = _addressCtrl.text.trim();
    final port = int.tryParse(_portCtrl.text.trim());

    if (name.isEmpty || address.isEmpty) {
      AppToast.show(
        context,
        message: '${loc.serverNameLabel} & ${loc.addressLabel} are required',
        icon: Icons.warning_rounded,
        color: AppTheme.warning,
      );
      return;
    }
    if (port == null || port < 1 || port > 65535) {
      AppToast.show(
        context,
        message: loc.invalidPort,
        icon: Icons.error_outline_rounded,
        color: AppTheme.error,
      );
      return;
    }

    final server = UserServer(
      name: name,
      address: address,
      port: port,
      description: _descCtrl.text.trim().isEmpty ? null : _descCtrl.text.trim(),
      isJava: _isJava,
    );

    if (widget.editingIndex == null) {
      await UserServersStorage.addServer(server);
    } else {
      await UserServersStorage.updateServer(widget.editingIndex!, server);
    }

    widget.onSaved();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final isEditing = widget.editingIndex != null;

    return Column(
      children: [
        DsHeader(
          title: isEditing ? loc.editServer : loc.addServer,
          leading: DsIconButton(
            icon: Icons.close_rounded,
            size: 36,
            onPressed: widget.onCancel,
          ),
        ),

        Expanded(
          child: !_loaded
              ? Center(
                  child: SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.8,
                      color: DsColor.textFaint,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                    DsSpace.gutter,
                    DsSpace.sm,
                    DsSpace.gutter,
                    DsSpace.xxxl,
                  ),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 560),
                      child: Column(
                        children: [
                          _Field(
                            controller: _nameCtrl,
                            label: loc.serverNameLabel,
                            hint: loc.serverNameExampleHint,
                            icon: Icons.label_rounded,
                            autofocus: true,
                          ),
                          const SizedBox(height: DsSpace.md),
                          _Field(
                            controller: _addressCtrl,
                            label: loc.addressLabel,
                            hint: loc.serverAddressExampleHint,
                            icon: Icons.dns_rounded,
                          ),
                          const SizedBox(height: DsSpace.md),
                          _Field(
                            controller: _portCtrl,
                            label: loc.portLabel,
                            icon: Icons.numbers_rounded,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: DsSpace.md),
                          _EditionToggle(
                            isJava: _isJava,
                            onChanged: (value) {
                              setState(() {
                                _isJava = value;
                                final currentPort = int.tryParse(
                                  _portCtrl.text.trim(),
                                );
                                if (value && currentPort == 19132) {
                                  _portCtrl.text = '25565';
                                } else if (!value && currentPort == 25565) {
                                  _portCtrl.text = '19132';
                                }
                              });
                            },
                          ),
                          const SizedBox(height: DsSpace.md),
                          _Field(
                            controller: _descCtrl,
                            label: loc.descriptionLabel,
                            hint: loc.serverDescriptionExampleHint,
                            icon: Icons.notes_rounded,
                            maxLines: 3,
                          ),
                          const SizedBox(height: DsSpace.xl),
                          DsButton(
                            label: loc.save,
                            size: DsButtonSize.large,
                            expand: true,
                            onPressed: _save,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  final AppLocalizations loc;
  final VoidCallback onAdd;
  const _EmptyState({required this.loc, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DsEmptyState(
        icon: Icons.dns_rounded,
        title: loc.noSavedServers,
        message: loc.addServersHint,
        action: DsButton(
          label: loc.addServer,
          icon: Icons.add_rounded,
          tone: DsButtonTone.neutral,
          size: DsButtonSize.small,
          onPressed: onAdd,
        ),
      ),
    );
  }
}

class _ServerCard extends StatelessWidget {
  final UserServer server;
  final int index;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _ServerCard({
    required this.server,
    required this.index,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DsColor.surface,
        borderRadius: DsRadius.cardR,
        border: Border.all(color: DsColor.line),
      ),
      padding: const EdgeInsets.fromLTRB(
        DsSpace.sm,
        DsSpace.md,
        DsSpace.md,
        DsSpace.md,
      ),
      child: Row(
        children: [
          ReorderableDragStartListener(
            index: index,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: DsSpace.xs),
              child: Icon(
                Icons.drag_indicator_rounded,
                size: 20,
                color: DsColor.textFaint,
              ),
            ),
          ),
          const SizedBox(width: DsSpace.sm),
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: DsColor.accent.withValues(alpha: 0.14),
              borderRadius: BorderRadius.circular(DsRadius.control - 2),
            ),
            child: Icon(Icons.dns_rounded, color: DsColor.accent, size: 18),
          ),
          const SizedBox(width: DsSpace.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  server.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: DsType.bodyStrong,
                ),
                const SizedBox(height: DsSpace.xxs),
                Text(
                  '${server.address}:${server.port}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: DsType.caption,
                ),
                if (server.description != null &&
                    server.description!.isNotEmpty) ...[
                  const SizedBox(height: DsSpace.xxs),
                  Text(
                    server.description!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: DsType.caption,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: DsSpace.sm),
          DsIconButton(icon: Icons.edit_rounded, size: 36, onPressed: onEdit),
          const SizedBox(width: DsSpace.sm),
          DsIconButton(
            icon: Icons.delete_outline_rounded,
            size: 36,
            color: DsColor.danger,
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}

class _ConfirmDeleteDialog extends StatelessWidget {
  final String serverName;
  final AppLocalizations loc;

  const _ConfirmDeleteDialog({required this.serverName, required this.loc});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.surfaceRaised,
          borderRadius: AppRadius.large,
          border: Border.all(color: AppTheme.borderGray),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppTheme.error.withValues(alpha: 0.12),
                borderRadius: AppRadius.large,
                border: Border.all(
                  color: AppTheme.error.withValues(alpha: 0.30),
                ),
              ),
              child: const Icon(
                Icons.delete_outline_rounded,
                color: AppTheme.error,
                size: 26,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              loc.deleteServer,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${loc.delete} "$serverName"?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context, false),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.textSecondary,
                      side: const BorderSide(color: AppTheme.borderGray),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(loc.cancel),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.error,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(loc.delete),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final IconData icon;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool autofocus;

  const _Field({
    required this.controller,
    required this.label,
    required this.icon,
    this.hint,
    this.keyboardType,
    this.maxLines = 1,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return DsField(
      controller: controller,
      label: label,
      hint: hint,
      icon: icon,
      keyboardType: keyboardType,
      maxLines: maxLines,
      autofocus: autofocus,
    );
  }
}

class _EditionToggle extends StatelessWidget {
  final bool isJava;
  final ValueChanged<bool> onChanged;

  const _EditionToggle({required this.isJava, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(loc.editionLabel, style: DsType.label),
        const SizedBox(height: DsSpace.sm - 2),
        DsSegmented<bool>(
          value: isJava,
          onChanged: onChanged,
          options: [
            DsOption(value: false, label: loc.bedrockLabel),
            DsOption(value: true, label: loc.labelJava),
          ],
        ),
      ],
    );
  }
}
