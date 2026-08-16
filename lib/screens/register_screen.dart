import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../services/user_service.dart';
import '../services/push_notification_service.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback onRegistered;
  const RegisterScreen({super.key, required this.onRegistered});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameCtrl = TextEditingController();
  final _displayNameCtrl = TextEditingController();
  bool _loading = false;
  bool _acceptedTerms = false;
  String? _error;

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _displayNameCtrl.dispose();
    super.dispose();
  }

  Future<void> _openPage(String path) async {
    final uri = Uri.parse('https://mccompanion.net/$path');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _register() async {
    final username = _usernameCtrl.text.trim();
    final l = AppLocalizations.of(context)!;
    if (username.isEmpty) {
      setState(() => _error = l.usernameRequired);
      return;
    }
    if (!RegExp(r'^[a-z0-9_]{3,20}$').hasMatch(username)) {
      setState(() => _error = l.usernameFormatError);
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    final result = await UserService.register(
      acceptedTerms: _acceptedTerms,
      username: username,
      displayName: _displayNameCtrl.text.trim(),
    );

    if (!mounted) return;

    if (result.user != null) {
      await PushNotificationService.onUserSignedIn();
      unawaited(UserService.sendVerificationEmail());
      widget.onRegistered();
      return;
    }

    setState(() {
      _loading = false;
      final l = AppLocalizations.of(context)!;
      _error = switch (result.error) {
        'username_taken' => l.usernameTaken,
        'network_error' => l.noConnectionError,
        _ => result.message ?? l.somethingWentWrong,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: AppTheme.accent.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: AppTheme.accent.withValues(alpha: 0.30),
                      ),
                    ),
                    child: Icon(
                      Icons.person_add_rounded,
                      color: AppTheme.accent,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context)!.createProfile,
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    AppLocalizations.of(context)!.chooseUniqueUsername,
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  _label(AppLocalizations.of(context)!.usernameFieldLabel),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _usernameCtrl,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9_]')),
                      TextInputFormatter.withFunction((oldValue, newValue) =>
                          newValue.copyWith(text: newValue.text.toLowerCase())),
                    ],
                    style: TextStyle(color: AppTheme.textPrimary),
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(
                        context,
                      )!.usernameExampleHint,
                      prefixIcon: Icon(
                        Icons.alternate_email_rounded,
                        size: 18,
                        color: AppTheme.textMuted,
                      ),
                    ),
                    onChanged: (_) {
                      if (_error != null) setState(() => _error = null);
                    },
                  ),
                  const SizedBox(height: 6),
                  Text(
                    AppLocalizations.of(context)!.usernameFormatHint,
                    style: TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _label(AppLocalizations.of(context)!.displayNameOptional),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _displayNameCtrl,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(color: AppTheme.textPrimary),
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(
                        context,
                      )!.displayNameExampleHint,
                      prefixIcon: Icon(
                        Icons.badge_rounded,
                        size: 18,
                        color: AppTheme.textMuted,
                      ),
                    ),
                    onSubmitted: (_) => _register(),
                  ),
                  if (_error != null) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.error.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppTheme.error.withValues(alpha: 0.30),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.error_outline_rounded,
                            color: AppTheme.error,
                            size: 16,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              _error!,
                              style: const TextStyle(
                                color: AppTheme.error,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: _acceptedTerms,
                        onChanged: (v) => setState(() => _acceptedTerms = v ?? false),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: _TermsSentence(
                            onOpen: _openPage,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: (_loading || !_acceptedTerms) ? null : _register,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: _loading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            AppLocalizations.of(context)!.createProfile,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),
                          ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _label(String text) => Text(
    text,
    style: TextStyle(
      color: AppTheme.textSecondary,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.4,
    ),
  );
}


class _TermsSentence extends StatelessWidget {
  const _TermsSentence({required this.onOpen});

  final void Function(String path) onOpen;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final terms = l.termsOfService;
    final privacy = l.privacyPolicy;
    final sentence = l.termsAgreement(terms, privacy);

    final base = TextStyle(fontSize: 13, color: AppTheme.textSecondary);
    final link = base.copyWith(
      color: AppTheme.accent,
      decoration: TextDecoration.underline,
    );

    final spans = <InlineSpan>[];
    var rest = sentence;
    while (rest.isNotEmpty) {
      final iTerms = rest.indexOf(terms);
      final iPrivacy = rest.indexOf(privacy);
      final candidates = [
        if (iTerms >= 0) (iTerms, terms, 'terms'),
        if (iPrivacy >= 0) (iPrivacy, privacy, 'privacy'),
      ]..sort((a, b) => a.$1.compareTo(b.$1));

      if (candidates.isEmpty) {
        spans.add(TextSpan(text: rest, style: base));
        break;
      }

      final (index, label, path) = candidates.first;
      if (index > 0) spans.add(TextSpan(text: rest.substring(0, index), style: base));
      spans.add(TextSpan(
        text: label,
        style: link,
        recognizer: TapGestureRecognizer()..onTap = () => onOpen(path),
      ));
      rest = rest.substring(index + label.length);
    }

    return Text.rich(TextSpan(children: spans));
  }
}
