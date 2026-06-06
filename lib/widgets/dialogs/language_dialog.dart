import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../l10n/app_localizations.dart';
import '../../services/locale_provider.dart';
import '../../theme/app_theme.dart';

class LanguageDialog {
  static Future<void> show(
    BuildContext context, {
    required ValueNotifier<Locale?> appLocaleNotifier,
    bool barrierDismissible = true,
  }) {
    final loc = AppLocalizations.of(context)!;
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withValues(alpha: 0.65),
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: _LanguageContent(
          title: loc.changeLanguageTitle,
          appLocaleNotifier: appLocaleNotifier,
          loc: loc,
        ),
      ),
    );
  }
}

class _LanguageContent extends StatefulWidget {
  final String title;
  final ValueNotifier<Locale?> appLocaleNotifier;
  final AppLocalizations loc;

  const _LanguageContent({
    required this.title,
    required this.appLocaleNotifier,
    required this.loc,
  });

  @override
  State<_LanguageContent> createState() => _LanguageContentState();
}

class _LanguageContentState extends State<_LanguageContent> {
  static final Map<String, String> _cache = {};
  final Map<String, String> _names = {};
  bool _loading = true;
  bool _disposed = false;

  @override
  void initState() {
    super.initState();
    _loadNames();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  String _tag(Locale l) => l.toLanguageTag();

  Future<void> _loadNames() async {
    final locales = AppLocalizations.supportedLocales;
    final results = await Future.wait(locales.map(_loadOne));
    if (_disposed) return;
    for (var i = 0; i < locales.length; i++) {
      _names[_tag(locales[i])] = results[i];
    }
    if (mounted) setState(() => _loading = false);
  }

  Future<String> _loadOne(Locale locale) async {
    final tag = _tag(locale);
    if (_cache.containsKey(tag)) return _cache[tag]!;
    try {
      final l = await AppLocalizations.delegate.load(locale);
      final dynamic d = l.language;
      final name = (d is String && d.trim().isNotEmpty) ? d : tag;
      return _cache[tag] = name;
    } catch (_) {
      return _cache[tag] = tag;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 480,
        maxHeight: MediaQuery.of(context).size.height * 0.80,
        minWidth: 260,
      ),
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.borderGray),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.45),
            blurRadius: 36,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 16, 16),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceLight,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppTheme.borderGray),
                  ),
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.language,
                      color: AppTheme.textSecondary,
                      size: 15,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceLight,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppTheme.borderGray),
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      color: AppTheme.textSecondary,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1, color: AppTheme.borderDim),

          if (_loading)
            const SizedBox(
              height: 110,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppTheme.textMuted,
                ),
              ),
            )
          else
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: AppLocalizations.supportedLocales.length,
                itemBuilder: (_, i) {
                  final locale = AppLocalizations.supportedLocales[i];
                  final tag = _tag(locale);
                  final name = _names[tag] ?? _cache[tag] ?? tag;
                  final current =
                      widget.appLocaleNotifier.value?.languageCode ??
                      WidgetsBinding
                          .instance
                          .platformDispatcher
                          .locale
                          .languageCode;
                  final isSelected = current == locale.languageCode;

                  return _LangTile(
                    name: name,
                    isSelected: isSelected,
                    onTap: () async {
                      await setLocale(locale);
                      if (context.mounted) Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ),

          const Divider(height: 1, color: AppTheme.borderDim),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: SizedBox(
              height: 44,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.of(context).pop(),
                icon: const FaIcon(FontAwesomeIcons.xmark, size: 12),
                label: Text(widget.loc.cancel),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.textSecondary,
                  side: const BorderSide(color: AppTheme.borderGray),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LangTile extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const _LangTile({
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isSelected ? null : onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.surfaceLight : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: isSelected ? Border.all(color: AppTheme.borderLight) : null,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  color: isSelected
                      ? AppTheme.textPrimary
                      : AppTheme.textSecondary,
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppTheme.success.withValues(alpha: 0.15)
                    : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppTheme.success.withValues(alpha: 0.55)
                      : AppTheme.borderGray,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check_rounded,
                      size: 12,
                      color: AppTheme.success,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
