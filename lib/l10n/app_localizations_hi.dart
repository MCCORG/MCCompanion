// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get console => 'कंसोल';

  @override
  String get modeLabel => 'मोड';

  @override
  String get statusLabel => 'स्थिति';

  @override
  String get seeAll => 'सभी देखें';

  @override
  String get sectionHelp => 'सहायता';

  @override
  String get sectionAdvanced => 'उन्नत';

  @override
  String get versionLabel => 'संस्करण';

  @override
  String get consoleOutput => 'कंसोल आउटपुट';

  @override
  String get noLogsYet => 'अभी तक कोई लॉग नहीं';

  @override
  String get startBroadcastingToSeeOutput =>
      'आउटपुट देखने के लिए ब्रॉडकास्टिंग शुरू करें';

  @override
  String get close => 'बंद करें';

  @override
  String get ok => 'OK';

  @override
  String get back => 'वापस';

  @override
  String get next => 'आगे';

  @override
  String get done => 'हो गया';

  @override
  String get none => 'कोई नहीं';

  @override
  String get onboardingThemeTitle => 'थीम चुनें';

  @override
  String get onboardingThemeSubtitle =>
      'आप बाद में सेटिंग में हर रंग को बदल सकते हैं।';

  @override
  String get onboardingNavTitle => 'त्वरित पहुँच';

  @override
  String get onboardingNavSubtitle => 'नेविगेशन बार के लिए दो सुविधाएँ चुनें।';

  @override
  String get onboardingNavLeftLabel => 'बायाँ बटन';

  @override
  String get onboardingNavRightLabel => 'दायाँ बटन';

  @override
  String get onboardingNavPreviewConnector => 'कनेक्टर';

  @override
  String get onboardingNavPreviewProfile => 'प्रोफ़ाइल';

  @override
  String get onboardingNavPreviewEmpty => 'खाली';

  @override
  String get onboardingCustomizeDetail => 'विस्तार से अनुकूलित करें →';

  @override
  String get website => 'वेबसाइट';

  @override
  String get howToUseMenu => 'कैसे उपयोग करें';

  @override
  String get support => 'सहायता';

  @override
  String get start => 'शुरू करें';

  @override
  String get stop => 'रोकें';

  @override
  String get labelJava => 'Java';

  @override
  String get language => 'हिन्दी';

  @override
  String get discord => 'Discord';

  @override
  String get toggleDebug => 'डिबग टॉगल करें';

  @override
  String get copyLogs => 'लॉग कॉपी करें';

  @override
  String get clear => 'साफ़ करें';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get deleteServer => 'सर्वर हटाएँ';

  @override
  String get delete => 'हटाएँ';

  @override
  String get addServer => 'सर्वर जोड़ें';

  @override
  String get addServersHint => 'बाद में जल्दी कनेक्ट करने के लिए सर्वर जोड़ें';

  @override
  String get serverNameLabel => 'सर्वर नाम *';

  @override
  String get addressLabel => 'पता *';

  @override
  String get portLabel => 'पोर्ट *';

  @override
  String get descriptionLabel => 'विवरण (वैकल्पिक)';

  @override
  String get save => 'सहेजें';

  @override
  String get pleaseEnterServer => '⚠️ कृपया एक सर्वर पता दर्ज करें';

  @override
  String get invalidPort => '⚠️ अमान्य पोर्ट नंबर (1-65535)';

  @override
  String get dataSentToServers => 'डेटा MCCompanion सर्वर पर भेज दिया गया';

  @override
  String selectedServer(Object name) {
    return '📋 चयनित: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'चयनित: $name';
  }

  @override
  String copiedLogs(Object count) {
    return '$count लॉग एंट्रियाँ क्लिपबोर्ड पर कॉपी की गईं';
  }

  @override
  String get debugEnabled => 'डिबग लॉग सक्षम किए गए';

  @override
  String get iUnderstand => 'मैं समझ गया';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'चयनित: $relayName\r\n\r\nकैसे कनेक्ट करें:\r\n1. अपने Switch Settings में जाएँ और DNS को इस पर बदलें: $relayIp\r\n2. Minecraft खोलें और सूची से एक सर्वर चुनें (जैसे Cubecraft या Hive)।\r\n3. अब आपको अपने सर्वर पर अपने आप भेज दिया जाएगा।';
  }

  @override
  String get noSavedServers => 'कोई सहेजा गया सर्वर नहीं';

  @override
  String get savedServers => 'सहेजे गए सर्वर';

  @override
  String get manageServers => 'सर्वर प्रबंधित करें';

  @override
  String get active => 'सक्रिय';

  @override
  String get vpnDetected => 'VPN पाया गया';

  @override
  String get noWifi => 'Wi‑Fi पर नहीं';

  @override
  String get vpnActive =>
      'हमें पता चला है कि आपका VPN सक्रिय है।\n\nMCCompanion का उपयोग करने से पहले कृपया अपना VPN बंद करें, नहीं तो LAN प्रसारण आपके कंसोल तक नहीं पहुंच सकता।';

  @override
  String get mobileActive =>
      'पता चला: मोबाइल डेटा\n\nMCCompanion को आपके कंसोल के उसी नेटवर्क पर होना चाहिए। आगे बढ़ने से पहले अपने घर के Wi‑Fi या हॉटस्पॉट से जुड़ें।';

  @override
  String get continueAnyway => 'फिर भी जारी रखें';

  @override
  String get updateAvailable => 'अपडेट उपलब्ध है';

  @override
  String get stopBroadcasting => 'ब्रॉडकास्टिंग बंद करें';

  @override
  String get startNintendoMode => 'Nintendo मोड शुरू करें';

  @override
  String get startFriendsMode => 'मित्र मोड शुरू करें';

  @override
  String get startBroadcasting => 'ब्रॉडकास्टिंग शुरू करें';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'दोस्त';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / प्रॉक्सी)';

  @override
  String get howToXboxSubtitle => 'LAN से कनेक्ट करें';

  @override
  String get howToXboxBody =>
      'कैसे कनेक्ट करें (Xbox / PS4 / PS5):\r\n1. सुनिश्चित करें कि MCCompanion चलाने वाला आपका डिवाइस और आपका कंसोल एक ही लोकल नेटवर्क पर हैं।\r\n2. ऐप में अपना Minecraft server address और port दर्ज करें और \\\"ब्रॉडकास्टिंग शुरू करें\\\" दबाएँ।\r\n3. कंसोल पर Minecraft → Play खोलें → LAN Worlds या Friends टैब देखें और सूची को रिफ्रेश करें।\r\n4. जुड़ने के लिए \\\"MCCompanion\\\" नाम वाले LAN server को चुनें।\r\nनोट्स:\r\n- यदि सर्वर दिखाई नहीं देता, तो पुष्टि करें कि दोनों डिवाइस एक ही subnet पर हैं और ऐप अभी भी ब्रॉडकास्ट कर रही है।\r\n- कुछ कंसोल मॉडल या राउटर LAN discovery को ब्लॉक कर सकते हैं; जरूरत पड़ने पर ऐप या राउटर सेटिंग्स बदलकर देखें।';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (DNS मोड)';

  @override
  String get howToNintendoSubtitle => 'DNS से कनेक्ट करें';

  @override
  String get howToFriendsTitle => 'मित्र मोड';

  @override
  String get howToFriendsSubtitle => 'फ्रेंड्स से कनेक्ट करें';

  @override
  String get helpMCCompanionTitle => 'MCCompanion दिखाई नहीं दे रहा';

  @override
  String get helpMCCompanionSubtitle => 'LAN खोज संबंधी समस्याओं का समाधान';

  @override
  String get helpMCCompanionBody =>
      'यदि सर्वर आपके कंसोल पर दिखाई नहीं दे रहा है, तो ये चरण आज़माएँ:\r\n\r\n✅ बुनियादी जाँच:\r\n1. एक ही WiFi नेटवर्क - आपका फ़ोन/टैबलेट और कंसोल एक ही WiFi पर होना चाहिए\r\n2. सही सर्वर पता - IP और port दोबारा जाँचें (डिफ़ॉल्ट: 19132)\r\n3. ब्रॉडकास्टिंग सक्रिय - पुष्टि करें कि MCCompanion \\\"Broadcasting\\\" स्थिति दिखा रहा है\r\n\r\n🔄 त्वरित समाधान:\r\n• ऐप को पुनः आरंभ करें: ब्रॉडकास्टिंग बंद करें, MCCompanion को पूरी तरह बंद करें, फिर दोबारा खोलकर प्रयास करें\r\n• अपने कंसोल को पुनः आरंभ करें: कभी-कभी LAN games का पता लगाने के लिए कंसोल को रिफ्रेश की आवश्यकता होती है\r\n• Friends/LAN टैब जाँचें: सर्वर \\\"Friends\\\" या \\\"LAN Games\\\" के अंतर्गत दिखाई देता है, server list में नहीं\r\n• ब्रॉडकास्टिंग शुरू करने के बाद 10-15 सेकंड प्रतीक्षा करें\r\n• VPN अक्षम करें: VPN लोकल ब्रॉडकास्ट को ब्लॉक कर सकते हैं\r\n\r\n⚠️ सामान्य समस्याएँ:\r\n\\\"No route found for user\\\" → सुनिश्चित करें कि दोनों डिवाइस एक ही Wi‑Fi पर हैं (Guest networks से बचें)\r\n\\\"Unable to connect to MCCompanion relay server\\\" → अपना इंटरनेट / relay status जाँचें\r\n\r\n📱 अभी भी समस्या है? MCCompanion में Debug Mode सक्षम करें और logs जाँचें, या कोई दूसरा सर्वर आज़माएँ।';

  @override
  String get helpMultiplayerFailedTitle => 'मल्टीप्लेयर कनेक्शन विफल';

  @override
  String get helpMultiplayerFailedSubtitle =>
      'यह MCCompanion त्रुटि क्यों नहीं है, इसका स्पष्टीकरण';

  @override
  String get helpMultiplayerFailedBody =>
      '⚠️ यह MCCompanion की समस्या नहीं है!\r\n\r\nMCCompanion ने आपको सफलतापूर्वक अनुरोधित सर्वर पर रीडायरेक्ट कर दिया। \\\"Multiplayer Connection Failed\\\" संदेश का अर्थ है कि लक्ष्य सर्वर इस समय पहुँच से बाहर है। संभावित कारण:\r\n\r\n• लक्ष्य Minecraft सर्वर ऑफ़लाइन है या अत्यधिक लोड में है\r\n• सर्वर को अपडेटेड client version या किसी विशेष edition की आवश्यकता है\r\n• relay और लक्ष्य सर्वर के बीच नेटवर्क समस्याएँ हैं\r\n\r\nकिसी दूसरे सर्वर से कनेक्ट करने का प्रयास करें या सर्वर के support से संपर्क करें। यदि समस्या कई सर्वरों पर बनी रहती है, तो MCCompanion में Debug Mode सक्षम करें और logs जाँचें।';

  @override
  String get helpNintendoDnsTitle => 'Nintendo DNS काम नहीं कर रहा';

  @override
  String get helpNintendoDnsSubtitle => 'सामान्य DNS / relay समस्याएँ';

  @override
  String get helpNintendoDnsBody =>
      'यदि Nintendo DNS मोड काम नहीं कर रहा है, तो निम्नलिखित जाँचें:\r\n\r\n1. पुष्टि करें कि आपने ऐप से DNS config भेजा है (DNS Config भेजें)।\r\n2. पुष्टि करें कि आपने Switch पर relay IP को Primary DNS के रूप में लागू किया है।\r\n3. सुनिश्चित करें कि चुना गया relay server (EU/US) ऑनलाइन है और ओवरलोड नहीं है।\r\n4. कुछ नेटवर्क (जैसे captive portals) custom DNS को रोकते हैं, किसी दूसरे नेटवर्क पर परीक्षण करें।\r\n\r\nयदि समस्या बनी रहती है, तो Debug Mode सक्षम करें और logs जाँचें या Friends-mode विकल्प आज़माएँ।';

  @override
  String get helpFriendsModeTitle => 'मित्र मोड काम नहीं कर रहा';

  @override
  String get helpFriendsModeSubtitle => 'सामान्य मित्र समस्याएँ';

  @override
  String get helpFriendsModeBody =>
      'मित्र मोड के लिए समस्या-निवारण सुझाव:\r\n\r\n1. सुनिश्चित करें कि relay friend account कंसोल पर जोड़ा/स्वीकार किया गया है (यदि आवश्यक हो)।\r\n2. मित्र मोड सक्षम करने के बाद गेम को पुनः आरंभ करें और Friends/LAN टैब को रिफ्रेश करें।\r\n\r\nयदि सर्वर अब भी मित्रों को दिखाई नहीं देता, तो त्रुटियाँ पहचानने के लिए Debug Mode सक्षम करें और logs जाँचें।';

  @override
  String get changeLanguageTitle => 'भाषा बदलें';

  @override
  String get changeLanguage => 'भाषा';

  @override
  String get couldNotOpenUrl => 'URL खोला नहीं जा सका';

  @override
  String get serverTrackerTitle => 'सर्वर ट्रैकर';

  @override
  String get removeServerTitle => 'सर्वर हटाएं';

  @override
  String removeServerConfirm(Object name) {
    return 'अपने ट्रैकर से \"$name\" हटाएं?';
  }

  @override
  String get removeServerFailed => 'सर्वर हटाने में विफल';

  @override
  String get refreshStatus => 'स्थिति ताज़ा करें';

  @override
  String get trackerSignInRequired => 'साइन इन आवश्यक है';

  @override
  String get trackerSignInSubtitle =>
      'सर्वर ट्रैक करने और ऑफलाइन सूचनाएं पाने के लिए साइन इन करें।';

  @override
  String get signIn => 'साइन इन';

  @override
  String get noServersTracked => 'कोई सर्वर ट्रैक नहीं किया गया';

  @override
  String get trackerEmptySubtitle =>
      'स्थिति मॉनिटर करने और सूचनाएं पाने के लिए एक Minecraft सर्वर जोड़ें।';

  @override
  String get fillAllFields => 'कृपया सभी फ़ील्ड सही से भरें';

  @override
  String get slotUsedUpgrade =>
      'आपका निःशुल्क स्लॉट उपयोग में है। अधिक सर्वर के लिए अपग्रेड करें।';

  @override
  String get addServerFailed => 'सर्वर जोड़ने में विफल। अपनी जानकारी जांचें।';

  @override
  String get ipAddressLabel => 'IP पता';

  @override
  String get platformLabel => 'प्लेटफ़ॉर्म';

  @override
  String get bedrockLabel => 'Bedrock';

  @override
  String get addLabel => 'जोड़ें';

  @override
  String get statusOnline => 'ऑनलाइन';

  @override
  String get statusOffline => 'ऑफलाइन';

  @override
  String get statusChecking => 'जांच हो रही है...';

  @override
  String get failedUpdateNotifications => 'सूचनाएं अपडेट करने में विफल';

  @override
  String get editServerTitle => 'सर्वर संपादित करें';

  @override
  String get serverNameHint => 'सर्वर का नाम';

  @override
  String get failedSave => 'सहेजने में विफल। पुनः प्रयास करें।';

  @override
  String get serverRenamed => 'सर्वर का नाम बदला गया';

  @override
  String get customizeLabel => 'अनुकूलित करें';

  @override
  String get customizeSubtitle => 'नेविगेशन बार और रंग';

  @override
  String get resetLabel => 'रीसेट';

  @override
  String get navigationSection => 'नेविगेशन';

  @override
  String get navFixed => 'Connector और प्रोफ़ाइल हमेशा स्थिर रहते हैं';

  @override
  String get leftSlot => 'स्लॉट 2';

  @override
  String get outerSlot => 'स्लॉट 1';

  @override
  String get rightSlot => 'स्लॉट 3';

  @override
  String get farSlot => 'स्लॉट 4';

  @override
  String get colorPickerApply => 'लागू करें';

  @override
  String get colorPickerHex => 'Hex';

  @override
  String get textColorSection => 'टेक्स्ट रंग';

  @override
  String get textColorPickerTitle => 'टेक्स्ट रंग';

  @override
  String get textColorHint =>
      'कस्टम टेक्स्ट रंग चुनने के लिए सर्कल पर टैप करें';

  @override
  String get textColorPreviewPrimary => 'प्राथमिक';

  @override
  String get textColorPreviewSecondary => 'द्वितीयक';

  @override
  String get textColorPreviewMuted => 'म्यूट';

  @override
  String get colorSwatchCustom => 'कस्टम';

  @override
  String get accentColorSection => 'एक्सेंट रंग';

  @override
  String get opacityLabel => 'अपारदर्शिता';

  @override
  String get backgroundSection => 'पृष्ठभूमि';

  @override
  String get cardsSection => 'कार्ड';

  @override
  String get editLabel => 'संपादित करें';

  @override
  String get playerLookupJavaEdition => 'Java Edition';

  @override
  String get playerLookupBedrockEdition => 'Bedrock Edition';

  @override
  String get playerLookupLabelUuid => 'UUID';

  @override
  String get playerLookupLabelGamertag => 'गेमरटैग';

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
  String get reportUser => 'उपयोगकर्ता की रिपोर्ट करें';

  @override
  String reportUserWithName(Object name) {
    return '$name की रिपोर्ट करें';
  }

  @override
  String get reportDisclaimer =>
      'रिपोर्ट की समीक्षा हमारी टीम करती है। झूठी रिपोर्ट पर आपके खाते के विरुद्ध कार्रवाई हो सकती है।';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonHarassment => 'उत्पीड़न';

  @override
  String get reportReasonInappropriate => 'अनुचित सामग्री';

  @override
  String get reportReasonOther => 'अन्य';

  @override
  String get reportAdditionalDetails => 'अतिरिक्त विवरण (वैकल्पिक)…';

  @override
  String get reportSuccess => 'रिपोर्ट भेज दी गई। धन्यवाद।';

  @override
  String get reportFailed =>
      'रिपोर्ट भेजने में विफल। कृपया फिर से प्रयास करें।';

  @override
  String get reportSubmit => 'रिपोर्ट भेजें';

  @override
  String get playerLookupSubtitle =>
      'यूज़रनेम से Java या Bedrock खिलाड़ी खोजें';

  @override
  String get playerLookupHint => 'यूज़रनेम दर्ज करें…';

  @override
  String get playerLookupLinked => 'लिंक किए गए खाते मिले';

  @override
  String get playerLookupLabelUsername => 'यूज़रनेम';

  @override
  String get playerLookupLabelTier => 'Tier';

  @override
  String playerLookupCopied(Object value) {
    return '$value कॉपी किया गया';
  }

  @override
  String get addFriend => 'मित्र जोड़ें';

  @override
  String get send => 'Send';

  @override
  String get somethingWentWrong =>
      'कुछ गड़बड़ हो गई। कृपया फिर से प्रयास करें।';

  @override
  String friendRequestAccepted(Object name) {
    return 'अब आप $name के मित्र हैं';
  }

  @override
  String requestDeclined(Object name) {
    return '$name का अनुरोध अस्वीकार किया गया';
  }

  @override
  String get deleteAccountTitle => 'खाता हटाएँ';

  @override
  String get deleteAccountBody =>
      'इससे आपका खाता और सारा डेटा स्थायी रूप से हट जाएगा। इस क्रिया को पूर्ववत नहीं किया जा सकता।';

  @override
  String get deletePermanently => 'स्थायी रूप से हटाएँ';

  @override
  String get couldNotDeleteAccount =>
      'खाता हटाया नहीं जा सका। कृपया फिर से प्रयास करें।';

  @override
  String get removeFriendTitle => 'मित्र हटाएँ';

  @override
  String removeFriendConfirm(Object name) {
    return 'क्या $name को अपने मित्रों से हटाएँ?';
  }

  @override
  String get remove => 'हटाएँ';

  @override
  String friendRemoved(Object name) {
    return '$name को आपके मित्रों से हटा दिया गया';
  }

  @override
  String get emailDifferentMethod =>
      'यह ईमेल किसी दूसरे साइन-इन तरीके से जुड़ा है';

  @override
  String get googleSignInFailed =>
      'Google साइन-इन विफल रहा। कृपया फिर से प्रयास करें।';

  @override
  String get appleSignInFailed =>
      'Apple साइन-इन विफल रहा। कृपया फिर से प्रयास करें।';

  @override
  String get resetPasswordTitle => 'पासवर्ड रीसेट करें';

  @override
  String get resetPasswordBody =>
      'अपना ईमेल पता दर्ज करें, हम आपको पासवर्ड रीसेट करने का लिंक भेजेंगे।';

  @override
  String get emailAddressHint => 'ईमेल पता';

  @override
  String get sendLink => 'लिंक भेजें';

  @override
  String resetLinkSent(Object email) {
    return 'अगर $email के लिए कोई खाता है, तो लिंक भेजा जा रहा है';
  }

  @override
  String get invalidEmailError => 'ईमेल पता मान्य नहीं है';

  @override
  String get couldNotSendResetEmail =>
      'रीसेट ईमेल नहीं भेजा जा सका। कृपया फिर से प्रयास करें।';

  @override
  String get enterEmailAndPassword => 'कृपया अपना ईमेल और पासवर्ड दर्ज करें';

  @override
  String get incorrectEmailOrPassword => 'ईमेल या पासवर्ड गलत है';

  @override
  String get emailAlreadyInUse => 'यह ईमेल पता पहले से उपयोग में है';

  @override
  String get weakPassword =>
      'पासवर्ड बहुत कमज़ोर है। कृपया अधिक मज़बूत पासवर्ड चुनें।';

  @override
  String get createAccount => 'खाता बनाएँ';

  @override
  String get signInSubtitle =>
      'अपनी प्रोफ़ाइल, मित्रों और चैट तक पहुँचने के लिए साइन इन करें।';

  @override
  String get passwordHint => 'पासवर्ड';

  @override
  String get forgotPassword => 'पासवर्ड भूल गए?';

  @override
  String get orDivider => 'or';

  @override
  String get continueWithGoogle => 'Google से जारी रखें';

  @override
  String get alreadyHaveAccount => 'पहले से खाता है? साइन इन करें';

  @override
  String get noAccountYet => 'खाता नहीं है? बनाएँ';

  @override
  String get profileNotSetUp => 'प्रोफ़ाइल सेट नहीं है';

  @override
  String get chooseUsernameSubtitle =>
      'एक यूज़रनेम चुनें ताकि दूसरे खिलाड़ी आपको ढूंढ सकें।';

  @override
  String get createProfile => 'प्रोफ़ाइल बनाएँ';

  @override
  String get findUser => 'उपयोगकर्ता खोजें';

  @override
  String get couldNotUpdateVisibility => 'दृश्यता सेटिंग अपडेट नहीं हो सकी';

  @override
  String get signOut => 'साइन आउट';

  @override
  String get appearOfflineLabel => 'ऑफ़लाइन दिखें';

  @override
  String get appearOfflineOn => 'आप अन्य खिलाड़ियों को ऑफ़लाइन दिखते हैं';

  @override
  String get appearOfflineOff => 'आप अन्य खिलाड़ियों को ऑनलाइन दिखते हैं';

  @override
  String get unlinkXboxTitle => 'Xbox खाता अनलिंक करें';

  @override
  String removeLabelConfirm(Object name) {
    return 'क्या $name को अपने लिंक किए गए खातों से हटाएँ?';
  }

  @override
  String get unlink => 'अनलिंक करें';

  @override
  String get unlinkJavaTitle => 'Java खाता अनलिंक करें';

  @override
  String removeJavaConfirm(Object name) {
    return 'क्या $name को अपने लिंक किए गए खातों से हटाएँ?';
  }

  @override
  String get linkAccountsHint =>
      'अपनी स्किन और आँकड़े दिखाने के लिए अपने Minecraft खाते लिंक करें।';

  @override
  String get linkXbox => 'Xbox लिंक करें';

  @override
  String get linkJava => 'Java लिंक करें';

  @override
  String get profileUpdated => 'प्रोफ़ाइल अपडेट हो गई';

  @override
  String get edit => 'Edit';

  @override
  String get displayNameLabel => 'प्रदर्शित नाम';

  @override
  String get yourNameHint => 'आपका नाम';

  @override
  String get bioLabel => 'Bio';

  @override
  String get bioHint => 'दूसरों को अपने बारे में बताएँ…';

  @override
  String get noFriendsYet => 'अभी कोई मित्र नहीं';

  @override
  String get noFriendsSub => 'मित्र जोड़ें, वे यहाँ दिखेंगे।';

  @override
  String onlineFriendsLabel(Object count) {
    return '$count ऑनलाइन';
  }

  @override
  String offlineFriendsLabel(Object count) {
    return '$count ऑफ़लाइन';
  }

  @override
  String get noPendingRequests => 'कोई लंबित अनुरोध नहीं';

  @override
  String get requestsAppearHere => 'नए मित्र अनुरोध यहाँ दिखाई देंगे।';

  @override
  String get chooseUniqueUsername =>
      'शुरू करने के लिए एक अनोखा उपयोगकर्ता नाम चुनें।';

  @override
  String get usernameFieldLabel => 'उपयोगकर्ता नाम';

  @override
  String get usernameExampleHint => 'जैसे: CoolPlayer123';

  @override
  String get usernameFormatHint =>
      '3–20 अक्षर · केवल अक्षर, संख्याएं और अंडरस्कोर';

  @override
  String get displayNameOptional => 'प्रदर्शन नाम (वैकल्पिक)';

  @override
  String get displayNameExampleHint => 'जैसे: Cool Player';

  @override
  String get usernameRequired => 'उपयोगकर्ता नाम आवश्यक है';

  @override
  String get usernameFormatError =>
      'उपयोगकर्ता नाम 3–20 अक्षर का होना चाहिए और केवल अक्षर, संख्याएं और अंडरस्कोर हो सकते हैं';

  @override
  String get usernameTaken => 'यह उपयोगकर्ता नाम पहले से लिया गया है';

  @override
  String get noConnectionError =>
      'कोई कनेक्शन नहीं। अपना इंटरनेट जांचें और पुनः प्रयास करें।';

  @override
  String get info => 'जानकारी';

  @override
  String get navProfile => 'प्रोफ़ाइल';

  @override
  String serverRemoved(Object name) {
    return '$name हटाया गया';
  }

  @override
  String serverAdded(Object name) {
    return '$name जोड़ा गया';
  }

  @override
  String get paywallRestore => 'रीस्टोर करें';

  @override
  String get paywallMonthly => 'मासिक';

  @override
  String get paywallYearly => 'वार्षिक';

  @override
  String get paywallSavePercent => '~17% बचाएँ';

  @override
  String get paywallSubtitle =>
      'और सर्वर ट्रैक करें और उनके ऑनलाइन\nया ऑफ़लाइन होने पर सूचना पाएँ।';

  @override
  String paywallSlotLabel(Object slots) {
    return '$slots सर्वर स्लॉट';
  }

  @override
  String get paywallPopular => 'लोकप्रिय';

  @override
  String get paywallContinue => 'जारी रखें';

  @override
  String get paywallNoPkgs => 'कोई पैकेज उपलब्ध नहीं है।';

  @override
  String get paywallManaged =>
      'Apple/Google द्वारा प्रबंधित। कभी भी रद्द करें।';

  @override
  String get paywallPurchaseSuccess => 'खरीदारी सफल रही!';

  @override
  String get paywallPurchaseFailed =>
      'खरीदारी विफल रही। कृपया फिर से प्रयास करें।';

  @override
  String get paywallPurchasesRestored => 'खरीदारी रीस्टोर हो गई!';

  @override
  String get paywallNoActivePurchases => 'कोई सक्रिय खरीदारी नहीं मिली।';

  @override
  String get paywallRestoreFailed =>
      'रीस्टोर विफल रहा। कृपया फिर से प्रयास करें।';

  @override
  String get relay => 'Relay';

  @override
  String get serversSection => 'सर्वर';

  @override
  String get selectBedrockAccount => 'Bedrock खाता चुनें';

  @override
  String get infoAndLegal => 'जानकारी और कानूनी';

  @override
  String get legalSection => 'कानूनी';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get privacyPolicySubtitle =>
      'हम आपका डेटा कैसे एकत्र और सुरक्षित करते हैं';

  @override
  String get termsOfService => 'सेवा की शर्तों';

  @override
  String get termsOfServiceSubtitle => 'उपयोग के नियम और शर्तें';

  @override
  String get dataSourcesSection => 'डेटा स्रोत और श्रेय';

  @override
  String get creditMojangTitle => 'Mojang / Microsoft';

  @override
  String get creditMojangSubtitle =>
      'Java खिलाड़ियों की स्किन, UUID और प्रोफ़ाइल डेटा आधिकारिक Mojang API से।';

  @override
  String get creditGeyserTitle => 'GeyserMC';

  @override
  String get creditGeyserSubtitle =>
      'Bedrock स्किन रेंडरिंग। Bedrock खिलाड़ियों की स्किन GeyserMC स्किन सर्वर से ली जाती हैं।';

  @override
  String get creditXboxTitle => 'Xbox / Microsoft';

  @override
  String get creditXboxSubtitle =>
      'Xbox Live के ज़रिए Bedrock खाता लिंकिंग। Gamertag और XUID Microsoft प्रमाणीकरण प्रक्रिया से प्राप्त होते हैं।';

  @override
  String get aboutMCCompanionSection => 'MCCompanion के बारे में';

  @override
  String get aboutMCCompanionDisclaimer =>
      'MCCompanion एक स्वतंत्र ऐप है और Mojang Studios या Microsoft Corporation से संबद्ध, उनके द्वारा समर्थित या प्रायोजित नहीं है।';

  @override
  String get minecraftTrademark =>
      '\"Minecraft\" Microsoft Corporation का ट्रेडमार्क है।';

  @override
  String get nldServerLabelShort => 'MCCompanion Server';

  @override
  String get editServer => 'सर्वर संपादित करें';

  @override
  String get serverNameExampleHint => 'मेरा शानदार सर्वर';

  @override
  String get serverAddressExampleHint => 'play.example.com';

  @override
  String get serverDescriptionExampleHint => 'दोस्तों के साथ सर्वाइवल सर्वर';

  @override
  String get editionLabel => 'संस्करण';

  @override
  String get nameLabel => 'Name';

  @override
  String get ipAddressFieldLabel => 'IP पता';

  @override
  String get portFieldLabel => 'Port';

  @override
  String get platformFieldLabel => 'प्लेटफ़ॉर्म';

  @override
  String get nameValidationError => 'नाम 1 से 50 अक्षरों का होना चाहिए';

  @override
  String get ipRequiredError => 'IP पता आवश्यक है';

  @override
  String get portRangeError => 'पोर्ट 1 और 65535 के बीच होना चाहिए';

  @override
  String get xboxLinkTitle => 'Xbox खाता लिंक करें';

  @override
  String get xboxStartingLogin => 'Xbox लॉगिन शुरू हो रहा है…';

  @override
  String get xboxSignInWithMicrosoft => 'Microsoft से साइन इन करें';

  @override
  String get xboxGoToLink =>
      'नीचे दिए लिंक पर जाएँ और अपना Xbox खाता जोड़ने के लिए कोड दर्ज करें।';

  @override
  String get xboxYourCode => 'आपका कोड';

  @override
  String get xboxTapToCopy => 'कॉपी करने के लिए कोड पर टैप करें';

  @override
  String get xboxOpenLink => 'microsoft.com/link खोलें';

  @override
  String get xboxWaitingForLogin => 'लॉगिन की प्रतीक्षा है…';

  @override
  String get xboxAccountLinked => 'Xbox खाता लिंक हो गया!';

  @override
  String get xboxCodeCopied => 'कोड क्लिपबोर्ड पर कॉपी हो गया';

  @override
  String get xboxCouldNotStart =>
      'Xbox लॉगिन शुरू नहीं हो सका। कृपया फिर से प्रयास करें।';

  @override
  String get xboxCodeExpired =>
      'कोड की समय-सीमा समाप्त हो गई। कृपया फिर से प्रयास करें।';

  @override
  String get xboxSomethingWrong =>
      'कुछ गड़बड़ हो गई। कृपया फिर से प्रयास करें।';

  @override
  String get tryAgain => 'फिर से प्रयास करें';

  @override
  String get userNotFound => 'उपयोगकर्ता नहीं मिला';

  @override
  String get profileSectionLabel => 'प्रोफ़ाइल';

  @override
  String get displayNameRowLabel => 'प्रदर्शित नाम';

  @override
  String get usernameRowLabel => 'यूज़रनेम';

  @override
  String get lastSeenLabel => 'आखिरी बार देखा गया';

  @override
  String get aboutSectionLabel => 'परिचय';

  @override
  String get xboxBedrockLabel => 'Xbox / Bedrock';

  @override
  String get friendRequestSent => 'मित्र अनुरोध भेजा गया';

  @override
  String get alreadyFriendsMsg => 'आप पहले से मित्र हैं।';

  @override
  String get requestAlreadyPendingMsg => 'पहले से एक अनुरोध लंबित है।';

  @override
  String get userNotFoundMsg2 => 'उपयोगकर्ता नहीं मिला।';

  @override
  String get cannotSendRequestMsg =>
      'इस उपयोगकर्ता को अनुरोध नहीं भेजा जा सकता।';

  @override
  String nowFriendsWith(Object username) {
    return 'अब आप @$username के मित्र हैं';
  }

  @override
  String get removeFriendButton => 'मित्र हटाएँ';

  @override
  String get requestSentButton => 'अनुरोध भेजा गया';

  @override
  String get acceptRequestButton => 'अनुरोध स्वीकारें';

  @override
  String get addFriendButton => 'मित्र जोड़ें';

  @override
  String get removeFriendDialogTitle => 'मित्र हटाएँ';

  @override
  String removeFriendDialogBody(Object username) {
    return 'क्या @$username को मित्र सूची से हटाएँ?';
  }

  @override
  String get trackerLimitReached => 'सर्वर सीमा पूरी हुई';

  @override
  String get upgradeButton => 'अपग्रेड करें';

  @override
  String get javaLinkTitle => 'Java Edition लिंक करें';

  @override
  String get javaStartingLogin => 'Microsoft लॉगिन शुरू हो रहा है…';

  @override
  String get javaSignInWithMicrosoft => 'Microsoft से साइन इन करें';

  @override
  String get javaGoToLink =>
      'नीचे दिए लिंक पर जाएँ और अपना Minecraft Java Edition खाता जोड़ने के लिए कोड दर्ज करें।';

  @override
  String get javaYourCode => 'आपका कोड';

  @override
  String get javaTapToCopy => 'कॉपी करने के लिए कोड पर टैप करें';

  @override
  String get javaOpenLink => 'microsoft.com/link खोलें';

  @override
  String get javaWaitingForLogin => 'लॉगिन की प्रतीक्षा है…';

  @override
  String get javaAccountLinked => 'Java Edition लिंक हो गया!';

  @override
  String get javaNoJavaTitle => 'Java Edition नहीं मिला';

  @override
  String get javaNoJavaBody =>
      'जिस Microsoft खाते से आपने साइन इन किया है उसके पास Minecraft Java Edition नहीं है।';

  @override
  String get javaTryDifferentAccount => 'दूसरा खाता आज़माएँ';

  @override
  String get javaCouldNotStart =>
      'Microsoft लॉगिन शुरू नहीं हो सका। कृपया फिर से प्रयास करें।';

  @override
  String get javaCodeExpired =>
      'कोड की समय-सीमा समाप्त हो गई। कृपया फिर से प्रयास करें।';

  @override
  String get javaSomethingWrong =>
      'कुछ गड़बड़ हो गई। कृपया फिर से प्रयास करें।';

  @override
  String get javaCodeCopied => 'कोड क्लिपबोर्ड पर कॉपी हो गया';

  @override
  String get featureLabelConnector => 'कनेक्टर';

  @override
  String get featureLabelSkins => 'स्किन्स';

  @override
  String get featureLabelPartners => 'सर्वर सूची';

  @override
  String get featureLabelLookup => 'खोज';

  @override
  String get featureLabelTracker => 'सर्वर ट्रैकर';

  @override
  String get userSearchHint => 'यूज़रनाम, गेमरटैग या Java नाम…';

  @override
  String get userSearchSub => 'यूज़रनाम, Xbox गेमरटैग या Java नाम से खोजें';

  @override
  String get upgradeWindowsHint => 'Microsoft Store पर अपग्रेड उपलब्ध है';

  @override
  String get accountActions => 'खाता';

  @override
  String get feedbackBugReport => 'बग रिपोर्ट';

  @override
  String get feedbackFeatureRequest => 'फीचर अनुरोध';

  @override
  String get feedbackTitleLabel => 'शीर्षक';

  @override
  String get feedbackTitleHintBug =>
      'उदा. स्किन एडिटर खोलने पर ऐप क्रैश होता है';

  @override
  String get feedbackTitleHintFeature =>
      'उदा. सर्वर सूची में प्लेयर का पिंग दिखाएं';

  @override
  String get feedbackWhatHappened => 'क्या हुआ?';

  @override
  String get feedbackDescribeIdea => 'अपना विचार बताएं';

  @override
  String get feedbackDescHintBug =>
      'बग का वर्णन करें: आपने क्या किया, क्या उम्मीद थी और इसके बजाय क्या हुआ?';

  @override
  String get feedbackDescHintFeature =>
      'बताएं कि आप क्या चाहते हैं और यह क्यों उपयोगी होगा।';

  @override
  String get feedbackSubmitBug => 'बग रिपोर्ट सबमिट करें';

  @override
  String get feedbackSubmitFeature => 'फीचर अनुरोध सबमिट करें';

  @override
  String get feedbackDisclaimer => 'हमारी टीम तक जाता है · पासवर्ड न लिखें';

  @override
  String get feedbackSuccessTitle => 'फीडबैक के लिए धन्यवाद!';

  @override
  String get feedbackSuccessBody =>
      'धन्यवाद! आपकी रिपोर्ट मिल गई। हम ऐप में ही जवाब देते हैं, इसलिए जवाब देखने यहाँ लौटें।';

  @override
  String get feedbackSubmitAnother => 'एक और सबमिट करें';

  @override
  String get feedbackBackToApp => 'ऐप पर वापस जाएं';

  @override
  String get feedbackTitleTooShort =>
      'शीर्षक कम से कम 5 अक्षरों का होना चाहिए।';

  @override
  String get feedbackDescTooShort => 'विवरण कम से कम 10 अक्षरों का होना चाहिए।';

  @override
  String get feedbackSubmitFailed =>
      'सबमिट करने में विफल। कृपया पुनः प्रयास करें।';

  @override
  String get feedbackTileTitle => 'प्रतिक्रिया';

  @override
  String get feedbackTileSubtitle => 'MCCompanion को बेहतर बनाने में मदद करें';

  @override
  String get friendsHowToStep1 => 'अपने फ़ोन या कंसोल पर Xbox ऐप खोलें।';

  @override
  String get friendsHowToStep2 =>
      'नीचे दिए गए किसी एक बॉट को Xbox पर मित्र के रूप में जोड़ें।';

  @override
  String get friendsHowToStep3 => 'Minecraft खोलें और Friends टैब पर जाएं।';

  @override
  String get friendsHowToStep4 =>
      'LAN Worlds में अपना सर्वर खोजें और शामिल हों।';

  @override
  String get friendsHowToNote =>
      '⚠️ हर बार खेलने से पहले MCCompanion ऐप में Friends mode शुरू करें। शुरू करने के बाद ऐप बंद किया जा सकता है।';

  @override
  String get friendsBotLoadError =>
      '⚠️ बॉट सूची लोड नहीं हो सकी। बाद में पुनः प्रयास करें।';

  @override
  String get regionEurope => 'यूरोप';

  @override
  String get regionUnitedStates => 'संयुक्त राज्य अमेरिका';

  @override
  String get yourRegion => 'आपका क्षेत्र';

  @override
  String get botStatusOffline => 'ऑफ़लाइन';

  @override
  String get botStatusFull => 'भरा हुआ';

  @override
  String botFriendCount(Object current, Object max) {
    return '$current / $max मित्र';
  }

  @override
  String botCopied(Object gamertag) {
    return '$gamertag कॉपी किया गया';
  }

  @override
  String get copyLabel => 'कॉपी करें';

  @override
  String get skinSavedToDocuments => 'स्किन डॉक्युमेंट्स में सेव हुई';

  @override
  String get skinMenuExport => 'निर्यात';

  @override
  String get skinMenuDelete => 'हटाएं';

  @override
  String get rpScreenTitle => 'रिसोर्स पैक';

  @override
  String get rpWhatWorks => 'क्या काम करता है';

  @override
  String get rpSupportedBedrockOnly => 'केवल Bedrock Edition (.mcpack या .zip)';

  @override
  String get rpSupportedBedrockOnlyHint => 'Java पैक्स कंसोल पर काम नहीं करते।';

  @override
  String get rpSupportedTexture => 'रिसोर्स पैक्स और टेक्सचर पैक्स';

  @override
  String get rpSupportedTextureHint =>
      'ये आधिकारिक रूप से समर्थित हैं और विश्वसनीय रूप से काम करते हैं।';

  @override
  String get rpUnsupportedShaders => 'शेडर्स, बिहेवियर पैक्स, स्किन पैक्स';

  @override
  String get rpUnsupportedShadersHint =>
      'ये MCCompanion के माध्यम से कंसोल पर लोड नहीं होंगे।';

  @override
  String get rpUnsupportedAddons => 'ऐड-ऑन और UI मॉड्स';

  @override
  String get rpUnsupportedAddonsHint =>
      'कभी-कभी काम कर सकते हैं, लेकिन आधिकारिक रूप से समर्थित नहीं हैं। अपने जोखिम पर उपयोग करें।';

  @override
  String get rpNoDiscord =>
      'Discord लिंक: .mcpack एक्सटेंशन नहीं और कुछ घंटों में समाप्त हो जाते हैं';

  @override
  String get rpNoDrive => 'Google Drive / Dropbox शेयर लिंक: सीधे डाउनलोड नहीं';

  @override
  String get rpNoEncrypted => 'एन्क्रिप्टेड या पासवर्ड-सुरक्षित पैक वाले सर्वर';

  @override
  String get rpConsolePerformanceTitle => 'कंसोल प्रदर्शन';

  @override
  String get rpConsolePerformanceBody =>
      'उच्च-रिज़ॉल्यूशन टेक्सचर पैक्स कंसोल पर लैग या क्रैश का कारण बन सकते हैं। यदि समस्याएं आती हैं, तो कम रिज़ॉल्यूशन पैक पर स्विच करें या यदि पैक समर्थन करता है तो हल्का सबपैक चुनें।';

  @override
  String get rpToastSaved => 'रिसोर्स पैक सेटिंग्स सहेजी गईं।';

  @override
  String get rpInvalidPackFormat =>
      'यह Java Edition पैक है और समर्थित नहीं है। कृपया Bedrock Edition रिसोर्स पैक इस्तेमाल करें।';

  @override
  String get rpBehaviorContentWarning =>
      'इस पैक में बिहेवियर पैक डेटा है, जो सर्वर पर काम नहीं करेगा। टेक्सचर फिर भी काम करेंगे।';

  @override
  String get rpClearMinecraftTitle => 'पहली बार इस पैक के साथ?';

  @override
  String get rpClearStep1 =>
      'अपने कंसोल पर Minecraft खोलें और Settings → Storage में जाएं';

  @override
  String get rpClearStep2 =>
      'Resource Packs के बगल में ‘Clear’ या ‘Reset’ दबाएं, यह सभी लोकली कैश्ड पैक हटा देगा';

  @override
  String get rpClearStep3 =>
      'MCCompanion के ज़रिए फिर से कनेक्ट करें: मर्ज किया गया पैक अपने आप डाउनलोड हो जाएगा';

  @override
  String get rpRelayTitle => 'पैक ठीक नहीं दिख रहा?';

  @override
  String get rpRelayBody =>
      'रिले आपकी overlay URL को key के रूप में उपयोग करके merged pack को 1 घंटे तक cache करता है। नई merge के लिए: pack URL थोड़ा बदलें (जैसे ?v=2 जोड़ें) और save करें। इसके बाद Minecraft का pack cache भी साफ़ करें, merged pack अभी भी server का UUID उपयोग करता है, इसलिए Minecraft वरना पुराना cached version दिखाता रहेगा।';

  @override
  String get rpNoDiscordHint =>
      'Discord CDN लिंक थोड़े समय बाद समाप्त हो जाते हैं';

  @override
  String get rpNoDriveHint =>
      'सीधा डाउनलोड नहीं: प्रीव्यू पेज पर रीडायरेक्ट करता है';

  @override
  String get rpNoEncryptedHint =>
      'MCCompanion एन्क्रिप्टेड पैक मर्ज नहीं कर सकता';

  @override
  String get rpClearWhy =>
      'Minecraft रिसोर्स पैक को उनके UUID से कैश करता है। मर्ज किया गया पैक सर्वर का मूल UUID रखता है, अगर Minecraft ने पहले से किसी पुरानी सेशन में (MCCompanion चालू होने से पहले) सर्वर का पैक कैश किया हुआ है, तो वह नई मर्ज की गई वर्शन डाउनलोड नहीं करेगा। कैश साफ़ करें ताकि Minecraft ताज़ा मर्ज किया पैक लोड करे।';

  @override
  String get rpUploadTab => 'अपलोड';

  @override
  String get rpBrowseTab => 'ब्राउज़';

  @override
  String get rpCategoryRealism => 'यथार्थवादी';

  @override
  String get rpCategoryFaithful => 'Faithful';

  @override
  String get rpCategoryPvp => 'PvP';

  @override
  String get rpCategoryCartoon => 'कार्टून';

  @override
  String get rpCategoryDark => 'डार्क';

  @override
  String get rpCategoryMedieval => 'मध्यकालीन';

  @override
  String get rpCategoryNature => 'प्रकृति';

  @override
  String get rpCategoryThemed => 'थीम आधारित';

  @override
  String get rpCategoryOther => 'अन्य';

  @override
  String get rpUploadButton => 'अपना पैक चुनने के लिए टैप करें';

  @override
  String get rpUploadHint => '.mcpack या .zip • अधिकतम 100 MB';

  @override
  String get rpUploading => 'अपलोड हो रहा है...';

  @override
  String get rpMergerTitle => 'RP मर्जर';

  @override
  String get rpMergerPriorityHint =>
      'शीर्ष पैक की उच्चतम प्राथमिकता है: इसकी फ़ाइलें विवादों में जीतती हैं।';

  @override
  String get rpMergerTopBadge => 'शीर्ष';

  @override
  String get rpMergerAddPacks => 'रिसोर्स पैक जोड़ें';

  @override
  String rpMergerAddAnother(int current) {
    return 'एक और पैक जोड़ें ($current/4)';
  }

  @override
  String get rpMergerFileTypes => '.zip या .mcpack';

  @override
  String get rpMergerMerging => 'मर्ज हो रहा है…';

  @override
  String rpMergerButton(int count) {
    return '$count पैक मर्ज करें';
  }

  @override
  String get rpMergerSetActiveToast =>
      'सक्रिय रिसोर्स पैक के रूप में सेट किया गया';

  @override
  String get rpDisabled => 'अक्षम';

  @override
  String get rpNoPackSelected => 'कोई संसाधन पैक चुना नहीं गया';

  @override
  String get rpActiveOnConnect => 'सक्रिय: कनेक्ट होने पर लागू होता है';

  @override
  String get rpBrowseSubtitle => 'क्यूरेटेड पैक, उपयोग के लिए तैयार';

  @override
  String get rpBrowseEmpty => 'अभी कोई पैक उपलब्ध नहीं';

  @override
  String get rpBrowseEmptyHint => 'क्यूरेटेड पैक के लिए बाद में वापस आएं।';

  @override
  String get rpReplaceFile => 'किसी अन्य फ़ाइल से बदलें';

  @override
  String get rpDropToUpload => 'अपलोड करने के लिए छोड़ें';

  @override
  String get rpTabBrowseInfo =>
      'MCCompanion द्वारा चुने गए पैक ब्राउज़ करें। तुरंत पैक सक्रिय करने के लिए उपयोग करें टैप करें, कोई अपलोड या लिंक की जरूरत नहीं।';

  @override
  String get rpTabUploadInfo =>
      'अपनी खुद की .mcpack या .zip फ़ाइल अपलोड करें। MCCompanion इसे क्लाउड में सुरक्षित रखता है और हर बार कनेक्ट होने पर आपके कंसोल पर भेजता है।';

  @override
  String get rpTabMergeInfo =>
      '2 से 4 पैक को एक में मिलाएं। मर्ज किया गया पैक MCCompanion Cloud पर अपलोड होता है और स्वतः सक्रिय हो जाता है।';

  @override
  String get shareLabel => 'शेयर करें';

  @override
  String get sectionMinecraftAccounts => 'Minecraft अकाउंट';

  @override
  String get sectionSettings => 'सेटिंग्स';

  @override
  String get avatarUpdated => 'अवतार अपडेट हुआ';

  @override
  String get uploadFailed => 'अपलोड विफल';

  @override
  String get profileLinkCopied => 'प्रोफ़ाइल लिंक कॉपी हो गया!';

  @override
  String get shareProfileTooltip => 'प्रोफ़ाइल शेयर करें';

  @override
  String get profileFallbackTitle => 'प्रोफ़ाइल';

  @override
  String get noUsersFound => 'कोई उपयोगकर्ता नहीं मिला';

  @override
  String get skinLabel => 'SKIN';

  @override
  String get skinsLabel => 'स्किन';

  @override
  String get javaEditionBadge => 'Java';

  @override
  String get bedrockEditionBadge => 'Bedrock';

  @override
  String get downloadLabel => 'डाउनलोड';

  @override
  String get justNow => 'अभी';

  @override
  String minutesAgo(int count) {
    return '$countमि पहले';
  }

  @override
  String hoursAgo(int count) {
    return '$countघ पहले';
  }

  @override
  String daysAgo(int count) {
    return '$countदि पहले';
  }

  @override
  String get rpPackInfo => 'जानकारी';

  @override
  String get rpUseThisPack => 'यह पैक उपयोग करें';

  @override
  String get rpViewOnWebsite => 'वेबसाइट पर देखें →';

  @override
  String rpDownloads(int count) {
    return '$count डाउनलोड';
  }

  @override
  String get skinsSavedToMySkins => 'मेरे स्किन्स में सहेजा गया';

  @override
  String get skinsEmptyLocalSkins => 'अभी तक कोई सहेजी गई स्किन नहीं है।';

  @override
  String get sectionRecentActivity => 'हालिया गतिविधि';

  @override
  String get activityNoEvents => 'अभी तक कोई हालिया गतिविधि नहीं।';

  @override
  String get activitySkinUploaded => 'स्किन अपलोड की';

  @override
  String get activitySkinLiked => 'स्किन पसंद की';

  @override
  String get activityPackSubmitted => 'पैक सबमिट किया';

  @override
  String get activityPackApproved => 'पैक स्वीकृत';

  @override
  String get activityPackRejected => 'पैक अस्वीकृत';

  @override
  String get timeJustNow => 'अभी-अभी';

  @override
  String timeMinutesAgo(int count) {
    return '$count मिनट पहले';
  }

  @override
  String timeHoursAgo(int count) {
    return '$count घंटे पहले';
  }

  @override
  String timeDaysAgo(int count) {
    return '$count दिन पहले';
  }

  @override
  String timeMonthsAgo(int count) {
    return '$count महीने पहले';
  }

  @override
  String get sectionNotifications => 'सूचनाएं';

  @override
  String get sectionNotificationTypes => 'सूचना प्रकार';

  @override
  String get notifMarkAllRead => 'सभी को पढ़ा हुआ चिह्नित करें';

  @override
  String get notifEmpty =>
      'अभी कोई सूचना नहीं। लाइक, टिप्पणियां और मित्र गतिविधि यहां दिखेंगी।';

  @override
  String get notifSomeone => 'किसी ने';

  @override
  String notifSkinLiked(String actor) {
    return '$actor ने आपकी स्किन पसंद की';
  }

  @override
  String notifCommentReceived(String actor) {
    return '$actor ने आपकी स्किन पर टिप्पणी की';
  }

  @override
  String get notifPackApproved => 'पैक स्वीकृत';

  @override
  String get notifPackRejected => 'पैक अस्वीकृत';

  @override
  String notifFriendRequest(String actor) {
    return '$actor ने आपको मित्र अनुरोध भेजा';
  }

  @override
  String notifFriendAccepted(String actor) {
    return '$actor ने आपका अनुरोध स्वीकार किया';
  }

  @override
  String notifMessageReceived(String actor) {
    return '$actor का नया संदेश';
  }

  @override
  String get notifPrefCommentReceived => 'टिप्पणी मिली';

  @override
  String get notifPrefPackApproved => 'पैक स्वीकृत';

  @override
  String get notifPrefPackRejected => 'पैक अस्वीकृत';

  @override
  String get notifPrefFriendRequest => 'मित्र अनुरोध';

  @override
  String get notifPrefFriendAccepted => 'मित्र जोड़ा गया';

  @override
  String get notifPrefMessageReceived => 'नया संदेश';

  @override
  String get feedbackLoginRequiredTitle =>
      'प्रतिक्रिया भेजने के लिए लॉग इन करें';

  @override
  String get feedbackLoginRequiredBody =>
      'प्रतिक्रिया आपके MCCompanion खाते से जुड़ी होती है ताकि हम ऐप में सीधे आपको जवाब दे सकें।';

  @override
  String get feedbackLoginButton => 'लॉग इन';

  @override
  String get supportInboxTitle => 'सपोर्ट इनबॉक्स';

  @override
  String get customColour => 'कस्टम रंग';

  @override
  String get featuredServerLabel => 'फ़ीचर्ड सर्वर';

  @override
  String get featuredServerTagline => 'जुड़िए और खेलना शुरू कीजिए।';

  @override
  String get featuredServerPlay => 'खेलें';

  @override
  String rpUploadFailedCode(int code) {
    return 'अपलोड विफल ($code)';
  }

  @override
  String rpUploadFailed(String error) {
    return 'अपलोड विफल: $error';
  }

  @override
  String get rpLoadFailed => 'पैक लोड नहीं हो सके';

  @override
  String get rpRetry => 'फिर कोशिश करें';

  @override
  String get rpSearchHint => 'पैक खोजें…';

  @override
  String rpMergeFailed(String error) {
    return 'मर्ज विफल: $error';
  }

  @override
  String get rpMergerSize => 'आकार';

  @override
  String get rpMergerCreated => 'बनाया गया';

  @override
  String get rpMergerSourcePacks => 'स्रोत पैक';

  @override
  String get rpMergerDropToAdd => 'जोड़ने के लिए छोड़ें';

  @override
  String get rpMergerSavedMerges => 'सेव किए गए मर्ज';

  @override
  String get rpMergerUse => 'इस्तेमाल करें';

  @override
  String get supportInboxShared => 'सभी एडमिन के साथ साझा';

  @override
  String get supportInboxEmpty => 'अभी कोई सपोर्ट चैट नहीं';

  @override
  String get supportReplyingAs =>
      'आप MCCompanion Support के रूप में जवाब दे रहे हैं';

  @override
  String get relayBlocked =>
      'आपका IP या अकाउंट MCCompanion ने ब्लॉक किया है। अगर आपको लगता है कि यह गलती है, हमारे Discord पर आइए।';

  @override
  String relayBlockedWithReason(String reason) {
    return 'आपका IP या अकाउंट MCCompanion ने ब्लॉक किया है।\nकारण: $reason\nअगर आपको लगता है कि यह गलती है, हमारे Discord पर आइए।';
  }

  @override
  String relayConfigFailed(int code) {
    return 'रिले सेट नहीं हो सका (स्टेटस $code)। दूसरा रिले आज़माएं या हमारे Discord पर आइए।';
  }

  @override
  String relayConfigFailedDetail(int code, String detail) {
    return 'रिले सेट नहीं हो सका (स्टेटस $code): $detail। दूसरा रिले आज़माएं या हमारे Discord पर आइए।';
  }

  @override
  String get relayTimeout => 'रिले ने समय पर जवाब नहीं दिया।';

  @override
  String get relayUnreachable => 'रिले तक नहीं पहुंच सके।';

  @override
  String get lookupNotFound => 'खिलाड़ी नहीं मिला।';

  @override
  String get lookupNetworkError => 'नेटवर्क गड़बड़ी। फिर कोशिश करें।';

  @override
  String get lookupBedrockUnavailable => 'Bedrock लुकअप अभी उपलब्ध नहीं है।';

  @override
  String get lookupFailed => 'खोज विफल।';

  @override
  String get myFeedbackTitle => 'मेरा फ़ीडबैक';

  @override
  String get myFeedbackEmpty => 'आपने अभी तक कुछ नहीं भेजा है।';

  @override
  String get myFeedbackOpenList => 'मेरा फ़ीडबैक';

  @override
  String get fbStatusOpen => 'खुला';

  @override
  String get fbStatusPlanned => 'योजना में';

  @override
  String get fbStatusInProgress => 'काम चल रहा है';

  @override
  String get fbStatusImplemented => 'पूरा';

  @override
  String get fbStatusNotPlanned => 'योजना नहीं';

  @override
  String get fbStatusDuplicate => 'डुप्लिकेट';

  @override
  String get fbNoReplies => 'अभी कोई जवाब नहीं। हम यहीं बताएंगे।';

  @override
  String get fbReplyHint => 'इस रिपोर्ट में कुछ जोड़ें…';

  @override
  String get fbFromTeam => 'MCCompanion';

  @override
  String get fbFromYou => 'आप';

  @override
  String get feedbackGoesToTeam => 'सीधे टीम तक जाता है';

  @override
  String get notifFeedbackStatus => 'आपके फ़ीडबैक पर अपडेट';

  @override
  String get notifFeedbackReply => 'आपके फ़ीडबैक का जवाब';

  @override
  String get adminTicketsHeader => 'रिपोर्ट और अनुरोध';

  @override
  String get adminTicketReplyHint => 'इस टिकट पर जवाब दें…';

  @override
  String get chooseServerTitle => 'सर्वर चुनें';

  @override
  String get changeLabel => 'बदलें';

  @override
  String get howToAutoShow => 'शुरू करते समय यह दिखाएं';

  @override
  String get shareServerLabel => 'अपना सर्वर साझा करें';

  @override
  String get shareServerOn => 'दोस्त देख सकते हैं कि आप किस सर्वर पर हैं';

  @override
  String get shareServerOff => 'दोस्त देखते हैं कि आप खेल रहे हैं, कहाँ नहीं';

  @override
  String directHostNotFound(String host) {
    return '$host नहीं मिला। पता जाँचें और फिर से कोशिश करें।';
  }

  @override
  String get directPortBusy =>
      'लोकल पोर्ट नहीं खुल सका। पहले मौजूदा कनेक्शन बंद करें।';

  @override
  String get waitingForConsole => 'आपके कंसोल का इंतज़ार है…';

  @override
  String get consoleFound => 'कंसोल मिल गया';

  @override
  String get consoleLanHint =>
      'अपने कंसोल पर Minecraft खोलें और दोस्त में LAN गेम खोजें।';

  @override
  String get localNetworkBlocked =>
      'MCCompanion आपके लोकल नेटवर्क तक नहीं पहुँच पा रहा है। अपने डिवाइस की सेटिंग में MCCompanion के लिए लोकल नेटवर्क चालू करें और सुनिश्चित करें कि आप Wi-Fi पर हैं।';

  @override
  String directAddressNotSupported(String host) {
    return '$host एक IPv6 पता है। प्रॉक्सी/डायरेक्ट मोड केवल IPv4 का समर्थन करता है। IPv4 पता या होस्टनाम इस्तेमाल करें।';
  }

  @override
  String termsAgreement(String terms, String privacy) {
    return 'मैं $terms और $privacy से सहमत हूँ।';
  }

  @override
  String get verifyEmailTitle => 'अपना ईमेल सत्यापित करें';

  @override
  String get verifyEmailBody =>
      'टिप्पणी करने, स्किन अपलोड करने या पैक भेजने से पहले ज़रूरी है।';

  @override
  String get verifyEmailSent => 'भेज दिया गया, अपना इनबॉक्स देखें।';

  @override
  String get verifyEmailSending => 'भेजा जा रहा है…';

  @override
  String get verifyEmailSend => 'लिंक भेजें';

  @override
  String updateAvailableTitle(Object version) {
    return 'संस्करण $version उपलब्ध है';
  }

  @override
  String updateAvailableBody(Object current) {
    return 'आप $current चला रहे हैं। यह बिल्ड खुद अपडेट नहीं होता।';
  }

  @override
  String get updateAvailableAction => 'डाउनलोड करें';

  @override
  String get updateAvailableDismiss => 'अभी नहीं';

  @override
  String get serverListSearchHint => 'नाम या पते से खोजें';

  @override
  String get serverListEditionAny => 'Java और Bedrock';

  @override
  String get serverListEditionJava => 'केवल Java';

  @override
  String get serverListEditionBedrock => 'केवल Bedrock';

  @override
  String get serverListSortVotes => 'सबसे ज़्यादा वोट';

  @override
  String get serverListSortPlayers => 'सबसे ज़्यादा खिलाड़ी';

  @override
  String get serverListSortPeak => 'सबसे ऊँचा शिखर';

  @override
  String get serverListSortNewest => 'सबसे नए';

  @override
  String get serverListSortName => 'नाम';

  @override
  String get serverListAllCategories => 'सभी';

  @override
  String get serverListPlayersAny => 'कोई भी आकार';

  @override
  String get serverListPlayersHint => 'औसत ऑनलाइन खिलाड़ी';

  @override
  String get serverListLoadFailed => 'सर्वर सूची लोड नहीं हो सकी';

  @override
  String get serverListLoadFailedHint => 'दोबारा कोशिश करने के लिए नीचे खींचें';

  @override
  String get serverListNoMatch => 'कोई सर्वर मेल नहीं खाता';

  @override
  String get serverListNoMatchHint => 'कोई और खोज या श्रेणी आज़माएँ';

  @override
  String get serverCardPlay => 'खेलें';

  @override
  String get serverCardVote => 'वोट करें';

  @override
  String get serverCopyIp => 'IP कॉपी करें';

  @override
  String get serverCopied => 'कॉपी हो गया';

  @override
  String get serverStatPlayers => 'खिलाड़ी';

  @override
  String get serverStatPeak => 'शिखर';

  @override
  String get serverStatUptime => 'अपटाइम';

  @override
  String get serverStatVotesMonth => 'इस महीने के वोट';

  @override
  String get serverBadgeFeatured => 'विशेष';

  @override
  String get serverEditionJava => 'Java';

  @override
  String get serverEditionBedrock => 'Bedrock';

  @override
  String get serverEditionCrossplay => 'क्रॉसप्ले';

  @override
  String get serverSectionMotd => 'आज का संदेश';

  @override
  String get serverLinkDiscord => 'Discord';

  @override
  String get serverLinkWebsite => 'वेबसाइट';

  @override
  String get serverVotesThisMonth => 'इस महीने';

  @override
  String get serverVotesAllTime => 'अब तक';

  @override
  String get serverVoteSignInRequired => 'ऐप से वोट करने के लिए साइन इन करें।';

  @override
  String serverVoteSheetTitle(String name) {
    return '$name को वोट करें';
  }

  @override
  String get serverVoteSheetSubtitle =>
      'आपका Minecraft नाम, ताकि सर्वर जान सके किसे इनाम देना है।';

  @override
  String get serverVoteSheetHint => 'Steve';

  @override
  String get serverVoteSheetButton => 'वोट करें';

  @override
  String get serverVoteSheetLimit => 'हर सर्वर पर दिन में एक वोट।';

  @override
  String get serverVoteDelivered => 'वोट हो गया। आपका इनाम रास्ते में है।';

  @override
  String get serverVoteNoRewards =>
      'वोट हो गया। इस सर्वर पर कोई इनाम सेट नहीं है।';

  @override
  String get serverVoteFailed => 'यह काम नहीं आया, कृपया फिर कोशिश करें।';

  @override
  String get serverVoteOffline =>
      'सर्वर से संपर्क नहीं हो सका। अपना कनेक्शन जाँचें।';

  @override
  String get feedbackViewYourReport => 'अपनी रिपोर्ट देखें';

  @override
  String get showMore => 'और';

  @override
  String get showLess => 'कम';

  @override
  String get lookupRecent => 'हाल के';

  @override
  String get skinsRemovalNotice =>
      'अगले अपडेट में स्किन हटा दी जाएँगी। जिन्हें रखना चाहते हैं उन्हें एक्सपोर्ट करें।';

  @override
  String get feedbackRpNotice =>
      'हम रिसोर्स पैक से जुड़ी रिपोर्ट का जवाब नहीं देते। कुछ पैक बस काम नहीं करते, और कुछ सर्वर कस्टम पैक अस्वीकार कर देते हैं।';
}
