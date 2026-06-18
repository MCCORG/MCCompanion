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
  final TextEditingController _urlCtrl = TextEditingController();
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
    final url     = await ResourcePackPrefs.getUrl();
    final enabled = await ResourcePackPrefs.isEnabled();
    if (!mounted) return;
    setState(() {
      _urlCtrl.text = url ?? '';
      _enabled = enabled;
      _loaded  = true;
    });
    _validateUrl();
  }

  void _validateUrl() {
    final url = _urlCtrl.text.trim();
    final l = AppLocalizations.of(context);
    String? warning;
    if (url.isNotEmpty && l != null) {
      if (url.contains('cdn.discordapp.com') || url.contains('media.discordapp.net')) {
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
      AppToast.show(context,
          message: l.rpToastEnterUrl,
          icon: Icons.warning_rounded,
          color: AppTheme.warning);
      return;
    }
    if (_enabled && _urlWarning != null) {
      AppToast.show(context,
          message: _urlWarning!,
          icon: Icons.warning_rounded,
          color: AppTheme.warning);
      return;
    }
    await ResourcePackPrefs.save(url: url, enabled: _enabled);
    if (!mounted) return;
    AppToast.show(context,
        message: l.rpToastSaved,
        icon: Icons.check_rounded,
        color: AppTheme.accent);
    widget.onBack();
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
            border: Border(bottom: BorderSide(color: AppTheme.borderGray, width: 0.5)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded, color: AppTheme.textSecondary, size: 18),
                onPressed: widget.onBack,
              ),
              Expanded(
                child: Text(
                  l.rpScreenTitle,
                  style: TextStyle(color: AppTheme.textPrimary, fontSize: 17, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: !_loaded
              ? Center(child: CircularProgressIndicator(strokeWidth: 2, color: AppTheme.accent))
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      _SectionCard(
                        icon: Icons.extension_rounded,
                        iconColor: AppTheme.accent,
                        title: l.rpWhatIsThis,
                        child: Text(
                          l.rpExplanation,
                          style: TextStyle(color: AppTheme.textSecondary, fontSize: 13, height: 1.55),
                        ),
                      ),
                      const SizedBox(height: 12),

                      TextField(
                        controller: _urlCtrl,
                        keyboardType: TextInputType.url,
                        autocorrect: false,
                        style: TextStyle(color: AppTheme.textPrimary, fontSize: 14),
                        decoration: InputDecoration(
                          labelText: l.rpPackUrlLabel,
                          hintText: l.rpPackUrlHint,
                          labelStyle: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
                          hintStyle: TextStyle(color: AppTheme.textMuted, fontSize: 13),
                          prefixIcon: Icon(Icons.link_rounded, color: AppTheme.textMuted, size: 18),
                          filled: true,
                          fillColor: AppTheme.surface,
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              color: _urlWarning != null ? AppTheme.warning : AppTheme.borderGray,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                              color: _urlWarning != null ? AppTheme.warning : AppTheme.accent,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),

                      if (_urlWarning != null) ...[
                        const SizedBox(height: 6),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.warning_amber_rounded, color: AppTheme.warning, size: 14),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                _urlWarning!,
                                style: TextStyle(color: AppTheme.warning, fontSize: 12, height: 1.4),
                              ),
                            ),
                          ],
                        ),
                      ],
                      const SizedBox(height: 12),

                      Container(
                        decoration: BoxDecoration(
                          color: AppTheme.surface,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppTheme.borderGray),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                        child: Row(
                          children: [
                            Icon(Icons.power_settings_new_rounded,
                                color: _enabled ? AppTheme.accent : AppTheme.textMuted, size: 18),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                l.rpEnableToggle,
                                style: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
                              ),
                            ),
                            Switch(
                              value: _enabled,
                              onChanged: (v) => setState(() => _enabled = v),
                              activeThumbColor: AppTheme.accent,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _save,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.accent,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                          ),
                          child: Text(l.save),
                        ),
                      ),
                      const SizedBox(height: 24),

                      _SectionCard(
                        icon: Icons.check_circle_outline_rounded,
                        iconColor: Colors.green,
                        title: l.rpWhatWorks,
                        child: Column(
                          children: [
                            _BulletRow(text: l.rpWorksGithub),
                            _BulletRow(text: l.rpWorksCloudflare),
                            _BulletRow(text: l.rpWorksDirect),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      _SectionCard(
                        icon: Icons.cancel_outlined,
                        iconColor: Colors.redAccent,
                        title: l.rpWhatDoesntWork,
                        child: Column(
                          children: [
                            _BulletRow(text: l.rpNoDiscord, isWarning: true),
                            _BulletRow(text: l.rpNoDrive, isWarning: true),
                            _BulletRow(text: l.rpNoEncrypted, isWarning: true),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final Widget child;

  const _SectionCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 16),
              const SizedBox(width: 7),
              Text(
                title,
                style: TextStyle(
                    color: AppTheme.textPrimary, fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}

class _BulletRow extends StatelessWidget {
  final String text;
  final bool isWarning;

  const _BulletRow({required this.text, this.isWarning = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isWarning ? '✕  ' : '✓  ',
            style: TextStyle(
              color: isWarning ? Colors.redAccent : Colors.green,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: AppTheme.textSecondary, fontSize: 12, height: 1.45),
            ),
          ),
        ],
      ),
    );
  }
}
