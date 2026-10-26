// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get console => 'کنسول';

  @override
  String get modeLabel => 'موڈ';

  @override
  String get statusLabel => 'حالت';

  @override
  String get seeAll => 'سب دیکھیں';

  @override
  String get sectionHelp => 'مدد';

  @override
  String get sectionAdvanced => 'اعلیٰ';

  @override
  String get versionLabel => 'ورژن';

  @override
  String get consoleOutput => 'کنسول آؤٹ پٹ';

  @override
  String get noLogsYet => 'ابھی تک کوئی لاگز نہیں';

  @override
  String get startBroadcastingToSeeOutput =>
      'آؤٹ پٹ دیکھنے کے لیے براڈکاسٹنگ شروع کریں';

  @override
  String get close => 'بند کریں';

  @override
  String get ok => 'OK';

  @override
  String get back => 'واپس';

  @override
  String get next => 'اگلا';

  @override
  String get done => 'مکمل';

  @override
  String get none => 'کوئی نہیں';

  @override
  String get onboardingThemeTitle => 'تھیم منتخب کریں';

  @override
  String get onboardingThemeSubtitle =>
      'آپ بعد میں سیٹنگز میں ہر رنگ کو تبدیل کر سکتے ہیں۔';

  @override
  String get onboardingNavTitle => 'فوری رسائی';

  @override
  String get onboardingNavSubtitle =>
      'نیویگیشن بار کے لیے دو خصوصیات منتخب کریں۔';

  @override
  String get onboardingNavLeftLabel => 'بائیں بٹن';

  @override
  String get onboardingNavRightLabel => 'دائیں بٹن';

  @override
  String get onboardingNavPreviewConnector => 'کنیکٹر';

  @override
  String get onboardingNavPreviewProfile => 'پروفائل';

  @override
  String get onboardingNavPreviewEmpty => 'خالی';

  @override
  String get onboardingCustomizeDetail =>
      'تفصیل میں اپنی مرضی کے مطابق بنائیں →';

  @override
  String get website => 'ویب سائٹ';

  @override
  String get howToUseMenu => 'استعمال کا طریقہ';

  @override
  String get support => 'مدد';

  @override
  String get start => 'شروع کریں';

  @override
  String get stop => 'روکیں';

  @override
  String get labelJava => 'Java';

  @override
  String get language => 'اردو';

  @override
  String get discord => 'Discord';

  @override
  String get toggleDebug => 'ڈیبگ ٹوگل کریں';

  @override
  String get copyLogs => 'لاگز کاپی کریں';

  @override
  String get clear => 'صاف کریں';

  @override
  String get cancel => 'منسوخ کریں';

  @override
  String get deleteServer => 'سرور حذف کریں';

  @override
  String get delete => 'حذف کریں';

  @override
  String get addServer => 'سرور شامل کریں';

  @override
  String get addServersHint => 'بعد میں جلدی جڑنے کے لیے سرورز شامل کریں';

  @override
  String get serverNameLabel => 'سرور کا نام *';

  @override
  String get addressLabel => 'ایڈریس *';

  @override
  String get portLabel => 'پورٹ *';

  @override
  String get descriptionLabel => 'تفصیل (اختیاری)';

  @override
  String get save => 'محفوظ کریں';

  @override
  String get pleaseEnterServer => '⚠️ براہ کرم سرور ایڈریس درج کریں';

  @override
  String get invalidPort => '⚠️ غلط پورٹ نمبر (1-65535)';

  @override
  String get dataSentToServers => 'ڈیٹا MCCompanion سرورز کو بھیج دیا گیا';

  @override
  String selectedServer(Object name) {
    return '📋 منتخب شدہ: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'منتخب شدہ: $name';
  }

  @override
  String copiedLogs(Object count) {
    return '$count لاگ اندراجات کلپ بورڈ میں کاپی کر دیے گئے';
  }

  @override
  String get debugEnabled => 'ڈیبگ لاگز فعال ہیں';

  @override
  String get iUnderstand => 'میں سمجھ گیا';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'منتخب شدہ: $relayName\r\n\r\nجڑنے کا طریقہ:\r\n1. اپنے Switch کی Settings میں جائیں اور DNS کو اس میں تبدیل کریں: $relayIp\r\n2. Minecraft کھولیں اور فہرست میں سے ایک سرور منتخب کریں (جیسے Cubecraft یا Hive)۔\r\n3. اب آپ خودکار طور پر اپنے سرور پر بھیج دیے جائیں گے۔';
  }

  @override
  String get noSavedServers => 'کوئی محفوظ شدہ سرور نہیں';

  @override
  String get savedServers => 'محفوظ شدہ سرورز';

  @override
  String get manageServers => 'سرورز منظم کریں';

  @override
  String get active => 'فعال';

  @override
  String get vpnDetected => 'VPN کا پتہ چل گیا';

  @override
  String get noWifi => 'Wi‑Fi پر نہیں';

  @override
  String get vpnActive =>
      'ہم نے پتہ لگایا ہے کہ آپ کا VPN فعال ہے۔\n\nMCCompanion استعمال کرنے سے پہلے براہ کرم VPN بند کریں، ورنہ LAN براڈکاسٹ آپ کے کنسول تک نہیں پہنچ پائے گی۔';

  @override
  String get mobileActive =>
      'پتہ چلا: موبائل ڈیٹا\n\nMCCompanion کو آپ کے کنسول کے اسی نیٹ ورک پر ہونا چاہیے۔ آگے بڑھنے سے پہلے اپنے ہوم Wi‑Fi یا ہاٹ اسپاٹ سے جڑیں۔';

  @override
  String get continueAnyway => 'پھر بھی جاری رکھیں';

  @override
  String get updateAvailable => 'اپ ڈیٹ دستیاب ہے';

  @override
  String get stopBroadcasting => 'براڈکاسٹنگ بند کریں';

  @override
  String get startNintendoMode => 'Nintendo موڈ شروع کریں';

  @override
  String get startFriendsMode => 'دوست موڈ شروع کریں';

  @override
  String get startBroadcasting => 'براڈکاسٹنگ شروع کریں';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'دوست';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / پراکسی)';

  @override
  String get howToXboxSubtitle => 'LAN کے ذریعے جڑیں';

  @override
  String get howToXboxBody =>
      'جڑنے کا طریقہ (Xbox / PS4 / PS5):\r\n1. یقینی بنائیں کہ MCCompanion چلانے والی آپ کی ڈیوائس اور آپ کا کنسول ایک ہی مقامی نیٹ ورک پر ہیں۔\r\n2. ایپ میں اپنا Minecraft سرور ایڈریس اور پورٹ درج کریں اور \"براڈکاسٹنگ شروع کریں\" دبائیں۔\r\n3. کنسول پر Minecraft → Play کھولیں → LAN Worlds یا Friends ٹیب تلاش کریں اور فہرست تازہ کریں۔\r\n4. شامل ہونے کے لیے \"MCCompanion\" نامی LAN سرور منتخب کریں۔\r\nنوٹس:\r\n- اگر سرور ظاہر نہ ہو تو تصدیق کریں کہ دونوں ڈیوائسز ایک ہی subnet پر ہیں اور ایپ اب بھی براڈکاسٹ کر رہی ہے۔\r\n- کچھ کنسول ماڈلز یا routers LAN دریافت کو بلاک کر سکتے ہیں؛ ضرورت ہو تو ایپ یا router settings تبدیل کر کے دیکھیں۔';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (DNS موڈ)';

  @override
  String get howToNintendoSubtitle => 'DNS کے ذریعے جڑیں';

  @override
  String get howToFriendsTitle => 'دوست موڈ';

  @override
  String get howToFriendsSubtitle => 'فرینڈز کے ذریعے جڑیں';

  @override
  String get helpMCCompanionTitle => 'MCCompanion ظاہر نہیں ہوتا';

  @override
  String get helpMCCompanionSubtitle => 'LAN دریافت کے مسائل کا حل';

  @override
  String get helpMCCompanionBody =>
      'اگر سرور آپ کے کنسول پر ظاہر نہیں ہو رہا تو یہ مراحل آزمائیں:\r\n\r\n✅ بنیادی جانچ:\r\n1. ایک ہی WiFi نیٹ ورک - آپ کا فون/ٹیبلیٹ اور کنسول لازماً ایک ہی WiFi پر ہوں\r\n2. درست سرور ایڈریس - IP اور پورٹ دوبارہ چیک کریں (ڈیفالٹ: 19132)\r\n3. براڈکاسٹنگ فعال ہے - تصدیق کریں کہ MCCompanion \"براڈکاسٹنگ\" اسٹیٹس دکھا رہا ہے\r\n\r\n🔄 فوری حل:\r\n• ایپ دوبارہ شروع کریں: براڈکاسٹنگ بند کریں، MCCompanion مکمل طور پر بند کریں، دوبارہ کھولیں اور پھر کوشش کریں\r\n• اپنا کنسول دوبارہ شروع کریں: کبھی کبھی LAN گیمز کا پتہ لگانے کے لیے کنسول کو ریفریش درکار ہوتا ہے\r\n• Friends/LAN ٹیب چیک کریں: سرور \"Friends\" یا \"LAN Games\" کے تحت ظاہر ہوتا ہے، سرور لسٹ میں نہیں\r\n• براڈکاسٹنگ شروع کرنے کے بعد 10-15 سیکنڈ انتظار کریں\r\n• VPNs بند کریں: VPNs مقامی براڈکاسٹس کو بلاک کر سکتے ہیں\r\n\r\n⚠️ عام مسائل:\r\n\"No route found for user\" → یقینی بنائیں کہ دونوں ڈیوائسز ایک ہی Wi‑Fi پر ہیں (Guest نیٹ ورکس سے بچیں)\r\n\"Unable to connect to MCCompanion relay server\" → اپنا انٹرنیٹ / relay اسٹیٹس چیک کریں\r\n\r\n📱 پھر بھی مسئلہ ہے؟ MCCompanion میں ڈیبگ موڈ فعال کریں اور لاگز چیک کریں، یا کوئی مختلف سرور آزمائیں۔';

  @override
  String get helpMultiplayerFailedTitle => 'ملٹی پلیئر کنکشن ناکام ہو گیا';

  @override
  String get helpMultiplayerFailedSubtitle =>
      'یہ MCCompanion کی خرابی کیوں نہیں ہے، اس کی وضاحت';

  @override
  String get helpMultiplayerFailedBody =>
      '⚠️ یہ MCCompanion کا مسئلہ نہیں ہے!\r\n\r\nMCCompanion نے آپ کو کامیابی سے مطلوبہ سرور پر ری ڈائریکٹ کیا ہے۔ \"Multiplayer Connection Failed\" کا مطلب ہے کہ ہدف سرور اس وقت قابلِ رسائی نہیں۔ ممکنہ وجوہات:\r\n\r\n• ہدف Minecraft سرور آف لائن ہے یا بہت زیادہ بوجھ میں ہے\r\n• سرور کو اپ ڈیٹ شدہ کلائنٹ ورژن یا مخصوص ایڈیشن درکار ہے\r\n• relay اور ہدف سرور کے درمیان نیٹ ورک مسائل\r\n\r\nکسی مختلف سرور سے جڑنے کی کوشش کریں یا سرور سپورٹ سے رابطہ کریں۔ اگر یہ مسئلہ کئی سرورز پر برقرار رہے تو MCCompanion میں ڈیبگ موڈ فعال کریں اور لاگز چیک کریں۔';

  @override
  String get helpNintendoDnsTitle => 'Nintendo DNS کام نہیں کرتا';

  @override
  String get helpNintendoDnsSubtitle => 'عام DNS / relay مسائل';

  @override
  String get helpNintendoDnsBody =>
      'اگر Nintendo DNS موڈ کام نہیں کر رہا تو درج ذیل چیک کریں:\r\n\r\n1. تصدیق کریں کہ آپ نے ایپ سے DNS config بھیجی ہے (Send DNS Config)۔\r\n2. تصدیق کریں کہ آپ نے Switch پر relay IP کو Primary DNS کے طور پر لاگو کیا ہے۔\r\n3. یقینی بنائیں کہ منتخب کردہ relay سرور (EU/US) آن لائن ہے اور بہت زیادہ بوجھ میں نہیں۔\r\n4. کچھ نیٹ ورکس (مثلاً captive portals) کسٹم DNS کو روکتے ہیں, کسی دوسرے نیٹ ورک پر آزما کر دیکھیں۔\r\n\r\nاگر مسئلہ برقرار رہے تو ڈیبگ موڈ فعال کریں اور لاگز چیک کریں یا دوست موڈ متبادل آزمائیں۔';

  @override
  String get helpFriendsModeTitle => 'دوست موڈ کام نہیں کرتا';

  @override
  String get helpFriendsModeSubtitle => 'دوستوں سے متعلق عام مسائل';

  @override
  String get helpFriendsModeBody =>
      'دوست موڈ کے لیے مسئلہ حل کرنے کی تجاویز:\r\n\r\n1. یقینی بنائیں کہ relay دوست اکاؤنٹ کنسول پر شامل/قبول کیا گیا ہے (اگر ضرورت ہو)۔\r\n2. دوست موڈ فعال کرنے کے بعد گیم دوبارہ شروع کریں اور Friends/LAN ٹیب ریفریش کریں۔\r\n\r\nاگر سرور اب بھی دوستوں کو نظر نہیں آتا تو ڈیبگ موڈ فعال کریں اور غلطیوں کی شناخت کے لیے لاگز چیک کریں۔';

  @override
  String get changeLanguageTitle => 'زبان تبدیل کریں';

  @override
  String get changeLanguage => 'زبان';

  @override
  String get couldNotOpenUrl => 'URL نہیں کھولا جا سکا';

  @override
  String get serverTrackerTitle => 'سرور ٹریکر';

  @override
  String get removeServerTitle => 'سرور ہٹائیں';

  @override
  String removeServerConfirm(Object name) {
    return 'اپنے ٹریکر سے \"$name\" ہٹائیں؟';
  }

  @override
  String get removeServerFailed => 'سرور ہٹانے میں ناکامی';

  @override
  String get refreshStatus => 'حیثیت تازہ کریں';

  @override
  String get trackerSignInRequired => 'سائن ان ضروری ہے';

  @override
  String get trackerSignInSubtitle =>
      'سرورز ٹریک کرنے اور آف لائن اطلاعات پانے کے لیے سائن ان کریں۔';

  @override
  String get signIn => 'سائن ان';

  @override
  String get noServersTracked => 'کوئی سرور ٹریک نہیں کیا گیا';

  @override
  String get trackerEmptySubtitle =>
      'حیثیت مانیٹر کرنے اور اطلاعات پانے کے لیے Minecraft سرور شامل کریں۔';

  @override
  String get fillAllFields => 'براہ کرم تمام فیلڈز درست طریقے سے پُر کریں';

  @override
  String get slotUsedUpgrade =>
      'آپ کا مفت سلاٹ استعمال ہو گیا۔ مزید سرورز کے لیے اپ گریڈ کریں۔';

  @override
  String get addServerFailed =>
      'سرور شامل کرنے میں ناکامی۔ اپنی تفصیلات جانچیں۔';

  @override
  String get ipAddressLabel => 'IP پتہ';

  @override
  String get platformLabel => 'پلیٹ فارم';

  @override
  String get bedrockLabel => 'Bedrock';

  @override
  String get addLabel => 'شامل کریں';

  @override
  String get statusOnline => 'آن لائن';

  @override
  String get statusOffline => 'آف لائن';

  @override
  String get statusChecking => 'جانچ ہو رہی ہے...';

  @override
  String get failedUpdateNotifications => 'اطلاعات اپ ڈیٹ کرنے میں ناکامی';

  @override
  String get editServerTitle => 'سرور ترمیم کریں';

  @override
  String get serverNameHint => 'سرور کا نام';

  @override
  String get failedSave => 'محفوظ کرنے میں ناکامی۔ دوبارہ کوشش کریں۔';

  @override
  String get serverRenamed => 'سرور کا نام بدل دیا گیا';

  @override
  String get customizeLabel => 'حسب ضرورت بنائیں';

  @override
  String get customizeSubtitle => 'نیویگیشن بار اور رنگ';

  @override
  String get resetLabel => 'دوبارہ ترتیب دیں';

  @override
  String get navigationSection => 'نیوی گیشن';

  @override
  String get navFixed => 'Connector اور پروفائل ہمیشہ مقرر ہیں';

  @override
  String get leftSlot => 'سلاٹ 2';

  @override
  String get outerSlot => 'سلاٹ 1';

  @override
  String get rightSlot => 'سلاٹ 3';

  @override
  String get farSlot => 'سلاٹ 4';

  @override
  String get colorPickerApply => 'لاگو کریں';

  @override
  String get colorPickerHex => 'Hex';

  @override
  String get textColorSection => 'متن کا رنگ';

  @override
  String get textColorPickerTitle => 'متن کا رنگ';

  @override
  String get textColorHint =>
      'کسٹم متن رنگ منتخب کرنے کے لیے دائرے پر ٹیپ کریں';

  @override
  String get textColorPreviewPrimary => 'بنیادی';

  @override
  String get textColorPreviewSecondary => 'ثانوی';

  @override
  String get textColorPreviewMuted => 'دھیما';

  @override
  String get colorSwatchCustom => 'کسٹم';

  @override
  String get accentColorSection => 'ایکسینٹ رنگ';

  @override
  String get opacityLabel => 'شفافیت';

  @override
  String get backgroundSection => 'پس منظر';

  @override
  String get cardsSection => 'کارڈز';

  @override
  String get editLabel => 'ترمیم کریں';

  @override
  String get playerLookupJavaEdition => 'Java Edition';

  @override
  String get playerLookupBedrockEdition => 'Bedrock Edition';

  @override
  String get playerLookupLabelUuid => 'UUID';

  @override
  String get playerLookupLabelGamertag => 'گیمرٹیگ';

  @override
  String get playerLookupLabelXuid => 'XUID';

  @override
  String get playerLookupLabelFloodgate => 'Floodgate';

  @override
  String accountSubtitleXbox(Object xuid) {
    return 'Xbox · $xuid';
  }

  @override
  String accountSubtitleJava(Object uuid) {
    return 'Java Edition · $uuid';
  }

  @override
  String get reportUser => 'صارف کی رپورٹ کریں';

  @override
  String reportUserWithName(Object name) {
    return '$name کی رپورٹ کریں';
  }

  @override
  String get reportDisclaimer =>
      'رپورٹس کا جائزہ ہماری ٹیم لیتی ہے۔ جھوٹی رپورٹس پر آپ کے اکاؤنٹ کے خلاف کارروائی ہو سکتی ہے۔';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonHarassment => 'ہراسانی';

  @override
  String get reportReasonInappropriate => 'نامناسب مواد';

  @override
  String get reportReasonOther => 'دیگر';

  @override
  String get reportAdditionalDetails => 'اضافی تفصیلات (اختیاری)…';

  @override
  String get reportSuccess => 'رپورٹ جمع کر دی گئی۔ شکریہ۔';

  @override
  String get reportFailed =>
      'رپورٹ جمع نہیں ہو سکی۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get reportSubmit => 'رپورٹ جمع کرائیں';

  @override
  String get playerLookupSubtitle =>
      'یوزر نیم سے Java یا Bedrock کھلاڑی تلاش کریں';

  @override
  String get playerLookupHint => 'یوزر نیم درج کریں…';

  @override
  String get playerLookupLinked => 'منسلک اکاؤنٹس مل گئے';

  @override
  String get playerLookupLabelUsername => 'یوزر نیم';

  @override
  String get playerLookupLabelTier => 'Tier';

  @override
  String playerLookupCopied(Object value) {
    return '$value کاپی ہو گیا';
  }

  @override
  String get addFriend => 'دوست شامل کریں';

  @override
  String get send => 'Send';

  @override
  String get somethingWentWrong => 'کچھ غلط ہو گیا۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String friendRequestAccepted(Object name) {
    return 'اب آپ $name کے دوست ہیں';
  }

  @override
  String requestDeclined(Object name) {
    return '$name کی درخواست مسترد کر دی گئی';
  }

  @override
  String get deleteAccountTitle => 'اکاؤنٹ حذف کریں';

  @override
  String get deleteAccountBody =>
      'اس سے آپ کا اکاؤنٹ اور تمام ڈیٹا مستقل طور پر حذف ہو جائے گا۔ یہ عمل واپس نہیں ہو سکتا۔';

  @override
  String get deletePermanently => 'مستقل طور پر حذف کریں';

  @override
  String get couldNotDeleteAccount =>
      'اکاؤنٹ حذف نہیں ہو سکا۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get removeFriendTitle => 'دوست ہٹائیں';

  @override
  String removeFriendConfirm(Object name) {
    return 'کیا $name کو اپنے دوستوں سے ہٹانا ہے؟';
  }

  @override
  String get remove => 'ہٹائیں';

  @override
  String friendRemoved(Object name) {
    return '$name کو آپ کے دوستوں سے ہٹا دیا گیا';
  }

  @override
  String get emailDifferentMethod =>
      'یہ ای میل سائن اِن کے کسی دوسرے طریقے سے منسلک ہے';

  @override
  String get googleSignInFailed =>
      'Google سائن اِن ناکام ہو گیا۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get appleSignInFailed =>
      'Apple سائن اِن ناکام ہو گیا۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get resetPasswordTitle => 'پاس ورڈ ری سیٹ کریں';

  @override
  String get resetPasswordBody =>
      'اپنا ای میل پتہ درج کریں، ہم آپ کو پاس ورڈ ری سیٹ کرنے کا لنک بھیجیں گے۔';

  @override
  String get emailAddressHint => 'ای میل پتہ';

  @override
  String get sendLink => 'لنک بھیجیں';

  @override
  String resetLinkSent(Object email) {
    return 'اگر $email کے لیے اکاؤنٹ موجود ہے تو لنک بھیجا جا رہا ہے';
  }

  @override
  String get invalidEmailError => 'ای میل پتہ درست نہیں ہے';

  @override
  String get couldNotSendResetEmail =>
      'ری سیٹ ای میل نہیں بھیجی جا سکی۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get enterEmailAndPassword =>
      'براہ کرم اپنی ای میل اور پاس ورڈ درج کریں';

  @override
  String get incorrectEmailOrPassword => 'ای میل یا پاس ورڈ غلط ہے';

  @override
  String get emailAlreadyInUse => 'یہ ای میل پتہ پہلے سے استعمال میں ہے';

  @override
  String get weakPassword =>
      'پاس ورڈ بہت کمزور ہے۔ براہ کرم زیادہ مضبوط پاس ورڈ منتخب کریں۔';

  @override
  String get createAccount => 'اکاؤنٹ بنائیں';

  @override
  String get signInSubtitle =>
      'اپنی پروفائل، دوستوں اور چیٹس تک رسائی کے لیے سائن اِن کریں۔';

  @override
  String get passwordHint => 'پاس ورڈ';

  @override
  String get forgotPassword => 'پاس ورڈ بھول گئے؟';

  @override
  String get orDivider => 'or';

  @override
  String get continueWithGoogle => 'Google کے ساتھ جاری رکھیں';

  @override
  String get alreadyHaveAccount => 'پہلے سے اکاؤنٹ ہے؟ سائن اِن کریں';

  @override
  String get noAccountYet => 'اکاؤنٹ نہیں ہے؟ بنائیں';

  @override
  String get profileNotSetUp => 'پروفائل سیٹ نہیں ہے';

  @override
  String get chooseUsernameSubtitle =>
      'ایک صارف نام چنیں تاکہ دوسرے کھلاڑی آپ کو تلاش کر سکیں۔';

  @override
  String get createProfile => 'پروفائل بنائیں';

  @override
  String get findUser => 'صارف تلاش کریں';

  @override
  String get couldNotUpdateVisibility => 'نمائش کی ترتیبات اپ ڈیٹ نہیں ہو سکیں';

  @override
  String get signOut => 'سائن آؤٹ';

  @override
  String get appearOfflineLabel => 'آف لائن ظاہر ہوں';

  @override
  String get appearOfflineOn => 'آپ دوسرے کھلاڑیوں کو آف لائن نظر آتے ہیں';

  @override
  String get appearOfflineOff => 'آپ دوسرے کھلاڑیوں کو آن لائن نظر آتے ہیں';

  @override
  String get unlinkXboxTitle => 'Xbox اکاؤنٹ کا لنک ختم کریں';

  @override
  String removeLabelConfirm(Object name) {
    return 'کیا $name کو اپنے منسلک اکاؤنٹس سے ہٹانا ہے؟';
  }

  @override
  String get unlink => 'لنک ختم کریں';

  @override
  String get unlinkJavaTitle => 'Java اکاؤنٹ کا لنک ختم کریں';

  @override
  String removeJavaConfirm(Object name) {
    return 'کیا $name کو اپنے منسلک اکاؤنٹس سے ہٹانا ہے؟';
  }

  @override
  String get linkAccountsHint =>
      'اپنی اسکنز اور اعداد و شمار دکھانے کے لیے اپنے Minecraft اکاؤنٹس منسلک کریں۔';

  @override
  String get linkXbox => 'Xbox منسلک کریں';

  @override
  String get linkJava => 'Java منسلک کریں';

  @override
  String get profileUpdated => 'پروفائل اپ ڈیٹ ہو گئی';

  @override
  String get edit => 'Edit';

  @override
  String get displayNameLabel => 'ظاہری نام';

  @override
  String get yourNameHint => 'آپ کا نام';

  @override
  String get bioLabel => 'Bio';

  @override
  String get bioHint => 'دوسروں کو اپنے بارے میں بتائیں…';

  @override
  String get noFriendsYet => 'ابھی کوئی دوست نہیں';

  @override
  String get noFriendsSub => 'دوست شامل کریں تو وہ یہاں نظر آئیں گے۔';

  @override
  String onlineFriendsLabel(Object count) {
    return '$count آن لائن';
  }

  @override
  String offlineFriendsLabel(Object count) {
    return '$count آف لائن';
  }

  @override
  String get noPendingRequests => 'کوئی زیر التوا درخواست نہیں';

  @override
  String get requestsAppearHere => 'دوستی کی نئی درخواستیں یہاں نظر آئیں گی۔';

  @override
  String get chooseUniqueUsername =>
      'شروع کرنے کے لیے ایک منفرد صارف نام چنیں۔';

  @override
  String get usernameFieldLabel => 'صارف نام';

  @override
  String get usernameExampleHint => 'مثال: CoolPlayer123';

  @override
  String get usernameFormatHint => '3–20 حروف · صرف حروف، اعداد اور انڈر اسکور';

  @override
  String get displayNameOptional => 'ڈسپلے نام (اختیاری)';

  @override
  String get displayNameExampleHint => 'مثال: Cool Player';

  @override
  String get usernameRequired => 'صارف نام ضروری ہے';

  @override
  String get usernameFormatError =>
      'صارف نام 3–20 حروف کا ہونا چاہیے اور صرف حروف، اعداد اور انڈر اسکور ہو سکتے ہیں';

  @override
  String get usernameTaken => 'یہ صارف نام پہلے سے لیا گیا ہے';

  @override
  String get noConnectionError =>
      'کوئی کنکشن نہیں۔ اپنا انٹرنیٹ چیک کریں اور دوبارہ کوشش کریں۔';

  @override
  String get info => 'معلومات';

  @override
  String get navProfile => 'پروفائل';

  @override
  String serverRemoved(Object name) {
    return '$name ہٹا دیا گیا';
  }

  @override
  String serverAdded(Object name) {
    return '$name شامل کیا گیا';
  }

  @override
  String get paywallRestore => 'بحال کریں';

  @override
  String get paywallMonthly => 'ماہانہ';

  @override
  String get paywallYearly => 'سالانہ';

  @override
  String get paywallSavePercent => '~17% بچائیں';

  @override
  String get paywallSubtitle =>
      'مزید سرورز ٹریک کریں اور ان کے آن لائن\nیا آف لائن ہونے پر اطلاع پائیں۔';

  @override
  String paywallSlotLabel(Object slots) {
    return '$slots سرور سلاٹس';
  }

  @override
  String get paywallPopular => 'مقبول';

  @override
  String get paywallContinue => 'جاری رکھیں';

  @override
  String get paywallNoPkgs => 'کوئی پیکج دستیاب نہیں۔';

  @override
  String get paywallManaged =>
      'Apple/Google کے زیر انتظام۔ کسی بھی وقت منسوخ کریں۔';

  @override
  String get paywallPurchaseSuccess => 'خریداری کامیاب رہی!';

  @override
  String get paywallPurchaseFailed =>
      'خریداری ناکام ہو گئی۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get paywallPurchasesRestored => 'خریداریاں بحال ہو گئیں!';

  @override
  String get paywallNoActivePurchases => 'کوئی فعال خریداری نہیں ملی۔';

  @override
  String get paywallRestoreFailed =>
      'بحالی ناکام ہو گئی۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get relay => 'Relay';

  @override
  String get serversSection => 'سرورز';

  @override
  String get selectBedrockAccount => 'Bedrock اکاؤنٹ منتخب کریں';

  @override
  String get infoAndLegal => 'معلومات اور قانونی';

  @override
  String get legalSection => 'قانونی';

  @override
  String get privacyPolicy => 'پرائیویسی پالیسی';

  @override
  String get privacyPolicySubtitle =>
      'ہم آپ کا ڈیٹا کیسے جمع اور محفوظ کرتے ہیں';

  @override
  String get termsOfService => 'سروس کی شرائط';

  @override
  String get termsOfServiceSubtitle => 'استعمال کے اصول اور شرائط';

  @override
  String get dataSourcesSection => 'ڈیٹا کے ذرائع اور کریڈٹس';

  @override
  String get creditMojangTitle => 'Mojang / Microsoft';

  @override
  String get creditMojangSubtitle =>
      'Java کھلاڑیوں کی اسکنز، UUID اور پروفائل ڈیٹا سرکاری Mojang API کے ذریعے۔';

  @override
  String get creditGeyserTitle => 'GeyserMC';

  @override
  String get creditGeyserSubtitle =>
      'Bedrock اسکن رینڈرنگ۔ Bedrock کھلاڑیوں کی اسکنز GeyserMC اسکن سرور سے حاصل کی جاتی ہیں۔';

  @override
  String get creditXboxTitle => 'Xbox / Microsoft';

  @override
  String get creditXboxSubtitle =>
      'Xbox Live کے ذریعے Bedrock اکاؤنٹ لنکنگ۔ Gamertag اور XUID Microsoft کی تصدیقی کارروائی سے حاصل ہوتے ہیں۔';

  @override
  String get aboutMCCompanionSection => 'MCCompanion کے بارے میں';

  @override
  String get aboutMCCompanionDisclaimer =>
      'MCCompanion ایک آزاد ایپ ہے اور Mojang Studios یا Microsoft Corporation سے وابستہ نہیں، نہ ان کی منظور شدہ یا سرپرستی میں ہے۔';

  @override
  String get minecraftTrademark =>
      '\"Minecraft\" Microsoft Corporation کا ٹریڈ مارک ہے۔';

  @override
  String get nldServerLabelShort => 'MCCompanion Server';

  @override
  String get editServer => 'سرور میں ترمیم کریں';

  @override
  String get serverNameExampleHint => 'میرا شاندار سرور';

  @override
  String get serverAddressExampleHint => 'play.example.com';

  @override
  String get serverDescriptionExampleHint => 'دوستوں کے ساتھ سروائیول سرور';

  @override
  String get editionLabel => 'ایڈیشن';

  @override
  String get nameLabel => 'Name';

  @override
  String get ipAddressFieldLabel => 'IP پتہ';

  @override
  String get portFieldLabel => 'Port';

  @override
  String get platformFieldLabel => 'پلیٹ فارم';

  @override
  String get nameValidationError => 'نام 1 سے 50 حروف کا ہونا چاہیے';

  @override
  String get ipRequiredError => 'IP پتہ ضروری ہے';

  @override
  String get portRangeError => 'پورٹ 1 اور 65535 کے درمیان ہونا چاہیے';

  @override
  String get xboxLinkTitle => 'Xbox اکاؤنٹ منسلک کریں';

  @override
  String get xboxStartingLogin => 'Xbox لاگ اِن شروع ہو رہا ہے…';

  @override
  String get xboxSignInWithMicrosoft => 'Microsoft کے ساتھ سائن اِن کریں';

  @override
  String get xboxGoToLink =>
      'نیچے دیے گئے لنک پر جائیں اور اپنا Xbox اکاؤنٹ جوڑنے کے لیے کوڈ درج کریں۔';

  @override
  String get xboxYourCode => 'آپ کا کوڈ';

  @override
  String get xboxTapToCopy => 'کاپی کرنے کے لیے کوڈ پر ٹیپ کریں';

  @override
  String get xboxOpenLink => 'microsoft.com/link کھولیں';

  @override
  String get xboxWaitingForLogin => 'لاگ اِن کا انتظار ہے…';

  @override
  String get xboxAccountLinked => 'Xbox اکاؤنٹ منسلک ہو گیا!';

  @override
  String get xboxCodeCopied => 'کوڈ کلپ بورڈ پر کاپی ہو گیا';

  @override
  String get xboxCouldNotStart =>
      'Xbox لاگ اِن شروع نہیں ہو سکا۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get xboxCodeExpired =>
      'کوڈ کی میعاد ختم ہو گئی۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get xboxSomethingWrong => 'کچھ غلط ہو گیا۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get tryAgain => 'دوبارہ کوشش کریں';

  @override
  String get userNotFound => 'صارف نہیں ملا';

  @override
  String get profileSectionLabel => 'پروفائل';

  @override
  String get displayNameRowLabel => 'ظاہری نام';

  @override
  String get usernameRowLabel => 'یوزر نیم';

  @override
  String get lastSeenLabel => 'آخری بار دیکھا گیا';

  @override
  String get aboutSectionLabel => 'تعارف';

  @override
  String get xboxBedrockLabel => 'Xbox / Bedrock';

  @override
  String get friendRequestSent => 'دوستی کی درخواست بھیج دی گئی';

  @override
  String get alreadyFriendsMsg => 'آپ پہلے ہی دوست ہیں۔';

  @override
  String get requestAlreadyPendingMsg => 'ایک درخواست پہلے سے زیر التوا ہے۔';

  @override
  String get userNotFoundMsg2 => 'صارف نہیں ملا۔';

  @override
  String get cannotSendRequestMsg => 'اس صارف کو درخواست نہیں بھیجی جا سکتی۔';

  @override
  String nowFriendsWith(Object username) {
    return 'اب آپ @$username کے دوست ہیں';
  }

  @override
  String get removeFriendButton => 'دوست ہٹائیں';

  @override
  String get requestSentButton => 'درخواست بھیج دی گئی';

  @override
  String get acceptRequestButton => 'درخواست قبول کریں';

  @override
  String get addFriendButton => 'دوست شامل کریں';

  @override
  String get removeFriendDialogTitle => 'دوست ہٹائیں';

  @override
  String removeFriendDialogBody(Object username) {
    return 'کیا @$username کو دوستوں سے ہٹانا ہے؟';
  }

  @override
  String get trackerLimitReached => 'سرور کی حد پوری ہو گئی';

  @override
  String get upgradeButton => 'اپ گریڈ کریں';

  @override
  String get javaLinkTitle => 'Java Edition منسلک کریں';

  @override
  String get javaStartingLogin => 'Microsoft لاگ اِن شروع ہو رہا ہے…';

  @override
  String get javaSignInWithMicrosoft => 'Microsoft کے ساتھ سائن اِن کریں';

  @override
  String get javaGoToLink =>
      'نیچے دیے گئے لنک پر جائیں اور اپنا Minecraft Java Edition اکاؤنٹ جوڑنے کے لیے کوڈ درج کریں۔';

  @override
  String get javaYourCode => 'آپ کا کوڈ';

  @override
  String get javaTapToCopy => 'کاپی کرنے کے لیے کوڈ پر ٹیپ کریں';

  @override
  String get javaOpenLink => 'microsoft.com/link کھولیں';

  @override
  String get javaWaitingForLogin => 'لاگ اِن کا انتظار ہے…';

  @override
  String get javaAccountLinked => 'Java Edition منسلک ہو گیا!';

  @override
  String get javaNoJavaTitle => 'Java Edition نہیں ملا';

  @override
  String get javaNoJavaBody =>
      'جس Microsoft اکاؤنٹ سے آپ نے سائن اِن کیا ہے اس کے پاس Minecraft Java Edition نہیں ہے۔';

  @override
  String get javaTryDifferentAccount => 'کوئی اور اکاؤنٹ آزمائیں';

  @override
  String get javaCouldNotStart =>
      'Microsoft لاگ اِن شروع نہیں ہو سکا۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get javaCodeExpired =>
      'کوڈ کی میعاد ختم ہو گئی۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get javaSomethingWrong => 'کچھ غلط ہو گیا۔ براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get javaCodeCopied => 'کوڈ کلپ بورڈ پر کاپی ہو گیا';

  @override
  String get featureLabelConnector => 'کنیکٹر';

  @override
  String get featureLabelSkins => 'اسکنز';

  @override
  String get featureLabelPartners => 'سرورز کی فہرست';

  @override
  String get featureLabelLookup => 'تلاش';

  @override
  String get featureLabelTracker => 'سرور ٹریکر';

  @override
  String get userSearchHint => 'صارف نام, گیمرٹیگ یا Java نام…';

  @override
  String get userSearchSub => 'صارف نام, Xbox گیمرٹیگ یا Java نام سے تلاش کریں';

  @override
  String get upgradeWindowsHint => 'اپ گریڈ مائیکروسافٹ اسٹور پر دستیاب ہے';

  @override
  String get accountActions => 'اکاؤنٹ';

  @override
  String get feedbackBugReport => 'بگ رپورٹ';

  @override
  String get feedbackFeatureRequest => 'فیچر کی درخواست';

  @override
  String get feedbackTitleLabel => 'عنوان';

  @override
  String get feedbackTitleHintBug =>
      'مثلاً: سکن ایڈیٹر کھولتے وقت ایپ کریش ہوتی ہے';

  @override
  String get feedbackTitleHintFeature =>
      'مثلاً: سرور لسٹ میں کھلاڑی کی پنگ دکھائیں';

  @override
  String get feedbackWhatHappened => 'کیا ہوا؟';

  @override
  String get feedbackDescribeIdea => 'اپنا خیال بیان کریں';

  @override
  String get feedbackDescHintBug =>
      'بگ بیان کریں: آپ نے کیا کیا، کیا توقع تھی اور اس کی بجائے کیا ہوا؟';

  @override
  String get feedbackDescHintFeature =>
      'بتائیں کہ آپ کیا چاہتے ہیں اور یہ کیوں مفید ہوگا۔';

  @override
  String get feedbackSubmitBug => 'بگ رپورٹ جمع کریں';

  @override
  String get feedbackSubmitFeature => 'فیچر درخواست جمع کریں';

  @override
  String get feedbackDisclaimer => 'ہماری ٹیم تک جاتا ہے · پاس ورڈ نہ لکھیں';

  @override
  String get feedbackSuccessTitle => 'فیڈبیک کے لیے شکریہ!';

  @override
  String get feedbackSuccessBody =>
      'شکریہ! آپ کی رپورٹ موصول ہو گئی۔ ہم ایپ میں جواب دیتے ہیں، اس لیے جواب دیکھنے کے لیے یہاں واپس آئیں۔';

  @override
  String get feedbackSubmitAnother => 'ایک اور جمع کریں';

  @override
  String get feedbackBackToApp => 'ایپ پر واپس جائیں';

  @override
  String get feedbackTitleTooShort => 'عنوان کم از کم 5 حروف کا ہونا چاہیے۔';

  @override
  String get feedbackDescTooShort => 'تفصیل کم از کم 10 حروف کی ہونی چاہیے۔';

  @override
  String get feedbackSubmitFailed => 'جمع کرنے میں ناکامی۔ دوبارہ کوشش کریں۔';

  @override
  String get feedbackTileTitle => 'رائے';

  @override
  String get feedbackTileSubtitle => 'MCCompanion کو بہتر بنانے میں مدد کریں';

  @override
  String get friendsHowToStep1 => 'اپنے فون یا کنسول پر Xbox ایپ کھولیں۔';

  @override
  String get friendsHowToStep2 =>
      'نیچے دیے گئے کسی ایک بوٹ کو Xbox پر دوست کے طور پر شامل کریں۔';

  @override
  String get friendsHowToStep3 => 'Minecraft کھولیں اور Friends ٹیب پر جائیں۔';

  @override
  String get friendsHowToStep4 =>
      'LAN Worlds میں اپنا سرور تلاش کریں اور شامل ہوں۔';

  @override
  String get friendsHowToNote =>
      '⚠️ ہر بار کھیلنے سے پہلے MCCompanion ایپ میں Friends mode شروع کریں۔ شروع کرنے کے بعد ایپ بند کی جا سکتی ہے۔';

  @override
  String get friendsBotLoadError =>
      '⚠️ بوٹ لسٹ لوڈ نہیں ہو سکی۔ بعد میں دوبارہ کوشش کریں۔';

  @override
  String get regionEurope => 'یورپ';

  @override
  String get regionUnitedStates => 'ریاستہائے متحدہ';

  @override
  String get yourRegion => 'آپ کا علاقہ';

  @override
  String get botStatusOffline => 'آف لائن';

  @override
  String get botStatusFull => 'بھرا ہوا';

  @override
  String botFriendCount(Object current, Object max) {
    return '$current / $max دوست';
  }

  @override
  String botCopied(Object gamertag) {
    return '$gamertag کاپی کیا گیا';
  }

  @override
  String get copyLabel => 'کاپی کریں';

  @override
  String get skinSavedToDocuments => 'اسکن دستاویزات میں محفوظ ہوگیا';

  @override
  String get skinMenuExport => 'برآمد کریں';

  @override
  String get skinMenuDelete => 'حذف کریں';

  @override
  String get rpScreenTitle => 'ریسورس پیک';

  @override
  String get rpWhatWorks => 'کیا کام کرتا ہے';

  @override
  String get rpSupportedBedrockOnly => 'صرف Bedrock Edition (.mcpack یا .zip)';

  @override
  String get rpSupportedBedrockOnlyHint => 'Java پیک کنسول پر کام نہیں کرتے۔';

  @override
  String get rpSupportedTexture => 'ریسورس پیک اور ٹیکسچر پیک';

  @override
  String get rpSupportedTextureHint =>
      'یہ باضابطہ طور پر سپورٹ ہیں اور قابل اعتماد طریقے سے کام کرتے ہیں۔';

  @override
  String get rpUnsupportedShaders => 'شیڈرز، بیہیوئیر پیک، اسکن پیک';

  @override
  String get rpUnsupportedShadersHint =>
      'یہ MCCompanion کے ذریعے کنسول پر لوڈ نہیں ہوں گے۔';

  @override
  String get rpUnsupportedAddons => 'ایڈ آن اور UI موڈز';

  @override
  String get rpUnsupportedAddonsHint =>
      'کبھی کبھی کام کر سکتے ہیں لیکن باضابطہ طور پر سپورٹ نہیں ہیں۔ اپنی ذمہ داری پر استعمال کریں۔';

  @override
  String get rpNoDiscord =>
      'Discord لنکس: کوئی .mcpack توسیع نہیں اور چند گھنٹوں میں ختم ہو جاتے ہیں';

  @override
  String get rpNoDrive =>
      'Google Drive / Dropbox شیئر لنکس: براہ راست ڈاؤن لوڈ نہیں';

  @override
  String get rpNoEncrypted => 'خفیہ کردہ یا پاس ورڈ محفوظ پیک والے سرور';

  @override
  String get rpConsolePerformanceTitle => 'کنسول کارکردگی';

  @override
  String get rpConsolePerformanceBody =>
      'اعلی ریزولیوشن ٹیکسچر پیک کنسول پر لیگ یا کریش کا باعث بن سکتے ہیں۔ اگر مسائل آئیں تو کم ریزولیوشن پیک پر سوئچ کریں یا اگر پیک سپورٹ کرے تو ہلکا سب پیک منتخب کریں۔';

  @override
  String get rpToastSaved => 'ریسورس پیک سیٹنگز محفوظ ہو گئیں۔';

  @override
  String get rpInvalidPackFormat =>
      'یہ Java Edition پیک ہے اور تعاون یافتہ نہیں۔ براہ کرم Bedrock Edition ریسورس پیک استعمال کریں۔';

  @override
  String get rpBehaviorContentWarning =>
      'اس پیک میں بیہیویئر پیک ڈیٹا شامل ہے جو سرورز پر کام نہیں کرے گا۔ ٹیکسچرز پھر بھی کام کریں گے۔';

  @override
  String get rpClearMinecraftTitle => 'اس پیک کے ساتھ پہلی بار؟';

  @override
  String get rpClearStep1 =>
      'اپنے کنسول پر Minecraft کھولیں اور Settings → Storage میں جائیں';

  @override
  String get rpClearStep2 =>
      'Resource Packs کے ساتھ ‘Clear’ یا ‘Reset’ دبائیں, یہ تمام مقامی کیشڈ پیکس ہٹا دے گا';

  @override
  String get rpClearStep3 =>
      'MCCompanion کے ذریعے دوبارہ جڑیں: مرج کیا گیا پیک خودبخود ڈاؤنلوڈ ہو جائے گا';

  @override
  String get rpRelayTitle => 'پیک ٹھیک نہیں لگ رہا؟';

  @override
  String get rpRelayBody =>
      'ریلے آپ کی overlay URL کو کیش کی بطور استعمال کرتے ہوئے مرج شدہ پیک کو 1 گھنٹے کیش میں رکھتا ہے۔ نیا مرج کروانے کے لیے: پیک URL تھوڑا بدلیں (مثلاً ?v=2 لگائیں) اور سیو کریں۔ اس کے بعد Minecraft کی پیک کیش بھی صاف کریں, مرج شدہ پیک اب بھی سرور کا UUID استعمال کرتا ہے، ورنہ Minecraft پرانی کیشڈ ورژن دکھاتا رہے گا۔';

  @override
  String get rpNoDiscordHint =>
      'Discord CDN لنکس تھوڑی دیر بعد ختم ہو جاتے ہیں';

  @override
  String get rpNoDriveHint =>
      'براہ راست ڈاؤنلوڈ نہیں: پریویو صفحے پر بھیجتا ہے';

  @override
  String get rpNoEncryptedHint =>
      'MCCompanion انکرپٹیڈ پیک کا مواد یکجا نہیں کر سکتا';

  @override
  String get rpClearWhy =>
      'Minecraft ریسورس پیکس کو ان کے UUID سے کیش کرتا ہے۔ مرج شدہ پیک سرور کا اصل UUID رکھتا ہے, اگر Minecraft نے پہلے کسی سیشن میں (MCCompanion فعال ہونے سے پہلے) سرور کا پیک کیش کیا ہوا ہے، تو نئی مرج شدہ ورژن ڈاؤنلوڈ نہیں کرے گا۔ کیش صاف کریں تاکہ Minecraft تازہ مرج شدہ پیک لوڈ کرے۔';

  @override
  String get rpUploadTab => 'اپ لوڈ';

  @override
  String get rpBrowseTab => 'براؤز';

  @override
  String get rpCategoryRealism => 'حقیقت پسند';

  @override
  String get rpCategoryFaithful => 'Faithful';

  @override
  String get rpCategoryPvp => 'PvP';

  @override
  String get rpCategoryCartoon => 'کارٹون';

  @override
  String get rpCategoryDark => 'ڈارک';

  @override
  String get rpCategoryMedieval => 'قرونِ وسطیٰ';

  @override
  String get rpCategoryNature => 'قدرت';

  @override
  String get rpCategoryThemed => 'تھیم والے';

  @override
  String get rpCategoryOther => 'دیگر';

  @override
  String get rpUploadButton => 'اپنا پیک منتخب کرنے کے لیے ٹیپ کریں';

  @override
  String get rpUploadHint => '.mcpack یا .zip • زیادہ سے زیادہ 100 MB';

  @override
  String get rpUploading => 'اپ لوڈ ہو رہا ہے...';

  @override
  String get rpMergerTitle => 'RP ضم کنندہ';

  @override
  String get rpMergerPriorityHint =>
      'سب سے اوپر کا پیک سب سے زیادہ ترجیح رکھتا ہے, اس کی فائلیں تنازعات جیتتی ہیں۔';

  @override
  String get rpMergerTopBadge => 'سرفہرست';

  @override
  String get rpMergerAddPacks => 'ریسورس پیک شامل کریں';

  @override
  String rpMergerAddAnother(int current) {
    return 'ایک اور پیک شامل کریں ($current/4)';
  }

  @override
  String get rpMergerFileTypes => '.zip یا .mcpack';

  @override
  String get rpMergerMerging => 'ضم ہو رہا ہے…';

  @override
  String rpMergerButton(int count) {
    return '$count پیک ضم کریں';
  }

  @override
  String get rpMergerSetActiveToast => 'فعال ریسورس پیک کے طور پر سیٹ کیا گیا';

  @override
  String get rpDisabled => 'غیر فعال';

  @override
  String get rpNoPackSelected => 'کوئی ریسورس پیک منتخب نہیں';

  @override
  String get rpActiveOnConnect => 'فعال: کنیکٹ ہونے پر لاگو ہوتا ہے';

  @override
  String get rpBrowseSubtitle => 'منتخب شدہ پیک، استعمال کے لیے تیار';

  @override
  String get rpBrowseEmpty => 'ابھی کوئی پیک دستیاب نہیں';

  @override
  String get rpBrowseEmptyHint => 'منتخب شدہ پیکس کے لیے بعد میں دیکھیں۔';

  @override
  String get rpReplaceFile => 'کسی دوسری فائل سے تبدیل کریں';

  @override
  String get rpDropToUpload => 'اپ لوڈ کرنے کے لیے چھوڑیں';

  @override
  String get rpTabBrowseInfo =>
      'MCCompanion کے منتخب کردہ پیکس براؤز کریں۔ فوری طور پر پیک کو فعال کرنے کے لیے استعمال کریں ٹیپ کریں, کوئی اپ لوڈ یا لنک کی ضرورت نہیں۔';

  @override
  String get rpTabUploadInfo =>
      'اپنی .mcpack یا .zip فائل اپ لوڈ کریں۔ MCCompanion اسے کلاؤڈ میں محفوظ رکھتا ہے اور ہر بار کنیکٹ ہونے پر آپ کے کنسول پر بھیجتا ہے۔';

  @override
  String get rpTabMergeInfo =>
      '2 سے 4 پیکس کو ایک میں ضم کریں۔ ضم شدہ پیک MCCompanion Cloud پر اپ لوڈ ہوتا ہے اور خودکار طور پر فعال ہو جاتا ہے۔';

  @override
  String get shareLabel => 'شیئر کریں';

  @override
  String get sectionMinecraftAccounts => 'Minecraft اکاؤنٹس';

  @override
  String get sectionSettings => 'ترتیبات';

  @override
  String get avatarUpdated => 'اوتار اپڈیٹ ہو گیا';

  @override
  String get uploadFailed => 'اپلوڈ ناکام';

  @override
  String get profileLinkCopied => 'پروفائل لنک کاپی ہو گیا!';

  @override
  String get shareProfileTooltip => 'پروفائل شیئر کریں';

  @override
  String get profileFallbackTitle => 'پروفائل';

  @override
  String get noUsersFound => 'کوئی صارف نہیں ملا';

  @override
  String get skinLabel => 'SKIN';

  @override
  String get skinsLabel => 'اسکنز';

  @override
  String get javaEditionBadge => 'Java';

  @override
  String get bedrockEditionBadge => 'Bedrock';

  @override
  String get downloadLabel => 'ڈاؤنلوڈ';

  @override
  String get justNow => 'ابھی';

  @override
  String minutesAgo(int count) {
    return '$countم پہلے';
  }

  @override
  String hoursAgo(int count) {
    return '$countگ پہلے';
  }

  @override
  String daysAgo(int count) {
    return '$countد پہلے';
  }

  @override
  String get rpPackInfo => 'معلومات';

  @override
  String get rpUseThisPack => 'یہ پیک استعمال کریں';

  @override
  String get rpViewOnWebsite => 'ویب سائٹ پر دیکھیں →';

  @override
  String rpDownloads(int count) {
    return '$count ڈاؤنلوڈ';
  }

  @override
  String get skinsSavedToMySkins => 'میری اسکنز میں محفوظ ہو گیا';

  @override
  String get skinsEmptyLocalSkins => 'ابھی تک کوئی محفوظ اسکن نہیں۔';

  @override
  String get sectionRecentActivity => 'حالیہ سرگرمی';

  @override
  String get activityNoEvents => 'ابھی تک کوئی حالیہ سرگرمی نہیں۔';

  @override
  String get activitySkinUploaded => 'اسکن اپلوڈ کی';

  @override
  String get activitySkinLiked => 'اسکن پسند کی';

  @override
  String get activityPackSubmitted => 'پیک جمع کیا';

  @override
  String get activityPackApproved => 'پیک منظور ہوا';

  @override
  String get activityPackRejected => 'پیک منظور نہیں ہوا';

  @override
  String get timeJustNow => 'ابھی';

  @override
  String timeMinutesAgo(int count) {
    return '$count منٹ پہلے';
  }

  @override
  String timeHoursAgo(int count) {
    return '$count گھنٹے پہلے';
  }

  @override
  String timeDaysAgo(int count) {
    return '$count دن پہلے';
  }

  @override
  String timeMonthsAgo(int count) {
    return '$count مہینے پہلے';
  }

  @override
  String get sectionNotifications => 'اطلاعات';

  @override
  String get sectionNotificationTypes => 'اطلاع کی اقسام';

  @override
  String get notifMarkAllRead => 'سب کو پڑھا ہوا نشان لگائیں';

  @override
  String get notifEmpty =>
      'ابھی کوئی اطلاع نہیں۔ لائکس، تبصرے اور دوستوں کی سرگرمی یہاں نظر آئے گی۔';

  @override
  String get notifSomeone => 'کسی نے';

  @override
  String notifSkinLiked(String actor) {
    return '$actor نے آپ کی اسکن پسند کی';
  }

  @override
  String notifCommentReceived(String actor) {
    return '$actor نے آپ کی اسکن پر تبصرہ کیا';
  }

  @override
  String get notifPackApproved => 'پیک منظور ہوا';

  @override
  String get notifPackRejected => 'پیک منظور نہیں ہوا';

  @override
  String notifFriendRequest(String actor) {
    return '$actor نے آپ کو دوستی کی درخواست بھیجی';
  }

  @override
  String notifFriendAccepted(String actor) {
    return '$actor نے آپ کی درخواست قبول کی';
  }

  @override
  String notifMessageReceived(String actor) {
    return '$actor کا نیا پیغام';
  }

  @override
  String get notifPrefCommentReceived => 'تبصرہ موصول';

  @override
  String get notifPrefPackApproved => 'پیک منظور';

  @override
  String get notifPrefPackRejected => 'پیک مسترد';

  @override
  String get notifPrefFriendRequest => 'دوستی کی درخواست';

  @override
  String get notifPrefFriendAccepted => 'دوست شامل';

  @override
  String get notifPrefMessageReceived => 'نیا پیغام';

  @override
  String get feedbackLoginRequiredTitle => 'رائے بھیجنے کے لیے لاگ ان کریں';

  @override
  String get feedbackLoginRequiredBody =>
      'رائے آپ کے MCCompanion اکاؤنٹ سے منسلک ہوتی ہے تاکہ ہم ایپ میں براہِ راست آپ کو جواب دے سکیں۔';

  @override
  String get feedbackLoginButton => 'لاگ ان';

  @override
  String get supportInboxTitle => 'سپورٹ ان باکس';

  @override
  String get customColour => 'اپنی مرضی کا رنگ';

  @override
  String get featuredServerLabel => 'نمایاں سرور';

  @override
  String get featuredServerTagline => 'شامل ہوں اور کھیلنا شروع کریں۔';

  @override
  String get featuredServerPlay => 'کھیلیں';

  @override
  String rpUploadFailedCode(int code) {
    return 'اپ لوڈ ناکام ($code)';
  }

  @override
  String rpUploadFailed(String error) {
    return 'اپ لوڈ ناکام: $error';
  }

  @override
  String get rpLoadFailed => 'پیک لوڈ نہیں ہو سکے';

  @override
  String get rpRetry => 'دوبارہ کوشش کریں';

  @override
  String get rpSearchHint => 'پیک تلاش کریں…';

  @override
  String rpMergeFailed(String error) {
    return 'مرج ناکام: $error';
  }

  @override
  String get rpMergerSize => 'سائز';

  @override
  String get rpMergerCreated => 'بنایا گیا';

  @override
  String get rpMergerSourcePacks => 'سورس پیکس';

  @override
  String get rpMergerDropToAdd => 'شامل کرنے کے لیے چھوڑیں';

  @override
  String get rpMergerSavedMerges => 'محفوظ مرجز';

  @override
  String get rpMergerUse => 'استعمال کریں';

  @override
  String get supportInboxShared => 'تمام ایڈمنز کے ساتھ شیئر';

  @override
  String get supportInboxEmpty => 'ابھی کوئی سپورٹ چیٹ نہیں';

  @override
  String get supportReplyingAs =>
      'آپ MCCompanion Support کے طور پر جواب دے رہے ہیں';

  @override
  String get relayBlocked =>
      'آپ کا IP یا اکاؤنٹ MCCompanion نے بلاک کر دیا ہے۔ اگر آپ کو لگتا ہے یہ غلطی ہے تو ہمارے Discord پر آئیں۔';

  @override
  String relayBlockedWithReason(String reason) {
    return 'آپ کا IP یا اکاؤنٹ MCCompanion نے بلاک کر دیا ہے۔\nوجہ: $reason\nاگر آپ کو لگتا ہے یہ غلطی ہے تو ہمارے Discord پر آئیں۔';
  }

  @override
  String relayConfigFailed(int code) {
    return 'ریلے سیٹ نہیں ہو سکا (اسٹیٹس $code)۔ دوسرا ریلے آزمائیں یا ہمارے Discord پر آئیں۔';
  }

  @override
  String relayConfigFailedDetail(int code, String detail) {
    return 'ریلے سیٹ نہیں ہو سکا (اسٹیٹس $code): $detail۔ دوسرا ریلے آزمائیں یا ہمارے Discord پر آئیں۔';
  }

  @override
  String get relayTimeout => 'ریلے نے وقت پر جواب نہیں دیا۔';

  @override
  String get relayUnreachable => 'ریلے تک نہیں پہنچ سکے۔';

  @override
  String get lookupNotFound => 'کھلاڑی نہیں ملا۔';

  @override
  String get lookupNetworkError => 'نیٹ ورک کی خرابی۔ دوبارہ کوشش کریں۔';

  @override
  String get lookupBedrockUnavailable => 'Bedrock لک اپ اس وقت دستیاب نہیں۔';

  @override
  String get lookupFailed => 'تلاش ناکام۔';

  @override
  String get myFeedbackTitle => 'میرا فیڈبیک';

  @override
  String get myFeedbackEmpty => 'آپ نے ابھی تک کچھ نہیں بھیجا۔';

  @override
  String get myFeedbackOpenList => 'میرا فیڈبیک';

  @override
  String get fbStatusOpen => 'کھلا';

  @override
  String get fbStatusPlanned => 'منصوبہ بند';

  @override
  String get fbStatusInProgress => 'کام جاری ہے';

  @override
  String get fbStatusImplemented => 'مکمل';

  @override
  String get fbStatusNotPlanned => 'منصوبہ نہیں';

  @override
  String get fbStatusDuplicate => 'ڈپلیکیٹ';

  @override
  String get fbNoReplies => 'ابھی کوئی جواب نہیں۔ ہم یہیں بتائیں گے۔';

  @override
  String get fbReplyHint => 'اس رپورٹ میں کچھ شامل کریں…';

  @override
  String get fbFromTeam => 'MCCompanion';

  @override
  String get fbFromYou => 'آپ';

  @override
  String get feedbackGoesToTeam => 'براہِ راست ٹیم تک جاتا ہے';

  @override
  String get notifFeedbackStatus => 'آپ کے فیڈبیک پر اپ ڈیٹ';

  @override
  String get notifFeedbackReply => 'آپ کے فیڈبیک کا جواب';

  @override
  String get adminTicketsHeader => 'رپورٹس اور درخواستیں';

  @override
  String get adminTicketReplyHint => 'اس ٹکٹ کے بارے میں جواب دیں…';

  @override
  String get chooseServerTitle => 'سرور منتخب کریں';

  @override
  String get changeLabel => 'تبدیل کریں';

  @override
  String get howToAutoShow => 'شروع کرتے وقت یہ دکھائیں';

  @override
  String get shareServerLabel => 'اپنا سرور شیئر کریں';

  @override
  String get shareServerOn => 'دوست دیکھ سکتے ہیں آپ کس سرور پر ہیں';

  @override
  String get shareServerOff => 'دوست دیکھتے ہیں کہ آپ کھیل رہے ہیں، کہاں نہیں';

  @override
  String directHostNotFound(String host) {
    return '$host نہیں ملا۔ پتہ چیک کریں اور دوبارہ کوشش کریں۔';
  }

  @override
  String get directPortBusy =>
      'مقامی پورٹ نہیں کھل سکا۔ پہلے موجودہ کنکشن بند کریں۔';

  @override
  String get waitingForConsole => 'آپ کے کنسول کا انتظار ہے…';

  @override
  String get consoleFound => 'کنسول مل گیا';

  @override
  String get consoleLanHint =>
      'اپنے کنسول پر Minecraft کھولیں اور دوست میں LAN گیم تلاش کریں۔';

  @override
  String get localNetworkBlocked =>
      'MCCompanion آپ کے مقامی نیٹ ورک تک نہیں پہنچ سکتا۔ اپنے آلے کی سیٹنگز میں MCCompanion کے لیے لوکل نیٹ ورک آن کریں اور یقینی بنائیں کہ آپ Wi-Fi پر ہیں۔';

  @override
  String directAddressNotSupported(String host) {
    return '$host ایک IPv6 پتہ ہے۔ پراکسی/ڈائریکٹ موڈ صرف IPv4 کو سپورٹ کرتا ہے۔ IPv4 پتہ یا ہوسٹ نام استعمال کریں۔';
  }

  @override
  String termsAgreement(String terms, String privacy) {
    return 'میں $terms اور $privacy سے اتفاق کرتا ہوں۔';
  }

  @override
  String get verifyEmailTitle => 'اپنا ای میل تصدیق کریں';

  @override
  String get verifyEmailBody =>
      'تبصرہ کرنے، سکن اپ لوڈ کرنے یا پیک جمع کرانے سے پہلے ضروری ہے۔';

  @override
  String get verifyEmailSent => 'بھیج دیا گیا، اپنا ان باکس دیکھیں۔';

  @override
  String get verifyEmailSending => 'بھیجا جا رہا ہے…';

  @override
  String get verifyEmailSend => 'لنک بھیجیں';

  @override
  String updateAvailableTitle(Object version) {
    return 'ورژن $version دستیاب ہے';
  }

  @override
  String updateAvailableBody(Object current) {
    return 'آپ $current چلا رہے ہیں۔ یہ ورژن خود کو اپ ڈیٹ نہیں کرتا۔';
  }

  @override
  String get updateAvailableAction => 'ڈاؤن لوڈ کریں';

  @override
  String get updateAvailableDismiss => 'ابھی نہیں';

  @override
  String get serverListSearchHint => 'نام یا پتے سے تلاش کریں';

  @override
  String get serverListEditionAny => 'Java اور Bedrock';

  @override
  String get serverListEditionJava => 'صرف Java';

  @override
  String get serverListEditionBedrock => 'صرف Bedrock';

  @override
  String get serverListSortVotes => 'سب سے زیادہ ووٹ';

  @override
  String get serverListSortPlayers => 'سب سے زیادہ کھلاڑی';

  @override
  String get serverListSortPeak => 'سب سے بلند عروج';

  @override
  String get serverListSortNewest => 'نئے ترین';

  @override
  String get serverListSortName => 'نام';

  @override
  String get serverListAllCategories => 'سب';

  @override
  String get serverListPlayersAny => 'کوئی بھی سائز';

  @override
  String get serverListPlayersHint => 'اوسط آن لائن کھلاڑی';

  @override
  String get serverListLoadFailed => 'سرور کی فہرست لوڈ نہیں ہو سکی';

  @override
  String get serverListLoadFailedHint => 'دوبارہ کوشش کے لیے نیچے کھینچیں';

  @override
  String get serverListNoMatch => 'کوئی سرور نہیں ملا';

  @override
  String get serverListNoMatchHint => 'کوئی اور تلاش یا زمرہ آزمائیں';

  @override
  String get serverCardPlay => 'کھیلیں';

  @override
  String get serverCardVote => 'ووٹ دیں';

  @override
  String get serverCopyIp => 'IP کاپی کریں';

  @override
  String get serverCopied => 'کاپی ہو گیا';

  @override
  String get serverStatPlayers => 'کھلاڑی';

  @override
  String get serverStatPeak => 'عروج';

  @override
  String get serverStatUptime => 'اپ ٹائم';

  @override
  String get serverStatVotesMonth => 'اس ماہ کے ووٹ';

  @override
  String get serverBadgeFeatured => 'نمایاں';

  @override
  String get serverEditionJava => 'Java';

  @override
  String get serverEditionBedrock => 'Bedrock';

  @override
  String get serverEditionCrossplay => 'کراس پلے';

  @override
  String get serverSectionMotd => 'آج کا پیغام';

  @override
  String get serverLinkDiscord => 'Discord';

  @override
  String get serverLinkWebsite => 'ویب سائٹ';

  @override
  String get serverVotesThisMonth => 'اس ماہ';

  @override
  String get serverVotesAllTime => 'مجموعی';

  @override
  String get serverVoteSignInRequired => 'ایپ سے ووٹ دینے کے لیے سائن ان کریں۔';

  @override
  String serverVoteSheetTitle(String name) {
    return '$name کو ووٹ دیں';
  }

  @override
  String get serverVoteSheetSubtitle =>
      'آپ کا Minecraft نام، تاکہ سرور جان سکے کسے انعام دینا ہے۔';

  @override
  String get serverVoteSheetHint => 'Steve';

  @override
  String get serverVoteSheetButton => 'ووٹ دیں';

  @override
  String get serverVoteSheetLimit => 'ہر سرور پر دن میں ایک ووٹ۔';

  @override
  String get serverVoteDelivered => 'ووٹ ہو گیا۔ آپ کا انعام راستے میں ہے۔';

  @override
  String get serverVoteNoRewards =>
      'ووٹ ہو گیا۔ اس سرور پر کوئی انعام مقرر نہیں۔';

  @override
  String get serverVoteFailed => 'یہ کام نہیں کیا، براہ کرم دوبارہ کوشش کریں۔';

  @override
  String get serverVoteOffline =>
      'سرور تک رسائی نہیں ہو سکی۔ اپنا کنکشن چیک کریں۔';

  @override
  String get feedbackViewYourReport => 'اپنی رپورٹ دیکھیں';

  @override
  String get showMore => 'مزید';

  @override
  String get showLess => 'کم';

  @override
  String get lookupRecent => 'حالیہ';
}
