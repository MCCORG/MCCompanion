import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import '../services/subscription_service.dart';
import '../theme/app_theme.dart';
import '../widgets/components/app_toast.dart';

class PaywallScreen extends StatefulWidget {
  final VoidCallback? onSuccess;
  const PaywallScreen({super.key, this.onSuccess});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  List<Package> _packages = [];
  bool _loading = true;
  bool _purchasing = false;
  bool _yearly = false;
  String? _selectedTier; 

  @override
  void initState() {
    super.initState();
    _loadPackages();
  }

  Future<void> _loadPackages() async {
    final packages = await SubscriptionService.instance.getPackages();
    if (mounted) {
      setState(() {
        _packages = packages;
        _loading = false;
        _selectedTier = 'starter';
      });
    }
  }

  Package? _packageFor(String tier, bool yearly) {
    final id = 'mcc_${tier}_${yearly ? 'yearly' : 'monthly'}';
    try {
      return _packages.firstWhere((p) => p.storeProduct.identifier == id);
    } catch (_) {
      return null;
    }
  }

  Future<void> _purchase() async {
    if (_selectedTier == null) return;
    final pkg = _packageFor(_selectedTier!, _yearly);
    if (pkg == null) return;

    setState(() => _purchasing = true);
    final result = await SubscriptionService.instance.purchase(pkg);
    if (!mounted) return;
    setState(() => _purchasing = false);

    if (result.success) {
      AppToast.show(context, message: 'Purchase successful!');
      widget.onSuccess?.call();
      Navigator.of(context).pop();
    } else if (result.error != 'cancelled') {
      AppToast.show(context, message: 'Purchase failed. Please try again.');
    }
  }

  Future<void> _restore() async {
    setState(() => _purchasing = true);
    final result = await SubscriptionService.instance.restorePurchases();
    if (!mounted) return;
    setState(() => _purchasing = false);

    if (result.success) {
      final isPro = SubscriptionService.instance.isPro;
      AppToast.show(
        context,
        message: isPro ? 'Purchases restored!' : 'No active purchases found.',
      );
      if (isPro) {
        widget.onSuccess?.call();
        Navigator.of(context).pop();
      }
    } else {
      AppToast.show(context, message: 'Restore failed. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.xmark, size: 18),
          color: AppTheme.textSecondary,
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
            onPressed: _purchasing ? null : _restore,
            child: Text('Restore', style: TextStyle(color: AppTheme.textMuted, fontSize: 13)),
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: AppTheme.brand.withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                        border: Border.all(color: AppTheme.brand.withValues(alpha: 0.3)),
                      ),
                      child: Center(
                        child: FaIcon(FontAwesomeIcons.satellite, color: AppTheme.brand, size: 24),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'Server Tracker',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppTheme.textPrimary, fontSize: 22, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Track more servers and get notified\nwhen they go online or offline.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppTheme.textSecondary, fontSize: 13, height: 1.5),
                  ),
                  const SizedBox(height: 28),

                  Container(
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.borderGray),
                    ),
                    child: Row(
                      children: [
                        _ToggleBtn(label: 'Monthly', active: !_yearly, onTap: () => setState(() => _yearly = false)),
                        _ToggleBtn(
                          label: 'Yearly',
                          active: _yearly,
                          onTap: () => setState(() => _yearly = true),
                          badge: 'Save ~17%',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  if (_packages.isEmpty)
                    Center(child: Text('No packages available.', style: TextStyle(color: AppTheme.textMuted)))
                  else ...[
                    _TierCard(
                      tier: 'starter',
                      title: 'Starter',
                      slots: 3,
                      package: _packageFor('starter', _yearly),
                      selected: _selectedTier == 'starter',
                      onTap: () => setState(() => _selectedTier = 'starter'),
                    ),
                    const SizedBox(height: 10),
                    _TierCard(
                      tier: 'pro',
                      title: 'Pro',
                      slots: 6,
                      package: _packageFor('pro', _yearly),
                      selected: _selectedTier == 'pro',
                      onTap: () => setState(() => _selectedTier = 'pro'),
                      highlighted: true,
                    ),
                    const SizedBox(height: 10),
                    _TierCard(
                      tier: 'ultra',
                      title: 'Ultra',
                      slots: 10,
                      package: _packageFor('ultra', _yearly),
                      selected: _selectedTier == 'ultra',
                      onTap: () => setState(() => _selectedTier = 'ultra'),
                    ),
                  ],

                  const SizedBox(height: 24),

                  if (_packages.isNotEmpty)
                    SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _purchasing ? null : _purchase,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.brand,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          elevation: 0,
                        ),
                        child: _purchasing
                            ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                            : const Text('Continue', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                      ),
                    ),

                  const SizedBox(height: 14),
                  Text(
                    'Managed by Apple/Google. Cancel anytime.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppTheme.textDisabled, fontSize: 11),
                  ),
                ],
              ),
            ),
    );
  }
}

class _ToggleBtn extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  final String? badge;

  const _ToggleBtn({required this.label, required this.active, required this.onTap, this.badge});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          margin: const EdgeInsets.all(3),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: active ? AppTheme.brand : Colors.transparent,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: active ? Colors.white : AppTheme.textMuted,
                  fontWeight: active ? FontWeight.w700 : FontWeight.w400,
                  fontSize: 13,
                ),
              ),
              if (badge != null) ...[
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: active ? Colors.white.withValues(alpha: 0.2) : AppTheme.brand.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    badge!,
                    style: TextStyle(
                      color: active ? Colors.white : AppTheme.brand,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _TierCard extends StatelessWidget {
  final String tier;
  final String title;
  final int slots;
  final Package? package;
  final bool selected;
  final bool highlighted;
  final VoidCallback onTap;

  const _TierCard({
    required this.tier,
    required this.title,
    required this.slots,
    required this.package,
    required this.selected,
    required this.onTap,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    final price = package?.storeProduct.priceString ?? '—';

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected
              ? AppTheme.brand.withValues(alpha: 0.08)
              : highlighted
                  ? AppTheme.surfaceRaised
                  : AppTheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? AppTheme.brand : highlighted ? AppTheme.borderLight : AppTheme.borderGray,
            width: selected ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? AppTheme.brand : Colors.transparent,
                border: Border.all(
                  color: selected ? AppTheme.brand : AppTheme.borderLight,
                  width: 2,
                ),
              ),
              child: selected ? const Icon(Icons.check, size: 12, color: Colors.white) : null,
            ),
            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      if (highlighted) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppTheme.brand.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Popular',
                            style: TextStyle(color: AppTheme.brand, fontSize: 10, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$slots server slots',
                    style: TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                  ),
                ],
              ),
            ),

            Text(
              price,
              style: TextStyle(
                color: selected ? AppTheme.brand : AppTheme.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
