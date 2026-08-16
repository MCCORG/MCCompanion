import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../services/auth_service.dart';
import '../../services/user_service.dart';
import '../../theme/app_theme.dart';

class VerifyEmailBanner extends StatefulWidget {
  const VerifyEmailBanner({super.key});

  @override
  State<VerifyEmailBanner> createState() => _VerifyEmailBannerState();
}

class _VerifyEmailBannerState extends State<VerifyEmailBanner>
    with WidgetsBindingObserver {
  bool _verified = true;
  bool _sending = false;
  bool _sent = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _check();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _check();
  }

  Future<void> _check() async {
    final user = AuthService.currentUser;
    if (user == null) return;
    try {
      await user.reload();
    } catch (_) {}
    if (!mounted) return;
    setState(() => _verified = AuthService.currentUser?.emailVerified ?? true);
  }

  Future<void> _resend() async {
    setState(() => _sending = true);
    final ok = await UserService.sendVerificationEmail();
    if (!mounted) return;
    setState(() {
      _sending = false;
      _sent = ok;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_verified) return const SizedBox.shrink();

    final l = AppLocalizations.of(context)!;
    const tone = AppTheme.warning;
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: tone.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: tone.withValues(alpha: 0.45)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.mark_email_unread_rounded, color: tone, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.verifyEmailTitle,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                const SizedBox(height: 2),
                Text(
                  l.verifyEmailBody,
                  style: TextStyle(fontSize: 12, color: AppTheme.textSecondary),
                ),
                const SizedBox(height: 8),
                if (_sent)
                  Text(
                    l.verifyEmailSent,
                    style: const TextStyle(fontSize: 12, color: tone, fontWeight: FontWeight.w600),
                  )
                else
                  TextButton(
                    onPressed: _sending ? null : _resend,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      foregroundColor: tone,
                    ),
                    child: Text(_sending ? l.verifyEmailSending : l.verifyEmailSend),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
