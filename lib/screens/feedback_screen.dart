import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/components/swipe_back.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../theme/app_theme.dart';
import '../services/feedback_service.dart';
import '../services/auth_service.dart';
import '../widgets/components/app_toast.dart';
import '../l10n/app_localizations.dart';

enum _FeedbackType { bug, feature }

class FeedbackScreen extends StatefulWidget {
  final VoidCallback? onBack;
  final VoidCallback? onGoToLogin;
  const FeedbackScreen({super.key, this.onBack, this.onGoToLogin});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _titleCtrl = TextEditingController();
  final _descCtrl = TextEditingController();

  _FeedbackType _type = _FeedbackType.bug;
  bool _submitting = false;
  bool _success = false;
  String? _issueUrl;
  String? _appVersion;

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((i) {
      if (mounted) setState(() => _appVersion = '${i.version}+${i.buildNumber}');
    });
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  bool get _isBug => _type == _FeedbackType.bug;
  Color get _typeColor => _isBug ? AppTheme.error : AppTheme.accent;

  Future<void> _submit() async {
    final l = AppLocalizations.of(context)!;
    final title = _titleCtrl.text.trim();
    final desc = _descCtrl.text.trim();

    if (title.length < 5) {
      AppToast.show(context, message: l.feedbackTitleTooShort, icon: Icons.warning_rounded, color: AppTheme.warning);
      return;
    }
    if (desc.length < 10) {
      AppToast.show(context, message: l.feedbackDescTooShort, icon: Icons.warning_rounded, color: AppTheme.warning);
      return;
    }

    setState(() => _submitting = true);

    final result = await FeedbackService.submit(
      type: _isBug ? 'bug' : 'feature',
      title: title,
      description: desc,
      appVersion: _appVersion,
    );

    if (!mounted) return;
    setState(() => _submitting = false);

    if (result.ok) {
      setState(() {
        _success = true;
        _issueUrl = result.issueUrl;
      });
    } else {
      AppToast.show(
        context,
        message: l.feedbackSubmitFailed,
        icon: Icons.error_outline_rounded,
        color: AppTheme.error,
      );
    }
  }

