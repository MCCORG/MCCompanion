import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart';
import '../models/subscription_model.dart';
import 'auth_service.dart';

class SubscriptionService extends ChangeNotifier {
  static final SubscriptionService instance = SubscriptionService._();
  SubscriptionService._();

  static const String _base = AppConstants.apiBase;
  static const Duration _timeout = Duration(seconds: 10);

  static const String _rcAppleKey = 'appl_AAUDAAXgqNuMxqNzplqLdBHpxKr';
  static const String _rcGoogleKey = 'goog_pUxzsaywbuAhIrRYuLsunoHBVZl';

  static const String productStarterMonthly = 'mcc_starter_monthly';
  static const String productStarterYearly  = 'mcc_starter_yearly';
  static const String productProMonthly     = 'mcc_pro_monthly';
  static const String productProYearly      = 'mcc_pro_yearly';
  static const String productUltraMonthly   = 'mcc_ultra_monthly';
  static const String productUltraYearly    = 'mcc_ultra_yearly';
  static const String entitlementPro = 'pro';

  SubscriptionStatus _status = SubscriptionStatus.free;
  bool _initialized = false;
  bool _loading = false;

  SubscriptionStatus get status => _status;
  bool get loading => _loading;
  bool get isPro => _status.active;

  Future<void> init(String firebaseUid) async {
    if (_initialized) return;
    _initialized = true;

    try {
      await Purchases.setLogLevel(LogLevel.warn);

      final config = PurchasesConfiguration(
        Platform.isIOS || Platform.isMacOS ? _rcAppleKey : _rcGoogleKey,
      )..appUserID = firebaseUid;

      await Purchases.configure(config);
      await refreshStatus();

      Purchases.addCustomerInfoUpdateListener((_) => refreshStatus());
    } catch (e) {
      debugPrint('[SubscriptionService] init error: $e');
    }
  }

  Future<void> refreshStatus() async {
    try {
      _loading = true;
      notifyListeners();

      final token = await AuthService.getIdToken();
      if (token == null) {
        _status = SubscriptionStatus.free;
        return;
      }

      final res = await http
          .get(
            Uri.parse('$_base/api/users/me/subscription'),
            headers: {'Authorization': 'Bearer $token'},
          )
          .timeout(_timeout);

      if (res.statusCode == 200) {
        _status = SubscriptionStatus.fromJson(
          jsonDecode(res.body) as Map<String, dynamic>,
        );
      }
    } catch (e) {
      debugPrint('[SubscriptionService] refreshStatus error: $e');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<List<Package>> getPackages() async {
    try {
      final offerings = await Purchases.getOfferings();
      return offerings.current?.availablePackages ?? [];
    } catch (e) {
      debugPrint('[SubscriptionService] getPackages error: $e');
      return [];
    }
  }

  Future<({bool success, String? error})> purchase(Package package) async {
    try {
      await Purchases.purchase(PurchaseParams.package(package));
      for (int i = 0; i < 5; i++) {
        await Future.delayed(const Duration(seconds: 2));
        await refreshStatus();
        if (_status.active) break;
      }
      return (success: true, error: null);
    } on PlatformException catch (e) {
      final code = PurchasesErrorHelper.getErrorCode(e);
      if (code == PurchasesErrorCode.purchaseCancelledError) {
        return (success: false, error: 'cancelled');
      }
      return (success: false, error: e.message ?? code.toString());
    } catch (e) {
      return (success: false, error: e.toString());
    }
  }

  Future<({bool success, String? error})> restorePurchases() async {
    try {
      await Purchases.restorePurchases();
      await refreshStatus();
      return (success: true, error: null);
    } catch (e) {
      return (success: false, error: e.toString());
    }
  }

  void reset() {
    _status = SubscriptionStatus.free;
    _initialized = false;
    notifyListeners();
  }
}
