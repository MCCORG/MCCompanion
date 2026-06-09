import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/app_localizations.dart';
import '../widgets/components/app_toast.dart';
import '../widgets/console/console_widget.dart';
import '../widgets/dialogs/language_dialog.dart';

class NavigationController {
  final String websiteUrl;
  final String discordUrl;

  final ValueNotifier<Locale?> appLocaleNotifier;
  final ValueNotifier<List<String>> logsNotifier;
  final ScrollController logsScrollController;
  final ValueNotifier<bool> debugEnabledNotifier;

  final VoidCallback? toggleDebugCallback;
  final Future<void> Function()? copyLogsCallback;
  final VoidCallback? clearLogsCallback;
  final VoidCallback? showXboxHelpCallback;
  final void Function(BuildContext context)? showHowToMenuCallback;
  final void Function(BuildContext context)? showHelpMenuCallback;

  final ValueNotifier<bool> consoleOpen = ValueNotifier<bool>(false);

  NavigationController({
    required this.websiteUrl,
    required this.discordUrl,
    required this.appLocaleNotifier,
    required this.logsNotifier,
    required this.logsScrollController,
    required this.debugEnabledNotifier,
    this.toggleDebugCallback,
    this.copyLogsCallback,
    this.clearLogsCallback,
    this.showXboxHelpCallback,
    this.showHowToMenuCallback,
    this.showHelpMenuCallback,
  });

  Future<void> _launch(BuildContext context, String url) async {
    final loc = AppLocalizations.of(context);
    final fallback = loc?.couldNotOpenUrl ?? 'Could not open URL';
    final uri = Uri.tryParse(url);
    if (uri == null || url.isEmpty) {
      AppToast.show(context, message: fallback, color: Colors.red.shade700);
      return;
    }
    try {
      final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!opened)
        AppToast.show(context, message: fallback, color: Colors.red.shade700);
    } catch (_) {
      AppToast.show(context, message: fallback, color: Colors.red.shade700);
    }
  }

  Future<void> openWebsite(BuildContext context) =>
      _launch(context, websiteUrl);

  Future<void> openWebsiteWithCustomUrl(BuildContext context, String url) =>
      _launch(context, url);

  Future<void> openDiscord(BuildContext context) =>
      _launch(context, discordUrl);

  Future<void> showLanguageDialog(BuildContext context) async {
    await LanguageDialog.show(context, appLocaleNotifier: appLocaleNotifier);
  }

  Future<void> showConsole(BuildContext context) async {
    if (consoleOpen.value) return;
    consoleOpen.value = true;
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => ValueListenableBuilder<bool>(
        valueListenable: debugEnabledNotifier,
        builder: (_, debugEnabled, __) => ConsoleDialog(
          logsNotifier: logsNotifier,
          scrollController: logsScrollController,
          debugEnabled: debugEnabled,
          onToggleDebug: toggleDebugCallback ?? () {},
          onClearLogs: clearLogsCallback ?? () {},
          onCopyLogs: copyLogsCallback ?? () {},
        ),
      ),
    );
    consoleOpen.value = false;
  }

  void showHowToMenu(BuildContext context) =>
      showHowToMenuCallback?.call(context);

  void showHelpMenu(BuildContext context) =>
      showHelpMenuCallback?.call(context);

  void showXboxHelp() => showXboxHelpCallback?.call();
}
