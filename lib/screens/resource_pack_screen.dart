import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../util/resource_pack_prefs.dart';
import '../widgets/components/app_toast.dart';

class ResourcePackScreen extends StatefulWidget {
  final VoidCallback onBack;
  const ResourcePackScreen({super.key, required this.onBack});

  @override
  State<ResourcePackScreen> createState() => _ResourcePackScreenState();
}

class _ResourcePackScreenState extends State<ResourcePackScreen> {
  final _urlCtrl = TextEditingController();
  bool _enabled = false;
  bool _loaded = false;
  String? _urlWarning;

  @override
  void initState() {
    super.initState();
    _load();
    _urlCtrl.addListener(_validateUrl);
  }

  Future<void> _load() async {
    final url = await ResourcePackPrefs.getUrl();
    final enabled = await ResourcePackPrefs.isEnabled();
    if (!mounted) return;
    setState(() {
      _urlCtrl.text = url ?? '';
      _enabled = enabled;
      _loaded = true;
    });
    _validateUrl();
  }

  void _validateUrl() {
    final url = _urlCtrl.text.trim();
    final l = AppLocalizations.of(context);
    String? warning;
    if (url.isNotEmpty && l != null) {
      if (url.contains('cdn.discordapp.com') ||
          url.contains('media.discordapp.net')) {
        warning = l.rpWarnDiscord;
      } else if (!url.startsWith('https://')) {
        warning = l.rpWarnHttps;
      } else if (!url.endsWith('.mcpack') && !url.endsWith('.zip')) {
        warning = l.rpWarnExtension;
      }
    }
    if (warning != _urlWarning) setState(() => _urlWarning = warning);
  }

  Future<void> _save() async {
    final url = _urlCtrl.text.trim();
    final l = AppLocalizations.of(context)!;
    if (_enabled && url.isEmpty) {
      AppToast.show(
        context,
        message: l.rpToastEnterUrl,
        icon: Icons.warning_rounded,
        color: AppTheme.warning,
      );
      return;
    }
    if (_enabled && _urlWarning != null) {
      AppToast.show(
        context,
        message: _urlWarning!,
        icon: Icons.warning_rounded,
        color: AppTheme.warning,
      );
      return;
    }
    await ResourcePackPrefs.save(url: url, enabled: _enabled);
    if (!mounted) return;
    AppToast.show(
      context,
      message: l.rpToastSaved,
      icon: Icons.check_rounded,
      color: AppTheme.accent,
    );
    widget.onBack();
  }

