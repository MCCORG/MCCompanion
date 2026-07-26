import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../util/user_servers.dart';
import '../components/app_sheet.dart';
import 'my_servers_tab.dart';

class ServerPickerSheet extends StatelessWidget {
  const ServerPickerSheet({
    super.key,
    required this.savedServers,
    required this.ipController,
    required this.portController,
    required this.onServerSelected,
    required this.onManageServers,
    this.onDelete,
  });

  final List<UserServer> savedServers;
  final TextEditingController ipController;
  final TextEditingController portController;
  final Function(UserServer) onServerSelected;
  final VoidCallback onManageServers;
  final Function(int index)? onDelete;

  static Future<void> show(
    BuildContext context, {
    required List<UserServer> savedServers,
    required TextEditingController ipController,
    required TextEditingController portController,
    required Function(UserServer) onServerSelected,
    required VoidCallback onManageServers,
    Function(int index)? onDelete,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ServerPickerSheet(
        savedServers: savedServers,
        ipController: ipController,
        portController: portController,
        onServerSelected: onServerSelected,
        onManageServers: onManageServers,
        onDelete: onDelete,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return AppSheet(
      onClose: () => Navigator.of(context).pop(),
      maxHeightFactor: 0.75,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    loc.chooseServerTitle,
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    onManageServers();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceRaised,
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(color: AppTheme.borderGray),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.settings_rounded,
                          size: 13,
                          color: AppTheme.textSecondary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          loc.manageServers,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, color: AppTheme.borderDim),
          Flexible(
            child: MyServersTab(
              savedServers: savedServers,
              ipController: ipController,
              portController: portController,
              broadcasting: false,
              shrinkWrap: true,
              selectedAddress: ipController.text.trim(),
              selectedPort: int.tryParse(portController.text),
              onDelete: onDelete,
              onServerSelected: (server) {
                onServerSelected(server);
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
