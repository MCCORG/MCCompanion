import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart'
    show SignInWithAppleButton, SignInWithAppleButtonStyle;
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../services/auth_service.dart';
import '../../widgets/components/app_toast.dart';

class ProfileNotLoggedInView extends StatefulWidget {
  const ProfileNotLoggedInView({super.key});

  @override
  State<ProfileNotLoggedInView> createState() => ProfileNotLoggedInViewState();
}

class ProfileNotLoggedInViewState extends State<ProfileNotLoggedInView> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _loading = false;
  bool _googleLoading = false;
  bool _appleLoading = false;
  String? _error;
  bool _isRegisterMode = false;

  bool get _supportsGoogle =>
      !Platform.isLinux || AuthService.linuxGoogleAvailable;
  bool get _supportsApple => Platform.isIOS || Platform.isMacOS;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _signInWithGoogle() async {
    setState(() {
      _googleLoading = true;
      _error = null;
    });
    try {
      await AuthService.signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      final l = AppLocalizations.of(context)!;
      setState(
        () => _error = switch (e.code) {
          'account-exists-with-different-credential' => l.emailDifferentMethod,
          _ => l.googleSignInFailed,
        },
      );
    } catch (_) {
      if (mounted) {
        setState(
          () => _error = AppLocalizations.of(context)!.googleSignInFailed,
        );
      }
    } finally {
      if (mounted) setState(() => _googleLoading = false);
    }
  }

  Future<void> _signInWithApple() async {
    setState(() {
      _appleLoading = true;
      _error = null;
    });
    try {
      await AuthService.signInWithApple();
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      final l = AppLocalizations.of(context)!;
      setState(
        () => _error = switch (e.code) {
          'account-exists-with-different-credential' => l.emailDifferentMethod,
          _ => l.appleSignInFailed,
        },
      );
    } catch (e) {
      if (!mounted) return;
      final msg = e.toString();
      if (!msg.contains('AuthorizationErrorCode.canceled') &&
          !msg.contains('canceled') &&
          !msg.contains('cancelled')) {
        setState(
          () => _error = AppLocalizations.of(context)!.appleSignInFailed,
        );
      }
    } finally {
      if (mounted) setState(() => _appleLoading = false);
    }
  }

  Future<void> _forgotPassword() async {
    final emailCtrl = TextEditingController(text: _emailCtrl.text.trim());
    final email = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.surfaceRaised,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppTheme.borderGray),
        ),
        title: Text(
          AppLocalizations.of(ctx)!.resetPasswordTitle,
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(ctx)!.resetPasswordBody,
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 13,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailCtrl,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              autofocus: true,
              style: TextStyle(color: AppTheme.textPrimary),
              decoration: InputDecoration(
                hintText: AppLocalizations.of(ctx)!.emailAddressHint,
                prefixIcon: Icon(
                  Icons.email_rounded,
                  size: 18,
                  color: AppTheme.textMuted,
                ),
              ),
              onSubmitted: (v) => Navigator.of(ctx).pop(v.trim()),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(null),
            child: Text(AppLocalizations.of(ctx)!.cancel),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(emailCtrl.text.trim()),
            child: Text(
              AppLocalizations.of(ctx)!.sendLink,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
    emailCtrl.dispose();

    if (email == null || email.isEmpty || !mounted) return;

    final ok = await AuthService.sendPasswordResetEmail(email);
    if (!mounted) return;
    AppToast.show(
      context,
      message: ok
          ? AppLocalizations.of(context)!.resetLinkSent(email)
          : AppLocalizations.of(context)!.couldNotSendResetEmail,
      icon: ok ? Icons.mark_email_read_rounded : Icons.error_outline_rounded,
      color: ok ? AppTheme.success : AppTheme.error,
    );
  }

  Future<void> _submit() async {
    final email = _emailCtrl.text.trim();
    final pass = _passCtrl.text;
    if (email.isEmpty || pass.isEmpty) {
      setState(
        () => _error = AppLocalizations.of(context)!.enterEmailAndPassword,
      );
      return;
    }
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      if (_isRegisterMode) {
        await AuthService.createAccountWithEmail(email, pass);
      } else {
        await AuthService.signInWithEmail(email, pass);
      }
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      final l = AppLocalizations.of(context)!;
      setState(() {
        _error = switch (e.code) {
          'user-not-found' ||
          'wrong-password' ||
          'invalid-credential' => l.incorrectEmailOrPassword,
          'email-already-in-use' => l.emailAlreadyInUse,
          'weak-password' => l.weakPassword,
          'invalid-email' => l.invalidEmailError,
          _ => l.somethingWentWrong,
        };
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _error = AppLocalizations.of(context)!.somethingWentWrong);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                  Icons.person_rounded,
                  color: AppTheme.accent,
                  size: 28,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _isRegisterMode
                    ? AppLocalizations.of(context)!.createAccount
                    : AppLocalizations.of(context)!.signIn,
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                AppLocalizations.of(context)!.signInSubtitle,
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 28),
              TextField(
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                style: TextStyle(color: AppTheme.textPrimary),
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.emailAddressHint,
                  prefixIcon: Icon(
                    Icons.email_rounded,
                    size: 18,
                    color: AppTheme.textMuted,
                  ),
                ),
                onChanged: (_) {
                  if (_error != null) setState(() => _error = null);
                },
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _passCtrl,
                obscureText: true,
                textInputAction: TextInputAction.done,
                style: TextStyle(color: AppTheme.textPrimary),
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.passwordHint,
                  prefixIcon: Icon(
                    Icons.lock_rounded,
                    size: 18,
                    color: AppTheme.textMuted,
                  ),
                ),
                onSubmitted: (_) => _submit(),
                onChanged: (_) {
                  if (_error != null) setState(() => _error = null);
                },
              ),
              if (!_isRegisterMode) ...[
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _forgotPassword,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 4,
                      ),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.forgotPassword,
                      style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                    ),
                  ),
                ),
              ],
              if (_error != null) ...[
                const SizedBox(height: 14),
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _loading ? null : _submit,
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
                        _isRegisterMode
                            ? AppLocalizations.of(context)!.createAccount
                            : AppLocalizations.of(context)!.signIn,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
              ),
              if (_supportsApple || _supportsGoogle) ...[
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Expanded(child: Divider(color: AppTheme.borderGray)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        AppLocalizations.of(context)!.orDivider,
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider(color: AppTheme.borderGray)),
                  ],
                ),
                const SizedBox(height: 16),
                if (_supportsApple) ...[
                  SignInWithAppleButton(
                    onPressed: (_loading || _googleLoading || _appleLoading)
                        ? () {}
                        : _signInWithApple,
                    style:
                        ThemeData.estimateBrightnessForColor(
                              AppTheme.background,
                            ) ==
                            Brightness.dark
                        ? SignInWithAppleButtonStyle.white
                        : SignInWithAppleButtonStyle.black,
                    height: 48,
                  ),
                  if (_supportsGoogle) const SizedBox(height: 12),
                ],
                if (_supportsGoogle)
                  OutlinedButton(
                    onPressed: (_loading || _googleLoading || _appleLoading)
                        ? null
                        : _signInWithGoogle,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: Color(0xFF8E918F)),
                      backgroundColor: AppTheme.surfaceRaised,
                    ),
                    child: _googleLoading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: AppTheme.textMuted,
                              strokeWidth: 2,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/google_g.svg',
                                width: 18,
                                height: 18,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                AppLocalizations.of(
                                  context,
                                )!.continueWithGoogle,
                                style: TextStyle(
                                  color: AppTheme.textPrimary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                  ),
              ],
              const SizedBox(height: 14),
              TextButton(
                onPressed: () =>
                    setState(() => _isRegisterMode = !_isRegisterMode),
                child: Text(
                  _isRegisterMode
                      ? AppLocalizations.of(context)!.alreadyHaveAccount
                      : AppLocalizations.of(context)!.noAccountYet,
                  style: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileNotRegisteredView extends StatelessWidget {
  final VoidCallback onRegister;
  const ProfileNotRegisteredView({super.key, required this.onRegister});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
              AppLocalizations.of(context)!.profileNotSetUp,
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.chooseUsernameSubtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 13,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onRegister,
              icon: const Icon(Icons.arrow_forward_rounded, size: 16),
              label: Text(
                AppLocalizations.of(context)!.createProfile,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