  void _showHelpSheet(
    BuildContext context,
    String title,
    Widget body, {
    IconData icon = Icons.info_rounded,
    Color iconColor = const Color(0xFF60A5FA),
  }) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.65),
      builder: (ctx) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 16, 16),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.08),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: iconColor.withValues(alpha: 0.18),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: iconColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(icon, color: iconColor, size: 18),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      icon: Icon(
                        Icons.close_rounded,
                        color: AppTheme.textMuted,
                        size: 18,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      splashRadius: 16,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 22),
                child: body,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _urlCtrl.removeListener(_validateUrl);
    _urlCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

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
                  l.rpScreenTitle,
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
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 480),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 28),
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: AppTheme.accent.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppTheme.accent.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Icon(
                            Icons.layers_rounded,
                            color: AppTheme.accent,
                            size: 26,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l.rpScreenTitle,
                          style: TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l.rpExplanation,
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 13,
                            height: 1.6,
                          ),
                        ),

                        const SizedBox(height: 28),

                        Text(
                          l.rpPackUrlLabel.toUpperCase(),
                          style: TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _urlCtrl,
                          keyboardType: TextInputType.url,
                          autocorrect: false,
                          style: TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            hintText: l.rpPackUrlHint,
                            prefixIcon: Icon(
                              Icons.link_rounded,
                              color: AppTheme.textMuted,
                              size: 18,
                            ),
                          ),
                        ),
                        if (_urlWarning != null) ...[
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.warning.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppTheme.warning.withValues(alpha: 0.3),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.warning_amber_rounded,
                                  color: AppTheme.warning,
                                  size: 14,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    _urlWarning!,
                                    style: TextStyle(
                                      color: AppTheme.warning,
                                      fontSize: 12,
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],

                        const SizedBox(height: 20),

                        Container(
                          decoration: BoxDecoration(
                            color: AppTheme.surfaceRaised,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppTheme.borderGray),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                _enabled
                                    ? Icons.check_circle_rounded
                                    : Icons.radio_button_unchecked_rounded,
                                color: _enabled
                                    ? AppTheme.accent
                                    : AppTheme.textMuted,
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  l.rpEnableToggle,
                                  style: TextStyle(
                                    color: AppTheme.textPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Switch(
                                value: _enabled,
                                onChanged: (v) => setState(() => _enabled = v),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: _save,
                            icon: const Icon(Icons.save_rounded, size: 18),
                            label: Text(
                              l.save,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                          ),
                        ),

                        const SizedBox(height: 32),

                        Container(
                          decoration: BoxDecoration(
                            color: AppTheme.surfaceRaised,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppTheme.borderGray),
                          ),
                          child: Column(
                            children: [
                              _InfoRow(
                                icon: Icons.check_circle_outline_rounded,
                                iconColor: AppTheme.success,
                                label: l.rpWhatWorks,
                                onTap: () => _showHelpSheet(
                                  context,
                                  l.rpWhatWorks,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _ModalBullet(
                                        title: l.rpWorksGithub,
                                        hint: l.rpWorksGithubHint,
                                        ok: true,
                                      ),
                                      _ModalBullet(
                                        title: l.rpWorksCloudflare,
                                        hint: l.rpWorksCloudflareHint,
                                        ok: true,
                                      ),
                                      _ModalBullet(
                                        title: l.rpWorksDirect,
                                        hint: l.rpWorksDirectHint,
                                        ok: true,
                                      ),
                                      Divider(
                                        height: 20,
                                        color: AppTheme.borderGray,
                                      ),
                                      _ModalBullet(
                                        title: l.rpNoDiscord,
                                        hint: l.rpNoDiscordHint,
                                        ok: false,
                                      ),
                                      _ModalBullet(
                                        title: l.rpNoDrive,
                                        hint: l.rpNoDriveHint,
                                        ok: false,
                                      ),
                                      _ModalBullet(
                                        title: l.rpNoEncrypted,
                                        hint: l.rpNoEncryptedHint,
                                        ok: false,
                                      ),
                                    ],
                                  ),
                                  icon: Icons.check_circle_outline_rounded,
                                  iconColor: AppTheme.success,
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: AppTheme.borderGray,
                                indent: 52,
                              ),
                              _InfoRow(
                                icon: Icons.cleaning_services_rounded,
                                iconColor: Colors.orangeAccent,
                                label: l.rpClearMinecraftTitle,
                                onTap: () => _showHelpSheet(
                                  context,
                                  l.rpClearMinecraftTitle,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        l.rpClearWhy,
                                        style: TextStyle(
                                          color: AppTheme.textSecondary,
                                          fontSize: 13,
                                          height: 1.6,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      _ModalStep(n: '1', text: l.rpClearStep1),
                                      _ModalStep(n: '2', text: l.rpClearStep2),
                                      _ModalStep(n: '3', text: l.rpClearStep3),
                                    ],
                                  ),
                                  icon: Icons.cleaning_services_rounded,
                                  iconColor: Colors.orangeAccent,
                                ),
                              ),
                              Divider(
                                height: 1,
                                color: AppTheme.borderGray,
                                indent: 52,
                              ),
                              _InfoRow(
                                icon: Icons.refresh_rounded,
                                iconColor: AppTheme.info,
                                label: l.rpRelayTitle,
                                onTap: () => _showHelpSheet(
                                  context,
                                  l.rpRelayTitle,
                                  Text(
                                    l.rpRelayBody,
                                    style: TextStyle(
                                      color: AppTheme.textSecondary,
                                      fontSize: 14,
                                      height: 1.65,
                                    ),
                                  ),
                                  icon: Icons.refresh_rounded,
                                  iconColor: AppTheme.info,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;
  final VoidCallback onTap;
  const _InfoRow({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 16),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: AppTheme.textMuted,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}

class _ModalBullet extends StatelessWidget {
  final String title;
  final String hint;
  final bool ok;
  const _ModalBullet({
    required this.title,
    required this.hint,
    required this.ok,
  });

  @override
  Widget build(BuildContext context) {
    final color = ok ? AppTheme.success : AppTheme.error;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              ok ? Icons.check_rounded : Icons.close_rounded,
              color: color,
              size: 13,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  hint,
                  style: TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ModalStep extends StatelessWidget {
  final String n;
  final String text;
  const _ModalStep({required this.n, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 26,
            height: 26,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.orangeAccent.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              n,
              style: const TextStyle(
                color: Colors.orangeAccent,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                text,
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
