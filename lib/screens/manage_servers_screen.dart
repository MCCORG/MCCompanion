import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../util/user_servers.dart';
import '../util/user_servers_storage.dart';
import '../l10n/app_localizations.dart';
import '../widgets/components/app_toast.dart';

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
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppTheme.textSecondary,
                  size: 18,
                ),
                onPressed: widget.onBack,
              ),
              Expanded(
                child: Text(
                  loc.myServers,
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add_rounded, color: AppTheme.accent, size: 22),
                onPressed: widget.onAddServer,
              ),
            ],
          ),
        ),

        Expanded(
          child: _loading
              ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppTheme.accent,
                  ),
                )
              : _servers.isEmpty
              ? _EmptyState(loc: loc, onAdd: widget.onAddServer)
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: _servers.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (_, i) => _ServerCard(
                    server: _servers[i],
                    onEdit: () => widget.onEditServer(i),
                    onDelete: () => _deleteServer(i),
                  ),
                ),
        ),
      ],
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
                icon: Icon(
                  Icons.close_rounded,
                  color: AppTheme.textSecondary,
                  size: 20,
                ),
                onPressed: widget.onCancel,
              ),
              Expanded(
                child: Text(
                  isEditing ? loc.editServer : loc.addServer,
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: !_loaded
              ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppTheme.accent,
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    children: [
                      _Field(
                        controller: _nameCtrl,
                        label: loc.serverNameLabel,
                        hint: loc.serverNameExampleHint,
                        icon: Icons.label_rounded,
                        autofocus: true,
                      ),
                      const SizedBox(height: 12),
                      _Field(
                        controller: _addressCtrl,
                        label: loc.addressLabel,
                        hint: loc.serverAddressExampleHint,
                        icon: Icons.dns_rounded,
                      ),
                      const SizedBox(height: 12),
                      _Field(
                        controller: _portCtrl,
                        label: loc.portLabel,
                        icon: Icons.numbers_rounded,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 12),
                      _EditionToggle(
                        isJava: _isJava,
                        onChanged: (value) {
                          setState(() {
                            _isJava = value;
                            final currentPort = int.tryParse(_portCtrl.text.trim());
                            if (value && currentPort == 19132) {
                              _portCtrl.text = '25565';
                            } else if (!value && currentPort == 25565) {
                              _portCtrl.text = '19132';
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      _Field(
                        controller: _descCtrl,
                        label: loc.descriptionLabel,
                        hint: loc.serverDescriptionExampleHint,
                        icon: Icons.notes_rounded,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _save,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.accent,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                          child: Text(loc.save),
                        ),
                      ),
                    ],
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
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppTheme.surfaceLight,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppTheme.borderGray),
              ),
              child: Icon(
                Icons.dns_outlined,
                size: 28,
                color: AppTheme.textMuted,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              loc.noSavedServers,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppTheme.textSecondary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              loc.addServersHint,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: AppTheme.textMuted),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add_rounded, size: 16),
              label: Text(loc.addServer),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.accent,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServerCard extends StatelessWidget {
  final UserServer server;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _ServerCard({
    required this.server,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.borderGray),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.accent.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(11),
              border: Border.all(color: AppTheme.accent.withValues(alpha: 0.22)),
            ),
            child: Icon(Icons.dns_rounded, color: AppTheme.accent, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  server.name,
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  '${server.address}:${server.port}',
                  style: TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (server.description != null &&
                    server.description!.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    server.description!,
                    style: TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 11,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          _IconBtn(
            icon: Icons.edit_rounded,
            color: AppTheme.accent,
            onTap: onEdit,
          ),
          const SizedBox(width: 6),
          _IconBtn(
            icon: Icons.delete_rounded,
            color: AppTheme.error,
            onTap: onDelete,
          ),
        ],
      ),
    );
  }
}

class _IconBtn extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _IconBtn({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.25)),
        ),
        child: Icon(icon, size: 16, color: color),
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
          borderRadius: BorderRadius.circular(18),
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
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.error.withValues(alpha: 0.30)),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
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
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
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
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      autofocus: autofocus,
      style: TextStyle(color: AppTheme.textPrimary, fontSize: 14),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(
          color: AppTheme.textSecondary,
          fontSize: 13,
        ),
        hintStyle: TextStyle(color: AppTheme.textMuted, fontSize: 13),
        prefixIcon: Icon(icon, color: AppTheme.textMuted, size: 18),
        filled: true,
        fillColor: AppTheme.surface,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 13,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: const BorderSide(color: AppTheme.borderGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: AppTheme.accent, width: 1.5),
        ),
      ),
    );
  }
}

class _EditionToggle extends StatelessWidget {
  final bool isJava;
  final ValueChanged<bool> onChanged;

  const _EditionToggle({required this.isJava, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: AppTheme.borderGray),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      child: Row(
        children: [
          Icon(Icons.sports_esports_rounded, color: AppTheme.textMuted, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.editionLabel,
              style: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
            ),
          ),
          _EditionChip(label: AppLocalizations.of(context)!.bedrockLabel, selected: !isJava, onTap: () => onChanged(false)),
          const SizedBox(width: 6),
          _EditionChip(label: AppLocalizations.of(context)!.labelJava, selected: isJava, onTap: () => onChanged(true)),
        ],
      ),
    );
  }
}

class _EditionChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _EditionChip({required this.label, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? AppTheme.accent : Colors.transparent,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: selected ? AppTheme.accent : AppTheme.borderGray,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : AppTheme.textMuted,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
