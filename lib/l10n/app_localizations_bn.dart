// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'MCCompanion';

  @override
  String get console => 'কনসোল';

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
  String get onboardingThemeSubtitle => 'পরে সেটিংসে প্রতিটি রঙ পরিবর্তন করতে পারবেন।';

  @override
  String get onboardingNavTitle => 'দ্রুত অ্যাক্সেস';

  @override
  String get onboardingNavSubtitle => 'নেভিগেশন বারের জন্য দুটি ফিচার বেছে নিন।';

  @override
  String get onboardingNavLeftLabel => 'বাম বোতাম';

  @override
  String get onboardingNavRightLabel => 'ডান বোতাম';

  @override
  String get onboardingNavPreviewHome => 'হোম';

  @override
  String get onboardingNavPreviewConnector => 'কানেক্টর';

  @override
  String get onboardingNavPreviewProfile => 'প্রোফাইল';

  @override
  String get onboardingNavPreviewEmpty => 'খালি';

  @override
  String get onboardingStartTitle => 'শুরুর পৃষ্ঠা';

  @override
  String get onboardingStartSubtitle => 'অ্যাপ প্রতিবার এখানে খোলে।';

  @override
  String get onboardingCustomizeDetail => 'বিস্তারিত কাস্টমাইজ করুন →';

  @override
  String get startPageHome => 'হোম';

  @override
  String get startPageHomeSubtitle => 'টাইলসহ হোম স্ক্রিন দেখান';

  @override
  String get startPageFeature => 'ফিচার';

  @override
  String get startPageFeatureSubtitle => 'সরাসরি একটি নির্দিষ্ট পৃষ্ঠায় খুলুন';

  @override
  String get startPageSectionLabel => 'শুরুর পৃষ্ঠা';

  @override
  String get joinUs => 'আমাদের সঙ্গে যোগ দিন';

  @override
  String get more => 'আরও';

  @override
  String get website => 'ওয়েবসাইট';

  @override
  String get howToUseMenu => 'ব্যবহারের নিয়ম';

  @override
  String get support => 'সহায়তা';

  @override
  String helpText(Object appCreator) {
    return '$appCreator দ্বারা তৈরি।\r\n\r\nব্যবহারের নিয়ম:\r\n1. আপনার Minecraft সার্ভারের ঠিকানা এবং পোর্ট লিখুন (ডিফল্ট: 19132)\r\n   — অথবা ড্রপডাউন থেকে আগে সংরক্ষিত কোনো সার্ভার বেছে নিন\r\n2. (ঐচ্ছিক) আপনার অবস্থানের নিকটতম Relay Server (EU বা US) বেছে নিন\r\n3. শুরু করতে \\\"সম্প্রচার শুরু করুন\\\" এ ক্লিক করুন\r\n4. আপনার কনসোল/ডিভাইসে: Minecraft > Play > Friends\r\n5. আপনি \\\"MCCompanion\\\" নামের একটি LAN সার্ভার দেখতে পাবেন\r\n6. MCCompanion এর মাধ্যমে আপনার বাহ্যিক সার্ভারে যোগ দিতে সেটিতে ক্লিক করুন\r\n\r\nNintendo Switch (DNS মোড):\r\n1. সংযোগ প্যানেলে \\\"Nintendo Switch\\\" সক্রিয় করুন\r\n2. একটি Relay Server (EU বা US) নির্বাচন করুন\r\n3. \\\"DNS কনফিগ পাঠান\\\" এ ক্লিক করুন — এটি আপনার কনফিগ relay-এ পাঠাবে\r\n   (এটি কোনো LAN সার্ভার সম্প্রচার করে না)\r\n4. আপনার Switch-এ MCCompanion DNS সেটআপ প্রয়োগ করুন এবং যোগ দিন\r\n   MCCompanion এর জন্য যে server entry ব্যবহার করেন তা ব্যবহার করে\r\n\r\nনোট:\r\n- LAN সম্প্রচারের জন্য MCCompanion এবং কনসোলকে একই লোকাল নেটওয়ার্কে থাকতে হবে।\r\n- পরামর্শ: সর্বোত্তম পারফরম্যান্সের জন্য আপনার নিকটতম relay server বেছে নিন।';
  }

  @override
  String get serverDetailsLabel => 'সার্ভারের বিবরণ';

  @override
  String get start => 'শুরু করুন';

  @override
  String get stop => 'বন্ধ করুন';

  @override
  String get labelJava => 'Java';

  @override
  String get startJavaMode => 'জাভা মোড শুরু করুন';

  @override
  String get javaInfoTitle => 'জাভা মোড';

  @override
  String get javaInfoText => 'Java Edition সার্ভারে সংযোগ করুন';

  @override
  String get howToJavaTitle => 'জাভা মোড';

  @override
  String get howToJavaSubtitle => 'MCCompanion-এর মাধ্যমে Java Edition সার্ভারে সংযোগ করুন';

  @override
  String get aternosSubtext => 'আপনার নিজের বিনামূল্যের মাইনক্রাফ্ট সার্ভার তৈরি করুন';

  @override
  String get howToJavaBody => 'জাভা মোড — দ্রুত ধাপসমূহ:\n1. অ্যাপে Java মোড নির্বাচন করুন।\n2. আপনার Java Edition সার্ভারের ঠিকানা এবং পোর্ট লিখুন (ডিফল্ট: 25565)।\n3. \"জাভা মোড শুরু করুন\" চাপুন — MCCompanion সংযোগটি ব্রিজ করবে।\n4. Minecraft Bedrock খুলে Friends ট্যাবে যান।\n5. Java সার্ভারে যোগ দিতে \"MCCompanion\" নামের LAN সার্ভারটি নির্বাচন করুন।\n\n⚠️ গুরুত্বপূর্ণ সতর্কতা:\n- একটি বৈধ Java Edition অ্যাকাউন্ট (Microsoft) প্রয়োজন।\n- কিছু সার্ভারে anti-cheat সিস্টেম থাকে যা আপনার অ্যাকাউন্ট শনাক্ত করে ব্যান করতে পারে।\n- কিছু সার্ভার Bedrock ক্লায়েন্টকে স্পষ্টভাবে নিষিদ্ধ করে — সবসময় সার্ভারের নিয়ম দেখে নিন।\n- এই ফিচার ব্যবহারের ফলে অ্যাকাউন্ট ব্যান, সাসপেনশন বা অন্য কোনো অ্যাকাউন্ট-সংক্রান্ত সমস্যার জন্য MCCompanion দায়ী নয়।\n- নিজ দায়িত্বে ব্যবহার করুন।';

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
  String get myServers => 'আমার সার্ভারসমূহ';

  @override
  String get quickAccessServers => 'দ্রুত প্রবেশের সার্ভার';

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
  String get initializing => 'শুরু করা হচ্ছে...';

  @override
  String get createdBy => 'NetherDev দ্বারা তৈরি';

  @override
  String get bedrockBridge => 'বেডরক ব্রিজ';

  @override
  String get clientDisconnected => 'ক্লায়েন্ট সংযোগ বিচ্ছিন্ন হয়েছে — সম্প্রচার বন্ধ হয়েছে';

  @override
  String get pleaseEnterServer => '⚠️ অনুগ্রহ করে একটি সার্ভার ঠিকানা লিখুন';

  @override
  String get invalidPort => '⚠️ অবৈধ পোর্ট নম্বর (1-65535)';

  @override
  String get dnsConfigSent => '✅ DNS কনফিগ relay-এ পাঠানো হয়েছে';

  @override
  String get broadcastingStarted => 'সম্প্রচার শুরু হয়েছে';

  @override
  String get broadcastStopped => 'সম্প্রচার বন্ধ হয়েছে';

  @override
  String selectedServer(Object name) {
    return '📋 নির্বাচিত: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'নির্বাচিত: $name';
  }

  @override
  String get noLogsToCopy => 'কপি করার মতো কোনো লগ নেই';

  @override
  String copiedLogs(Object count) {
    return '$countটি লগ এন্ট্রি ক্লিপবোর্ডে কপি করা হয়েছে';
  }

  @override
  String get debugEnabled => 'ডিবাগ লগ চালু হয়েছে';

  @override
  String get debugDisabled => 'ডিবাগ লগ বন্ধ হয়েছে';

  @override
  String get howToUseTitle => 'MCCompanion কীভাবে ব্যবহার করবেন';

  @override
  String get iUnderstand => 'আমি বুঝেছি';

  @override
  String get playOnSwitchTitle => 'Nintendo Switch-এ খেলুন';

  @override
  String get playWithFriendsTitle => 'বন্ধুদের সঙ্গে খেলুন';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'নির্বাচিত: $relayName\r\n\r\nকীভাবে সংযোগ করবেন:\r\n1. আপনার Switch Settings-এ যান এবং DNS পরিবর্তন করে এটি দিন: $relayIp\r\n2. Minecraft খুলুন এবং তালিকা থেকে একটি সার্ভার নির্বাচন করুন (যেমন Cubecraft বা Hive)।\r\n3. এখন আপনাকে স্বয়ংক্রিয়ভাবে আপনার নিজের সার্ভারে পাঠানো হবে।';
  }

  @override
  String playInstructionsFriends(Object friend) {
    return 'কীভাবে সংযোগ করবেন:\r\n1. আপনার কনসোলে $friend-কে বন্ধু হিসেবে যোগ করুন।\r\n2. Minecraft খুলে Friends ট্যাবে যান।\r\n3. LAN Worlds-এর নিচে আপনার সার্ভার খুঁজে সেটি নির্বাচন করে যোগ দিন।';
  }

  @override
  String get nldServerLabel => 'নেদারলিংক সার্ভার';

  @override
  String selectRelayLabel(Object name) {
    return 'রিলে নির্বাচন করুন $name';
  }

  @override
  String get noSavedServers => 'কোনো সংরক্ষিত সার্ভার নেই';

  @override
  String get savedServers => 'সংরক্ষিত সার্ভার';

  @override
  String get serverAddressHint => 'সার্ভার ঠিকানা';

  @override
  String get portHint => 'পোর্ট';

  @override
  String get manageServers => 'সার্ভার পরিচালনা করুন';

  @override
  String get manageServersTooltip => 'সার্ভার পরিচালনা করুন';

  @override
  String get noServerYet => 'এখনও কোনো সংরক্ষিত সার্ভার নেই।\nএকটি যোগ করতে ম্যানেজে ট্যাপ করুন।';

  @override
  String get serverNotSelected => 'কোনো সার্ভার নির্বাচিত নয়';

  @override
  String get ready => 'প্রস্তুত';

  @override
  String get active => 'সক্রিয়';

  @override
  String get vpnDetected => 'VPN শনাক্ত হয়েছে';

  @override
  String get noWifi => 'Wi‑Fi এ নেই';

  @override
  String get vpnActive => 'আমরা শনাক্ত করেছি যে আপনার VPN সক্রিয় আছে।\n\nMCCompanion ব্যবহার করার আগে অনুগ্রহ করে VPN বন্ধ করুন, নইলে LAN সম্প্রচার আপনার কনসোলে পৌঁছাতে নাও পারে।';

  @override
  String get mobileActive => 'শনাক্ত হয়েছে: মোবাইল ডেটা\n\nMCCompanion কে আপনার কনসোলের একই নেটওয়ার্কে থাকতে হবে। চালিয়ে যাওয়ার আগে আপনার হোম Wi‑Fi বা হটস্পটে সংযুক্ত হোন।';

  @override
  String get continueAnyway => 'তবুও চালিয়ে যান';

  @override
  String get sameWifi => 'একই Wi‑Fi নেটওয়ার্ক';

  @override
  String get needSameWifi => 'যে ডিভাইসে MCCompanion চলছে সেটি অবশ্যই সেই একই Wi‑Fi নেটওয়ার্কে থাকতে হবে, যেটিতে আপনার Minecraft কনসোল যুক্ত আছে।';

  @override
  String get subscription => 'অনলাইন সাবস্ক্রিপশন প্রয়োজন';

  @override
  String get needSubscription => 'প্রতিটি কনসোলের জন্য আলাদা সক্রিয় অনলাইন সাবস্ক্রিপশন (Xbox Live, PS Plus, NSO) প্রয়োজন। এটি না থাকলে MCCompanion দেখা যাবে না।';

  @override
  String get updateAvailable => 'আপডেট উপলব্ধ';

  @override
  String get newVersion => 'অ্যাপের একটি নতুন সংস্করণ উপলব্ধ।\nসর্বশেষ ফিচার ও সংশোধনের জন্য এখনই আপডেট করুন।';

  @override
  String get later => 'পরে';

  @override
  String get updateNow => 'এখনই আপডেট করুন';

  @override
  String get beforeYouStart => 'শুরু করার আগে';

  @override
  String get stopBroadcasting => 'সম্প্রচার বন্ধ করুন';

  @override
  String get startNintendoMode => 'Nintendo মোড শুরু করুন';

  @override
  String get startFriendsMode => 'বন্ধু মোড শুরু করুন';

  @override
  String get startBroadcasting => 'সম্প্রচার শুরু করুন';

  @override
  String get modeLabel => 'মোড';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'বন্ধুরা';

  @override
  String get nintendoInfoTitle => 'Nintendo Switch DNS মোড';

  @override
  String get nintendoInfoText => 'Nintendo মোডে শুরু করুন, আপনার DNS সেট করুন এবং একটি নির্বাচিত সার্ভারে যোগ দিন।';

  @override
  String get friendModeTitle => 'বন্ধু মোড';

  @override
  String get friendModeText => 'MCCompanion-এর friend bot-গুলোকে বন্ধু হিসেবে যোগ করুন। বন্ধু মোড শুরু করুন এবং খেলুন';

  @override
  String get selectedRelayCheck => 'নির্বাচিত';

  @override
  String relayFallbackWarning(Object name) {
    return 'সতর্কতা: মূল relay সাড়া দেয়নি। বিকল্প relay ব্যবহৃত হচ্ছে: $name';
  }

  @override
  String get relayUnableConnect => 'কোনো MCCompanion relay server-এ সংযোগ করা যায়নি। পরে আবার চেষ্টা করুন অথবা আপনার ইন্টারনেট পরীক্ষা করুন।';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / প্রক্সি)';

  @override
  String get howToXboxSubtitle => 'LAN সম্প্রচার বা প্রক্সির মাধ্যমে খেলুন';

  @override
  String get howToXboxBody => 'কীভাবে সংযোগ করবেন (Xbox / PS4 / PS5):\r\n1. নিশ্চিত করুন যে MCCompanion চালানো আপনার ডিভাইস এবং আপনার কনসোল একই লোকাল নেটওয়ার্কে আছে।\r\n2. অ্যাপে আপনার Minecraft server address এবং port লিখে \\\"সম্প্রচার শুরু করুন\\\" চাপুন।\r\n3. কনসোলে Minecraft → Play খুলুন → LAN Worlds অথবা Friends ট্যাব খুঁজুন এবং তালিকাটি রিফ্রেশ করুন।\r\n4. যোগ দিতে \\\"MCCompanion\\\" নামের LAN server নির্বাচন করুন।\r\nনোট:\r\n- সার্ভার না দেখালে নিশ্চিত করুন যে দুই ডিভাইস একই subnet-এ আছে এবং অ্যাপ এখনও সম্প্রচার করছে।\r\n- কিছু কনসোল মডেল বা রাউটার LAN discovery ব্লক করতে পারে; প্রয়োজন হলে অ্যাপ বা রাউটারের সেটিংস পরিবর্তন করে দেখুন।';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (DNS মোড)';

  @override
  String get howToNintendoSubtitle => 'Switch-এর জন্য DNS রিলে নির্দেশনা';

  @override
  String get howToNintendoBody => 'Nintendo Switch — DNS মোড (ধাপে ধাপে):\r\n1. অ্যাপে \\\"Nintendo\\\" মোড চালু করুন এবং একটি রিলে সার্ভার (EU বা US) নির্বাচন করুন।\r\n2. DNS IP রিলেতে পাঠাতে \\\"DNS কনফিগ পাঠান\\\" এ ট্যাপ করুন।\r\n3. আপনার Nintendo Switch-এ System Settings → Internet → Internet Settings → (your network) → Change Settings → DNS এ যান এবং Primary DNS হিসেবে রিলে IP সেট করুন।\r\n4. Minecraft খুলে একটি public server-এ যোগ দিন; রিলে DNS ব্যবহার করে আপনাকে আপনার সার্ভারে পুনর্নির্দেশ করা হবে।\r\nনোট:\r\n- DNS মোড কোনো LAN server সম্প্রচার করে না; এটি রিলের মাধ্যমে game traffic রাউট করে।\r\n- স্বাভাবিক নেটওয়ার্ক আচরণ দরকার হলে কাজ শেষে DNS আগের অবস্থায় ফিরিয়ে দিন।';

  @override
  String get howToFriendsTitle => 'বন্ধু মোড';

  @override
  String get howToFriendsSubtitle => 'বন্ধুদের আমন্ত্রণ করুন এবং LAN দিয়ে যোগ দিন';

  @override
  String get howToFriendsBody => 'বন্ধু মোড — দ্রুত ধাপসমূহ:\r\n1. প্রয়োজন হলে আপনার কনসোল বা প্ল্যাটফর্মে MCCompanion friend account (relay friend) যোগ করুন।\r\n2. অ্যাপে বন্ধু মোড চালু করুন এবং relay configuration পাঠান (যদি প্রযোজ্য হয়)।\r\n3. আপনার কনসোলে Minecraft → Friends খুলে LAN Worlds খুঁজুন — আপনার সার্ভার সেখানে একটি LAN world হিসেবে দেখা উচিত।\r\n4. বন্ধুদের সঙ্গে আপনার সার্ভারে যোগ দিতে সেটি নির্বাচন করুন।\r\nনোট:\r\n- নিশ্চিত করুন যে আপনার এবং আপনার বন্ধুদের NAT/settings একই এবং friend presence অনুমোদন করে।\r\n- বন্ধু মোড প্ল্যাটফর্মের friend features-এর ওপর নির্ভরশীল এবং friend request গ্রহণ করতে হতে পারে।';

  @override
  String get helpMCCompanionTitle => 'MCCompanion দেখা যাচ্ছে না';

  @override
  String get helpMCCompanionSubtitle => 'LAN শনাক্তকরণ সমস্যার সমাধান';

  @override
  String get helpMCCompanionBody => 'যদি আপনার কনসোলে সার্ভারটি না দেখা যায়, তাহলে এই ধাপগুলো চেষ্টা করুন:\r\n\r\n✅ প্রাথমিক পরীক্ষা:\r\n1. একই WiFi নেটওয়ার্ক - আপনার ফোন/ট্যাবলেট এবং কনসোল অবশ্যই একই WiFi-তে থাকতে হবে\r\n2. সঠিক সার্ভার ঠিকানা - IP এবং port আবার পরীক্ষা করুন (ডিফল্ট: 19132)\r\n3. সম্প্রচার সক্রিয় - MCCompanion \\\"Broadcasting\\\" স্ট্যাটাস দেখাচ্ছে কি না নিশ্চিত করুন\r\n\r\n🔄 দ্রুত সমাধান:\r\n• অ্যাপ রিস্টার্ট করুন: সম্প্রচার বন্ধ করুন, MCCompanion পুরোপুরি বন্ধ করুন, আবার খুলে চেষ্টা করুন\r\n• কনসোল রিস্টার্ট করুন: কখনও কখনও LAN game শনাক্ত করতে কনসোলকে রিফ্রেশ করতে হয়\r\n• Friends/LAN ট্যাব পরীক্ষা করুন: সার্ভারটি \\\"Friends\\\" বা \\\"LAN Games\\\" এর নিচে দেখা যায়, server list-এ নয়\r\n• সম্প্রচার শুরু করার পর 10-15 সেকেন্ড অপেক্ষা করুন\r\n• VPN বন্ধ করুন: VPN লোকাল সম্প্রচার ব্লক করতে পারে\r\n\r\n⚠️ সাধারণ সমস্যা:\r\n\\\"No route found for user\\\" → নিশ্চিত করুন যে দুই ডিভাইস একই Wi‑Fi-তে আছে (Guest network এড়িয়ে চলুন)\r\n\\\"Unable to connect to MCCompanion relay server\\\" → আপনার ইন্টারনেট / relay status পরীক্ষা করুন\r\n\r\n📱 এখনও সমস্যা হচ্ছে? MCCompanion-এ Debug Mode চালু করে logs পরীক্ষা করুন, অথবা অন্য কোনো সার্ভার চেষ্টা করুন।';

  @override
  String get helpMultiplayerFailedTitle => 'মাল্টিপ্লেয়ার সংযোগ ব্যর্থ';

  @override
  String get helpMultiplayerFailedSubtitle => 'কেন এটি MCCompanion-এর ত্রুটি নয় তার ব্যাখ্যা';

  @override
  String get helpMultiplayerFailedBody => '⚠️ এটি MCCompanion-এর কোনো সমস্যা নয়!\r\n\r\nMCCompanion আপনাকে সফলভাবে অনুরোধকৃত সার্ভারে পুনর্নির্দেশ করেছে। \\\"Multiplayer Connection Failed\\\" বার্তাটি বোঝায় যে লক্ষ্য সার্ভারটি বর্তমানে অপ্রাপ্য। সম্ভাব্য কারণ:\r\n\r\n• লক্ষ্য Minecraft server অফলাইন বা অতিরিক্ত লোডে আছে\r\n• সার্ভারের জন্য আপডেটেড client version বা নির্দিষ্ট edition প্রয়োজন\r\n• relay এবং লক্ষ্য সার্ভারের মধ্যে নেটওয়ার্ক সমস্যা\r\n\r\nঅন্য কোনো সার্ভারে সংযোগ করার চেষ্টা করুন অথবা সার্ভারের support-এর সাথে যোগাযোগ করুন। যদি একাধিক সার্ভারে একই সমস্যা থাকে, MCCompanion-এ Debug Mode চালু করে logs পরীক্ষা করুন।';

  @override
  String get helpNintendoDnsTitle => 'Nintendo DNS কাজ করছে না';

  @override
  String get helpNintendoDnsSubtitle => 'সাধারণ DNS / relay সমস্যা';

  @override
  String get helpNintendoDnsBody => 'যদি Nintendo DNS মোড কাজ না করে, তাহলে নিচের বিষয়গুলো পরীক্ষা করুন:\r\n\r\n1. নিশ্চিত করুন যে আপনি অ্যাপ থেকে DNS config পাঠিয়েছেন (DNS কনফিগ পাঠান)।\r\n2. নিশ্চিত করুন যে আপনি Switch-এ relay IP-কে Primary DNS হিসেবে প্রয়োগ করেছেন।\r\n3. নিশ্চিত করুন যে নির্বাচিত relay server (EU/US) অনলাইনে আছে এবং অতিরিক্ত লোডে নেই।\r\n4. কিছু নেটওয়ার্ক (যেমন captive portal) custom DNS প্রতিরোধ করে — অন্য নেটওয়ার্কে পরীক্ষা করুন।\r\n\r\nযদি সমস্যা থেকে যায়, Debug Mode চালু করে logs পরীক্ষা করুন বা Friends-mode বিকল্পটি চেষ্টা করুন।';

  @override
  String get helpFriendsModeTitle => 'বন্ধু মোড কাজ করছে না';

  @override
  String get helpFriendsModeSubtitle => 'সাধারণ বন্ধু সংক্রান্ত সমস্যা';

  @override
  String get helpFriendsModeBody => 'বন্ধু মোড সমস্যা সমাধানের টিপস:\r\n\r\n1. নিশ্চিত করুন যে relay friend account কনসোলে যোগ/গ্রহণ করা হয়েছে (যদি প্রয়োজন হয়)।\r\n2. বন্ধু মোড চালু করার পর গেমটি রিস্টার্ট করে Friends/LAN ট্যাব রিফ্রেশ করার চেষ্টা করুন।\r\n\r\nযদি সার্ভারটি এখনও বন্ধুদের কাছে না দেখা যায়, তবে Debug Mode চালু করে logs পরীক্ষা করুন যাতে ত্রুটি শনাক্ত করা যায়।';

  @override
  String get changeLanguageTitle => 'ভাষা পরিবর্তন করুন';

  @override
  String get changeLanguage => 'ভাষা';

  @override
  String get useSystemLanguage => 'সিস্টেমের ভাষা ব্যবহার করুন';

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
  String get trackerSignInSubtitle => 'সার্ভার ট্র্যাক করতে এবং অফলাইন বিজ্ঞপ্তি পেতে সাইন ইন করুন।';

  @override
  String get signIn => 'সাইন ইন';

  @override
  String get noServersTracked => 'কোনো সার্ভার ট্র্যাক করা হয়নি';

  @override
  String get trackerEmptySubtitle => 'স্ট্যাটাস পর্যবেক্ষণ ও বিজ্ঞপ্তি পেতে একটি Minecraft সার্ভার যোগ করুন।';

  @override
  String get fillAllFields => 'সমস্ত ফিল্ড সঠিকভাবে পূরণ করুন';

  @override
  String get slotUsedUpgrade => 'আপনার বিনামূল্যে স্লট ব্যবহৃত হয়েছে। আরও সার্ভারের জন্য আপগ্রেড করুন।';

  @override
  String get addServerFailed => 'সার্ভার যোগ করতে ব্যর্থ হয়েছে। আপনার তথ্য যাচাই করুন।';

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
  String get notificationsOn => 'বিজ্ঞপ্তি চালু';

  @override
  String get notificationsOff => 'বিজ্ঞপ্তি বন্ধ';

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
  String get customizeSubtitle => 'টাইল পুনরায় সাজান এবং নেভিগেশন কাস্টমাইজ করুন';

  @override
  String get resetLabel => 'রিসেট';

  @override
  String get tilesSection => 'টাইলস';

  @override
  String get dragToReorder => 'পুনরায় সাজাতে টেনে আনুন';

  @override
  String get navigationSection => 'নেভিগেশন';

  @override
  String get navFixed => 'হোম, কানেক্টর এবং প্রোফাইল সর্বদা স্থির থাকে';

  @override
  String get leftSlot => 'বাম স্লট (হোমের পাশে)';

  @override
  String get rightSlot => 'ডান স্লট (প্রোফাইলের পাশে)';

  @override
  String get tileWideTooltipRemove => 'প্রশস্ত লেআউট সরান';

  @override
  String get tileWideTooltipAdd => 'প্রশস্ত টাইল করুন';

  @override
  String get tileVisibilityShow => 'টাইল দেখান';

  @override
  String get tileVisibilityHide => 'টাইল লুকান';

  @override
  String get tileVisibilityMin => 'লুকানো যাচ্ছে না (শেষ টাইল)';

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
  String get playerLookupLabelGamertag => 'Gamertag';

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
  String get avatarUrlHint => 'https://example.com/avatar.png';

  @override
  String get reportUser => 'Report user';

  @override
  String get reportMessage => 'Report message';

  @override
  String reportUserWithName(Object name) {
    return 'Report $name';
  }

  @override
  String get reportDisclaimer => 'Reports are reviewed by our team. False reports may result in action against your account.';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonHarassment => 'Harassment';

  @override
  String get reportReasonInappropriate => 'Inappropriate content';

  @override
  String get reportReasonOther => 'Other';

  @override
  String get reportAdditionalDetails => 'Additional details (optional)…';

  @override
  String get reportSuccess => 'Report submitted. Thank you.';

  @override
  String get reportFailed => 'Failed to submit report. Please try again.';

  @override
  String get reportSubmit => 'Submit report';

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get messagePlaceholder => 'Message…';

  @override
  String get noMessagesYet => 'No messages yet.\nSay hello!';

  @override
  String get noConversationsYet => 'No conversations yet';

  @override
  String get startChatHint => 'Find a friend and start chatting!';

  @override
  String get youPrefix => 'You';

  @override
  String get playerLookupTitle => 'Player Lookup';

  @override
  String get playerLookupSubtitle => 'Search for a Java or Bedrock player by username';

  @override
  String get playerLookupHint => 'Enter a username…';

  @override
  String get playerLookupLinked => 'Linked accounts found';

  @override
  String get playerLookupLabelUsername => 'Username';

  @override
  String get playerLookupLabelTier => 'Tier';

  @override
  String playerLookupCopied(Object value) {
    return '$value copied';
  }

  @override
  String get tabProfile => 'Profile';

  @override
  String get tabFriends => 'Friends';

  @override
  String get tabRequests => 'Requests';

  @override
  String get tabChats => 'Chats';

  @override
  String get addFriend => 'Add Friend';

  @override
  String get usernameHint => 'Username';

  @override
  String get send => 'Send';

  @override
  String friendRequestSentTo(Object name) {
    return 'Friend request sent to $name';
  }

  @override
  String alreadyFriendsWith(Object name) {
    return 'You are already friends with $name';
  }

  @override
  String requestAlreadyPending(Object name) {
    return 'A request to $name is already pending';
  }

  @override
  String userNotFoundMsg(Object name) {
    return 'User $name not found';
  }

  @override
  String cannotSendRequest(Object name) {
    return 'Cannot send a request to $name';
  }

  @override
  String get somethingWentWrong => 'Something went wrong. Please try again.';

  @override
  String friendRequestAccepted(Object name) {
    return 'You are now friends with $name';
  }

  @override
  String requestDeclined(Object name) {
    return 'Request from $name declined';
  }

  @override
  String get deleteAccountTitle => 'Delete Account';

  @override
  String get deleteAccountBody => 'This will permanently delete your account and all data. This action cannot be undone.';

  @override
  String get deletePermanently => 'Delete Permanently';

  @override
  String get couldNotDeleteAccount => 'Could not delete account. Please try again.';

  @override
  String get removeFriendTitle => 'Remove Friend';

  @override
  String removeFriendConfirm(Object name) {
    return 'Remove $name from your friends?';
  }

  @override
  String get remove => 'Remove';

  @override
  String friendRemoved(Object name) {
    return '$name has been removed from your friends';
  }

  @override
  String get emailDifferentMethod => 'This email is linked to a different sign-in method';

  @override
  String get googleSignInFailed => 'Google sign-in failed. Please try again.';

  @override
  String get appleSignInFailed => 'Apple sign-in failed. Please try again.';

  @override
  String get resetPasswordTitle => 'Reset Password';

  @override
  String get resetPasswordBody => 'Enter your email address and we will send you a link to reset your password.';

  @override
  String get emailAddressHint => 'Email address';

  @override
  String get sendLink => 'Send link';

  @override
  String resetLinkSent(Object email) {
    return 'Password reset link sent to $email';
  }

  @override
  String get noAccountForEmail => 'No account found for that email address';

  @override
  String get invalidEmailError => 'The email address is not valid';

  @override
  String get couldNotSendResetEmail => 'Could not send reset email. Please try again.';

  @override
  String get enterEmailAndPassword => 'Please enter your email and password';

  @override
  String get incorrectEmailOrPassword => 'Incorrect email or password';

  @override
  String get emailAlreadyInUse => 'This email address is already in use';

  @override
  String get weakPassword => 'Password is too weak. Please choose a stronger one.';

  @override
  String get createAccount => 'Create Account';

  @override
  String get signInSubtitle => 'Sign in to access your profile, friends, and chats.';

  @override
  String get passwordHint => 'Password';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get orDivider => 'or';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get alreadyHaveAccount => 'Already have an account? Sign in';

  @override
  String get noAccountYet => 'Don\'t have an account? Create one';

  @override
  String get profileNotSetUp => 'Profile not set up';

  @override
  String get chooseUsernameSubtitle => 'Choose a username to start connecting with other players.';

  @override
  String get createProfile => 'Create Profile';

  @override
  String get findUser => 'Find user';

  @override
  String get couldNotUpdateVisibility => 'Could not update visibility settings';

  @override
  String get signOut => 'Sign Out';

  @override
  String get appearOfflineLabel => 'Appear Offline';

  @override
  String get appearOfflineOn => 'You appear offline to other players';

  @override
  String get appearOfflineOff => 'You appear online to other players';

  @override
  String get unlinkXboxTitle => 'Unlink Xbox Account';

  @override
  String removeLabelConfirm(Object name) {
    return 'Remove $name from your linked accounts?';
  }

  @override
  String get unlink => 'Unlink';

  @override
  String get unlinkJavaTitle => 'Unlink Java Account';

  @override
  String removeJavaConfirm(Object name) {
    return 'Remove $name from your linked accounts?';
  }

  @override
  String get linkedAccountsTitle => 'Linked Accounts';

  @override
  String get linkAccountsHint => 'Link your Minecraft accounts to show your skins and stats.';

  @override
  String get linkXbox => 'Link Xbox';

  @override
  String get linkJava => 'Link Java';

  @override
  String get profileUpdated => 'Profile updated';

  @override
  String get profileCardTitle => 'Profile';

  @override
  String get edit => 'Edit';

  @override
  String get displayNameLabel => 'Display Name';

  @override
  String get yourNameHint => 'Your name';

  @override
  String get bioLabel => 'Bio';

  @override
  String get bioHint => 'Tell others about yourself…';

  @override
  String get avatarUrlLabel => 'Avatar URL';

  @override
  String get usernameDisplayLabel => 'Username';

  @override
  String get aboutMe => 'About me';

  @override
  String get noFriendsYet => 'No friends yet';

  @override
  String get noFriendsSub => 'Add friends to see them here.';

  @override
  String onlineFriendsLabel(Object count) {
    return '$count online';
  }

  @override
  String offlineFriendsLabel(Object count) {
    return '$count offline';
  }

  @override
  String get noPendingRequests => 'No pending requests';

  @override
  String get requestsAppearHere => 'New friend requests will appear here.';

  @override
  String get skinsEdit => 'Edit';

  @override
  String get skinsNoAccountsTitle => 'No Minecraft accounts linked';

  @override
  String get skinsNoAccountsSubtitle => 'Link a Java or Bedrock account to view your skins.';

  @override
  String get skinsSignInTitle => 'Sign in to view your skins';

  @override
  String get skinsSignInSubtitle => 'Sign in and link your Minecraft accounts to see your skins here.';

  @override
  String get skinsMustBe64 => 'Skin must be 64×64 pixels';

  @override
  String get skinsInvalidFile => 'Invalid image file';

  @override
  String get skinsUpload => 'Upload';

  @override
  String get skinsCreate => 'Create';

  @override
  String get skinsSectionRecent => 'RECENT SKINS';

  @override
  String get skinsSectionMy => 'MY SKINS';

  @override
  String get skinsEmptyMySkins => 'No saved skins yet. Upload or create one!';

  @override
  String get skinsSectionYours => 'YOUR SKINS';

  @override
  String get skinsCouldNotLoad => 'Could not load skins';

  @override
  String skinsPageOf(Object page, Object total) {
    return 'Page $page of $total';
  }

  @override
  String get skinsDownload => 'Download';

  @override
  String get wikiTitle => 'Wiki';

  @override
  String get wikiMinecraftWiki => 'Minecraft Wiki';

  @override
  String get wikiSearchHint => 'Search the wiki…';

  @override
  String get wikiCouldNotLoadPages => 'Could not load pages. Please try again.';

  @override
  String get wikiCouldNotReach => 'Could not reach the wiki. Check your connection.';

  @override
  String wikiNoResults(Object query) {
    return 'No results found for \"$query\"';
  }

  @override
  String get wikiNoPagesFound => 'No pages found';

  @override
  String wikiCategories(Object count) {
    return '$count categories';
  }

  @override
  String get wikiCouldNotLoadContent => 'Could not load article content.';

  @override
  String get wikiOpenInBrowser => 'Open in browser';

  @override
  String get wikiCrafting => 'Crafting';

  @override
  String get wikiReadFullArticle => 'Read full article';

  @override
  String get wikiMobs => 'Mobs';

  @override
  String get wikiBlocks => 'Blocks';

  @override
  String get wikiItems => 'Items';

  @override
  String get wikiBiomes => 'Biomes';

  @override
  String get wikiStructures => 'Structures';

  @override
  String get wikiEnchantments => 'Enchantments';

  @override
  String get wikiPotions => 'Potions';

  @override
  String get wikiPassive => 'Passive';

  @override
  String get wikiNeutral => 'Neutral';

  @override
  String get wikiHostile => 'Hostile';

  @override
  String get wikiBoss => 'Boss';

  @override
  String get wikiUtility => 'Utility';

  @override
  String get wikiNatural => 'Natural';

  @override
  String get wikiOres => 'Ores';

  @override
  String get wikiWood => 'Wood';

  @override
  String get wikiStone => 'Stone';

  @override
  String get wikiRedstone => 'Redstone';

  @override
  String get wikiPlants => 'Plants';

  @override
  String get wikiDecoration => 'Decoration';

  @override
  String get wikiTools => 'Tools';

  @override
  String get wikiSwords => 'Swords';

  @override
  String get wikiRanged => 'Ranged';

  @override
  String get wikiArmor => 'Armor';

  @override
  String get wikiFood => 'Food';

  @override
  String get wikiBrewing => 'Brewing';

  @override
  String get wikiMaterials => 'Materials';

  @override
  String get wikiOverworld => 'Overworld';

  @override
  String get wikiNether => 'Nether';

  @override
  String get wikiTheEnd => 'The End';

  @override
  String get wikiSword => 'Sword';

  @override
  String get wikiTool => 'Tool';

  @override
  String get wikiBow => 'Bow';

  @override
  String get wikiFishing => 'Fishing';

  @override
  String get wikiStatusEffects => 'Status Effects';

  @override
  String get chooseUniqueUsername => 'শুরু করতে একটি অনন্য ব্যবহারকারীর নাম বেছে নিন।';

  @override
  String get usernameFieldLabel => 'ব্যবহারকারীর নাম';

  @override
  String get usernameExampleHint => 'যেমন: CoolPlayer123';

  @override
  String get usernameFormatHint => '৩–২০ অক্ষর · শুধু অক্ষর, সংখ্যা এবং আন্ডারস্কোর';

  @override
  String get displayNameOptional => 'প্রদর্শন নাম (ঐচ্ছিক)';

  @override
  String get displayNameExampleHint => 'যেমন: Cool Player';

  @override
  String get usernameRequired => 'ব্যবহারকারীর নাম প্রয়োজন';

  @override
  String get usernameFormatError => 'ব্যবহারকারীর নাম ৩–২০ অক্ষর হতে হবে এবং শুধুমাত্র অক্ষর, সংখ্যা এবং আন্ডারস্কোর থাকতে পারে';

  @override
  String get usernameTaken => 'এই ব্যবহারকারীর নামটি ইতিমধ্যে নেওয়া হয়েছে';

  @override
  String get noConnectionError => 'কোনো সংযোগ নেই। আপনার ইন্টারনেট পরীক্ষা করুন এবং আবার চেষ্টা করুন।';

  @override
  String get home => 'হোম';

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
  String get paywallRestore => 'Restore';

  @override
  String get paywallMonthly => 'Monthly';

  @override
  String get paywallYearly => 'Yearly';

  @override
  String get paywallSavePercent => 'Save ~17%';

  @override
  String get paywallSubtitle => 'Track more servers and get notified\nwhen they go online or offline.';

  @override
  String paywallSlotLabel(Object slots) {
    return '$slots server slots';
  }

  @override
  String get paywallPopular => 'Popular';

  @override
  String get paywallContinue => 'Continue';

  @override
  String get paywallNoPkgs => 'No packages available.';

  @override
  String get paywallManaged => 'Managed by Apple/Google. Cancel anytime.';

  @override
  String get paywallPurchaseSuccess => 'Purchase successful!';

  @override
  String get paywallPurchaseFailed => 'Purchase failed. Please try again.';

  @override
  String get paywallPurchasesRestored => 'Purchases restored!';

  @override
  String get paywallNoActivePurchases => 'No active purchases found.';

  @override
  String get paywallRestoreFailed => 'Restore failed. Please try again.';

  @override
  String get relay => 'Relay';

  @override
  String get selectModeSection => 'SELECT MODE';

  @override
  String get serversSection => 'SERVERS';

  @override
  String get noServerSelected => 'No server selected';

  @override
  String get selectBedrockAccount => 'Select Bedrock account';

  @override
  String playersCount(Object players, Object max) {
    return '$players / $max players';
  }

  @override
  String get infoAndLegal => 'Info & Legal';

  @override
  String get legalSection => 'Legal';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get privacyPolicySubtitle => 'How we collect and protect your data';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get termsOfServiceSubtitle => 'Rules and conditions of use';

  @override
  String get dataSourcesSection => 'Data Sources & Credits';

  @override
  String get creditMinecraftWikiSubtitle => 'Used as data source for the Wiki feature. Content is provided by the community under Creative Commons.';

  @override
  String get creditMojangTitle => 'Mojang / Microsoft';

  @override
  String get creditMojangSubtitle => 'Java player skins, UUIDs, and profile data via the official Mojang API.';

  @override
  String get creditGeyserTitle => 'GeyserMC';

  @override
  String get creditGeyserSubtitle => 'Bedrock skin rendering. Skins for Bedrock players are fetched via the GeyserMC skin server.';

  @override
  String get creditXboxTitle => 'Xbox / Microsoft';

  @override
  String get creditXboxSubtitle => 'Bedrock account linking via Xbox Live. Gamertags and XUIDs are retrieved through the Microsoft authentication flow.';

  @override
  String get aboutMCCompanionSection => 'About MCCompanion';

  @override
  String get aboutMCCompanionDisclaimer => 'MCCompanion is an independent application and is not affiliated with, endorsed by, or sponsored by Mojang Studios or Microsoft Corporation.';

  @override
  String get minecraftTrademark => '\"Minecraft\" is a trademark of Microsoft Corporation.';

  @override
  String get nldServerLabelShort => 'MCCompanion Server';

  @override
  String get editServer => 'Edit Server';

  @override
  String get serverNameExampleHint => 'My Awesome Server';

  @override
  String get serverAddressExampleHint => 'play.example.com';

  @override
  String get serverDescriptionExampleHint => 'Survival server with friends';

  @override
  String get editionLabel => 'Edition';

  @override
  String get nameLabel => 'Name';

  @override
  String get ipAddressFieldLabel => 'IP Address';

  @override
  String get portFieldLabel => 'Port';

  @override
  String get platformFieldLabel => 'Platform';

  @override
  String get nameValidationError => 'Name must be 1–50 characters';

  @override
  String get ipRequiredError => 'IP address is required';

  @override
  String get portRangeError => 'Port must be between 1 and 65535';

  @override
  String get partnerServersTitle => 'Partner Servers';

  @override
  String get noPartnerServers => 'No partner servers available yet.';

  @override
  String get checkBackLater => 'Check back later.';

  @override
  String get xboxLinkTitle => 'Link Xbox Account';

  @override
  String get xboxStartingLogin => 'Starting Xbox login…';

  @override
  String get xboxSignInWithMicrosoft => 'Sign in with Microsoft';

  @override
  String get xboxGoToLink => 'Go to the link below and enter the code to connect your Xbox account.';

  @override
  String get xboxYourCode => 'Your code';

  @override
  String get xboxTapToCopy => 'Tap the code to copy it';

  @override
  String get xboxOpenLink => 'Open microsoft.com/link';

  @override
  String get xboxWaitingForLogin => 'Waiting for login…';

  @override
  String get xboxAccountLinked => 'Xbox account linked!';

  @override
  String get xboxCodeCopied => 'Code copied to clipboard';

  @override
  String get xboxCouldNotStart => 'Could not start Xbox login. Please try again.';

  @override
  String get xboxCodeExpired => 'The code expired. Please try again.';

  @override
  String get xboxSomethingWrong => 'Something went wrong. Please try again.';

  @override
  String get tryAgain => 'Try again';

  @override
  String get publicProfileTitle => 'Profile';

  @override
  String get userNotFound => 'User not found';

  @override
  String get profileSectionLabel => 'Profile';

  @override
  String get displayNameRowLabel => 'Display name';

  @override
  String get usernameRowLabel => 'Username';

  @override
  String get lastSeenLabel => 'Last seen';

  @override
  String get aboutSectionLabel => 'About';

  @override
  String get xboxBedrockLabel => 'Xbox / Bedrock';

  @override
  String get friendRequestSent => 'Friend request sent';

  @override
  String get alreadyFriendsMsg => 'You are already friends.';

  @override
  String get requestAlreadyPendingMsg => 'There is already a pending request.';

  @override
  String get userNotFoundMsg2 => 'User not found.';

  @override
  String get cannotSendRequestMsg => 'Cannot send a request to this user.';

  @override
  String nowFriendsWith(Object username) {
    return 'Now friends with @$username';
  }

  @override
  String get removeFriendButton => 'Remove friend';

  @override
  String get requestSentButton => 'Request sent';

  @override
  String get acceptRequestButton => 'Accept request';

  @override
  String get addFriendButton => 'Add friend';

  @override
  String get removeFriendDialogTitle => 'Remove friend';

  @override
  String removeFriendDialogBody(Object username) {
    return 'Remove @$username as a friend?';
  }

  @override
  String get trackerLimitReached => 'You\'ve reached your server limit. Upgrade to track more servers.';

  @override
  String get upgradeButton => 'Upgrade';

  @override
  String get javaLinkTitle => 'Link Java Edition';

  @override
  String get javaStartingLogin => 'Starting Microsoft login…';

  @override
  String get javaSignInWithMicrosoft => 'Sign in with Microsoft';

  @override
  String get javaGoToLink => 'Go to the link below and enter the code to connect your Minecraft Java Edition account.';

  @override
  String get javaYourCode => 'Your code';

  @override
  String get javaTapToCopy => 'Tap the code to copy it';

  @override
  String get javaOpenLink => 'Open microsoft.com/link';

  @override
  String get javaWaitingForLogin => 'Waiting for login…';

  @override
  String get javaAccountLinked => 'Java Edition linked!';

  @override
  String get javaNoJavaTitle => 'No Java Edition found';

  @override
  String get javaNoJavaBody => 'The Microsoft account you signed in with does not own Minecraft Java Edition.';

  @override
  String get javaTryDifferentAccount => 'Try a different account';

  @override
  String get javaCouldNotStart => 'Could not start Microsoft login. Please try again.';

  @override
  String get javaCodeExpired => 'The code expired. Please try again.';

  @override
  String get javaSomethingWrong => 'Something went wrong. Please try again.';

  @override
  String get javaCodeCopied => 'Code copied to clipboard';

  @override
  String get splashFeatureConnect => 'Connect';

  @override
  String get splashFeatureFriends => 'Friends';

  @override
  String get splashFeatureChat => 'Chat';

  @override
  String get splashFeatureSkins => 'Skins';

  @override
  String get featureLabelConnector => 'কানেক্টর';

  @override
  String get featureLabelSkins => 'স্কিনস';

  @override
  String get featureLabelWiki => 'উইকি';

  @override
  String get featureLabelPartners => 'অংশীদার';

  @override
  String get featureLabelLookup => 'খোঁজা';

  @override
  String get featureLabelTracker => 'সার্ভার ট্র্যাকার';

  @override
  String get featureSubtitleConnector => 'কনসোল Minecraft-এ সংযুক্ত করুন';

  @override
  String get featureSubtitleSkins => 'Minecraft স্কিন ব্রাউজ ও পরিচালনা করুন';

  @override
  String get featureSubtitleWiki => 'Minecraft বিশ্বকোষ';

  @override
  String get featureSubtitlePartners => 'বৈশিষ্ট্যযুক্ত সার্ভার';

  @override
  String get featureSubtitleLookup => 'Java ও Bedrock প্রোফাইল খুঁজুন';

  @override
  String get featureSubtitleTracker => 'সার্ভার স্ট্যাটাস পর্যবেক্ষণ করুন ও বিজ্ঞপ্তি পান';

  @override
  String get userSearchHint => 'ব্যবহারকারীর নাম, গেমারট্যাগ বা Java নাম…';

  @override
  String get userSearchSub => 'ব্যবহারকারীর নাম, Xbox গেমারট্যাগ বা Java নাম দিয়ে খুঁজুন';

  @override
  String get onlineStatus => 'অনলাইন';

  @override
  String get upgradeWindowsHint => 'মাইক্রোসফট স্টোরে আপগ্রেড পাওয়া যাচ্ছে';

  @override
  String get chatEmptyHint => 'প্রথম কিছু বলুন!';

  @override
  String get skinSaved => 'স্কিন সংরক্ষিত';

  @override
  String skinSavedAs(String name) {
    return '\"$name\" নামে সংরক্ষিত';
  }

  @override
  String get skinExportFailed => 'এক্সপোর্ট ব্যর্থ';

  @override
  String get skinExported => 'স্কিন সফলভাবে এক্সপোর্ট হয়েছে';

  @override
  String get accountActions => 'অ্যাকাউন্ট';

  @override
  String get feedbackBugReport => 'বাগ রিপোর্ট';

  @override
  String get feedbackFeatureRequest => 'ফিচার অনুরোধ';

  @override
  String get feedbackGoesToGithub => 'সরাসরি GitHub-এ যাবে';

  @override
  String get feedbackTitleLabel => 'শিরোনাম';

  @override
  String get feedbackTitleHintBug => 'উদা. স্কিন এডিটর খুলতে গেলে অ্যাপ ক্র্যাশ করে';

  @override
  String get feedbackTitleHintFeature => 'উদা. সার্ভার তালিকায় প্লেয়ারের পিং দেখান';

  @override
  String get feedbackWhatHappened => 'কী হয়েছিল?';

  @override
  String get feedbackDescribeIdea => 'আপনার ধারণা বর্ণনা করুন';

  @override
  String get feedbackDescHintBug => 'বাগটি বর্ণনা করুন — আপনি কী করেছিলেন, কী আশা করেছিলেন এবং পরিবর্তে কী হয়েছিল?';

  @override
  String get feedbackDescHintFeature => 'আপনি কী চান এবং কেন এটি উপকারী হবে তা ব্যাখ্যা করুন।';

  @override
  String get feedbackEmailLabel => 'ইমেইল';

  @override
  String get feedbackEmailHint => 'আমরা যোগাযোগ করতে পারি বলে';

  @override
  String get feedbackEmailNote => 'আপনার ইমেইল কখনো প্রকাশ্যে শেয়ার করা হবে না।';

  @override
  String get feedbackSubmitBug => 'বাগ রিপোর্ট জমা দিন';

  @override
  String get feedbackSubmitFeature => 'ফিচার অনুরোধ জমা দিন';

  @override
  String get feedbackDisclaimer => 'GitHub-এ একটি পাবলিক ইস্যু তৈরি করে · পাসওয়ার্ড অন্তর্ভুক্ত করবেন না';

  @override
  String get feedbackSuccessTitle => 'ফিডব্যাকের জন্য ধন্যবাদ!';

  @override
  String get feedbackSuccessBody => 'আপনার রিপোর্ট জমা দেওয়া হয়েছে এবং GitHub-এ একটি ইস্যু তৈরি হয়েছে। আমরা যত দ্রুত সম্ভব দেখব।';

  @override
  String get feedbackViewOnGithub => 'GitHub-এ দেখুন';

  @override
  String get feedbackSubmitAnother => 'আরেকটি জমা দিন';

  @override
  String get feedbackBackToApp => 'অ্যাপে ফিরে যান';

  @override
  String get feedbackTitleTooShort => 'শিরোনাম কমপক্ষে ৫ অক্ষরের হতে হবে।';

  @override
  String get feedbackDescTooShort => 'বিবরণ কমপক্ষে ১০ অক্ষরের হতে হবে।';

  @override
  String get feedbackEmailInvalid => 'অনুগ্রহ করে একটি বৈধ ইমেইল ঠিকানা দিন।';

  @override
  String get feedbackSubmitFailed => 'জমা দেওয়া ব্যর্থ হয়েছে। আবার চেষ্টা করুন।';

  @override
  String get feedbackTileTitle => 'একটি বাগ রিপোর্ট করুন বা ফিচার সাজেস্ট করুন';

  @override
  String get reportBug => 'Feedback';

  @override
  String get feedbackTileSubtitle => 'MCCompanion উন্নত করতে আমাদের সাহায্য করুন';

  @override
  String get friendsHowToStep1 => 'আপনার ফোন বা কনসোলে Xbox অ্যাপ খুলুন।';

  @override
  String get friendsHowToStep2 => 'নিচের যেকোনো একটি বট Xbox-এ বন্ধু হিসেবে যোগ করুন।';

  @override
  String get friendsHowToStep3 => 'Minecraft খুলুন এবং Friends ট্যাবে যান।';

  @override
  String get friendsHowToStep4 => 'LAN Worlds-এ আপনার সার্ভার খুঁজুন এবং যোগ দিন।';

  @override
  String get friendsHowToNote => '⚠️ প্রতিবার খেলতে চাইলে প্রথমে MCCompanion অ্যাপে Friends mode চালু করুন। চালু করার পরে অ্যাপ বন্ধ করা যাবে।';

  @override
  String get friendsBotLoadError => '⚠️ বট তালিকা লোড করা যায়নি। পরে আবার চেষ্টা করুন।';

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
  String get rpWhatIsThis => 'এটি কী?';

  @override
  String get rpExplanation => 'একটি রিসোর্স প্যাক আপনার কনসোলে Minecraft-এর চেহারা পরিবর্তন করে — নতুন ব্লক, রঙ বা শব্দ। নিচে .mcpack ফাইলের লিঙ্ক পেস্ট করুন, চালু করুন ও সেভ করুন। MCCompanion প্রতিবার সংযোগের সময় স্বয়ংক্রিয়ভাবে লোড করে।';

  @override
  String get rpPackUrlLabel => 'প্যাক URL';

  @override
  String get rpPackUrlHint => 'https://example.com/pack.mcpack';

  @override
  String get rpEnableToggle => 'রিসোর্স প্যাক সক্রিয় করুন';

  @override
  String get rpWhatWorks => 'যা কাজ করে';

  @override
  String get rpSupportedBedrockOnly => 'শুধুমাত্র Bedrock Edition (.mcpack বা .zip)';

  @override
  String get rpSupportedBedrockOnlyHint => 'Java প্যাকগুলো কনসোলে কাজ করে না।';

  @override
  String get rpSupportedTexture => 'রিসোর্স প্যাক ও টেক্সচার প্যাক';

  @override
  String get rpSupportedTextureHint => 'এগুলো আনুষ্ঠানিকভাবে সমর্থিত এবং নির্ভরযোগ্যভাবে কাজ করে।';

  @override
  String get rpUnsupportedShaders => 'শেডার, বিহেভিয়ার প্যাক, স্কিন প্যাক';

  @override
  String get rpUnsupportedShadersHint => 'এগুলো MCCompanion-এর মাধ্যমে কনসোলে লোড হবে না।';

  @override
  String get rpUnsupportedAddons => 'অ্যাড-অন ও UI মড';

  @override
  String get rpUnsupportedAddonsHint => 'কখনো কখনো কাজ করতে পারে, তবে আনুষ্ঠানিকভাবে সমর্থিত নয়। নিজের ঝুঁকিতে ব্যবহার করুন।';

  @override
  String get rpNoDiscord => 'Discord লিঙ্ক — .mcpack এক্সটেনশন নেই এবং কয়েক ঘণ্টায় মেয়াদ শেষ';

  @override
  String get rpNoDrive => 'Google Drive / Dropbox শেয়ার লিঙ্ক — সরাসরি ডাউনলোড নয়';

  @override
  String get rpNoEncrypted => 'এনক্রিপ্টেড বা পাসওয়ার্ড-সুরক্ষিত প্যাক সহ সার্ভার';

  @override
  String get rpConsolePerformanceTitle => 'কনসোল পারফরম্যান্স';

  @override
  String get rpConsolePerformanceBody => 'উচ্চ-রেজোলিউশন টেক্সচার প্যাক কনসোলে ল্যাগ বা ক্র্যাশ ঘটাতে পারে। সমস্যা হলে কম রেজোলিউশনের প্যাকে স্যুইচ করুন বা প্যাক সমর্থন করলে হালকা সাবপ্যাক বেছে নিন।';

  @override
  String get rpWarnDiscord => 'Discord লিঙ্কগুলির মেয়াদ শেষ হয়ে যায় এবং কাজ করা বন্ধ করবে। পরিবর্তে একটি স্থায়ী হোস্ট ব্যবহার করুন।';

  @override
  String get rpWarnHttps => 'URL অবশ্যই https:// দিয়ে শুরু হতে হবে';

  @override
  String get rpWarnExtension => 'URL অবশ্যই .mcpack বা .zip দিয়ে শেষ হতে হবে';

  @override
  String get rpToastEnterUrl => 'রিসোর্স প্যাক সক্রিয় করার আগে একটি URL দিন।';

  @override
  String get rpToastSaved => 'রিসোর্স প্যাক সেটিংস সংরক্ষিত।';

  @override
  String get rpInvalidPackFormat => 'This is a Java Edition pack and is not supported. Please use a Bedrock Edition resource pack.';

  @override
  String get rpClearMinecraftTitle => 'প্রথমবার এই প্যাক দিয়ে?';

  @override
  String get rpClearMinecraftBody => 'Minecraft রিসোর্স প্যাক লোকালি ক্যাশ করে। MCCompanion-এর প্যাক সক্রিয় করার আগে যদি সংযুক্ত হয়ে থাকেন, তাহলে Minecraft মূল প্যাক ক্যাশ করে রেখেছে।';

  @override
  String get rpClearStep1 => 'কনসোলে Minecraft খুলুন ও Settings → Storage-এ যান';

  @override
  String get rpClearStep2 => 'Resource Packs-এর পাশে \'Clear\' বা \'Reset\' চাপুন — এটি সব লোকাললি ক্যাশড প্যাক সরিয়ে দেবে';

  @override
  String get rpClearStep3 => 'MCCompanion-এর মাধ্যমে আবার সংযুক্ত হন — মার্জ করা প্যাক স্বয়ংক্রিয়ভাবে ডাউনলোড হবে';

  @override
  String get rpRelayTitle => 'প্যাক ঠিকমতো দেখাচ্ছে না?';

  @override
  String get rpRelayBody => 'রিলে আপনার overlay URL কে key হিসেবে ব্যবহার করে merged pack ১ ঘন্টা ক্যাশ করে। নতুন merge করতে: pack URL একটু বদলান (যেমন ?v=2 যোগ করুন) এবং সেভ করুন। এরপর Minecraft-এর pack cache-ও পরিষ্কার করুন — merged pack এখনও server-এর UUID ব্যবহার করে, তাই না করলে Minecraft পুরনো cached version দেখাবে।';

  @override
  String get rpWorksGithubHint => 'সরাসরি ডাউনলোড লিঙ্ক — সবসময় অ্যাক্সেসযোগ্য';

  @override
  String get rpWorksCloudflareHint => 'পাবলিক ক্লাউড স্টোরেজ — দ্রুত ও নির্ভরযোগ্য';

  @override
  String get rpWorksDirectHint => 'যেকোনো পাবলিক HTTPS .mcpack বা .zip URL';

  @override
  String get rpNoDiscordHint => 'Discord CDN লিঙ্ক অল্প সময়ের মধ্যে মেয়াদ শেষ হয়';

  @override
  String get rpNoDriveHint => 'সরাসরি ডাউনলোড নেই — প্রিভিউ পেজে রিডাইরেক্ট করে';

  @override
  String get rpNoEncryptedHint => 'MCCompanion এন্ক্রিপ্টেড প্যাক মার্জ করতে পারে না';

  @override
  String get rpClearWhy => 'Minecraft রিসোর্স প্যাক তাদের UUID দিয়ে ক্যাশ করে। মার্জ করা প্যাক সার্ভারের আসল UUID ধরে রাখে — যদি Minecraft আগের কোনো সেশনে (MCCompanion চালু হওয়ার আগে) সার্ভারের প্যাক ক্যাশ করে রাখে, তাহলে নতুন মার্জ করা ভার্সন ডাউনলোড করবে না। ক্যাশ পরিষ্কার করুন যাতে Minecraft তাজা মার্জ করা প্যাক লোড করে।';

  @override
  String get rpUploadTab => 'Upload';

  @override
  String get rpUrlTab => 'URL';

  @override
  String get rpUploadButton => 'Tap to select your pack';

  @override
  String get rpUploadHint => '.mcpack or .zip • max 100 MB';

  @override
  String get rpUploading => 'Uploading...';

  @override
  String get rpMergerTitle => 'RP মার্জার';

  @override
  String get rpMergerSubtitle => 'সর্বোচ্চ ৪টি রিসোর্স প্যাক একত্রিত করুন';

  @override
  String get rpMergerPriorityHint => 'শীর্ষ প্যাকের সর্বোচ্চ অগ্রাধিকার — তার ফাইলগুলো দ্বন্দ্বে জেতে।';

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
  String get rpMergerComplete => 'একত্রীকরণ সম্পন্ন!';

  @override
  String rpMergerConflicts(int count) {
    return '$countটি দ্বন্দ্ব সমাধান হয়েছে — শীর্ষ প্যাক জিতেছে।';
  }

  @override
  String get rpMergerSetActive => 'সক্রিয় রিসোর্স প্যাক হিসেবে সেট করুন';

  @override
  String get rpMergerSetActiveToast => 'সক্রিয় রিসোর্স প্যাক হিসেবে সেট করা হয়েছে';

  @override
  String get rpMergerOpenButton => 'রিসোর্স প্যাক একত্রিত করুন';

  @override
  String get rpMergerOpenSubtitle => '২-৪টি প্যাক একটিতে একত্রিত করুন';

  @override
  String get rpDisabled => 'নিষ্ক্রিয়';

  @override
  String get rpNoPackSelected => 'কোনো রিসোর্স প্যাক নির্বাচিত নয়';

  @override
  String get rpActiveOnConnect => 'সক্রিয় — সংযোগের সময় প্রয়োগ হয়';

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
  String get rpTabBrowseInfo => 'MCCompanion দ্বারা নির্বাচিত প্যাক ব্রাউজ করুন। তাৎক্ষণিকভাবে একটি প্যাক সক্রিয় করতে ব্যবহার করুন ট্যাপ করুন — কোনো আপলোড বা লিঙ্কের প্রয়োজন নেই।';

  @override
  String get rpTabUploadInfo => 'আপনার নিজস্ব .mcpack বা .zip ফাইল আপলোড করুন। MCCompanion এটি ক্লাউডে নিরাপদে সংরক্ষণ করে এবং প্রতিবার সংযোগের সময় আপনার কনসোলে পাঠায়।';

  @override
  String get rpTabUrlInfo => '.mcpack বা .zip ফাইলে একটি সরাসরি ডাউনলোড লিঙ্ক পেস্ট করুন। URL সার্বজনীনভাবে অ্যাক্সেসযোগ্য হতে হবে — Discord বা Google Drive লিঙ্ক নয়।';

  @override
  String get rpTabMergeInfo => '2 থেকে 4টি প্যাক একটিতে একত্রিত করুন। একত্রিত প্যাক MCCompanion Cloud-এ আপলোড হয় এবং স্বয়ংক্রিয়ভাবে সক্রিয় হয়।';

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
  String get rpPackDetailTitle => 'প্যাক বিবরণ';

  @override
  String get skinsSavedToMySkins => 'আমার স্কিনে সংরক্ষিত হয়েছে';

  @override
  String get skinsDownloadFailed => 'ডাউনলোড ব্যর্থ হয়েছে';

  @override
  String get skinsDeletedFromCloud => 'ক্লাউড থেকে মুছে ফেলা হয়েছে';

  @override
  String get skinsDeleteFailed => 'মুছে ফেলা ব্যর্থ হয়েছে';

  @override
  String get skinsLoginToUpload => 'স্কিন আপলোড করতে লগ ইন করুন';

  @override
  String get skinsUploading => 'আপলোড হচ্ছে…';

  @override
  String get skinUploaded => 'স্কিন আপলোড হয়েছে!';

  @override
  String skinUploadFailed(String error) {
    return 'আপলোড ব্যর্থ: $error';
  }

  @override
  String get skinsTabSkins => 'স্কিন';

  @override
  String get skinsTabRecent => 'সাম্প্রতিক';

  @override
  String get skinsEmptyCloudSkins => 'এখনো কোনো ক্লাউড স্কিন নেই। এখানে দেখতে একটি স্কিন আপলোড করুন।';

  @override
  String get skinsEmptyLocalSkins => 'এখনো কোনো স্কিন নেই। শুরু করতে একটি স্কিন তৈরি বা আপলোড করুন।';

  @override
  String get skinUploadToWebsite => 'ওয়েবসাইটে আপলোড করুন';

  @override
  String get skinReuploadToWebsite => 'ওয়েবসাইটে পুনরায় আপলোড করুন';

  @override
  String get skinCloudEdit => 'সম্পাদনা করুন';

  @override
  String get skinCloudSaveToDevice => 'ডিভাইসে সংরক্ষণ করুন';

  @override
  String get skinCloudDelete => 'ক্লাউড থেকে মুছুন';

  @override
  String get skinsTabGallery => 'গ্যালারি';

  @override
  String get skinsGalleryEmpty => 'এখনো কোনো কমিউনিটি স্কিন নেই।';

  @override
  String get skinsTopLabel => 'শীর্ষ ৩০';

  @override
  String get skinsAllLabel => 'সব স্কিন';

  @override
  String get skinUploadToCloud => 'ক্লাউডে আপলোড করুন';

  @override
  String get skinSaveDialog => 'স্কিন সেভ করুন';

  @override
  String get skinNameHint => 'স্কিনের নাম';

  @override
  String get skinDefaultName => 'আমার স্কিন';

  @override
  String get skinUpdatedInCloud => 'ক্লাউডে স্কিন আপডেট হয়েছে';

  @override
  String skinByCreator(String name) {
    return '$name দ্বারা';
  }

  @override
  String skinLikesCount(int count) {
    return '$count পছন্দ';
  }

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
  String get notifEmpty => 'এখনো কোনো বিজ্ঞপ্তি নেই। লাইক, মন্তব্য ও বন্ধুর কার্যক্রম এখানে দেখা যাবে।';

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
  String get notifPrefSkinLiked => 'স্কিন পছন্দ';

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
  String get commentsTitle => 'মন্তব্য';

  @override
  String get commentsEmpty => 'এখনো কোনো মন্তব্য নেই। প্রথম হন!';

  @override
  String get commentsPlaceholder => 'মন্তব্য লিখুন…';

  @override
  String get loadMore => 'আরও লোড করুন';

  @override
  String get skinLayerInner => 'অভ্যন্তরীণ';

  @override
  String get skinLayerOuter => 'বাহ্যিক';
}
