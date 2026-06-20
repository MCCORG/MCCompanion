// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'MCCompanion';

  @override
  String get console => 'कंसोल';

  @override
  String get consoleOutput => 'कंसोल आउटपुट';

  @override
  String get noLogsYet => 'अभी तक कोई लॉग नहीं';

  @override
  String get startBroadcastingToSeeOutput => 'आउटपुट देखने के लिए ब्रॉडकास्टिंग शुरू करें';

  @override
  String get close => 'बंद करें';

  @override
  String get ok => 'OK';

  @override
  String get joinUs => 'हमसे जुड़ें';

  @override
  String get more => 'और';

  @override
  String get website => 'वेबसाइट';

  @override
  String get howToUseMenu => 'कैसे उपयोग करें';

  @override
  String get support => 'सहायता';

  @override
  String helpText(Object appCreator) {
    return '$appCreator द्वारा बनाया गया।\r\n\r\nकैसे उपयोग करें:\r\n1. अपना Minecraft सर्वर पता और पोर्ट दर्ज करें (डिफ़ॉल्ट: 19132)\r\n   — या ड्रॉपडाउन से पहले से सहेजा गया सर्वर चुनें\r\n2. (वैकल्पिक) अपनी लोकेशन के सबसे पास का Relay Server (EU या US) चुनें\r\n3. शुरू करने के लिए \\\"ब्रॉडकास्टिंग शुरू करें\\\" पर क्लिक करें\r\n4. अपने कंसोल/डिवाइस पर: Minecraft > Play > Friends\r\n5. आपको \\\"MCCompanion\\\" नाम का एक LAN सर्वर दिखाई देना चाहिए\r\n6. MCCompanion के माध्यम से अपने बाहरी सर्वर से जुड़ने के लिए उस पर क्लिक करें\r\n\r\nNintendo Switch (DNS mode):\r\n1. कनेक्शन पैनल में \\\"Nintendo Switch\\\" सक्षम करें\r\n2. एक Relay Server (EU या US) चुनें\r\n3. \\\"DNS Config भेजें\\\" पर क्लिक करें — यह आपकी config को relay पर भेजता है\r\n   (यह LAN सर्वर ब्रॉडकास्ट नहीं करता)\r\n4. अपने Switch पर MCCompanion DNS सेटअप लागू करें और\r\n   MCCompanion के लिए उपयोग होने वाली server entry से जुड़ें\r\n\r\nनोट्स:\r\n- LAN ब्रॉडकास्टिंग के लिए MCCompanion और कंसोल एक ही लोकल नेटवर्क पर होने चाहिए।\r\n- सुझाव: सर्वोत्तम प्रदर्शन के लिए अपने सबसे नज़दीकी relay server को चुनें।';
  }

  @override
  String get serverDetailsLabel => 'सर्वर विवरण';

  @override
  String get start => 'शुरू करें';

  @override
  String get stop => 'रोकें';

  @override
  String get labelJava => 'Java';

  @override
  String get startJavaMode => 'जावा मोड शुरू करें';

  @override
  String get javaInfoTitle => 'जावा मोड';

  @override
  String get javaInfoText => 'Java Edition सर्वरों से कनेक्ट करें';

  @override
  String get howToJavaTitle => 'जावा मोड';

  @override
  String get howToJavaSubtitle => 'MCCompanion के माध्यम से Java Edition सर्वरों से कनेक्ट करें';

  @override
  String get aternosSubtext => 'अपना खुद का मुफ़्त Minecraft सर्वर बनाएँ';

  @override
  String get howToJavaBody => 'जावा मोड — त्वरित चरण:\n1. ऐप में जावा मोड चुनें।\n2. अपने Java Edition सर्वर का पता और पोर्ट दर्ज करें (डिफ़ॉल्ट: 25565)।\n3. \"जावा मोड शुरू करें\" दबाएँ — MCCompanion कनेक्शन को ब्रिज करेगा।\n4. Minecraft Bedrock खोलें और Friends टैब पर जाएँ।\n5. Java सर्वर से जुड़ने के लिए \"MCCompanion\" नाम वाले LAN सर्वर को चुनें।\n\n⚠️ महत्वपूर्ण चेतावनियाँ:\n- एक वैध Java Edition खाता (Microsoft) आवश्यक है।\n- कुछ सर्वर anti-cheat सिस्टम का उपयोग करते हैं जो आपके खाते का पता लगाकर उसे बैन कर सकते हैं।\n- कुछ सर्वर Bedrock क्लाइंट को स्पष्ट रूप से प्रतिबंधित करते हैं — हमेशा सर्वर नियम जाँचें।\n- इस सुविधा के उपयोग से होने वाले किसी भी अकाउंट बैन, निलंबन या अन्य अकाउंट-संबंधित समस्याओं के लिए MCCompanion जिम्मेदार नहीं है।\n- अपने जोखिम पर उपयोग करें।';

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
  String get myServers => 'मेरे सर्वर';

  @override
  String get quickAccessServers => 'त्वरित पहुँच सर्वर';

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
  String get initializing => 'आरंभ किया जा रहा है...';

  @override
  String get createdBy => 'NetherDev द्वारा बनाया गया';

  @override
  String get bedrockBridge => 'बेडरॉक ब्रिज';

  @override
  String get clientDisconnected => 'क्लाइंट डिस्कनेक्ट हो गया — ब्रॉडकास्ट बंद हो गया';

  @override
  String get pleaseEnterServer => '⚠️ कृपया एक सर्वर पता दर्ज करें';

  @override
  String get invalidPort => '⚠️ अमान्य पोर्ट नंबर (1-65535)';

  @override
  String get dnsConfigSent => '✅ DNS config relay को भेज दिया गया';

  @override
  String get broadcastingStarted => 'ब्रॉडकास्टिंग शुरू हो गई';

  @override
  String get broadcastStopped => 'ब्रॉडकास्ट बंद हो गया';

  @override
  String selectedServer(Object name) {
    return '📋 चयनित: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'चयनित: $name';
  }

  @override
  String get noLogsToCopy => 'कॉपी करने के लिए कोई लॉग नहीं';

  @override
  String copiedLogs(Object count) {
    return '$count लॉग एंट्रियाँ क्लिपबोर्ड पर कॉपी की गईं';
  }

  @override
  String get debugEnabled => 'डिबग लॉग सक्षम किए गए';

  @override
  String get debugDisabled => 'डिबग लॉग अक्षम किए गए';

  @override
  String get howToUseTitle => 'MCCompanion का उपयोग कैसे करें';

  @override
  String get iUnderstand => 'मैं समझ गया';

  @override
  String get playOnSwitchTitle => 'Nintendo Switch पर खेलें';

  @override
  String get playWithFriendsTitle => 'दोस्तों के साथ खेलें';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'चयनित: $relayName\r\n\r\nकैसे कनेक्ट करें:\r\n1. अपने Switch Settings में जाएँ और DNS को इस पर बदलें: $relayIp\r\n2. Minecraft खोलें और सूची से एक सर्वर चुनें (जैसे Cubecraft या Hive)।\r\n3. अब आपको अपने सर्वर पर अपने आप भेज दिया जाएगा।';
  }

  @override
  String playInstructionsFriends(Object friend) {
    return 'कैसे कनेक्ट करें:\r\n1. अपने कंसोल पर $friend को मित्र के रूप में जोड़ें।\r\n2. Minecraft खोलें और Friends टैब पर जाएँ।\r\n3. LAN Worlds के अंतर्गत अपने सर्वर को ढूँढें और जुड़ने के लिए उसे चुनें।';
  }

  @override
  String get nldServerLabel => 'MCCompanion सर्वर';

  @override
  String selectRelayLabel(Object name) {
    return 'रिले चुनें $name';
  }

  @override
  String get noSavedServers => 'कोई सहेजा गया सर्वर नहीं';

  @override
  String get savedServers => 'सहेजे गए सर्वर';

  @override
  String get serverAddressHint => 'सर्वर पता';

  @override
  String get portHint => 'पोर्ट';

  @override
  String get manageServers => 'सर्वर प्रबंधित करें';

  @override
  String get manageServersTooltip => 'सर्वर प्रबंधित करें';

  @override
  String get noServerYet => 'अभी तक कोई सेव किया हुआ सर्वर नहीं है।\nएक जोड़ने के लिए मैनेज पर टैप करें।';

  @override
  String get serverNotSelected => 'कोई सर्वर चयनित नहीं है';

  @override
  String get ready => 'तैयार';

  @override
  String get active => 'सक्रिय';

  @override
  String get vpnDetected => 'VPN पाया गया';

  @override
  String get noWifi => 'Wi‑Fi पर नहीं';

  @override
  String get vpnActive => 'हमें पता चला है कि आपका VPN सक्रिय है।\n\nMCCompanion का उपयोग करने से पहले कृपया अपना VPN बंद करें, नहीं तो LAN प्रसारण आपके कंसोल तक नहीं पहुंच सकता।';

  @override
  String get mobileActive => 'पता चला: मोबाइल डेटा\n\nMCCompanion को आपके कंसोल के उसी नेटवर्क पर होना चाहिए। आगे बढ़ने से पहले अपने घर के Wi‑Fi या हॉटस्पॉट से जुड़ें।';

  @override
  String get continueAnyway => 'फिर भी जारी रखें';

  @override
  String get sameWifi => 'एक ही Wi‑Fi नेटवर्क';

  @override
  String get needSameWifi => 'जिस डिवाइस पर MCCompanion चल रहा है, वह उसी Wi‑Fi नेटवर्क पर होना चाहिए जिस पर आपका Minecraft कंसोल जुड़ा है।';

  @override
  String get subscription => 'ऑनलाइन सदस्यता आवश्यक';

  @override
  String get needSubscription => 'हर कंसोल के लिए अलग सक्रिय ऑनलाइन सदस्यता (Xbox Live, PS Plus, NSO) आवश्यक है। इसके बिना MCCompanion दिखाई नहीं देगा।';

  @override
  String get updateAvailable => 'अपडेट उपलब्ध है';

  @override
  String get newVersion => 'ऐप का नया संस्करण उपलब्ध है।\nनवीनतम सुविधाओं और सुधारों के लिए अभी अपडेट करें।';

  @override
  String get later => 'बाद में';

  @override
  String get updateNow => 'अभी अपडेट करें';

  @override
  String get beforeYouStart => 'शुरू करने से पहले';

  @override
  String get stopBroadcasting => 'ब्रॉडकास्टिंग बंद करें';

  @override
  String get startNintendoMode => 'Nintendo मोड शुरू करें';

  @override
  String get startFriendsMode => 'मित्र मोड शुरू करें';

  @override
  String get startBroadcasting => 'ब्रॉडकास्टिंग शुरू करें';

  @override
  String get modeLabel => 'मोड';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'दोस्त';

  @override
  String get nintendoInfoTitle => 'Nintendo Switch DNS मोड';

  @override
  String get nintendoInfoText => 'Nintendo मोड में शुरू करें, अपना DNS सेट करें और किसी चुने हुए सर्वर से जुड़ें।';

  @override
  String get friendModeTitle => 'मित्र मोड';

  @override
  String get friendModeText => 'MCCompanion के मित्र बॉट्स को मित्र के रूप में जोड़ें। मित्र मोड शुरू करें और खेलें';

  @override
  String get selectedRelayCheck => 'चयनित';

  @override
  String relayFallbackWarning(Object name) {
    return 'चेतावनी: मूल relay ने जवाब नहीं दिया। Fallback relay उपयोग में है: $name';
  }

  @override
  String get relayUnableConnect => 'किसी भी MCCompanion relay server से कनेक्ट नहीं हो सका। बाद में फिर प्रयास करें या अपना इंटरनेट जाँचें।';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / प्रॉक्सी)';

  @override
  String get howToXboxSubtitle => 'LAN ब्रॉडकास्ट या प्रॉक्सी के माध्यम से खेलें';

  @override
  String get howToXboxBody => 'कैसे कनेक्ट करें (Xbox / PS4 / PS5):\r\n1. सुनिश्चित करें कि MCCompanion चलाने वाला आपका डिवाइस और आपका कंसोल एक ही लोकल नेटवर्क पर हैं।\r\n2. ऐप में अपना Minecraft server address और port दर्ज करें और \\\"ब्रॉडकास्टिंग शुरू करें\\\" दबाएँ।\r\n3. कंसोल पर Minecraft → Play खोलें → LAN Worlds या Friends टैब देखें और सूची को रिफ्रेश करें।\r\n4. जुड़ने के लिए \\\"MCCompanion\\\" नाम वाले LAN server को चुनें।\r\nनोट्स:\r\n- यदि सर्वर दिखाई नहीं देता, तो पुष्टि करें कि दोनों डिवाइस एक ही subnet पर हैं और ऐप अभी भी ब्रॉडकास्ट कर रही है।\r\n- कुछ कंसोल मॉडल या राउटर LAN discovery को ब्लॉक कर सकते हैं; जरूरत पड़ने पर ऐप या राउटर सेटिंग्स बदलकर देखें।';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (DNS मोड)';

  @override
  String get howToNintendoSubtitle => 'Switch के लिए DNS रिले निर्देश';

  @override
  String get howToNintendoBody => 'Nintendo Switch — DNS मोड (स्टेप-बाय-स्टेप):\r\n1. ऐप में \\\"Nintendo\\\" मोड सक्षम करें और एक रिले सर्वर (EU या US) चुनें।\r\n2. DNS IP को रिले तक भेजने के लिए \\\"DNS Config भेजें\\\" पर टैप करें।\r\n3. अपने Nintendo Switch पर System Settings → Internet → Internet Settings → (your network) → Change Settings → DNS पर जाएँ और Primary DNS को रिले IP पर सेट करें।\r\n4. Minecraft खोलें और किसी सार्वजनिक सर्वर से जुड़ें; रिले DNS का उपयोग करते हुए आपको आपके सर्वर पर रीडायरेक्ट कर दिया जाएगा।\r\nनोट्स:\r\n- DNS मोड LAN सर्वर ब्रॉडकास्ट नहीं करता; यह गेम ट्रैफ़िक को रिले के माध्यम से रूट करता है।\r\n- काम पूरा होने के बाद यदि सामान्य नेटवर्क व्यवहार चाहिए, तो DNS वापस बदल दें।';

  @override
  String get howToFriendsTitle => 'मित्र मोड';

  @override
  String get howToFriendsSubtitle => 'मित्रों को आमंत्रित करें और LAN के माध्यम से जुड़ें';

  @override
  String get howToFriendsBody => 'मित्र मोड — त्वरित चरण:\r\n1. यदि आवश्यक हो, तो अपने कंसोल या प्लेटफ़ॉर्म पर MCCompanion friend account (relay friend) जोड़ें।\r\n2. ऐप में मित्र मोड सक्षम करें और रिले configuration भेजें (यदि लागू हो)।\r\n3. अपने कंसोल पर Minecraft → Friends खोलें और LAN Worlds खोजें — आपका सर्वर वहाँ LAN world के रूप में दिखाई देना चाहिए।\r\n4. मित्रों के साथ अपने सर्वर से जुड़ने के लिए उसे चुनें।\r\nनोट्स:\r\n- सुनिश्चित करें कि आप और आपके मित्र एक जैसे NAT/settings का उपयोग कर रहे हैं जो friend presence की अनुमति देते हैं।\r\n- मित्र मोड प्लेटफ़ॉर्म के friend features पर निर्भर करता है और friend requests स्वीकार करने की आवश्यकता हो सकती है।';

  @override
  String get helpMCCompanionTitle => 'MCCompanion दिखाई नहीं दे रहा';

  @override
  String get helpMCCompanionSubtitle => 'LAN खोज संबंधी समस्याओं का समाधान';

  @override
  String get helpMCCompanionBody => 'यदि सर्वर आपके कंसोल पर दिखाई नहीं दे रहा है, तो ये चरण आज़माएँ:\r\n\r\n✅ बुनियादी जाँच:\r\n1. एक ही WiFi नेटवर्क - आपका फ़ोन/टैबलेट और कंसोल एक ही WiFi पर होना चाहिए\r\n2. सही सर्वर पता - IP और port दोबारा जाँचें (डिफ़ॉल्ट: 19132)\r\n3. ब्रॉडकास्टिंग सक्रिय - पुष्टि करें कि MCCompanion \\\"Broadcasting\\\" स्थिति दिखा रहा है\r\n\r\n🔄 त्वरित समाधान:\r\n• ऐप को पुनः आरंभ करें: ब्रॉडकास्टिंग बंद करें, MCCompanion को पूरी तरह बंद करें, फिर दोबारा खोलकर प्रयास करें\r\n• अपने कंसोल को पुनः आरंभ करें: कभी-कभी LAN games का पता लगाने के लिए कंसोल को रिफ्रेश की आवश्यकता होती है\r\n• Friends/LAN टैब जाँचें: सर्वर \\\"Friends\\\" या \\\"LAN Games\\\" के अंतर्गत दिखाई देता है, server list में नहीं\r\n• ब्रॉडकास्टिंग शुरू करने के बाद 10-15 सेकंड प्रतीक्षा करें\r\n• VPN अक्षम करें: VPN लोकल ब्रॉडकास्ट को ब्लॉक कर सकते हैं\r\n\r\n⚠️ सामान्य समस्याएँ:\r\n\\\"No route found for user\\\" → सुनिश्चित करें कि दोनों डिवाइस एक ही Wi‑Fi पर हैं (Guest networks से बचें)\r\n\\\"Unable to connect to MCCompanion relay server\\\" → अपना इंटरनेट / relay status जाँचें\r\n\r\n📱 अभी भी समस्या है? MCCompanion में Debug Mode सक्षम करें और logs जाँचें, या कोई दूसरा सर्वर आज़माएँ।';

  @override
  String get helpMultiplayerFailedTitle => 'मल्टीप्लेयर कनेक्शन विफल';

  @override
  String get helpMultiplayerFailedSubtitle => 'यह MCCompanion त्रुटि क्यों नहीं है, इसका स्पष्टीकरण';

  @override
  String get helpMultiplayerFailedBody => '⚠️ यह MCCompanion की समस्या नहीं है!\r\n\r\nMCCompanion ने आपको सफलतापूर्वक अनुरोधित सर्वर पर रीडायरेक्ट कर दिया। \\\"Multiplayer Connection Failed\\\" संदेश का अर्थ है कि लक्ष्य सर्वर इस समय पहुँच से बाहर है। संभावित कारण:\r\n\r\n• लक्ष्य Minecraft सर्वर ऑफ़लाइन है या अत्यधिक लोड में है\r\n• सर्वर को अपडेटेड client version या किसी विशेष edition की आवश्यकता है\r\n• relay और लक्ष्य सर्वर के बीच नेटवर्क समस्याएँ हैं\r\n\r\nकिसी दूसरे सर्वर से कनेक्ट करने का प्रयास करें या सर्वर के support से संपर्क करें। यदि समस्या कई सर्वरों पर बनी रहती है, तो MCCompanion में Debug Mode सक्षम करें और logs जाँचें।';

  @override
  String get helpNintendoDnsTitle => 'Nintendo DNS काम नहीं कर रहा';

  @override
  String get helpNintendoDnsSubtitle => 'सामान्य DNS / relay समस्याएँ';

  @override
  String get helpNintendoDnsBody => 'यदि Nintendo DNS मोड काम नहीं कर रहा है, तो निम्नलिखित जाँचें:\r\n\r\n1. पुष्टि करें कि आपने ऐप से DNS config भेजा है (DNS Config भेजें)।\r\n2. पुष्टि करें कि आपने Switch पर relay IP को Primary DNS के रूप में लागू किया है।\r\n3. सुनिश्चित करें कि चुना गया relay server (EU/US) ऑनलाइन है और ओवरलोड नहीं है।\r\n4. कुछ नेटवर्क (जैसे captive portals) custom DNS को रोकते हैं — किसी दूसरे नेटवर्क पर परीक्षण करें।\r\n\r\nयदि समस्या बनी रहती है, तो Debug Mode सक्षम करें और logs जाँचें या Friends-mode विकल्प आज़माएँ।';

  @override
  String get helpFriendsModeTitle => 'मित्र मोड काम नहीं कर रहा';

  @override
  String get helpFriendsModeSubtitle => 'सामान्य मित्र समस्याएँ';

  @override
  String get helpFriendsModeBody => 'मित्र मोड के लिए समस्या-निवारण सुझाव:\r\n\r\n1. सुनिश्चित करें कि relay friend account कंसोल पर जोड़ा/स्वीकार किया गया है (यदि आवश्यक हो)।\r\n2. मित्र मोड सक्षम करने के बाद गेम को पुनः आरंभ करें और Friends/LAN टैब को रिफ्रेश करें।\r\n\r\nयदि सर्वर अब भी मित्रों को दिखाई नहीं देता, तो त्रुटियाँ पहचानने के लिए Debug Mode सक्षम करें और logs जाँचें।';

  @override
  String get changeLanguageTitle => 'भाषा बदलें';

  @override
  String get changeLanguage => 'भाषा';

  @override
  String get useSystemLanguage => 'सिस्टम भाषा का उपयोग करें';

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
  String get trackerSignInSubtitle => 'सर्वर ट्रैक करने और ऑफलाइन सूचनाएं पाने के लिए साइन इन करें।';

  @override
  String get signIn => 'साइन इन';

  @override
  String get noServersTracked => 'कोई सर्वर ट्रैक नहीं किया गया';

  @override
  String get trackerEmptySubtitle => 'स्थिति मॉनिटर करने और सूचनाएं पाने के लिए एक Minecraft सर्वर जोड़ें।';

  @override
  String get fillAllFields => 'कृपया सभी फ़ील्ड सही से भरें';

  @override
  String get slotUsedUpgrade => 'आपका निःशुल्क स्लॉट उपयोग में है। अधिक सर्वर के लिए अपग्रेड करें।';

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
  String get notificationsOn => 'सूचनाएं चालू';

  @override
  String get notificationsOff => 'सूचनाएं बंद';

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
  String get customizeSubtitle => 'टाइल्स को पुनर्व्यवस्थित करें और नेविगेशन अनुकूलित करें';

  @override
  String get resetLabel => 'रीसेट';

  @override
  String get tilesSection => 'टाइल्स';

  @override
  String get dragToReorder => 'पुनर्व्यवस्थित करने के लिए खींचें';

  @override
  String get navigationSection => 'नेविगेशन';

  @override
  String get navFixed => 'होम, कनेक्टर और प्रोफ़ाइल हमेशा स्थिर रहते हैं';

  @override
  String get leftSlot => 'बायां स्लॉट (होम के बगल में)';

  @override
  String get rightSlot => 'दायां स्लॉट (प्रोफ़ाइल के बगल में)';

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
  String get chooseUniqueUsername => 'शुरू करने के लिए एक अनोखा उपयोगकर्ता नाम चुनें।';

  @override
  String get usernameFieldLabel => 'उपयोगकर्ता नाम';

  @override
  String get usernameExampleHint => 'जैसे: CoolPlayer123';

  @override
  String get usernameFormatHint => '3–20 अक्षर · केवल अक्षर, संख्याएं और अंडरस्कोर';

  @override
  String get displayNameOptional => 'प्रदर्शन नाम (वैकल्पिक)';

  @override
  String get displayNameExampleHint => 'जैसे: Cool Player';

  @override
  String get usernameRequired => 'उपयोगकर्ता नाम आवश्यक है';

  @override
  String get usernameFormatError => 'उपयोगकर्ता नाम 3–20 अक्षर का होना चाहिए और केवल अक्षर, संख्याएं और अंडरस्कोर हो सकते हैं';

  @override
  String get usernameTaken => 'यह उपयोगकर्ता नाम पहले से लिया गया है';

  @override
  String get noConnectionError => 'कोई कनेक्शन नहीं। अपना इंटरनेट जांचें और पुनः प्रयास करें।';

  @override
  String get home => 'होम';

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
  String get featureLabelConnector => 'कनेक्टर';

  @override
  String get featureLabelSkins => 'स्किन्स';

  @override
  String get featureLabelWiki => 'विकी';

  @override
  String get featureLabelPartners => 'पार्टनर';

  @override
  String get featureLabelLookup => 'खोज';

  @override
  String get featureLabelTracker => 'सर्वर ट्रैकर';

  @override
  String get featureSubtitleConnector => 'कंसोल को Minecraft से कनेक्ट करें';

  @override
  String get featureSubtitleSkins => 'Minecraft स्किन्स ब्राउज़ और प्रबंधित करें';

  @override
  String get featureSubtitleWiki => 'Minecraft विश्वकोश';

  @override
  String get featureSubtitlePartners => 'विशेष सर्वर';

  @override
  String get featureSubtitleLookup => 'Java और Bedrock प्रोफाइल खोजें';

  @override
  String get featureSubtitleTracker => 'सर्वर स्थिति मॉनिटर करें और सूचनाएं पाएं';

  @override
  String get userSearchHint => 'यूज़रनाम, गेमरटैग या Java नाम…';

  @override
  String get userSearchSub => 'यूज़रनाम, Xbox गेमरटैग या Java नाम से खोजें';

  @override
  String get onlineStatus => 'ऑनलाइन';

  @override
  String get upgradeWindowsHint => 'Microsoft Store पर अपग्रेड उपलब्ध है';

  @override
  String get chatEmptyHint => 'पहले कुछ कहो!';

  @override
  String get skinSaved => 'स्किन सेव हुई';

  @override
  String skinSavedAs(String name) {
    return '\"$name\" के रूप में सेव';
  }

  @override
  String get skinExportFailed => 'निर्यात विफल';

  @override
  String get skinExported => 'स्किन सफलतापूर्वक निर्यात हुई';

  @override
  String get accountActions => 'खाता';

  @override
  String get feedbackBugReport => 'बग रिपोर्ट';

  @override
  String get feedbackFeatureRequest => 'फीचर अनुरोध';

  @override
  String get feedbackGoesToGithub => 'सीधे GitHub पर जाता है';

  @override
  String get feedbackTitleLabel => 'शीर्षक';

  @override
  String get feedbackTitleHintBug => 'उदा. स्किन एडिटर खोलने पर ऐप क्रैश होता है';

  @override
  String get feedbackTitleHintFeature => 'उदा. सर्वर सूची में प्लेयर का पिंग दिखाएं';

  @override
  String get feedbackWhatHappened => 'क्या हुआ?';

  @override
  String get feedbackDescribeIdea => 'अपना विचार बताएं';

  @override
  String get feedbackDescHintBug => 'बग का वर्णन करें — आपने क्या किया, क्या उम्मीद थी और इसके बजाय क्या हुआ?';

  @override
  String get feedbackDescHintFeature => 'बताएं कि आप क्या चाहते हैं और यह क्यों उपयोगी होगा।';

  @override
  String get feedbackEmailLabel => 'ईमेल (वैकल्पिक)';

  @override
  String get feedbackEmailHint => 'ताकि हम आपसे संपर्क कर सकें';

  @override
  String get feedbackEmailNote => 'आपका ईमेल कभी सार्वजनिक नहीं किया जाएगा।';

  @override
  String get feedbackSubmitBug => 'बग रिपोर्ट सबमिट करें';

  @override
  String get feedbackSubmitFeature => 'फीचर अनुरोध सबमिट करें';

  @override
  String get feedbackDisclaimer => 'GitHub पर एक सार्वजनिक इशू बनाता है · पासवर्ड शामिल न करें';

  @override
  String get feedbackSuccessTitle => 'फीडबैक के लिए धन्यवाद!';

  @override
  String get feedbackSuccessBody => 'आपकी रिपोर्ट सबमिट हो गई है और GitHub पर एक इशू बनाया गया है। हम जल्द से जल्द देखेंगे।';

  @override
  String get feedbackViewOnGithub => 'GitHub पर देखें';

  @override
  String get feedbackSubmitAnother => 'एक और सबमिट करें';

  @override
  String get feedbackBackToApp => 'ऐप पर वापस जाएं';

  @override
  String get feedbackTitleTooShort => 'शीर्षक कम से कम 5 अक्षरों का होना चाहिए।';

  @override
  String get feedbackDescTooShort => 'विवरण कम से कम 10 अक्षरों का होना चाहिए।';

  @override
  String get feedbackSubmitFailed => 'सबमिट करने में विफल। कृपया पुनः प्रयास करें।';

  @override
  String get feedbackTileTitle => 'एक बग रिपोर्ट करें या फीचर सुझाएं';

  @override
  String get feedbackTileSubtitle => 'MCCompanion को बेहतर बनाने में मदद करें';

  @override
  String get friendsHowToStep1 => 'अपने फ़ोन या कंसोल पर Xbox ऐप खोलें।';

  @override
  String get friendsHowToStep2 => 'नीचे दिए गए किसी एक बॉट को Xbox पर मित्र के रूप में जोड़ें।';

  @override
  String get friendsHowToStep3 => 'Minecraft खोलें और Friends टैब पर जाएं।';

  @override
  String get friendsHowToStep4 => 'LAN Worlds में अपना सर्वर खोजें और शामिल हों।';

  @override
  String get friendsHowToNote => '⚠️ हर बार खेलने से पहले MCCompanion ऐप में Friends mode शुरू करें। शुरू करने के बाद ऐप बंद किया जा सकता है।';

  @override
  String get friendsBotLoadError => '⚠️ बॉट सूची लोड नहीं हो सकी। बाद में पुनः प्रयास करें।';

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
  String get rpWhatIsThis => 'यह क्या है?';

  @override
  String get rpExplanation => 'एक रिसोर्स पैक आपके कंसोल पर Minecraft का रूप बदलता है — नए ब्लॉक, रंग या आवाज़ें। नीचे .mcpack फ़ाइल का लिंक पेस्ट करें, चालू करें और सेव करें। MCCompanion हर बार कनेक्ट होने पर इसे अपने आप लोड करता है।';

  @override
  String get rpPackUrlLabel => 'पैक URL';

  @override
  String get rpPackUrlHint => 'https://example.com/pack.mcpack';

  @override
  String get rpEnableToggle => 'रिसोर्स पैक सक्षम करें';

  @override
  String get rpWhatWorks => 'क्या काम करता है';

  @override
  String get rpSupportedBedrockOnly => 'Bedrock Edition only (.mcpack or .zip)';

  @override
  String get rpSupportedBedrockOnlyHint => 'Java packs don\'t work on consoles.';

  @override
  String get rpSupportedTexture => 'Resource packs & texture packs';

  @override
  String get rpSupportedTextureHint => 'These are officially supported and work reliably.';

  @override
  String get rpUnsupportedShaders => 'Shaders, behavior packs, skin packs';

  @override
  String get rpUnsupportedShadersHint => 'These won\'t load on consoles via MCCompanion.';

  @override
  String get rpUnsupportedAddons => 'Add-ons & UI mods';

  @override
  String get rpUnsupportedAddonsHint => 'May sometimes work, but not officially supported. Use at your own risk.';

  @override
  String get rpNoDiscord => 'Discord लिंक — .mcpack एक्सटेंशन नहीं और कुछ घंटों में समाप्त हो जाते हैं';

  @override
  String get rpNoDrive => 'Google Drive / Dropbox शेयर लिंक — सीधे डाउनलोड नहीं';

  @override
  String get rpNoEncrypted => 'एन्क्रिप्टेड या पासवर्ड-सुरक्षित पैक वाले सर्वर';

  @override
  String get rpConsolePerformanceTitle => 'Console performance';

  @override
  String get rpConsolePerformanceBody => 'High-resolution texture packs can cause lag or crashes on consoles. If you experience issues, switch to a lower-resolution pack or select a lighter subpack if the pack supports it.';

  @override
  String get rpWarnDiscord => 'Discord लिंक समाप्त हो जाते हैं और काम करना बंद कर देंगे। इसके बजाय एक स्थायी होस्ट का उपयोग करें।';

  @override
  String get rpWarnHttps => 'URL https:// से शुरू होना चाहिए';

  @override
  String get rpWarnExtension => 'URL .mcpack या .zip से समाप्त होना चाहिए';

  @override
  String get rpToastEnterUrl => 'रिसोर्स पैक सक्षम करने से पहले एक URL दर्ज करें।';

  @override
  String get rpToastSaved => 'रिसोर्स पैक सेटिंग्स सहेजी गईं।';

  @override
  String get rpInvalidPackFormat => 'This is a Java Edition pack and is not supported. Please use a Bedrock Edition resource pack.';

  @override
  String get rpClearMinecraftTitle => 'पहली बार इस पैक के साथ?';

  @override
  String get rpClearMinecraftBody => 'Minecraft रिसोर्स पैक को लोकल में कैश करता है। अगर आपने MCCompanion का पैक एक्टिव करने से पहले इस सर्वर से कनेक्ट किया था, तो Minecraft ने ओरिजिनल पैक कैश कर लिया है।';

  @override
  String get rpClearStep1 => 'अपने कंसोल पर Minecraft खोलें और Settings → Storage में जाएं';

  @override
  String get rpClearStep2 => 'Resource Packs के बगल में ‘Clear’ या ‘Reset’ दबाएं — यह सभी लोकली कैश्ड पैक हटा देगा';

  @override
  String get rpClearStep3 => 'MCCompanion के ज़रिए फिर से कनेक्ट करें — मर्ज किया गया पैक अपने आप डाउनलोड हो जाएगा';

  @override
  String get rpRelayTitle => 'पैक ठीक नहीं दिख रहा?';

  @override
  String get rpRelayBody => 'रिले आपकी overlay URL को key के रूप में उपयोग करके merged pack को 1 घंटे तक cache करता है। नई merge के लिए: pack URL थोड़ा बदलें (जैसे ?v=2 जोड़ें) और save करें। इसके बाद Minecraft का pack cache भी साफ़ करें — merged pack अभी भी server का UUID उपयोग करता है, इसलिए Minecraft वरना पुराना cached version दिखाता रहेगा।';

  @override
  String get rpWorksGithubHint => 'सीधा डाउनलोड लिंक — हमेशा उपलब्ध';

  @override
  String get rpWorksCloudflareHint => 'पब्लिक क्लाउड स्टोरेज — तेज़ और भरोसेमंद';

  @override
  String get rpWorksDirectHint => 'कोई भी सार्वजनिक HTTPS .mcpack या .zip URL';

  @override
  String get rpNoDiscordHint => 'Discord CDN लिंक थोड़े समय बाद समाप्त हो जाते हैं';

  @override
  String get rpNoDriveHint => 'सीधा डाउनलोड नहीं — प्रीव्यू पेज पर रीडायरेक्ट करता है';

  @override
  String get rpNoEncryptedHint => 'MCCompanion एन्क्रिप्टेड पैक मर्ज नहीं कर सकता';

  @override
  String get rpClearWhy => 'Minecraft रिसोर्स पैक को उनके UUID से कैश करता है। मर्ज किया गया पैक सर्वर का मूल UUID रखता है — अगर Minecraft ने पहले से किसी पुरानी सेशन में (MCCompanion चालू होने से पहले) सर्वर का पैक कैश किया हुआ है, तो वह नई मर्ज की गई वर्शन डाउनलोड नहीं करेगा। कैश साफ़ करें ताकि Minecraft ताज़ा मर्ज किया पैक लोड करे।';

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
  String get rpMergerTitle => 'RP मर्जर';

  @override
  String get rpMergerSubtitle => '4 तक रिसोर्स पैक संयोजित करें';

  @override
  String get rpMergerPriorityHint => 'शीर्ष पैक की उच्चतम प्राथमिकता है — इसकी फ़ाइलें विवादों में जीतती हैं।';

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
  String get rpMergerComplete => 'मर्ज पूर्ण!';

  @override
  String rpMergerConflicts(int count) {
    return '$count टकराव हल हुए — शीर्ष पैक जीता।';
  }

  @override
  String get rpMergerSetActive => 'सक्रिय रिसोर्स पैक के रूप में सेट करें';

  @override
  String get rpMergerSetActiveToast => 'सक्रिय रिसोर्स पैक के रूप में सेट किया गया';

  @override
  String get rpMergerOpenButton => 'रिसोर्स पैक मर्ज करें';

  @override
  String get rpMergerOpenSubtitle => '2–4 पैक को एक में संयोजित करें';
}
