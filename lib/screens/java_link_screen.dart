import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../services/user_service.dart';

class JavaLinkScreen extends StatefulWidget {
  final VoidCallback onLinked;
  const JavaLinkScreen({super.key, required this.onLinked});

  @override
  State<JavaLinkScreen> createState() => _JavaLinkScreenState();
}

enum _Step { loading, waitingForUser, done, noJava, error }

class _JavaLinkScreenState extends State<JavaLinkScreen> {
  _Step _step = _Step.loading;
  String? _userCode;
  String? _verificationUri;
  String? _javaUsername;
  String? _errorMsg;
  Timer? _pollTimer;

  static const _javaBlue = Color(0xFF1565C0);

  @override
  void initState() {
    super.initState();
    _start();
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    super.dispose();
  }

  Future<void> _start() async {
    setState(() {
      _step = _Step.loading;
      _errorMsg = null;
    });

    final result = await UserService.startJavaLink();

    if (!mounted) return;

    if (result.error != null || result.userCode == null) {
      setState(() {
        _step = _Step.error;
        _errorMsg = 'Could not start Microsoft login. Please try again.';
      });
      return;
    }

    setState(() {
      _step = _Step.waitingForUser;
      _userCode = result.userCode;
      _verificationUri = result.verificationUri;
    });

    _pollTimer = Timer.periodic(const Duration(seconds: 4), (_) => _poll());
  }

  Future<void> _poll() async {
    final result = await UserService.getJavaStatus();
    if (!mounted) return;

    switch (result.status) {
      case 'done':
        _pollTimer?.cancel();
        setState(() {
          _step = _Step.done;
          _javaUsername = result.javaUsername;
        });
        await Future.delayed(const Duration(seconds: 2));
        if (mounted) widget.onLinked();
      case 'no_java':
        _pollTimer?.cancel();
        setState(() => _step = _Step.noJava);
      case 'expired':
        _pollTimer?.cancel();
        setState(() {
          _step = _Step.error;
          _errorMsg = 'The code expired. Please try again.';
        });
      case 'error':
        _pollTimer?.cancel();
        setState(() {
          _step = _Step.error;
          _errorMsg = 'Something went wrong. Please try again.';
        });
      default:
        break;
    }
  }

  Future<void> _openLink() async {
    if (_verificationUri == null) return;
    final uri = Uri.parse(_verificationUri!);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _copyCode() {
    if (_userCode == null) return;
    Clipboard.setData(ClipboardData(text: _userCode!));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Code copied to clipboard'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.surface,
        title: const Text(
          'Link Java Edition',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme: const IconThemeData(color: AppTheme.textPrimary),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: _buildBody(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return switch (_step) {
      _Step.loading => _buildLoading(),
      _Step.waitingForUser => _buildWaiting(),
      _Step.done => _buildDone(),
      _Step.noJava => _buildNoJava(),
      _Step.error => _buildError(),
    };
  }

  Widget _buildLoading() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(color: AppTheme.accent, strokeWidth: 2),
        SizedBox(height: 20),
        Text(
          'Starting Microsoft login…',
          style: TextStyle(color: AppTheme.textSecondary, fontSize: 13),
        ),
      ],
    );
  }

  Widget _buildWaiting() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: _javaBlue.withOpacity(0.12),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: _javaBlue.withOpacity(0.30)),
          ),
          child: const Icon(
            Icons.videogame_asset_rounded,
            color: _javaBlue,
            size: 30,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Sign in with Microsoft',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Go to the link below and enter the code to connect your Minecraft Java Edition account.',
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 13,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32),
        const Text(
          'Your code',
          style: TextStyle(
            color: AppTheme.textMuted,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: _copyCode,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            decoration: BoxDecoration(
              color: AppTheme.surfaceRaised,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppTheme.accent.withOpacity(0.35)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _userCode ?? '',
                  style: TextStyle(
                    color: AppTheme.accent,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 6,
                  ),
                ),
                const SizedBox(width: 12),
                const Icon(
                  Icons.copy_rounded,
                  color: AppTheme.textMuted,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Tap the code to copy it',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppTheme.textMuted, fontSize: 11),
        ),
        const SizedBox(height: 28),
        ElevatedButton.icon(
          onPressed: _openLink,
          icon: const Icon(Icons.open_in_browser_rounded, size: 18),
          label: const Text(
            'Open microsoft.com/link',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: _javaBlue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(
                color: AppTheme.textMuted,
                strokeWidth: 2,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Waiting for login…',
              style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildDone() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.check_circle_rounded,
          color: AppTheme.success,
          size: 56,
        ),
        const SizedBox(height: 16),
        const Text(
          'Java Edition linked!',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        if (_javaUsername != null) ...[
          const SizedBox(height: 8),
          Text(
            _javaUsername!,
            style: TextStyle(
              color: AppTheme.accent,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildNoJava() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Icon(
          Icons.info_outline_rounded,
          color: AppTheme.textMuted,
          size: 48,
        ),
        const SizedBox(height: 16),
        const Text(
          'No Java Edition found',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'The Microsoft account you signed in with does not own Minecraft Java Edition.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 13,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _start,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          child: const Text(
            'Try a different account',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  Widget _buildError() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Icon(
          Icons.error_outline_rounded,
          color: AppTheme.error,
          size: 48,
        ),
        const SizedBox(height: 16),
        Text(
          _errorMsg ?? 'Something went wrong.',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 13,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: _start,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          child: const Text(
            'Try again',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