  void _reset() {
    _titleCtrl.clear();
    _descCtrl.clear();
    setState(() {
      _success = false;
      _issueUrl = null;
      _type = _FeedbackType.bug;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = Platform.isMacOS || Platform.isWindows || Platform.isLinux;
    final loggedIn = AuthService.currentUser != null;

    return SwipeBack(
      onBack: widget.onBack ?? () {},
      child: Column(
        children: [
          _Header(onBack: widget.onBack, isBug: _isBug, typeColor: _typeColor),
          Expanded(
            child: !loggedIn
                ? _LoginRequiredView(onGoToLogin: widget.onGoToLogin, onBack: widget.onBack)
                : _success
                    ? _SuccessView(issueUrl: _issueUrl, onReset: _reset, onBack: widget.onBack)
                    : _FormView(
                        type: _type,
                        onTypeChange: (t) => setState(() => _type = t),
                        titleCtrl: _titleCtrl,
                        descCtrl: _descCtrl,
                        submitting: _submitting,
                        onSubmit: _submit,
                        isBug: _isBug,
                        typeColor: _typeColor,
                        isDesktop: isDesktop,
                      ),
          ),
        ],
      ),
    );
  }
}

class _LoginRequiredView extends StatelessWidget {
  final VoidCallback? onGoToLogin;
  final VoidCallback? onBack;

  const _LoginRequiredView({required this.onGoToLogin, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppTheme.accent.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppTheme.accent.withValues(alpha: 0.30)),
              ),
              child: Icon(Icons.person_rounded, size: 28, color: AppTheme.accent),
            ),
            const SizedBox(height: 20),
            Text(
              l.feedbackLoginRequiredTitle,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppTheme.textPrimary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              l.feedbackLoginRequiredBody,
              style: TextStyle(fontSize: 13, color: AppTheme.textSecondary, height: 1.6),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onGoToLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.accent,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 13),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
              child: Text(l.feedbackLoginButton, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: onBack,
              child: Text(l.feedbackBackToApp, style: TextStyle(color: AppTheme.textMuted, fontSize: 13)),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final VoidCallback? onBack;
  final bool isBug;
  final Color typeColor;

  const _Header({required this.onBack, required this.isBug, required this.typeColor});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        bottom: 12,
        left: 16,
        right: 16,
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: typeColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(9),
              border: Border.all(color: typeColor.withValues(alpha: 0.25)),
            ),
            child: FaIcon(
              isBug ? FontAwesomeIcons.bug : FontAwesomeIcons.lightbulb,
              size: 14,
              color: typeColor,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isBug ? l.feedbackBugReport : l.feedbackFeatureRequest,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary,
                ),
              ),
              Text(
                l.feedbackGoesToGithub,
                style: TextStyle(fontSize: 11, color: AppTheme.textMuted),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TypeToggle extends StatelessWidget {
  final _FeedbackType value;
  final ValueChanged<_FeedbackType> onChanged;

  const _TypeToggle({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Row(
      children: _FeedbackType.values.map((t) {
        final active = value == t;
        final isBug = t == _FeedbackType.bug;
        final color = isBug ? AppTheme.error : AppTheme.accent;
        return Expanded(
          child: GestureDetector(
            onTap: () => onChanged(t),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              margin: EdgeInsets.only(right: isBug ? 6 : 0),
              padding: const EdgeInsets.symmetric(vertical: 11),
              decoration: BoxDecoration(
                color: active ? color.withValues(alpha: 0.12) : AppTheme.surfaceRaised,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: active ? color.withValues(alpha: 0.35) : AppTheme.borderGray,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    isBug ? FontAwesomeIcons.bug : FontAwesomeIcons.lightbulb,
                    size: 12,
                    color: active ? color : AppTheme.textMuted,
                  ),
                  const SizedBox(width: 7),
                  Text(
                    isBug ? l.feedbackBugReport : l.feedbackFeatureRequest,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: active ? color : AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _FormView extends StatelessWidget {
  final _FeedbackType type;
  final ValueChanged<_FeedbackType> onTypeChange;
  final TextEditingController titleCtrl;
  final TextEditingController descCtrl;
  final bool submitting;
  final VoidCallback onSubmit;
  final bool isBug;
  final Color typeColor;
  final bool isDesktop;

  const _FormView({
    required this.type,
    required this.onTypeChange,
    required this.titleCtrl,
    required this.descCtrl,
    required this.submitting,
    required this.onSubmit,
    required this.isBug,
    required this.typeColor,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(16, 20, 16, MediaQuery.of(context).padding.bottom + 20),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: isDesktop ? 560 : double.infinity),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TypeToggle(value: type, onChanged: onTypeChange),
            const SizedBox(height: 20),
            _Divider(),
            const SizedBox(height: 20),
            _Label(l.feedbackTitleLabel, required: true),
            const SizedBox(height: 8),
            TextField(
              controller: titleCtrl,
              maxLength: 200,
              style: TextStyle(fontSize: 14, color: AppTheme.textPrimary),
              decoration: InputDecoration(
                hintText: isBug ? l.feedbackTitleHintBug : l.feedbackTitleHintFeature,
                counterText: '',
              ),
            ),
            const SizedBox(height: 16),
            _Label(isBug ? l.feedbackWhatHappened : l.feedbackDescribeIdea, required: true),
            const SizedBox(height: 8),
            TextField(
              controller: descCtrl,
              maxLines: 6,
              maxLength: 3000,
              style: TextStyle(fontSize: 14, color: AppTheme.textPrimary),
              decoration: InputDecoration(
                hintText: isBug ? l.feedbackDescHintBug : l.feedbackDescHintFeature,
                alignLabelWithHint: true,
                counterText: '',
              ),
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: submitting ? null : onSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: typeColor,
                  foregroundColor: Colors.black,
                  disabledBackgroundColor: AppTheme.surfaceRaised,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: submitting
                    ? SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2, color: typeColor),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            isBug ? FontAwesomeIcons.bug : FontAwesomeIcons.lightbulb,
                            size: 13,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            isBug ? l.feedbackSubmitBug : l.feedbackSubmitFeature,
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                l.feedbackDisclaimer,
                style: TextStyle(fontSize: 11, color: AppTheme.textMuted),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SuccessView extends StatelessWidget {
  final String? issueUrl;
  final VoidCallback onReset;
  final VoidCallback? onBack;

  const _SuccessView({required this.issueUrl, required this.onReset, required this.onBack});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppTheme.success.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppTheme.success.withValues(alpha: 0.30)),
              ),
              child: Icon(Icons.check_rounded, size: 28, color: AppTheme.success),
            ),
            const SizedBox(height: 20),
            Text(
              l.feedbackSuccessTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              l.feedbackSuccessBody,
              style: TextStyle(fontSize: 13, color: AppTheme.textSecondary, height: 1.6),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (issueUrl != null)
                  OutlinedButton.icon(
                    onPressed: () {
                    },
                    icon: FaIcon(FontAwesomeIcons.github, size: 13),
                    label: Text(l.feedbackViewOnGithub),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.accent,
                      side: BorderSide(color: AppTheme.accent.withValues(alpha: 0.35)),
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: onReset,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.textSecondary,
                    side: BorderSide(color: AppTheme.borderGray),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(l.feedbackSubmitAnother),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: onBack,
              child: Text(l.feedbackBackToApp, style: TextStyle(color: AppTheme.textMuted, fontSize: 13)),
            ),
          ],
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  final bool required;
  const _Label(this.text, {this.required = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.textSecondary,
            letterSpacing: 0.4,
          ),
        ),
        if (required) ...[
          const SizedBox(width: 3),
          Text('*', style: TextStyle(fontSize: 12, color: AppTheme.accent)),
        ],
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(color: AppTheme.borderGray, height: 1);
  }
}
