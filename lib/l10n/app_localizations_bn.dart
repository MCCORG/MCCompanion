// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get console => 'কনসোল';

  @override
  String get modeLabel => 'মোড';

  @override
  String get statusLabel => 'স্ট্যাটাস';

  @override
  String get seeAll => 'সব দেখুন';

  @override
  String get sectionHelp => 'সহায়তা';

  @override
  String get sectionAdvanced => 'উন্নত';

  @override
  String get versionLabel => 'সংস্করণ';

  @override
  String get consoleOutput => 'কনসোল আউটপুট';

  @override
  String get noLogsYet => 'এখনও কোনো লগ নেই';

  @override
  String get startBroadcastingToSeeOutput => 'আউটপুট দেখতে সম্প্রচার শুরু করুন';

  @override
  String get close => 'বন্ধ করুন';

  @override
  String get ok => 'OK';

  @override
  String get back => 'পিছনে';

  @override
  String get next => 'পরবর্তী';

  @override
  String get done => 'সম্পন্ন';

  @override
  String get none => 'কোনোটি না';

  @override
  String get onboardingThemeTitle => 'থিম বেছে নিন';

  @override
  String get onboardingThemeSubtitle =>
      'পরে সেটিংসে প্রতিটি রঙ পরিবর্তন করতে পারবেন।';

  @override
  String get onboardingNavTitle => 'দ্রুত অ্যাক্সেস';

  @override
  String get onboardingNavSubtitle =>
      'নেভিগেশন বারের জন্য দুটি ফিচার বেছে নিন।';

  @override
  String get onboardingNavLeftLabel => 'বাম বোতাম';

  @override
  String get onboardingNavRightLabel => 'ডান বোতাম';

  @override
  String get onboardingNavPreviewConnector => 'কানেক্টর';

  @override
  String get onboardingNavPreviewProfile => 'প্রোফাইল';

  @override
  String get onboardingNavPreviewEmpty => 'খালি';

  @override
  String get onboardingCustomizeDetail => 'বিস্তারিত কাস্টমাইজ করুন →';

  @override
  String get website => 'ওয়েবসাইট';

  @override
  String get howToUseMenu => 'ব্যবহারের নিয়ম';

  @override
  String get support => 'সহায়তা';

  @override
  String get start => 'শুরু করুন';

  @override
  String get stop => 'বন্ধ করুন';

  @override
  String get labelJava => 'Java';

  @override
  String get language => 'বাংলা';

  @override
  String get discord => 'Discord';

  @override
  String get toggleDebug => 'ডিবাগ চালু/বন্ধ করুন';

  @override
  String get copyLogs => 'লগ কপি করুন';

  @override
  String get clear => 'মুছুন';

  @override
  String get cancel => 'বাতিল';

  @override
  String get deleteServer => 'সার্ভার মুছুন';

  @override
  String get delete => 'মুছুন';

  @override
  String get addServer => 'সার্ভার যোগ করুন';

  @override
  String get addServersHint => 'পরে দ্রুত সংযোগের জন্য সার্ভার যোগ করুন';

  @override
  String get serverNameLabel => 'সার্ভারের নাম *';

  @override
  String get addressLabel => 'ঠিকানা *';

  @override
  String get portLabel => 'পোর্ট *';

  @override
  String get descriptionLabel => 'বিবরণ (ঐচ্ছিক)';

  @override
  String get save => 'সংরক্ষণ করুন';

  @override
  String get pleaseEnterServer => '⚠️ অনুগ্রহ করে একটি সার্ভার ঠিকানা লিখুন';

  @override
  String get invalidPort => '⚠️ অবৈধ পোর্ট নম্বর (1-65535)';

  @override
  String get dataSentToServers => 'ডেটা MCCompanion সার্ভারে পাঠানো হয়েছে';

  @override
  String selectedServer(Object name) {
    return '📋 নির্বাচিত: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'নির্বাচিত: $name';
  }

  @override
  String copiedLogs(Object count) {
    return '$countটি লগ এন্ট্রি ক্লিপবোর্ডে কপি করা হয়েছে';
  }

  @override
  String get debugEnabled => 'ডিবাগ লগ চালু হয়েছে';

  @override
  String get iUnderstand => 'আমি বুঝেছি';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'নির্বাচিত: $relayName\r\n\r\nকীভাবে সংযোগ করবেন:\r\n1. আপনার Switch Settings-এ যান এবং DNS পরিবর্তন করে এটি দিন: $relayIp\r\n2. Minecraft খুলুন এবং তালিকা থেকে একটি সার্ভার নির্বাচন করুন (যেমন Cubecraft বা Hive)।\r\n3. এখন আপনাকে স্বয়ংক্রিয়ভাবে আপনার নিজের সার্ভারে পাঠানো হবে।';
  }

  @override
  String get noSavedServers => 'কোনো সংরক্ষিত সার্ভার নেই';

  @override
  String get savedServers => 'সংরক্ষিত সার্ভার';

  @override
  String get manageServers => 'সার্ভার পরিচালনা করুন';

  @override
  String get active => 'সক্রিয়';

  @override
  String get vpnDetected => 'VPN শনাক্ত হয়েছে';

  @override
  String get noWifi => 'Wi‑Fi এ নেই';

  @override
  String get vpnActive =>
      'আমরা শনাক্ত করেছি যে আপনার VPN সক্রিয় আছে।\n\nMCCompanion ব্যবহার করার আগে অনুগ্রহ করে VPN বন্ধ করুন, নইলে LAN সম্প্রচার আপনার কনসোলে পৌঁছাতে নাও পারে।';

  @override
  String get mobileActive =>
      'শনাক্ত হয়েছে: মোবাইল ডেটা\n\nMCCompanion কে আপনার কনসোলের একই নেটওয়ার্কে থাকতে হবে। চালিয়ে যাওয়ার আগে আপনার হোম Wi‑Fi বা হটস্পটে সংযুক্ত হোন।';

  @override
  String get continueAnyway => 'তবুও চালিয়ে যান';

  @override
  String get updateAvailable => 'আপডেট উপলব্ধ';

  @override
  String get stopBroadcasting => 'সম্প্রচার বন্ধ করুন';

  @override
  String get startNintendoMode => 'Nintendo মোড শুরু করুন';

  @override
  String get startFriendsMode => 'বন্ধু মোড শুরু করুন';

  @override
  String get startBroadcasting => 'সম্প্রচার শুরু করুন';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'বন্ধুরা';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / প্রক্সি)';

  @override
  String get howToXboxSubtitle => 'LAN দিয়ে সংযোগ';

  @override
  String get howToXboxBody =>
      'কীভাবে সংযোগ করবেন (Xbox / PS4 / PS5):\r\n1. নিশ্চিত করুন যে MCCompanion চালানো আপনার ডিভাইস এবং আপনার কনসোল একই লোকাল নেটওয়ার্কে আছে।\r\n2. অ্যাপে আপনার Minecraft server address এবং port লিখে \\\"সম্প্রচার শুরু করুন\\\" চাপুন।\r\n3. কনসোলে Minecraft → Play খুলুন → LAN Worlds অথবা Friends ট্যাব খুঁজুন এবং তালিকাটি রিফ্রেশ করুন।\r\n4. যোগ দিতে \\\"MCCompanion\\\" নামের LAN server নির্বাচন করুন।\r\nনোট:\r\n- সার্ভার না দেখালে নিশ্চিত করুন যে দুই ডিভাইস একই subnet-এ আছে এবং অ্যাপ এখনও সম্প্রচার করছে।\r\n- কিছু কনসোল মডেল বা রাউটার LAN discovery ব্লক করতে পারে; প্রয়োজন হলে অ্যাপ বা রাউটারের সেটিংস পরিবর্তন করে দেখুন।';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (DNS মোড)';

  @override
  String get howToNintendoSubtitle => 'DNS দিয়ে সংযোগ';

  @override
  String get howToFriendsTitle => 'বন্ধু মোড';

  @override
  String get howToFriendsSubtitle => 'ফ্রেন্ডস দিয়ে সংযোগ';

  @override
  String get helpMCCompanionTitle => 'MCCompanion দেখা যাচ্ছে না';

  @override
  String get helpMCCompanionSubtitle => 'LAN শনাক্তকরণ সমস্যার সমাধান';

  @override
  String get helpMCCompanionBody =>
      'যদি আপনার কনসোলে সার্ভারটি না দেখা যায়, তাহলে এই ধাপগুলো চেষ্টা করুন:\r\n\r\n✅ প্রাথমিক পরীক্ষা:\r\n1. একই WiFi নেটওয়ার্ক - আপনার ফোন/ট্যাবলেট এবং কনসোল অবশ্যই একই WiFi-তে থাকতে হবে\r\n2. সঠিক সার্ভার ঠিকানা - IP এবং port আবার পরীক্ষা করুন (ডিফল্ট: 19132)\r\n3. সম্প্রচার সক্রিয় - MCCompanion \\\"Broadcasting\\\" স্ট্যাটাস দেখাচ্ছে কি না নিশ্চিত করুন\r\n\r\n🔄 দ্রুত সমাধান:\r\n• অ্যাপ রিস্টার্ট করুন: সম্প্রচার বন্ধ করুন, MCCompanion পুরোপুরি বন্ধ করুন, আবার খুলে চেষ্টা করুন\r\n• কনসোল রিস্টার্ট করুন: কখনও কখনও LAN game শনাক্ত করতে কনসোলকে রিফ্রেশ করতে হয়\r\n• Friends/LAN ট্যাব পরীক্ষা করুন: সার্ভারটি \\\"Friends\\\" বা \\\"LAN Games\\\" এর নিচে দেখা যায়, server list-এ নয়\r\n• সম্প্রচার শুরু করার পর 10-15 সেকেন্ড অপেক্ষা করুন\r\n• VPN বন্ধ করুন: VPN লোকাল সম্প্রচার ব্লক করতে পারে\r\n\r\n⚠️ সাধারণ সমস্যা:\r\n\\\"No route found for user\\\" → নিশ্চিত করুন যে দুই ডিভাইস একই Wi‑Fi-তে আছে (Guest network এড়িয়ে চলুন)\r\n\\\"Unable to connect to MCCompanion relay server\\\" → আপনার ইন্টারনেট / relay status পরীক্ষা করুন\r\n\r\n📱 এখনও সমস্যা হচ্ছে? MCCompanion-এ Debug Mode চালু করে logs পরীক্ষা করুন, অথবা অন্য কোনো সার্ভার চেষ্টা করুন।';

  @override
  String get helpMultiplayerFailedTitle => 'মাল্টিপ্লেয়ার সংযোগ ব্যর্থ';

  @override
  String get helpMultiplayerFailedSubtitle =>
      'কেন এটি MCCompanion-এর ত্রুটি নয় তার ব্যাখ্যা';

  @override
  String get helpMultiplayerFailedBody =>
      '⚠️ এটি MCCompanion-এর কোনো সমস্যা নয়!\r\n\r\nMCCompanion আপনাকে সফলভাবে অনুরোধকৃত সার্ভারে পুনর্নির্দেশ করেছে। \\\"Multiplayer Connection Failed\\\" বার্তাটি বোঝায় যে লক্ষ্য সার্ভারটি বর্তমানে অপ্রাপ্য। সম্ভাব্য কারণ:\r\n\r\n• লক্ষ্য Minecraft server অফলাইন বা অতিরিক্ত লোডে আছে\r\n• সার্ভারের জন্য আপডেটেড client version বা নির্দিষ্ট edition প্রয়োজন\r\n• relay এবং লক্ষ্য সার্ভারের মধ্যে নেটওয়ার্ক সমস্যা\r\n\r\nঅন্য কোনো সার্ভারে সংযোগ করার চেষ্টা করুন অথবা সার্ভারের support-এর সাথে যোগাযোগ করুন। যদি একাধিক সার্ভারে একই সমস্যা থাকে, MCCompanion-এ Debug Mode চালু করে logs পরীক্ষা করুন।';

  @override
  String get helpNintendoDnsTitle => 'Nintendo DNS কাজ করছে না';

  @override
  String get helpNintendoDnsSubtitle => 'সাধারণ DNS / relay সমস্যা';

  @override
  String get helpNintendoDnsBody =>
      'যদি Nintendo DNS মোড কাজ না করে, তাহলে নিচের বিষয়গুলো পরীক্ষা করুন:\r\n\r\n1. নিশ্চিত করুন যে আপনি অ্যাপ থেকে DNS config পাঠিয়েছেন (DNS কনফিগ পাঠান)।\r\n2. নিশ্চিত করুন যে আপনি Switch-এ relay IP-কে Primary DNS হিসেবে প্রয়োগ করেছেন।\r\n3. নিশ্চিত করুন যে নির্বাচিত relay server (EU/US) অনলাইনে আছে এবং অতিরিক্ত লোডে নেই।\r\n4. কিছু নেটওয়ার্ক (যেমন captive portal) custom DNS প্রতিরোধ করে, অন্য নেটওয়ার্কে পরীক্ষা করুন।\r\n\r\nযদি সমস্যা থেকে যায়, Debug Mode চালু করে logs পরীক্ষা করুন বা Friends-mode বিকল্পটি চেষ্টা করুন।';

  @override
  String get helpFriendsModeTitle => 'বন্ধু মোড কাজ করছে না';

  @override
  String get helpFriendsModeSubtitle => 'সাধারণ বন্ধু সংক্রান্ত সমস্যা';

  @override
  String get helpFriendsModeBody =>
      'বন্ধু মোড সমস্যা সমাধানের টিপস:\r\n\r\n1. নিশ্চিত করুন যে relay friend account কনসোলে যোগ/গ্রহণ করা হয়েছে (যদি প্রয়োজন হয়)।\r\n2. বন্ধু মোড চালু করার পর গেমটি রিস্টার্ট করে Friends/LAN ট্যাব রিফ্রেশ করার চেষ্টা করুন।\r\n\r\nযদি সার্ভারটি এখনও বন্ধুদের কাছে না দেখা যায়, তবে Debug Mode চালু করে logs পরীক্ষা করুন যাতে ত্রুটি শনাক্ত করা যায়।';

  @override
  String get changeLanguageTitle => 'ভাষা পরিবর্তন করুন';

  @override
  String get changeLanguage => 'ভাষা';

  @override
  String get couldNotOpenUrl => 'URL খোলা যায়নি';

  @override
  String get serverTrackerTitle => 'সার্ভার ট্র্যাকার';

  @override
  String get removeServerTitle => 'সার্ভার সরান';

  @override
  String removeServerConfirm(Object name) {
    return 'আপনার ট্র্যাকার থেকে \"$name\" সরাবেন?';
  }

  @override
  String get removeServerFailed => 'সার্ভার সরাতে ব্যর্থ হয়েছে';

  @override
  String get refreshStatus => 'স্ট্যাটাস রিফ্রেশ করুন';

  @override
  String get trackerSignInRequired => 'সাইন ইন প্রয়োজন';

  @override
  String get trackerSignInSubtitle =>
      'সার্ভার ট্র্যাক করতে এবং অফলাইন বিজ্ঞপ্তি পেতে সাইন ইন করুন।';

  @override
  String get signIn => 'সাইন ইন';

  @override
  String get noServersTracked => 'কোনো সার্ভার ট্র্যাক করা হয়নি';

  @override
  String get trackerEmptySubtitle =>
      'স্ট্যাটাস পর্যবেক্ষণ ও বিজ্ঞপ্তি পেতে একটি Minecraft সার্ভার যোগ করুন।';

  @override
  String get fillAllFields => 'সমস্ত ফিল্ড সঠিকভাবে পূরণ করুন';

  @override
  String get slotUsedUpgrade =>
      'আপনার বিনামূল্যে স্লট ব্যবহৃত হয়েছে। আরও সার্ভারের জন্য আপগ্রেড করুন।';

  @override
  String get addServerFailed =>
      'সার্ভার যোগ করতে ব্যর্থ হয়েছে। আপনার তথ্য যাচাই করুন।';

  @override
  String get ipAddressLabel => 'আইপি ঠিকানা';

  @override
  String get platformLabel => 'প্ল্যাটফর্ম';

  @override
  String get bedrockLabel => 'Bedrock';

  @override
  String get addLabel => 'যোগ করুন';

  @override
  String get statusOnline => 'অনলাইন';

  @override
  String get statusOffline => 'অফলাইন';

  @override
  String get statusChecking => 'যাচাই করা হচ্ছে...';

  @override
  String get failedUpdateNotifications => 'বিজ্ঞপ্তি আপডেট করতে ব্যর্থ হয়েছে';

  @override
  String get editServerTitle => 'সার্ভার সম্পাদনা করুন';

  @override
  String get serverNameHint => 'সার্ভারের নাম';

  @override
  String get failedSave => 'সংরক্ষণ করতে ব্যর্থ হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get serverRenamed => 'সার্ভারের নাম পরিবর্তন করা হয়েছে';

  @override
  String get customizeLabel => 'কাস্টমাইজ করুন';

  @override
  String get customizeSubtitle => 'নেভিগেশন বার এবং রং';

  @override
  String get resetLabel => 'রিসেট';

  @override
  String get navigationSection => 'নেভিগেশন';

  @override
  String get navFixed => 'Connector এবং প্রোফাইল সবসময় স্থির';

  @override
  String get leftSlot => 'স্লট ২';

  @override
  String get outerSlot => 'স্লট ১';

  @override
  String get rightSlot => 'স্লট ৩';

  @override
  String get farSlot => 'স্লট ৪';

  @override
  String get colorPickerApply => 'প্রয়োগ করুন';

  @override
  String get colorPickerHex => 'Hex';

  @override
  String get textColorSection => 'টেক্সট রঙ';

  @override
  String get textColorPickerTitle => 'টেক্সট রঙ';

  @override
  String get textColorHint => 'কাস্টম টেক্সট রঙ বাছাই করতে বৃত্তে ট্যাপ করুন';

  @override
  String get textColorPreviewPrimary => 'প্রাথমিক';

  @override
  String get textColorPreviewSecondary => 'মাধ্যমিক';

  @override
  String get textColorPreviewMuted => 'মৃদু';

  @override
  String get colorSwatchCustom => 'কাস্টম';

  @override
  String get accentColorSection => 'অ্যাকসেন্ট রঙ';

  @override
  String get opacityLabel => 'স্বচ্ছতা';

  @override
  String get backgroundSection => 'পটভূমি';

  @override
  String get cardsSection => 'কার্ডস';

  @override
  String get editLabel => 'সম্পাদনা';

  @override
  String get playerLookupJavaEdition => 'Java Edition';

  @override
  String get playerLookupBedrockEdition => 'Bedrock Edition';

  @override
  String get playerLookupLabelUuid => 'UUID';

  @override
  String get playerLookupLabelGamertag => 'গেমারট্যাগ';

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
  String get reportUser => 'ব্যবহারকারীকে রিপোর্ট করুন';

  @override
  String reportUserWithName(Object name) {
    return '$name-কে রিপোর্ট করুন';
  }

  @override
  String get reportDisclaimer =>
      'রিপোর্টগুলো আমাদের দল পর্যালোচনা করে। মিথ্যা রিপোর্টের কারণে আপনার অ্যাকাউন্টের বিরুদ্ধে ব্যবস্থা নেওয়া হতে পারে।';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonHarassment => 'হয়রানি';

  @override
  String get reportReasonInappropriate => 'অনুপযুক্ত কনটেন্ট';

  @override
  String get reportReasonOther => 'অন্যান্য';

  @override
  String get reportAdditionalDetails => 'অতিরিক্ত বিবরণ (ঐচ্ছিক)…';

  @override
  String get reportSuccess => 'রিপোর্ট জমা দেওয়া হয়েছে। ধন্যবাদ।';

  @override
  String get reportFailed => 'রিপোর্ট জমা দিতে ব্যর্থ। আবার চেষ্টা করুন।';

  @override
  String get reportSubmit => 'রিপোর্ট জমা দিন';

  @override
  String get playerLookupSubtitle =>
      'ইউজারনেম দিয়ে Java বা Bedrock প্লেয়ার খুঁজুন';

  @override
  String get playerLookupHint => 'ইউজারনেম লিখুন…';

  @override
  String get playerLookupLinked => 'লিঙ্ক করা অ্যাকাউন্ট পাওয়া গেছে';

  @override
  String get playerLookupLabelUsername => 'ইউজারনেম';

  @override
  String get playerLookupLabelTier => 'Tier';

  @override
  String playerLookupCopied(Object value) {
    return '$value কপি করা হয়েছে';
  }

  @override
  String get addFriend => 'বন্ধু যোগ করুন';

  @override
  String get send => 'Send';

  @override
  String get somethingWentWrong => 'কিছু ভুল হয়েছে। আবার চেষ্টা করুন।';

  @override
  String friendRequestAccepted(Object name) {
    return 'আপনি এখন $name-এর বন্ধু';
  }

  @override
  String requestDeclined(Object name) {
    return '$name-এর অনুরোধ প্রত্যাখ্যান করা হয়েছে';
  }

  @override
  String get deleteAccountTitle => 'অ্যাকাউন্ট মুছুন';

  @override
  String get deleteAccountBody =>
      'এটি আপনার অ্যাকাউন্ট ও সমস্ত ডেটা স্থায়ীভাবে মুছে ফেলবে। এই কাজ আর ফেরানো যাবে না।';

  @override
  String get deletePermanently => 'স্থায়ীভাবে মুছুন';

  @override
  String get couldNotDeleteAccount =>
      'অ্যাকাউন্ট মোছা যায়নি। আবার চেষ্টা করুন।';

  @override
  String get removeFriendTitle => 'বন্ধু সরান';

  @override
  String removeFriendConfirm(Object name) {
    return '$name-কে আপনার বন্ধুদের থেকে সরাবেন?';
  }

  @override
  String get remove => 'সরান';

  @override
  String friendRemoved(Object name) {
    return '$name-কে আপনার বন্ধুদের থেকে সরানো হয়েছে';
  }

  @override
  String get emailDifferentMethod =>
      'এই ইমেইল অন্য একটি সাইন-ইন পদ্ধতির সাথে যুক্ত';

  @override
  String get googleSignInFailed =>
      'Google সাইন-ইন ব্যর্থ হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get appleSignInFailed =>
      'Apple সাইন-ইন ব্যর্থ হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get resetPasswordTitle => 'পাসওয়ার্ড রিসেট করুন';

  @override
  String get resetPasswordBody =>
      'আপনার ইমেইল ঠিকানা লিখুন, আমরা পাসওয়ার্ড রিসেট করার একটি লিঙ্ক পাঠাব।';

  @override
  String get emailAddressHint => 'ইমেইল ঠিকানা';

  @override
  String get sendLink => 'লিঙ্ক পাঠান';

  @override
  String resetLinkSent(Object email) {
    return '$email-এর জন্য অ্যাকাউন্ট থাকলে, লিঙ্ক পাঠানো হচ্ছে';
  }

  @override
  String get invalidEmailError => 'ইমেইল ঠিকানাটি সঠিক নয়';

  @override
  String get couldNotSendResetEmail =>
      'রিসেট ইমেইল পাঠানো যায়নি। আবার চেষ্টা করুন।';

  @override
  String get enterEmailAndPassword => 'অনুগ্রহ করে ইমেইল ও পাসওয়ার্ড লিখুন';

  @override
  String get incorrectEmailOrPassword => 'ইমেইল বা পাসওয়ার্ড ভুল';

  @override
  String get emailAlreadyInUse => 'এই ইমেইল ঠিকানা আগে থেকেই ব্যবহৃত হচ্ছে';

  @override
  String get weakPassword =>
      'পাসওয়ার্ড খুব দুর্বল। আরও শক্তিশালী একটি বেছে নিন।';

  @override
  String get createAccount => 'অ্যাকাউন্ট তৈরি করুন';

  @override
  String get signInSubtitle => 'প্রোফাইল, বন্ধু ও চ্যাট দেখতে সাইন ইন করুন।';

  @override
  String get passwordHint => 'পাসওয়ার্ড';

  @override
  String get forgotPassword => 'পাসওয়ার্ড ভুলে গেছেন?';

  @override
  String get orDivider => 'or';

  @override
  String get continueWithGoogle => 'Google দিয়ে চালিয়ে যান';

  @override
  String get alreadyHaveAccount => 'আগে থেকেই অ্যাকাউন্ট আছে? সাইন ইন করুন';

  @override
  String get noAccountYet => 'অ্যাকাউন্ট নেই? একটি তৈরি করুন';

  @override
  String get profileNotSetUp => 'প্রোফাইল সেট করা নেই';

  @override
  String get chooseUsernameSubtitle =>
      'একটি ইউজারনেম বেছে নিন যাতে অন্য খেলোয়াড়রা আপনাকে খুঁজে পায়।';

  @override
  String get createProfile => 'প্রোফাইল তৈরি করুন';

  @override
  String get findUser => 'ব্যবহারকারী খুঁজুন';

  @override
  String get couldNotUpdateVisibility => 'দৃশ্যমানতার সেটিংস আপডেট করা যায়নি';

  @override
  String get signOut => 'সাইন আউট';

  @override
  String get appearOfflineLabel => 'অফলাইন দেখান';

  @override
  String get appearOfflineOn => 'অন্য খেলোয়াড়দের কাছে আপনি অফলাইন দেখাচ্ছেন';

  @override
  String get appearOfflineOff => 'অন্য খেলোয়াড়দের কাছে আপনি অনলাইন দেখাচ্ছেন';

  @override
  String get unlinkXboxTitle => 'Xbox অ্যাকাউন্ট আনলিঙ্ক করুন';

  @override
  String removeLabelConfirm(Object name) {
    return '$name-কে আপনার লিঙ্ক করা অ্যাকাউন্ট থেকে সরাবেন?';
  }

  @override
  String get unlink => 'আনলিঙ্ক করুন';

  @override
  String get unlinkJavaTitle => 'Java অ্যাকাউন্ট আনলিঙ্ক করুন';

  @override
  String removeJavaConfirm(Object name) {
    return '$name-কে আপনার লিঙ্ক করা অ্যাকাউন্ট থেকে সরাবেন?';
  }

  @override
  String get linkAccountsHint =>
      'স্কিন ও পরিসংখ্যান দেখাতে আপনার Minecraft অ্যাকাউন্ট লিঙ্ক করুন।';

  @override
  String get linkXbox => 'Xbox লিঙ্ক করুন';

  @override
  String get linkJava => 'Java লিঙ্ক করুন';

  @override
  String get profileUpdated => 'প্রোফাইল আপডেট হয়েছে';

  @override
  String get edit => 'Edit';

  @override
  String get displayNameLabel => 'প্রদর্শন নাম';

  @override
  String get yourNameHint => 'আপনার নাম';

  @override
  String get bioLabel => 'Bio';

  @override
  String get bioHint => 'নিজের সম্পর্কে অন্যদের বলুন…';

  @override
  String get noFriendsYet => 'এখনও কোনো বন্ধু নেই';

  @override
  String get noFriendsSub => 'বন্ধু যোগ করলে এখানে দেখা যাবে।';

  @override
  String onlineFriendsLabel(Object count) {
    return '$count জন অনলাইন';
  }

  @override
  String offlineFriendsLabel(Object count) {
    return '$count জন অফলাইন';
  }

  @override
  String get noPendingRequests => 'কোনো অপেক্ষমাণ অনুরোধ নেই';

  @override
  String get requestsAppearHere => 'নতুন বন্ধুত্বের অনুরোধ এখানে দেখা যাবে।';

  @override
  String get chooseUniqueUsername =>
      'শুরু করতে একটি অনন্য ব্যবহারকারীর নাম বেছে নিন।';

  @override
  String get usernameFieldLabel => 'ব্যবহারকারীর নাম';

  @override
  String get usernameExampleHint => 'যেমন: CoolPlayer123';

  @override
  String get usernameFormatHint =>
      '৩–২০ অক্ষর · শুধু অক্ষর, সংখ্যা এবং আন্ডারস্কোর';

  @override
  String get displayNameOptional => 'প্রদর্শন নাম (ঐচ্ছিক)';

  @override
  String get displayNameExampleHint => 'যেমন: Cool Player';

  @override
  String get usernameRequired => 'ব্যবহারকারীর নাম প্রয়োজন';

  @override
  String get usernameFormatError =>
      'ব্যবহারকারীর নাম ৩–২০ অক্ষর হতে হবে এবং শুধুমাত্র অক্ষর, সংখ্যা এবং আন্ডারস্কোর থাকতে পারে';

  @override
  String get usernameTaken => 'এই ব্যবহারকারীর নামটি ইতিমধ্যে নেওয়া হয়েছে';

  @override
  String get noConnectionError =>
      'কোনো সংযোগ নেই। আপনার ইন্টারনেট পরীক্ষা করুন এবং আবার চেষ্টা করুন।';

  @override
  String get info => 'তথ্য';

  @override
  String get navProfile => 'প্রোফাইল';

  @override
  String serverRemoved(Object name) {
    return '$name সরানো হয়েছে';
  }

  @override
  String serverAdded(Object name) {
    return '$name যোগ করা হয়েছে';
  }

  @override
  String get paywallRestore => 'পুনরুদ্ধার';

  @override
  String get paywallMonthly => 'মাসিক';

  @override
  String get paywallYearly => 'বার্ষিক';

  @override
  String get paywallSavePercent => '~১৭% সাশ্রয়';

  @override
  String get paywallSubtitle =>
      'আরও সার্ভার ট্র্যাক করুন এবং সেগুলো অনলাইন\nবা অফলাইন হলে বিজ্ঞপ্তি পান।';

  @override
  String paywallSlotLabel(Object slots) {
    return '$slotsটি সার্ভার স্লট';
  }

  @override
  String get paywallPopular => 'জনপ্রিয়';

  @override
  String get paywallContinue => 'চালিয়ে যান';

  @override
  String get paywallNoPkgs => 'কোনো প্যাকেজ উপলব্ধ নেই।';

  @override
  String get paywallManaged =>
      'Apple/Google দ্বারা পরিচালিত। যেকোনো সময় বাতিল করুন।';

  @override
  String get paywallPurchaseSuccess => 'ক্রয় সফল হয়েছে!';

  @override
  String get paywallPurchaseFailed => 'ক্রয় ব্যর্থ হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get paywallPurchasesRestored => 'ক্রয় পুনরুদ্ধার হয়েছে!';

  @override
  String get paywallNoActivePurchases => 'কোনো সক্রিয় ক্রয় পাওয়া যায়নি।';

  @override
  String get paywallRestoreFailed =>
      'পুনরুদ্ধার ব্যর্থ হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get relay => 'Relay';

  @override
  String get serversSection => 'সার্ভার';

  @override
  String get selectBedrockAccount => 'Bedrock অ্যাকাউন্ট নির্বাচন করুন';

  @override
  String get infoAndLegal => 'তথ্য ও আইনি';

  @override
  String get legalSection => 'আইনি';

  @override
  String get privacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String get privacyPolicySubtitle =>
      'আমরা কীভাবে আপনার ডেটা সংগ্রহ ও সুরক্ষিত করি';

  @override
  String get termsOfService => 'পরিষেবার শর্তাবলি';

  @override
  String get termsOfServiceSubtitle => 'ব্যবহারের নিয়ম ও শর্ত';

  @override
  String get dataSourcesSection => 'ডেটা উৎস ও কৃতিত্ব';

  @override
  String get creditMojangTitle => 'Mojang / Microsoft';

  @override
  String get creditMojangSubtitle =>
      'Java খেলোয়াড়দের স্কিন, UUID ও প্রোফাইল ডেটা অফিসিয়াল Mojang API থেকে।';

  @override
  String get creditGeyserTitle => 'GeyserMC';

  @override
  String get creditGeyserSubtitle =>
      'Bedrock স্কিন রেন্ডারিং। Bedrock খেলোয়াড়দের স্কিন GeyserMC স্কিন সার্ভার থেকে আনা হয়।';

  @override
  String get creditXboxTitle => 'Xbox / Microsoft';

  @override
  String get creditXboxSubtitle =>
      'Xbox Live-এর মাধ্যমে Bedrock অ্যাকাউন্ট লিঙ্কিং। Gamertag ও XUID Microsoft অথেন্টিকেশন প্রক্রিয়ার মাধ্যমে সংগ্রহ করা হয়।';

  @override
  String get aboutMCCompanionSection => 'MCCompanion সম্পর্কে';

  @override
  String get aboutMCCompanionDisclaimer =>
      'MCCompanion একটি স্বাধীন অ্যাপ এবং Mojang Studios বা Microsoft Corporation-এর সাথে যুক্ত নয়, তাদের দ্বারা অনুমোদিত বা পৃষ্ঠপোষকতাপ্রাপ্তও নয়।';

  @override
  String get minecraftTrademark =>
      '\"Minecraft\" Microsoft Corporation-এর ট্রেডমার্ক।';

  @override
  String get nldServerLabelShort => 'MCCompanion Server';

  @override
  String get editServer => 'সার্ভার সম্পাদনা করুন';

  @override
  String get serverNameExampleHint => 'আমার দারুণ সার্ভার';

  @override
  String get serverAddressExampleHint => 'play.example.com';

  @override
  String get serverDescriptionExampleHint => 'বন্ধুদের সাথে সারভাইভাল সার্ভার';

  @override
  String get editionLabel => 'সংস্করণ';

  @override
  String get nameLabel => 'Name';

  @override
  String get ipAddressFieldLabel => 'আইপি ঠিকানা';

  @override
  String get portFieldLabel => 'Port';

  @override
  String get platformFieldLabel => 'প্ল্যাটফর্ম';

  @override
  String get nameValidationError => 'নাম ১ থেকে ৫০ অক্ষরের হতে হবে';

  @override
  String get ipRequiredError => 'আইপি ঠিকানা আবশ্যক';

  @override
  String get portRangeError => 'পোর্ট ১ থেকে ৬৫৫৩৫-এর মধ্যে হতে হবে';

  @override
  String get xboxLinkTitle => 'Xbox অ্যাকাউন্ট লিঙ্ক করুন';

  @override
  String get xboxStartingLogin => 'Xbox লগইন শুরু হচ্ছে…';

  @override
  String get xboxSignInWithMicrosoft => 'Microsoft দিয়ে সাইন ইন করুন';

  @override
  String get xboxGoToLink =>
      'নিচের লিঙ্কে গিয়ে কোড লিখে আপনার Xbox অ্যাকাউন্ট সংযুক্ত করুন।';

  @override
  String get xboxYourCode => 'আপনার কোড';

  @override
  String get xboxTapToCopy => 'কপি করতে কোডে ট্যাপ করুন';

  @override
  String get xboxOpenLink => 'microsoft.com/link খুলুন';

  @override
  String get xboxWaitingForLogin => 'লগইনের অপেক্ষায়…';

  @override
  String get xboxAccountLinked => 'Xbox অ্যাকাউন্ট লিঙ্ক হয়েছে!';

  @override
  String get xboxCodeCopied => 'কোড ক্লিপবোর্ডে কপি হয়েছে';

  @override
  String get xboxCouldNotStart =>
      'Xbox লগইন শুরু করা যায়নি। আবার চেষ্টা করুন।';

  @override
  String get xboxCodeExpired => 'কোডের মেয়াদ শেষ হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get xboxSomethingWrong => 'কিছু ভুল হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get tryAgain => 'আবার চেষ্টা করুন';

  @override
  String get userNotFound => 'ব্যবহারকারী পাওয়া যায়নি';

  @override
  String get profileSectionLabel => 'প্রোফাইল';

  @override
  String get displayNameRowLabel => 'প্রদর্শন নাম';

  @override
  String get usernameRowLabel => 'ইউজারনেম';

  @override
  String get lastSeenLabel => 'সর্বশেষ দেখা গেছে';

  @override
  String get aboutSectionLabel => 'পরিচিতি';

  @override
  String get xboxBedrockLabel => 'Xbox / Bedrock';

  @override
  String get friendRequestSent => 'বন্ধুত্বের অনুরোধ পাঠানো হয়েছে';

  @override
  String get alreadyFriendsMsg => 'আপনারা আগে থেকেই বন্ধু।';

  @override
  String get requestAlreadyPendingMsg => 'একটি অনুরোধ আগে থেকেই অপেক্ষমাণ।';

  @override
  String get userNotFoundMsg2 => 'ব্যবহারকারী পাওয়া যায়নি।';

  @override
  String get cannotSendRequestMsg => 'এই ব্যবহারকারীকে অনুরোধ পাঠানো যাবে না।';

  @override
  String nowFriendsWith(Object username) {
    return 'এখন @$username-এর বন্ধু';
  }

  @override
  String get removeFriendButton => 'বন্ধু সরান';

  @override
  String get requestSentButton => 'অনুরোধ পাঠানো হয়েছে';

  @override
  String get acceptRequestButton => 'অনুরোধ গ্রহণ করুন';

  @override
  String get addFriendButton => 'বন্ধু যোগ করুন';

  @override
  String get removeFriendDialogTitle => 'বন্ধু সরান';

  @override
  String removeFriendDialogBody(Object username) {
    return '@$username-কে বন্ধু তালিকা থেকে সরাবেন?';
  }

  @override
  String get trackerLimitReached => 'সার্ভার সীমা পূর্ণ';

  @override
  String get upgradeButton => 'আপগ্রেড';

  @override
  String get javaLinkTitle => 'Java Edition লিঙ্ক করুন';

  @override
  String get javaStartingLogin => 'Microsoft লগইন শুরু হচ্ছে…';

  @override
  String get javaSignInWithMicrosoft => 'Microsoft দিয়ে সাইন ইন করুন';

  @override
  String get javaGoToLink =>
      'নিচের লিঙ্কে গিয়ে কোড লিখে আপনার Minecraft Java Edition অ্যাকাউন্ট সংযুক্ত করুন।';

  @override
  String get javaYourCode => 'আপনার কোড';

  @override
  String get javaTapToCopy => 'কপি করতে কোডে ট্যাপ করুন';

  @override
  String get javaOpenLink => 'microsoft.com/link খুলুন';

  @override
  String get javaWaitingForLogin => 'লগইনের অপেক্ষায়…';

  @override
  String get javaAccountLinked => 'Java Edition লিঙ্ক হয়েছে!';

  @override
  String get javaNoJavaTitle => 'Java Edition পাওয়া যায়নি';

  @override
  String get javaNoJavaBody =>
      'যে Microsoft অ্যাকাউন্টে সাইন ইন করেছেন সেটিতে Minecraft Java Edition নেই।';

  @override
  String get javaTryDifferentAccount => 'অন্য অ্যাকাউন্ট চেষ্টা করুন';

  @override
  String get javaCouldNotStart =>
      'Microsoft লগইন শুরু করা যায়নি। আবার চেষ্টা করুন।';

  @override
  String get javaCodeExpired => 'কোডের মেয়াদ শেষ হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get javaSomethingWrong => 'কিছু ভুল হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get javaCodeCopied => 'কোড ক্লিপবোর্ডে কপি হয়েছে';

  @override
  String get featureLabelConnector => 'কানেক্টর';

  @override
  String get featureLabelSkins => 'স্কিনস';

  @override
  String get featureLabelPartners => 'সার্ভার তালিকা';

  @override
  String get featureLabelLookup => 'খোঁজা';

  @override
  String get featureLabelTracker => 'সার্ভার ট্র্যাকার';

  @override
  String get userSearchHint => 'ব্যবহারকারীর নাম, গেমারট্যাগ বা Java নাম…';

  @override
  String get userSearchSub =>
      'ব্যবহারকারীর নাম, Xbox গেমারট্যাগ বা Java নাম দিয়ে খুঁজুন';

  @override
  String get upgradeWindowsHint => 'মাইক্রোসফট স্টোরে আপগ্রেড পাওয়া যাচ্ছে';

  @override
  String get accountActions => 'অ্যাকাউন্ট';

  @override
  String get feedbackBugReport => 'বাগ রিপোর্ট';

  @override
  String get feedbackFeatureRequest => 'ফিচার অনুরোধ';

  @override
  String get feedbackTitleLabel => 'শিরোনাম';

  @override
  String get feedbackTitleHintBug =>
      'উদা. স্কিন এডিটর খুলতে গেলে অ্যাপ ক্র্যাশ করে';

  @override
  String get feedbackTitleHintFeature =>
      'উদা. সার্ভার তালিকায় প্লেয়ারের পিং দেখান';

  @override
  String get feedbackWhatHappened => 'কী হয়েছিল?';

  @override
  String get feedbackDescribeIdea => 'আপনার ধারণা বর্ণনা করুন';

  @override
  String get feedbackDescHintBug =>
      'বাগটি বর্ণনা করুন: আপনি কী করেছিলেন, কী আশা করেছিলেন এবং পরিবর্তে কী হয়েছিল?';

  @override
  String get feedbackDescHintFeature =>
      'আপনি কী চান এবং কেন এটি উপকারী হবে তা ব্যাখ্যা করুন।';

  @override
  String get feedbackSubmitBug => 'বাগ রিপোর্ট জমা দিন';

  @override
  String get feedbackSubmitFeature => 'ফিচার অনুরোধ জমা দিন';

  @override
  String get feedbackDisclaimer =>
      'আমাদের টিমের কাছে যায় · পাসওয়ার্ড দেবেন না';

  @override
  String get feedbackSuccessTitle => 'ফিডব্যাকের জন্য ধন্যবাদ!';

  @override
  String get feedbackSuccessBody =>
      'ধন্যবাদ! আপনার রিপোর্ট পেয়েছি। আমরা অ্যাপেই উত্তর দিই, তাই উত্তর দেখতে এখানে ফিরে আসুন।';

  @override
  String get feedbackSubmitAnother => 'আরেকটি জমা দিন';

  @override
  String get feedbackBackToApp => 'অ্যাপে ফিরে যান';

  @override
  String get feedbackTitleTooShort => 'শিরোনাম কমপক্ষে ৫ অক্ষরের হতে হবে।';

  @override
  String get feedbackDescTooShort => 'বিবরণ কমপক্ষে ১০ অক্ষরের হতে হবে।';

  @override
  String get feedbackSubmitFailed =>
      'জমা দেওয়া ব্যর্থ হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get feedbackTileTitle => 'মতামত';

  @override
  String get feedbackTileSubtitle =>
      'MCCompanion উন্নত করতে আমাদের সাহায্য করুন';

  @override
  String get friendsHowToStep1 => 'আপনার ফোন বা কনসোলে Xbox অ্যাপ খুলুন।';

  @override
  String get friendsHowToStep2 =>
      'নিচের যেকোনো একটি বট Xbox-এ বন্ধু হিসেবে যোগ করুন।';

  @override
  String get friendsHowToStep3 => 'Minecraft খুলুন এবং Friends ট্যাবে যান।';

  @override
  String get friendsHowToStep4 =>
      'LAN Worlds-এ আপনার সার্ভার খুঁজুন এবং যোগ দিন।';

  @override
  String get friendsHowToNote =>
      '⚠️ প্রতিবার খেলতে চাইলে প্রথমে MCCompanion অ্যাপে Friends mode চালু করুন। চালু করার পরে অ্যাপ বন্ধ করা যাবে।';

  @override
  String get friendsBotLoadError =>
      '⚠️ বট তালিকা লোড করা যায়নি। পরে আবার চেষ্টা করুন।';

  @override
  String get regionEurope => 'ইউরোপ';

  @override
  String get regionUnitedStates => 'যুক্তরাষ্ট্র';

  @override
  String get yourRegion => 'আপনার অঞ্চল';

  @override
  String get botStatusOffline => 'অফলাইন';

  @override
  String get botStatusFull => 'পূর্ণ';

  @override
  String botFriendCount(Object current, Object max) {
    return '$current / $max বন্ধু';
  }

  @override
  String botCopied(Object gamertag) {
    return '$gamertag কপি করা হয়েছে';
  }

  @override
  String get copyLabel => 'কপি করুন';

  @override
  String get skinSavedToDocuments => 'স্কিন ডকুমেন্টসে সংরক্ষিত হয়েছে';

  @override
  String get skinMenuExport => 'এক্সপোর্ট';

  @override
  String get skinMenuDelete => 'মুছুন';

  @override
  String get rpScreenTitle => 'রিসোর্স প্যাক';

  @override
  String get rpWhatWorks => 'যা কাজ করে';

  @override
  String get rpSupportedBedrockOnly =>
      'শুধুমাত্র Bedrock Edition (.mcpack বা .zip)';

  @override
  String get rpSupportedBedrockOnlyHint => 'Java প্যাকগুলো কনসোলে কাজ করে না।';

  @override
  String get rpSupportedTexture => 'রিসোর্স প্যাক ও টেক্সচার প্যাক';

  @override
  String get rpSupportedTextureHint =>
      'এগুলো আনুষ্ঠানিকভাবে সমর্থিত এবং নির্ভরযোগ্যভাবে কাজ করে।';

  @override
  String get rpUnsupportedShaders => 'শেডার, বিহেভিয়ার প্যাক, স্কিন প্যাক';

  @override
  String get rpUnsupportedShadersHint =>
      'এগুলো MCCompanion-এর মাধ্যমে কনসোলে লোড হবে না।';

  @override
  String get rpUnsupportedAddons => 'অ্যাড-অন ও UI মড';

  @override
  String get rpUnsupportedAddonsHint =>
      'কখনো কখনো কাজ করতে পারে, তবে আনুষ্ঠানিকভাবে সমর্থিত নয়। নিজের ঝুঁকিতে ব্যবহার করুন।';

  @override
  String get rpNoDiscord =>
      'Discord লিঙ্ক: .mcpack এক্সটেনশন নেই এবং কয়েক ঘণ্টায় মেয়াদ শেষ';

  @override
  String get rpNoDrive =>
      'Google Drive / Dropbox শেয়ার লিঙ্ক: সরাসরি ডাউনলোড নয়';

  @override
  String get rpNoEncrypted =>
      'এনক্রিপ্টেড বা পাসওয়ার্ড-সুরক্ষিত প্যাক সহ সার্ভার';

  @override
  String get rpConsolePerformanceTitle => 'কনসোল পারফরম্যান্স';

  @override
  String get rpConsolePerformanceBody =>
      'উচ্চ-রেজোলিউশন টেক্সচার প্যাক কনসোলে ল্যাগ বা ক্র্যাশ ঘটাতে পারে। সমস্যা হলে কম রেজোলিউশনের প্যাকে স্যুইচ করুন বা প্যাক সমর্থন করলে হালকা সাবপ্যাক বেছে নিন।';

  @override
  String get rpToastSaved => 'রিসোর্স প্যাক সেটিংস সংরক্ষিত।';

  @override
  String get rpInvalidPackFormat =>
      'এটি একটি Java Edition প্যাক এবং সমর্থিত নয়। অনুগ্রহ করে Bedrock Edition রিসোর্স প্যাক ব্যবহার করুন।';

  @override
  String get rpBehaviorContentWarning =>
      'এই প্যাকে বিহেভিয়ার প্যাক ডেটা আছে, যা সার্ভারে কাজ করবে না। টেক্সচারগুলো অবশ্য কাজ করবে।';

  @override
  String get rpClearMinecraftTitle => 'প্রথমবার এই প্যাক দিয়ে?';

  @override
  String get rpClearStep1 =>
      'কনসোলে Minecraft খুলুন ও Settings → Storage-এ যান';

  @override
  String get rpClearStep2 =>
      'Resource Packs-এর পাশে \'Clear\' বা \'Reset\' চাপুন, এটি সব লোকাললি ক্যাশড প্যাক সরিয়ে দেবে';

  @override
  String get rpClearStep3 =>
      'MCCompanion-এর মাধ্যমে আবার সংযুক্ত হন: মার্জ করা প্যাক স্বয়ংক্রিয়ভাবে ডাউনলোড হবে';

  @override
  String get rpRelayTitle => 'প্যাক ঠিকমতো দেখাচ্ছে না?';

  @override
  String get rpRelayBody =>
      'রিলে আপনার overlay URL কে key হিসেবে ব্যবহার করে merged pack ১ ঘন্টা ক্যাশ করে। নতুন merge করতে: pack URL একটু বদলান (যেমন ?v=2 যোগ করুন) এবং সেভ করুন। এরপর Minecraft-এর pack cache-ও পরিষ্কার করুন, merged pack এখনও server-এর UUID ব্যবহার করে, তাই না করলে Minecraft পুরনো cached version দেখাবে।';

  @override
  String get rpNoDiscordHint =>
      'Discord CDN লিঙ্ক অল্প সময়ের মধ্যে মেয়াদ শেষ হয়';

  @override
  String get rpNoDriveHint => 'সরাসরি ডাউনলোড নেই: প্রিভিউ পেজে রিডাইরেক্ট করে';

  @override
  String get rpNoEncryptedHint =>
      'MCCompanion এন্ক্রিপ্টেড প্যাক মার্জ করতে পারে না';

  @override
  String get rpClearWhy =>
      'Minecraft রিসোর্স প্যাক তাদের UUID দিয়ে ক্যাশ করে। মার্জ করা প্যাক সার্ভারের আসল UUID ধরে রাখে, যদি Minecraft আগের কোনো সেশনে (MCCompanion চালু হওয়ার আগে) সার্ভারের প্যাক ক্যাশ করে রাখে, তাহলে নতুন মার্জ করা ভার্সন ডাউনলোড করবে না। ক্যাশ পরিষ্কার করুন যাতে Minecraft তাজা মার্জ করা প্যাক লোড করে।';

  @override
  String get rpUploadTab => 'আপলোড';

  @override
  String get rpBrowseTab => 'ব্রাউজ';

  @override
  String get rpCategoryRealism => 'বাস্তবসম্মত';

  @override
  String get rpCategoryFaithful => 'Faithful';

  @override
  String get rpCategoryPvp => 'PvP';

  @override
  String get rpCategoryCartoon => 'কার্টুন';

  @override
  String get rpCategoryDark => 'ডার্ক';

  @override
  String get rpCategoryMedieval => 'মধ্যযুগীয়';

  @override
  String get rpCategoryNature => 'প্রকৃতি';

  @override
  String get rpCategoryThemed => 'থিমভিত্তিক';

  @override
  String get rpCategoryOther => 'অন্যান্য';

  @override
  String get rpUploadButton => 'আপনার প্যাক বাছাই করতে ট্যাপ করুন';

  @override
  String get rpUploadHint => '.mcpack বা .zip • সর্বোচ্চ ১০০ MB';

  @override
  String get rpUploading => 'আপলোড হচ্ছে...';

  @override
  String get rpMergerTitle => 'RP মার্জার';

  @override
  String get rpMergerPriorityHint =>
      'শীর্ষ প্যাকের সর্বোচ্চ অগ্রাধিকার: তার ফাইলগুলো দ্বন্দ্বে জেতে।';

  @override
  String get rpMergerTopBadge => 'শীর্ষ';

  @override
  String get rpMergerAddPacks => 'রিসোর্স প্যাক যোগ করুন';

  @override
  String rpMergerAddAnother(int current) {
    return 'আরেকটি প্যাক যোগ করুন ($current/4)';
  }

  @override
  String get rpMergerFileTypes => '.zip বা .mcpack';

  @override
  String get rpMergerMerging => 'একত্রিত হচ্ছে…';

  @override
  String rpMergerButton(int count) {
    return '$countটি প্যাক একত্রিত করুন';
  }

  @override
  String get rpMergerSetActiveToast =>
      'সক্রিয় রিসোর্স প্যাক হিসেবে সেট করা হয়েছে';

  @override
  String get rpDisabled => 'নিষ্ক্রিয়';

  @override
  String get rpNoPackSelected => 'কোনো রিসোর্স প্যাক নির্বাচিত নয়';

  @override
  String get rpActiveOnConnect => 'সক্রিয়: সংযোগের সময় প্রয়োগ হয়';

  @override
  String get rpBrowseSubtitle => 'কিউরেটেড প্যাক, ব্যবহারের জন্য প্রস্তুত';

  @override
  String get rpBrowseEmpty => 'এখনো কোনো প্যাক উপলব্ধ নেই';

  @override
  String get rpBrowseEmptyHint => 'কিউরেটেড প্যাকের জন্য পরে আবার দেখুন।';

  @override
  String get rpReplaceFile => 'অন্য ফাইল দিয়ে প্রতিস্থাপন করুন';

  @override
  String get rpDropToUpload => 'আপলোড করতে ছেড়ে দিন';

  @override
  String get rpTabBrowseInfo =>
      'MCCompanion দ্বারা নির্বাচিত প্যাক ব্রাউজ করুন। তাৎক্ষণিকভাবে একটি প্যাক সক্রিয় করতে ব্যবহার করুন ট্যাপ করুন, কোনো আপলোড বা লিঙ্কের প্রয়োজন নেই।';

  @override
  String get rpTabUploadInfo =>
      'আপনার নিজস্ব .mcpack বা .zip ফাইল আপলোড করুন। MCCompanion এটি ক্লাউডে নিরাপদে সংরক্ষণ করে এবং প্রতিবার সংযোগের সময় আপনার কনসোলে পাঠায়।';

  @override
  String get rpTabMergeInfo =>
      '2 থেকে 4টি প্যাক একটিতে একত্রিত করুন। একত্রিত প্যাক MCCompanion Cloud-এ আপলোড হয় এবং স্বয়ংক্রিয়ভাবে সক্রিয় হয়।';

  @override
  String get shareLabel => 'শেয়ার করুন';

  @override
  String get sectionMinecraftAccounts => 'Minecraft অ্যাকাউন্ট';

  @override
  String get sectionSettings => 'সেটিংস';

  @override
  String get avatarUpdated => 'অবতার আপডেট হয়েছে';

  @override
  String get uploadFailed => 'আপলোড ব্যর্থ হয়েছে';

  @override
  String get profileLinkCopied => 'প্রোফাইল লিংক কপি হয়েছে!';

  @override
  String get shareProfileTooltip => 'প্রোফাইল শেয়ার করুন';

  @override
  String get profileFallbackTitle => 'প্রোফাইল';

  @override
  String get noUsersFound => 'কোনো ব্যবহারকারী পাওয়া যায়নি';

  @override
  String get skinLabel => 'স্কিন';

  @override
  String get skinsLabel => 'স্কিনস';

  @override
  String get javaEditionBadge => 'Java';

  @override
  String get bedrockEditionBadge => 'Bedrock';

  @override
  String get downloadLabel => 'ডাউনলোড';

  @override
  String get justNow => 'এইমাত্র';

  @override
  String minutesAgo(int count) {
    return '$countমি আগে';
  }

  @override
  String hoursAgo(int count) {
    return '$countঘ আগে';
  }

  @override
  String daysAgo(int count) {
    return '$countদি আগে';
  }

  @override
  String get rpPackInfo => 'তথ্য';

  @override
  String get rpUseThisPack => 'এই প্যাক ব্যবহার করুন';

  @override
  String get rpViewOnWebsite => 'ওয়েবসাইটে দেখুন →';

  @override
  String rpDownloads(int count) {
    return '$count ডাউনলোড';
  }

  @override
  String get skinsSavedToMySkins => 'আমার স্কিনে সংরক্ষিত হয়েছে';

  @override
  String get skinsEmptyLocalSkins => 'এখনও কোনো সংরক্ষিত স্কিন নেই।';

  @override
  String get sectionRecentActivity => 'সাম্প্রতিক কার্যক্রম';

  @override
  String get activityNoEvents => 'এখনো কোনো সাম্প্রতিক কার্যক্রম নেই।';

  @override
  String get activitySkinUploaded => 'স্কিন আপলোড করা হয়েছে';

  @override
  String get activitySkinLiked => 'স্কিন পছন্দ করা হয়েছে';

  @override
  String get activityPackSubmitted => 'প্যাক জমা দেওয়া হয়েছে';

  @override
  String get activityPackApproved => 'প্যাক অনুমোদিত';

  @override
  String get activityPackRejected => 'প্যাক অনুমোদিত হয়নি';

  @override
  String get timeJustNow => 'এইমাত্র';

  @override
  String timeMinutesAgo(int count) {
    return '$count মিনিট আগে';
  }

  @override
  String timeHoursAgo(int count) {
    return '$count ঘণ্টা আগে';
  }

  @override
  String timeDaysAgo(int count) {
    return '$count দিন আগে';
  }

  @override
  String timeMonthsAgo(int count) {
    return '$count মাস আগে';
  }

  @override
  String get sectionNotifications => 'বিজ্ঞপ্তি';

  @override
  String get sectionNotificationTypes => 'বিজ্ঞপ্তির ধরন';

  @override
  String get notifMarkAllRead => 'সব পঠিত হিসেবে চিহ্নিত করুন';

  @override
  String get notifEmpty =>
      'এখনো কোনো বিজ্ঞপ্তি নেই। লাইক, মন্তব্য ও বন্ধুর কার্যক্রম এখানে দেখা যাবে।';

  @override
  String get notifSomeone => 'কেউ';

  @override
  String notifSkinLiked(String actor) {
    return '$actor আপনার স্কিন পছন্দ করেছে';
  }

  @override
  String notifCommentReceived(String actor) {
    return '$actor আপনার স্কিনে মন্তব্য করেছে';
  }

  @override
  String get notifPackApproved => 'প্যাক অনুমোদিত';

  @override
  String get notifPackRejected => 'প্যাক অনুমোদিত হয়নি';

  @override
  String notifFriendRequest(String actor) {
    return '$actor আপনাকে বন্ধুত্বের অনুরোধ পাঠিয়েছে';
  }

  @override
  String notifFriendAccepted(String actor) {
    return '$actor আপনার অনুরোধ গ্রহণ করেছে';
  }

  @override
  String notifMessageReceived(String actor) {
    return '$actor এর কাছ থেকে নতুন বার্তা';
  }

  @override
  String get notifPrefCommentReceived => 'মন্তব্য প্রাপ্ত';

  @override
  String get notifPrefPackApproved => 'প্যাক অনুমোদিত';

  @override
  String get notifPrefPackRejected => 'প্যাক প্রত্যাখ্যাত';

  @override
  String get notifPrefFriendRequest => 'বন্ধুত্বের অনুরোধ';

  @override
  String get notifPrefFriendAccepted => 'বন্ধু যোগ করা হয়েছে';

  @override
  String get notifPrefMessageReceived => 'নতুন বার্তা';

  @override
  String get feedbackLoginRequiredTitle => 'মতামত পাঠাতে লগ ইন করুন';

  @override
  String get feedbackLoginRequiredBody =>
      'মতামত আপনার MCCompanion অ্যাকাউন্টের সাথে যুক্ত, যাতে আমরা অ্যাপের মধ্যেই সরাসরি আপনাকে উত্তর দিতে পারি।';

  @override
  String get feedbackLoginButton => 'লগ ইন';

  @override
  String get supportInboxTitle => 'সাপোর্ট ইনবক্স';

  @override
  String get customColour => 'নিজের রঙ';

  @override
  String get featuredServerLabel => 'ফিচার্ড সার্ভার';

  @override
  String get featuredServerTagline => 'যোগ দিন আর খেলা শুরু করুন।';

  @override
  String get featuredServerPlay => 'খেলুন';

  @override
  String rpUploadFailedCode(int code) {
    return 'আপলোড ব্যর্থ ($code)';
  }

  @override
  String rpUploadFailed(String error) {
    return 'আপলোড ব্যর্থ: $error';
  }

  @override
  String get rpLoadFailed => 'প্যাক লোড করা যায়নি';

  @override
  String get rpRetry => 'আবার চেষ্টা করুন';

  @override
  String get rpSearchHint => 'প্যাক খুঁজুন…';

  @override
  String rpMergeFailed(String error) {
    return 'মার্জ ব্যর্থ: $error';
  }

  @override
  String get rpMergerSize => 'আকার';

  @override
  String get rpMergerCreated => 'তৈরি';

  @override
  String get rpMergerSourcePacks => 'সোর্স প্যাক';

  @override
  String get rpMergerDropToAdd => 'যোগ করতে ছাড়ুন';

  @override
  String get rpMergerSavedMerges => 'সেভ করা মার্জ';

  @override
  String get rpMergerUse => 'ব্যবহার করুন';

  @override
  String get supportInboxShared => 'সব অ্যাডমিনের সঙ্গে শেয়ার করা';

  @override
  String get supportInboxEmpty => 'এখনও কোনও সাপোর্ট চ্যাট নেই';

  @override
  String get supportReplyingAs =>
      'আপনি MCCompanion Support হিসেবে উত্তর দিচ্ছেন';

  @override
  String get relayBlocked =>
      'আপনার IP বা অ্যাকাউন্ট MCCompanion ব্লক করেছে। ভুল হয়েছে মনে হলে আমাদের Discord-এ আসুন।';

  @override
  String relayBlockedWithReason(String reason) {
    return 'আপনার IP বা অ্যাকাউন্ট MCCompanion ব্লক করেছে।\nকারণ: $reason\nভুল হয়েছে মনে হলে আমাদের Discord-এ আসুন।';
  }

  @override
  String relayConfigFailed(int code) {
    return 'রিলে সেট করা যায়নি (স্ট্যাটাস $code)। অন্য রিলে চেষ্টা করুন বা আমাদের Discord-এ আসুন।';
  }

  @override
  String relayConfigFailedDetail(int code, String detail) {
    return 'রিলে সেট করা যায়নি (স্ট্যাটাস $code): $detail। অন্য রিলে চেষ্টা করুন বা আমাদের Discord-এ আসুন।';
  }

  @override
  String get relayTimeout => 'রিলে সময়মতো সাড়া দেয়নি।';

  @override
  String get relayUnreachable => 'রিলেতে পৌঁছানো যায়নি।';

  @override
  String get lookupNotFound => 'খেলোয়াড় পাওয়া যায়নি।';

  @override
  String get lookupNetworkError => 'নেটওয়ার্ক সমস্যা। আবার চেষ্টা করুন।';

  @override
  String get lookupBedrockUnavailable => 'Bedrock লুকআপ এখন পাওয়া যাচ্ছে না।';

  @override
  String get lookupFailed => 'খোঁজা ব্যর্থ।';

  @override
  String get myFeedbackTitle => 'আমার মতামত';

  @override
  String get myFeedbackEmpty => 'আপনি এখনও কিছু পাঠাননি।';

  @override
  String get myFeedbackOpenList => 'আমার মতামত';

  @override
  String get fbStatusOpen => 'খোলা';

  @override
  String get fbStatusPlanned => 'পরিকল্পিত';

  @override
  String get fbStatusInProgress => 'কাজ চলছে';

  @override
  String get fbStatusImplemented => 'সম্পন্ন';

  @override
  String get fbStatusNotPlanned => 'পরিকল্পনা নেই';

  @override
  String get fbStatusDuplicate => 'ডুপ্লিকেট';

  @override
  String get fbNoReplies => 'এখনও উত্তর নেই। আমরা এখানেই জানাব।';

  @override
  String get fbReplyHint => 'এই রিপোর্টে কিছু যোগ করুন…';

  @override
  String get fbFromTeam => 'MCCompanion';

  @override
  String get fbFromYou => 'আপনি';

  @override
  String get feedbackGoesToTeam => 'সরাসরি টিমের কাছে যায়';

  @override
  String get notifFeedbackStatus => 'আপনার মতামতে আপডেট';

  @override
  String get notifFeedbackReply => 'আপনার মতামতের উত্তর';

  @override
  String get adminTicketsHeader => 'রিপোর্ট ও অনুরোধ';

  @override
  String get adminTicketReplyHint => 'এই টিকিট নিয়ে উত্তর দিন…';

  @override
  String get chooseServerTitle => 'একটি সার্ভার বেছে নিন';

  @override
  String get changeLabel => 'পরিবর্তন';

  @override
  String get howToAutoShow => 'শুরু করার সময় এটি দেখান';

  @override
  String get shareServerLabel => 'আপনার সার্ভার শেয়ার করুন';

  @override
  String get shareServerOn => 'বন্ধুরা দেখতে পাবে আপনি কোন সার্ভারে আছেন';

  @override
  String get shareServerOff => 'বন্ধুরা দেখবে আপনি খেলছেন, কোথায় নয়';

  @override
  String directHostNotFound(String host) {
    return '$host পাওয়া যায়নি। ঠিকানা যাচাই করে আবার চেষ্টা করুন।';
  }

  @override
  String get directPortBusy =>
      'লোকাল পোর্ট খোলা যায়নি। আগে বর্তমান সংযোগ বন্ধ করুন।';

  @override
  String get waitingForConsole => 'আপনার কনসোলের জন্য অপেক্ষা করা হচ্ছে…';

  @override
  String get consoleFound => 'কনসোল পাওয়া গেছে';

  @override
  String get consoleLanHint =>
      'আপনার কনসোলে Minecraft খুলুন এবং বন্ধুরা অংশে একটি LAN গেম খুঁজুন।';

  @override
  String get consoleConnecting => 'Connecting your console…';

  @override
  String get consoleHandedOver => 'Joining through the relay';

  @override
  String get consoleHandedOverHint =>
      'Your console should switch to your server in a few seconds. Nothing happening? Try joining again.';

  @override
  String get consoleConnectFailed => 'Could not reach the relay';

  @override
  String get consoleConnectFailedHint =>
      'Check your connection, then try joining again.';

  @override
  String get localNetworkBlocked =>
      'MCCompanion আপনার লোকাল নেটওয়ার্কে পৌঁছাতে পারছে না। আপনার ডিভাইসের সেটিংসে MCCompanion-এর জন্য লোকাল নেটওয়ার্ক চালু করুন এবং নিশ্চিত করুন যে আপনি Wi-Fi-তে আছেন।';

  @override
  String directAddressNotSupported(String host) {
    return '$host একটি IPv6 ঠিকানা। প্রক্সি/সরাসরি মোড শুধু IPv4 সমর্থন করে। IPv4 ঠিকানা বা হোস্টনাম ব্যবহার করুন।';
  }

  @override
  String termsAgreement(String terms, String privacy) {
    return 'আমি $terms এবং $privacy মেনে নিচ্ছি।';
  }

  @override
  String get verifyEmailTitle => 'আপনার ইমেল যাচাই করুন';

  @override
  String get verifyEmailBody =>
      'মন্তব্য করা, স্কিন আপলোড বা প্যাক জমা দেওয়ার আগে প্রয়োজন।';

  @override
  String get verifyEmailSent => 'পাঠানো হয়েছে, ইনবক্স দেখুন।';

  @override
  String get verifyEmailSending => 'পাঠানো হচ্ছে…';

  @override
  String get verifyEmailSend => 'লিংক পাঠান';

  @override
  String updateAvailableTitle(Object version) {
    return 'সংস্করণ $version এসেছে';
  }

  @override
  String updateAvailableBody(Object current) {
    return 'আপনি $current চালাচ্ছেন। এই বিল্ড নিজে থেকে আপডেট হয় না।';
  }

  @override
  String get updateAvailableAction => 'ডাউনলোড';

  @override
  String get updateAvailableDismiss => 'এখন নয়';

  @override
  String get serverListSearchHint => 'নাম বা ঠিকানা দিয়ে খুঁজুন';

  @override
  String get serverListEditionAny => 'Java এবং Bedrock';

  @override
  String get serverListEditionJava => 'শুধু Java';

  @override
  String get serverListEditionBedrock => 'শুধু Bedrock';

  @override
  String get serverListSortVotes => 'সর্বাধিক ভোট';

  @override
  String get serverListSortPlayers => 'সর্বাধিক খেলোয়াড়';

  @override
  String get serverListSortPeak => 'সর্বোচ্চ শীর্ষ';

  @override
  String get serverListSortNewest => 'নতুনতম';

  @override
  String get serverListSortName => 'নাম';

  @override
  String get serverListAllCategories => 'সব';

  @override
  String get serverListPlayersAny => 'যেকোনো আকার';

  @override
  String get serverListPlayersHint => 'গড় অনলাইন খেলোয়াড়';

  @override
  String get serverListLoadFailed => 'সার্ভার তালিকা লোড করা যায়নি';

  @override
  String get serverListLoadFailedHint => 'আবার চেষ্টা করতে নিচে টানুন';

  @override
  String get serverListNoMatch => 'কোনো সার্ভার মেলেনি';

  @override
  String get serverListNoMatchHint => 'অন্য কিছু খুঁজুন বা অন্য বিভাগ দেখুন';

  @override
  String get serverCardPlay => 'খেলুন';

  @override
  String get serverCardVote => 'ভোট দিন';

  @override
  String get serverCopyIp => 'IP কপি করুন';

  @override
  String get serverCopied => 'কপি হয়েছে';

  @override
  String get serverStatPlayers => 'খেলোয়াড়';

  @override
  String get serverStatPeak => 'শীর্ষ';

  @override
  String get serverStatUptime => 'আপটাইম';

  @override
  String get serverStatVotesMonth => 'এই মাসের ভোট';

  @override
  String get serverBadgeFeatured => 'বিশেষ';

  @override
  String get serverEditionJava => 'Java';

  @override
  String get serverEditionBedrock => 'Bedrock';

  @override
  String get serverEditionCrossplay => 'ক্রসপ্লে';

  @override
  String get serverSectionMotd => 'আজকের বার্তা';

  @override
  String get serverLinkDiscord => 'Discord';

  @override
  String get serverLinkWebsite => 'ওয়েবসাইট';

  @override
  String get serverVotesThisMonth => 'এই মাসে';

  @override
  String get serverVotesAllTime => 'সর্বকালের';

  @override
  String get serverVoteSignInRequired => 'অ্যাপ থেকে ভোট দিতে সাইন ইন করুন।';

  @override
  String serverVoteSheetTitle(String name) {
    return '$name-কে ভোট দিন';
  }

  @override
  String get serverVoteSheetSubtitle =>
      'আপনার Minecraft নাম, যাতে সার্ভার জানে কাকে পুরস্কার দিতে হবে।';

  @override
  String get serverVoteSheetHint => 'Steve';

  @override
  String get serverVoteSheetButton => 'ভোট দিন';

  @override
  String get serverVoteSheetLimit => 'প্রতিটি সার্ভারে দিনে একটি ভোট।';

  @override
  String get serverVoteDelivered => 'ভোট হয়েছে। আপনার পুরস্কার আসছে।';

  @override
  String get serverVoteNoRewards =>
      'ভোট হয়েছে। এই সার্ভারে কোনো পুরস্কার সেট করা নেই।';

  @override
  String get serverVoteFailed => 'কাজ হয়নি, আবার চেষ্টা করুন।';

  @override
  String get serverVoteOffline =>
      'সার্ভারে পৌঁছানো যায়নি। আপনার সংযোগ পরীক্ষা করুন।';

  @override
  String get feedbackViewYourReport => 'আপনার রিপোর্ট দেখুন';

  @override
  String get showMore => 'আরও';

  @override
  String get showLess => 'কম';

  @override
  String get lookupRecent => 'সাম্প্রতিক';

  @override
  String get skinsRemovalNotice =>
      'পরবর্তী আপডেটে স্কিন সরিয়ে ফেলা হবে। যেগুলো রাখতে চান সেগুলো এক্সপোর্ট করুন।';

  @override
  String get feedbackRpNotice =>
      'রিসোর্স প্যাক নিয়ে করা রিপোর্টের আমরা উত্তর দিই না। কিছু প্যাক এমনিতেই কাজ করে না, আর কিছু সার্ভার কাস্টম প্যাক প্রত্যাখ্যান করে।';
}
