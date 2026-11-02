import 'package:flutter/material.dart';

import '../design/design.dart';
import '../screens/manage_servers_screen.dart';

class DesktopManageServersScreen extends StatefulWidget {
  static const double splitWidth = 880;
  static const double formWidth = 400;

  final GlobalKey<ManageServersScreenState> listKey;
  final VoidCallback onBack;
  final VoidCallback onAddServer;
  final void Function(int index) onEditServer;

  const DesktopManageServersScreen({
    super.key,
    required this.listKey,
    required this.onBack,
    required this.onAddServer,
    required this.onEditServer,
  });

  @override
  State<DesktopManageServersScreen> createState() =>
      _DesktopManageServersScreenState();
}

class _DesktopManageServersScreenState
    extends State<DesktopManageServersScreen> {
  int? _editingIndex;
  int _formRevision = 0;

  void _resetForm([int? editingIndex]) {
    setState(() {
      _editingIndex = editingIndex;
      _formRevision++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final split =
            constraints.maxWidth >= DesktopManageServersScreen.splitWidth;
        final list = ManageServersScreen(
          key: widget.listKey,
          onBack: widget.onBack,
          onAddServer: split ? () => _resetForm() : widget.onAddServer,
          onEditServer: split ? _resetForm : widget.onEditServer,
          onListChanged: split ? () => _resetForm() : null,
        );
        if (!split) return list;
        return Row(
          children: [
            Expanded(child: list),
            Container(
              width: DesktopManageServersScreen.formWidth,
              decoration: BoxDecoration(
                color: DsColor.surfaceQuiet,
                border: Border(left: BorderSide(color: DsColor.line)),
              ),
              child: AddEditServerScreen(
                key: ValueKey('form-$_formRevision'),
                editingIndex: _editingIndex,
                onSaved: () {
                  widget.listKey.currentState?.reload();
                  _resetForm();
                },
                onCancel: () => _resetForm(),
                showClose: _editingIndex != null,
              ),
            ),
          ],
        );
      },
    );
  }
}
