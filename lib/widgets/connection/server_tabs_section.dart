import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../util/user_servers.dart';
import 'my_servers_tab.dart';
import '../../l10n/app_localizations.dart';

class ServerTabsSection extends StatefulWidget {
  const ServerTabsSection({
    super.key,
    required this.savedServers,
    required this.ipController,
    required this.portController,
    required this.onServerSelected,
    required this.onManageServers,
    required this.onResourcePack,
    required this.broadcasting,
    this.resourcePackActive = false,
    this.onDelete,
  });

  final List<UserServer> savedServers;
  final TextEditingController ipController;
  final TextEditingController portController;
  final Function(UserServer) onServerSelected;
  final VoidCallback onManageServers;
  final VoidCallback onResourcePack;
  final bool broadcasting;
  final bool resourcePackActive;
  final Function(int index)? onDelete;

  @override
  State<ServerTabsSection> createState() => _ServerTabsSectionState();
}

class _ServerTabsSectionState extends State<ServerTabsSection> {
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTabHeader(loc),
        const Divider(height: 1, thickness: 1, color: AppTheme.borderDim),
        Expanded(
          child: MyServersTab(
            savedServers: widget.savedServers,
            ipController: widget.ipController,
            portController: widget.portController,
            onServerSelected: widget.onServerSelected,
            broadcasting: widget.broadcasting,
            onDelete: widget.onDelete,
          ),
        ),
      ],
    );
  }

  Widget _buildTabHeader(AppLocalizations loc) {
    final bool disabled = widget.broadcasting;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      child: Row(
        children: [
          _TabButton(
            label: loc.manageServers,
            icon: Icons.settings_rounded,
            disabled: disabled,
            onTap: disabled ? null : widget.onManageServers,
          ),
          const SizedBox(width: 8),
          _TabButton(
            label: 'Resource Pack',
            icon: Icons.extension_rounded,
            disabled: disabled,
            active: widget.resourcePackActive,
            onTap: disabled ? null : widget.onResourcePack,
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool disabled;
  final bool active;
  final IconData? icon;
  final VoidCallback? onTap;

  const _TabButton({
    required this.label,
    this.disabled = false,
    this.active = false,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color fg = disabled
        ? AppTheme.textDisabled
        : active
            ? AppTheme.accent
            : AppTheme.textSecondary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: active ? AppTheme.accent.withValues(alpha: 0.10) : AppTheme.surfaceRaised,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: active ? AppTheme.accent.withValues(alpha: 0.35) : AppTheme.borderGray,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 12, color: fg),
              const SizedBox(width: 5),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: fg,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
