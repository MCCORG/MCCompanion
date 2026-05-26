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
  String get helpNetherlinkTitle => 'MCCompanion দেখা যাচ্ছে না';

  @override
  String get helpNetherlinkSubtitle => 'LAN শনাক্তকরণ সমস্যার সমাধান';

  @override
  String get helpNetherlinkBody => 'যদি আপনার কনসোলে সার্ভারটি না দেখা যায়, তাহলে এই ধাপগুলো চেষ্টা করুন:\r\n\r\n✅ প্রাথমিক পরীক্ষা:\r\n1. একই WiFi নেটওয়ার্ক - আপনার ফোন/ট্যাবলেট এবং কনসোল অবশ্যই একই WiFi-তে থাকতে হবে\r\n2. সঠিক সার্ভার ঠিকানা - IP এবং port আবার পরীক্ষা করুন (ডিফল্ট: 19132)\r\n3. সম্প্রচার সক্রিয় - MCCompanion \\\"Broadcasting\\\" স্ট্যাটাস দেখাচ্ছে কি না নিশ্চিত করুন\r\n\r\n🔄 দ্রুত সমাধান:\r\n• অ্যাপ রিস্টার্ট করুন: সম্প্রচার বন্ধ করুন, MCCompanion পুরোপুরি বন্ধ করুন, আবার খুলে চেষ্টা করুন\r\n• কনসোল রিস্টার্ট করুন: কখনও কখনও LAN game শনাক্ত করতে কনসোলকে রিফ্রেশ করতে হয়\r\n• Friends/LAN ট্যাব পরীক্ষা করুন: সার্ভারটি \\\"Friends\\\" বা \\\"LAN Games\\\" এর নিচে দেখা যায়, server list-এ নয়\r\n• সম্প্রচার শুরু করার পর 10-15 সেকেন্ড অপেক্ষা করুন\r\n• VPN বন্ধ করুন: VPN লোকাল সম্প্রচার ব্লক করতে পারে\r\n\r\n⚠️ সাধারণ সমস্যা:\r\n\\\"No route found for user\\\" → নিশ্চিত করুন যে দুই ডিভাইস একই Wi‑Fi-তে আছে (Guest network এড়িয়ে চলুন)\r\n\\\"Unable to connect to MCCompanion relay server\\\" → আপনার ইন্টারনেট / relay status পরীক্ষা করুন\r\n\r\n📱 এখনও সমস্যা হচ্ছে? MCCompanion-এ Debug Mode চালু করে logs পরীক্ষা করুন, অথবা অন্য কোনো সার্ভার চেষ্টা করুন।';

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
  String get reportUser => 'ব্যবহারকারী রিপোর্ট করুন';
  @override
  String reportUserWithName(String username) => '@$username রিপোর্ট করুন';
  @override
  String get reportMessage => 'বার্তা রিপোর্ট করুন';
  @override
  String get reportDisclaimer => 'আমাদের দল এই রিপোর্ট পর্যালোচনা করবে। কমিউনিটি নিরাপদ রাখার জন্য ধন্যবাদ।';
  @override
  String get reportReasonSpam => 'স্প্যাম';
  @override
  String get reportReasonHarassment => 'হয়রানি বা বুলিং';
  @override
  String get reportReasonInappropriate => 'অনুপযুক্ত বিষয়বস্তু';
  @override
  String get reportReasonOther => 'অন্যান্য';
  @override
  String get reportAdditionalDetails => 'অতিরিক্ত বিবরণ (ঐচ্ছিক)';
  @override
  String get reportSubmit => 'রিপোর্ট জমা দিন';
  @override
  String get reportSuccess => 'রিপোর্ট জমা দেওয়া হয়েছে। ধন্যবাদ।';
  @override
  String get reportFailed => 'রিপোর্ট জমা দেওয়া যায়নি। আবার চেষ্টা করুন।';
  @override
  String get messagePlaceholder => 'বার্তা...';
  @override
  String get noMessagesYet => 'এখনো কোনো বার্তা নেই।\nহ্যালো বলুন!';
  @override
  String get today => 'আজ';
  @override
  String get yesterday => 'গতকাল';
  @override
  String get noConversationsYet => 'এখনো কোনো কথোপকথন নেই';
  @override
  String get startChatHint => 'আপনার বন্ধু তালিকা থেকে চ্যাট শুরু করুন।';
  @override
  String get youPrefix => 'আপনি';
  @override
  String get tabProfile => 'প্রোফাইল';
  @override
  String get tabFriends => 'বন্ধু';
  @override
  String get tabRequests => 'অনুরোধ';
  @override
  String get tabChats => 'চ্যাট';
  @override
  String get addFriend => 'বন্ধু যোগ করুন';
  @override
  String get usernameHint => 'ব্যবহারকারীর নাম';
  @override
  String get send => 'পাঠান';
  @override
  String friendRequestSentTo(String username) => '@$username-এ বন্ধুত্বের অনুরোধ পাঠানো হয়েছে';
  @override
  String alreadyFriendsWith(String username) => 'আপনি ইতিমধ্যে @$username-এর বন্ধু।';
  @override
  String requestAlreadyPending(String username) => '@$username-এর সাথে ইতিমধ্যে একটি মুলতুবি অনুরোধ রয়েছে।';
  @override
  String userNotFoundMsg(String username) => 'ব্যবহারকারী @$username পাওয়া যায়নি।';
  @override
  String cannotSendRequest(String username) => 'আপনি @$username-কে অনুরোধ পাঠাতে পারবেন না।';
  @override
  String get somethingWentWrong => 'কিছু একটা ভুল হয়েছে। আবার চেষ্টা করুন।';
  @override
  String friendRequestAccepted(String username) => '@$username-এর বন্ধুত্বের অনুরোধ গৃহীত হয়েছে';
  @override
  String requestDeclined(String username) => '@$username-এর অনুরোধ প্রত্যাখ্যান করা হয়েছে';
  @override
  String get deleteAccountTitle => 'অ্যাকাউন্ট মুছুন';
  @override
  String get deleteAccountBody => 'এটি আপনার অ্যাকাউন্ট, বার্তা, বন্ধু এবং সমস্ত সম্পর্কিত ডেটা স্থায়ীভাবে মুছে ফেলবে। এই কাজটি পূর্বাবস্থায় ফেরানো যাবে না।';
  @override
  String get deletePermanently => 'স্থায়ীভাবে মুছুন';
  @override
  String get couldNotDeleteAccount => 'অ্যাকাউন্ট মুছতে পারা যায়নি। আবার চেষ্টা করুন।';
  @override
  String get removeFriendTitle => 'বন্ধু সরান';
  @override
  String removeFriendConfirm(String username) => '@$username-কে বন্ধু থেকে সরাতে চান?';
  @override
  String get remove => 'সরান';
  @override
  String friendRemoved(String username) => '@$username আপনার বন্ধু তালিকা থেকে সরানো হয়েছে';
  @override
  String get noFriendsYet => 'এখনো কোনো বন্ধু নেই';
  @override
  String get noFriendsSub => 'উপরের ডানদিকের বোতাম ব্যবহার করে কাউকে যোগ করুন।';
  @override
  String get noPendingRequests => 'কোনো মুলতুবি অনুরোধ নেই';
  @override
  String get requestsAppearHere => 'বন্ধুত্বের অনুরোধ এখানে দেখাবে।';
  @override
  String onlineFriendsLabel(int count) => 'অনলাইন — $count';
  @override
  String offlineFriendsLabel(int count) => 'অফলাইন — $count';
  @override
  String get couldNotUpdateVisibility => 'দৃশ্যমানতা আপডেট করা যায়নি। আবার চেষ্টা করুন।';
  @override
  String get aboutMe => 'আমার সম্পর্কে';
  @override
  String get linkedAccountsTitle => 'সংযুক্ত অ্যাকাউন্ট';
  @override
  String get linkAccountsHint => 'আপনার প্রোফাইলে দেখাতে Minecraft অ্যাকাউন্ট সংযুক্ত করুন।';
  @override
  String get unlinkXboxTitle => 'Xbox অ্যাকাউন্ট আনলিংক করুন';
  @override
  String removeLabelConfirm(String label) => '$label সংযুক্ত অ্যাকাউন্ট থেকে সরাবেন?';
  @override
  String get unlinkJavaTitle => 'Java Edition আনলিংক করুন';
  @override
  String removeJavaConfirm(String username) => '$username সংযুক্ত অ্যাকাউন্ট থেকে সরাবেন?';
  @override
  String get unlink => 'আনলিংক';
  @override
  String get linkXbox => 'Xbox লিংক করুন';
  @override
  String get linkJava => 'Java লিংক করুন';
  @override
  String get appearOfflineLabel => 'অফলাইন দেখান';
  @override
  String get appearOfflineOn => 'বন্ধুরা আপনাকে অফলাইন দেখে';
  @override
  String get appearOfflineOff => 'বন্ধুরা দেখতে পারে আপনি কখন অনলাইন';
  @override
  String get signOut => 'সাইন আউট';
  @override
  String get profileCardTitle => 'প্রোফাইল';
  @override
  String get edit => 'সম্পাদনা';
  @override
  String get displayNameLabel => 'প্রদর্শন নাম';
  @override
  String get bioLabel => 'বায়ো';
  @override
  String get yourNameHint => 'আপনার নাম';
  @override
  String get bioHint => 'নিজের সম্পর্কে কিছু বলুন';
  @override
  String get avatarUrlLabel => 'অবতার URL';
  @override
  String get usernameDisplayLabel => 'ব্যবহারকারীর নাম';
  @override
  String get profileUpdated => 'প্রোফাইল আপডেট হয়েছে';
  @override
  String get findUser => 'ব্যবহারকারী খুঁজুন';
  @override
  String get signIn => 'সাইন ইন';
  @override
  String get createAccount => 'অ্যাকাউন্ট তৈরি করুন';
  @override
  String get signInSubtitle => 'বন্ধু যোগ করতে এবং সেশন শেয়ার করতে সাইন ইন করুন।';
  @override
  String get emailAddressHint => 'ইমেইল ঠিকানা';
  @override
  String get passwordHint => 'পাসওয়ার্ড';
  @override
  String get forgotPassword => 'পাসওয়ার্ড ভুলে গেছেন?';
  @override
  String get continueWithGoogle => 'Google দিয়ে চালিয়ে যান';
  @override
  String get alreadyHaveAccount => 'ইতিমধ্যে অ্যাকাউন্ট আছে? সাইন ইন করুন';
  @override
  String get noAccountYet => 'এখনো অ্যাকাউন্ট নেই? নিবন্ধন করুন';
  @override
  String get orDivider => 'অথবা';
  @override
  String get resetPasswordTitle => 'পাসওয়ার্ড রিসেট করুন';
  @override
  String get resetPasswordBody => 'আপনার ইমেইল ঠিকানা দিন, আমরা পাসওয়ার্ড রিসেটের লিংক পাঠাব।';
  @override
  String get sendLink => 'লিংক পাঠান';
  @override
  String resetLinkSent(String email) => '$email-এ রিসেট লিংক পাঠানো হয়েছে';
  @override
  String get noAccountForEmail => 'এই ইমেইল ঠিকানার জন্য কোনো অ্যাকাউন্ট পাওয়া যায়নি।';
  @override
  String get invalidEmailError => 'অবৈধ ইমেইল ঠিকানা।';
  @override
  String get couldNotSendResetEmail => 'রিসেট ইমেইল পাঠানো যায়নি। আবার চেষ্টা করুন।';
  @override
  String get incorrectEmailOrPassword => 'ভুল ইমেইল বা পাসওয়ার্ড।';
  @override
  String get emailAlreadyInUse => 'এই ইমেইল ঠিকানা ইতিমধ্যে ব্যবহৃত হচ্ছে।';
  @override
  String get weakPassword => 'পাসওয়ার্ড কমপক্ষে ৬ অক্ষরের হতে হবে।';
  @override
  String get googleSignInFailed => 'Google সাইন-ইন ব্যর্থ হয়েছে। আবার চেষ্টা করুন।';
  @override
  String get appleSignInFailed => 'Apple সাইন-ইন ব্যর্থ হয়েছে। আবার চেষ্টা করুন।';
  @override
  String get emailDifferentMethod => 'এই ইমেইলে ভিন্ন সাইন-ইন পদ্ধতিতে ইতিমধ্যে একটি অ্যাকাউন্ট আছে।';
  @override
  String get enterEmailAndPassword => 'অনুগ্রহ করে আপনার ইমেইল এবং পাসওয়ার্ড দিন।';
  @override
  String get profileNotSetUp => 'প্রোফাইল এখনো সেট আপ হয়নি';
  @override
  String get chooseUsernameSubtitle => 'বন্ধু যোগ করতে এবং সেশন শেয়ার করতে একটি ব্যবহারকারীর নাম বেছে নিন।';
  @override
  String get createProfile => 'প্রোফাইল তৈরি করুন';
  @override
  String get chooseUniqueUsername => 'বন্ধু যোগ করতে একটি অনন্য ব্যবহারকারীর নাম বেছে নিন।';
  @override
  String get usernameFieldLabel => 'ব্যবহারকারীর নাম *';
  @override
  String get usernameFormatHint => '৩–২০ অক্ষর · শুধুমাত্র a-z, 0-9 এবং _';
  @override
  String get displayNameOptional => 'প্রদর্শন নাম (ঐচ্ছিক)';
  @override
  String get usernameRequired => 'অনুগ্রহ করে একটি ব্যবহারকারীর নাম দিন।';
  @override
  String get usernameFormatError => '৩–২০ অক্ষর, শুধুমাত্র ছোট হাতের অক্ষর, সংখ্যা এবং _';
  @override
  String get usernameTaken => 'এই ব্যবহারকারীর নামটি ইতিমধ্যে নেওয়া হয়েছে।';
  @override
  String get noConnectionError => 'কোনো সংযোগ নেই। আবার চেষ্টা করুন।';
  @override
  String get usernameExampleHint => 'যেমন: jens_mc';
  @override
  String get displayNameExampleHint => 'যেমন: Jens';
  @override
  String get home => 'হোম';
  @override
  String get info => 'তথ্য';
  @override
  String get consoleConnect => 'Console Connect';
  @override
  String get consoleConnectSubtitle => 'Minecraft সার্ভারে সংযুক্ত হন';
  @override
  String get minecraftSkins => 'Minecraft স্কিন';
  @override
  String get minecraftSkinsSubtitle => 'Java ও Bedrock স্কিন দেখুন ও সম্পাদনা করুন';
  @override
  String get minecraftWiki => 'Minecraft Wiki';
  @override
  String get minecraftWikiSubtitle => 'মব, ব্লক, রেসিপি ও আরো';
  @override
  String get partnerServersLabel => 'পার্টনার সার্ভার';
  @override
  String get partnerServersSubtitle => 'ফিচার্ড Minecraft সার্ভার';
  @override
  String get userLookup => 'Minecraft ব্যবহারকারী অনুসন্ধান';
  @override
  String get userLookupSubtitle => 'Java ও Bedrock প্রোফাইল খুঁজুন';

  @override
  String get navSkins => 'স্কিন';
  @override
  String get navWiki => 'উইকি';
  @override
  String get navProfile => 'প্রোফাইল';

  @override
  String get skinsUpload => 'আপলোড';
  @override
  String get skinsCreate => 'তৈরি করুন';
  @override
  String get skinsSubtitle => 'Minecraft স্কিন দেখুন এবং ডাউনলোড করুন।';
  @override
  String get skinsSectionRecent => 'সাম্প্রতিক স্কিন';
  @override
  String get skinsSectionMy => 'আমার স্কিন';
  @override
  String get skinsSectionYours => 'আপনার স্কিন';
  @override
  String get skinsEmptyMySkins => 'এখনো কোনো স্কিন সেভ করা নেই। শুরু করতে একটি স্কিন তৈরি বা আপলোড করুন।';
  @override
  String get skinsCouldNotLoad => 'স্কিন লোড করা যায়নি';
  @override
  String skinsPageOf(int page, int total) => 'পৃষ্ঠা $page / $total';
  @override
  String get skinsMustBe64 => 'স্কিন অবশ্যই 64×64 পিক্সেল হতে হবে';
  @override
  String get skinsInvalidFile => 'অবৈধ ছবি ফাইল';
  @override
  String get skinsDownload => 'ডাউনলোড';
  @override
  String get skinsEdit => 'সম্পাদনা';
  @override
  String get skinsNoAccountsTitle => 'কোনো অ্যাকাউন্ট লিঙ্ক নেই';
  @override
  String get skinsNoAccountsSubtitle => 'আপনার স্কিন দেখতে প্রোফাইলে Java বা Bedrock লিঙ্ক করুন।';
  @override
  String get skinsSignInTitle => 'আপনার স্কিন দেখতে সাইন ইন করুন';
  @override
  String get skinsSignInSubtitle => 'একটি অ্যাকাউন্ট তৈরি করুন এবং প্রোফাইলে Java বা Bedrock লিঙ্ক করুন।';
}
