// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get appName => 'MCCompanion';

  @override
  String get console => 'Konsoli';

  @override
  String get consoleOutput => 'Matokeo ya Konsoli';

  @override
  String get noLogsYet => 'Bado hakuna kumbukumbu';

  @override
  String get startBroadcastingToSeeOutput => 'Anza kutangaza ili kuona matokeo';

  @override
  String get close => 'Funga';

  @override
  String get ok => 'OK';

  @override
  String get joinUs => 'Jiunge Nasi';

  @override
  String get more => 'Zaidi';

  @override
  String get website => 'Tovuti';

  @override
  String get howToUseMenu => 'Jinsi ya kutumia';

  @override
  String get support => 'Msaada';

  @override
  String helpText(Object appCreator) {
    return 'Imetengenezwa na $appCreator.\r\n\r\nJinsi ya kutumia:\r\n1. Weka anwani na port ya seva yako ya Minecraft (chaguo-msingi: 19132)\r\n   — au chagua seva iliyohifadhiwa awali kutoka kwenye menyu ya kushuka\r\n2. (Hiari) Chagua Relay Server (EU au US) iliyo karibu zaidi na eneo lako\r\n3. Bofya \"Anza Kutangaza\" ili kuanza\r\n4. Kwenye konsoli/kifaa chako: Minecraft > Play > Friends\r\n5. Unapaswa kuona seva ya LAN inayoitwa \"MCCompanion\"\r\n6. Bofya ili kujiunga na seva yako ya nje kupitia MCCompanion\r\n\r\nNintendo Switch (hali ya DNS):\r\n1. Washa \"Nintendo Switch\" kwenye paneli ya muunganisho\r\n2. Chagua Relay Server (EU au US)\r\n3. Bofya \"Send DNS Config\" — hii hutuma usanidi wako kwa relay\r\n   (hii HAITANGAZI seva ya LAN)\r\n4. Kwenye Switch yako, tumia mipangilio ya DNS ya MCCompanion kisha jiunge\r\n   kwa kutumia ingizo la seva unalotumia kwa MCCompanion\r\n\r\nVidokezo:\r\n- Kwa utangazaji wa LAN, MCCompanion na konsoli lazima ziwe kwenye mtandao mmoja wa ndani.\r\n- Dokezo: Chagua seva ya relay iliyo karibu zaidi nawe kwa utendaji bora.';
  }

  @override
  String get serverDetailsLabel => 'Maelezo ya seva';

  @override
  String get start => 'Anza';

  @override
  String get stop => 'Simamisha';

  @override
  String get labelJava => 'Java';

  @override
  String get startJavaMode => 'Anza hali ya Java';

  @override
  String get javaInfoTitle => 'Hali ya Java';

  @override
  String get javaInfoText => 'Unganisha kwenye seva za Java Edition';

  @override
  String get howToJavaTitle => 'Hali ya Java';

  @override
  String get howToJavaSubtitle => 'Unganisha kwenye seva za Java Edition kupitia MCCompanion';

  @override
  String get aternosSubtext => 'Skapa din egen gratis Minecraft-server';

  @override
  String get howToJavaBody => 'Hali ya Java — hatua za haraka:\n1. Kwenye programu, chagua hali ya Java.\n2. Weka anwani na port ya seva yako ya Java Edition (chaguomsingi: 25565).\n3. Bonyeza \"Anza hali ya Java\" — MCCompanion itaunganisha muunganisho.\n4. Fungua Minecraft Bedrock na uende kwenye kichupo cha Marafiki.\n5. Chagua seva ya LAN inayoitwa \"MCCompanion\" ili kujiunga na seva ya Java.\n\n⚠️ Maonyo muhimu:\n- Akaunti halali ya Java Edition (Microsoft) inahitajika.\n- Baadhi ya seva hutumia mifumo ya anti-cheat ambayo inaweza kugundua na kupiga marufuku akaunti yako.\n- Baadhi ya seva hukataza wazi wateja wa Bedrock — hakikisha unakagua sheria za seva kila wakati.\n- MCCompanion haiwajibiki kwa marufuku, kusimamishwa au matatizo mengine yanayohusiana na akaunti yanayoweza kusababishwa na kutumia kipengele hiki.\n- Tumia kwa hatari yako mwenyewe.';

  @override
  String get language => 'Kiswahili';

  @override
  String get discord => 'Discord';

  @override
  String get toggleDebug => 'Badili hali ya utatuzi';

  @override
  String get copyLogs => 'Nakili kumbukumbu';

  @override
  String get clear => 'Futa';

  @override
  String get cancel => 'Ghairi';

  @override
  String get deleteServer => 'Futa Seva';

  @override
  String get delete => 'Futa';

  @override
  String get myServers => 'Seva Zangu';

  @override
  String get quickAccessServers => 'Seva za ufikiaji wa haraka';

  @override
  String get addServer => 'Ongeza Seva';

  @override
  String get addServersHint => 'Ongeza seva ili kuunganika haraka baadaye';

  @override
  String get serverNameLabel => 'Jina la Seva *';

  @override
  String get addressLabel => 'Anwani *';

  @override
  String get portLabel => 'Porti *';

  @override
  String get descriptionLabel => 'Maelezo (Hiari)';

  @override
  String get save => 'Hifadhi';

  @override
  String get initializing => 'Inaandaliwa...';

  @override
  String get createdBy => 'Imetengenezwa na NetherDev';

  @override
  String get bedrockBridge => 'Daraja la Bedrock';

  @override
  String get clientDisconnected => 'Mteja ametenganishwa — Utangazaji umesimama';

  @override
  String get pleaseEnterServer => '⚠️ Tafadhali weka anwani ya seva';

  @override
  String get invalidPort => '⚠️ Nambari ya port si sahihi (1-65535)';

  @override
  String get dnsConfigSent => '✅ Usanidi wa DNS umetumwa kwa relay';

  @override
  String get broadcastingStarted => 'Utangazaji umeanza';

  @override
  String get broadcastStopped => 'Utangazaji umesimama';

  @override
  String selectedServer(Object name) {
    return '📋 Imechaguliwa: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'Imechaguliwa: $name';
  }

  @override
  String get noLogsToCopy => 'Hakuna kumbukumbu za kunakili';

  @override
  String copiedLogs(Object count) {
    return 'Ime nakili maingizo $count ya kumbukumbu kwenye clipboard';
  }

  @override
  String get debugEnabled => 'Kumbukumbu za utatuzi zimewashwa';

  @override
  String get debugDisabled => 'Kumbukumbu za utatuzi zimezimwa';

  @override
  String get howToUseTitle => 'Jinsi ya kutumia MCCompanion';

  @override
  String get iUnderstand => 'Nimeelewa';

  @override
  String get playOnSwitchTitle => 'Cheza kwenye Nintendo Switch';

  @override
  String get playWithFriendsTitle => 'Cheza na Marafiki';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'Imechaguliwa: $relayName\r\n\r\nJinsi ya kuunganika:\r\n1. Nenda kwenye Mipangilio ya Switch yako na ubadilishe DNS kuwa: $relayIp\r\n2. Fungua Minecraft na uchague seva kutoka kwenye orodha (kama Cubecraft au Hive).\r\n3. Sasa utapelekwa moja kwa moja kwenye seva yako mwenyewe.';
  }

  @override
  String playInstructionsFriends(Object friend) {
    return 'Jinsi ya kuunganika:\r\n1. Kwenye konsoli yako, ongeza $friend kama rafiki.\r\n2. Fungua Minecraft na uende kwenye kichupo cha Friends.\r\n3. Tafuta seva yako chini ya LAN Worlds na uchague ili kujiunga.';
  }

  @override
  String get nldServerLabel => 'SEVA YA MCCompanion';

  @override
  String selectRelayLabel(Object name) {
    return 'Chagua relay $name';
  }

  @override
  String get noSavedServers => 'Hakuna seva zilizohifadhiwa';

  @override
  String get savedServers => 'Seva zilizohifadhiwa';

  @override
  String get serverAddressHint => 'Anwani ya Seva';

  @override
  String get portHint => 'Porti';

  @override
  String get manageServers => 'Dhibiti seva';

  @override
  String get manageServersTooltip => 'Dhibiti seva';

  @override
  String get noServerYet => 'Bado hakuna seva zilizohifadhiwa.\nGusa Dhibiti ili kuongeza moja.';

  @override
  String get serverNotSelected => 'Hakuna seva iliyochaguliwa';

  @override
  String get ready => 'Tayari';

  @override
  String get active => 'Inatumika';

  @override
  String get vpnDetected => 'VPN imegunduliwa';

  @override
  String get noWifi => 'Haupo kwenye Wi‑Fi';

  @override
  String get vpnActive => 'Tumegundua kuwa VPN yako imewashwa.\n\nTafadhali izime kabla ya kutumia MCCompanion, la sivyo matangazo ya LAN yanaweza yasifikie konsoli yako.';

  @override
  String get mobileActive => 'Imegunduliwa: Data ya simu\n\nMCCompanion inahitaji kuwa kwenye mtandao ule ule na konsoli yako. Unganisha kwenye Wi‑Fi ya nyumbani au hotspot kabla ya kuendelea.';

  @override
  String get continueAnyway => 'Endelea hata hivyo';

  @override
  String get sameWifi => 'Mtandao ule ule wa Wi‑Fi';

  @override
  String get needSameWifi => 'Kifaa kinachoendesha MCCompanion LAZIMA kiwe kwenye mtandao ule ule wa Wi‑Fi na konsoli unayotumia kucheza Minecraft.';

  @override
  String get subscription => 'Usajili wa mtandaoni unahitajika';

  @override
  String get needSubscription => 'Kila konsoli inahitaji usajili wake wa mtandaoni ulio hai (Xbox Live, PS Plus, NSO). Bila huo, MCCompanion haitaonekana.';

  @override
  String get updateAvailable => 'Sasisho linapatikana';

  @override
  String get newVersion => 'Toleo jipya la programu linapatikana.\nSasisha sasa kwa vipengele na marekebisho mapya zaidi.';

  @override
  String get later => 'Baadaye';

  @override
  String get updateNow => 'Sasisha sasa';

  @override
  String get beforeYouStart => 'KABLA HUJAANZA';

  @override
  String get stopBroadcasting => 'Simamisha Utangazaji';

  @override
  String get startNintendoMode => 'Anza Hali ya Nintendo';

  @override
  String get startFriendsMode => 'Anza Hali ya Marafiki';

  @override
  String get startBroadcasting => 'Anza Kutangaza';

  @override
  String get modeLabel => 'Hali';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'Marafiki';

  @override
  String get nintendoInfoTitle => 'Hali ya DNS ya Nintendo Switch';

  @override
  String get nintendoInfoText => 'Anza kwenye hali ya Nintendo, weka DNS yako na jiunge na seva iliyopendekezwa.';

  @override
  String get friendModeTitle => 'Hali ya Marafiki';

  @override
  String get friendModeText => 'Ongeza roboti za marafiki za MCCompanion kama rafiki. Anza hali ya Marafiki na ucheze';

  @override
  String get selectedRelayCheck => 'Imechaguliwa';

  @override
  String relayFallbackWarning(Object name) {
    return 'Onyo: relay ya awali haikujibu. Relay mbadala inatumika: $name';
  }

  @override
  String get relayUnableConnect => 'Imeshindikana kuunganika kwa seva YOYOTE ya relay ya MCCompanion. Jaribu tena baadaye au angalia intaneti yako.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / proksi)';

  @override
  String get howToXboxSubtitle => 'Cheza kupitia utangazaji wa LAN au proxy';

  @override
  String get howToXboxBody => 'Jinsi ya kuunganika (Xbox / PS4 / PS5):\r\n1. Hakikisha kifaa chako kinachoendesha MCCompanion na konsoli yako viko kwenye mtandao mmoja wa ndani.\r\n2. Kwenye programu, weka anwani na port ya seva yako ya Minecraft kisha bonyeza \"Anza Kutangaza\".\r\n3. Kwenye konsoli, fungua Minecraft → Play → tafuta LAN Worlds au kichupo cha Friends kisha sasisha orodha.\r\n4. Chagua seva ya LAN iitwayo \"MCCompanion\" ili kujiunga.\r\nVidokezo:\r\n- Ikiwa seva haionekani, hakikisha vifaa vyote viko kwenye subnet moja na programu bado inatangaza.\r\n- Baadhi ya miundo ya konsoli au router inaweza kuzuia ugunduzi wa LAN; jaribu kubadili mipangilio ya programu au router ikihitajika.';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (hali ya DNS)';

  @override
  String get howToNintendoSubtitle => 'Maelekezo ya DNS relay kwa Switch';

  @override
  String get howToNintendoBody => 'Nintendo Switch — hali ya DNS (hatua kwa hatua):\r\n1. Kwenye programu, washa hali ya \"Nintendo\" na uchague Relay Server (EU au US).\r\n2. Gusa \"Send DNS Config\" ili kutuma DNS IP kwa relay.\r\n3. Kwenye Nintendo Switch yako nenda kwenye System Settings → Internet → Internet Settings → (mtandao wako) → Change Settings → DNS na weka Primary DNS kuwa relay IP.\r\n4. Fungua Minecraft na ujiunge na seva ya umma; utaelekezwa kwenye seva yako kwa kutumia relay DNS.\r\nVidokezo:\r\n- Hali ya DNS haitangazi seva ya LAN; inaelekeza trafiki ya mchezo kupitia relay.\r\n- Rudisha DNS yako baada ya kumaliza ikiwa unahitaji tabia ya kawaida ya mtandao.';

  @override
  String get howToFriendsTitle => 'Hali ya Marafiki';

  @override
  String get howToFriendsSubtitle => 'Alika marafiki na ujiunge kupitia LAN';

  @override
  String get howToFriendsBody => 'Hali ya Marafiki — hatua za haraka:\r\n1. Ongeza akaunti ya rafiki ya MCCompanion kwenye konsoli au jukwaa lako ikiwa inahitajika.\r\n2. Kwenye programu washa hali ya Marafiki na utume usanidi wa relay (ikiwa unatumika).\r\n3. Kwenye konsoli yako fungua Minecraft → Friends na utafute LAN Worlds — seva yako inapaswa kuonekana hapo kama ulimwengu wa LAN.\r\n4. Ichague ili kujiunga na seva yako pamoja na marafiki.\r\nVidokezo:\r\n- Hakikisha wewe na marafiki zako mna NAT/mipangilio sawa inayoruhusu uwepo wa marafiki.\r\n- Hali ya Marafiki hutegemea vipengele vya urafiki vya jukwaa na huenda ikahitaji kukubali maombi ya urafiki.';

  @override
  String get helpMCCompanionTitle => 'MCCompanion haionekani';

  @override
  String get helpMCCompanionSubtitle => 'Utatuzi wa matatizo ya ugunduzi wa LAN';

  @override
  String get helpMCCompanionBody => 'Ikiwa seva haionekani kwenye konsoli yako, jaribu hatua hizi:\r\n\r\n✅ Ukaguzi wa msingi:\r\n1. Mtandao ule ule wa WiFi - Simu/tablet yako na konsoli LAZIMA ziwe kwenye WiFi ile ile\r\n2. Anwani sahihi ya seva - Hakiki tena IP na port (chaguo-msingi: 19132)\r\n3. Utangazaji uko hai - Hakikisha MCCompanion inaonyesha hali ya \"Inatangaza\"\r\n\r\n🔄 Marekebisho ya haraka:\r\n• Anzisha tena programu: simamisha utangazaji, funga MCCompanion kabisa, ifungue tena na ujaribu upya\r\n• Anzisha tena konsoli yako: wakati mwingine konsoli huhitaji kusasishwa ili kugundua michezo ya LAN\r\n• Angalia kichupo cha Friends/LAN: seva huonekana chini ya \"Friends\" au \"LAN Games\", SI kwenye orodha ya seva\r\n• Subiri sekunde 10-15 baada ya kuanza kutangaza\r\n• Zima VPN: VPN zinaweza kuzuia matangazo ya ndani\r\n\r\n⚠️ Matatizo ya kawaida:\r\n\"No route found for user\" → Hakikisha vifaa vyote viwili viko kwenye Wi‑Fi ile ile (epuka mitandao ya wageni)\r\n\"Unable to connect to MCCompanion relay server\" → Angalia intaneti yako / hali ya relay\r\n\r\n📱 Bado una matatizo? Washa hali ya utatuzi kwenye MCCompanion na uangalie kumbukumbu, au jaribu seva tofauti.';

  @override
  String get helpMultiplayerFailedTitle => 'Muunganisho wa Multiplayer Umeshindikana';

  @override
  String get helpMultiplayerFailedSubtitle => 'Maelezo kwa nini hili si kosa la MCCompanion';

  @override
  String get helpMultiplayerFailedBody => '⚠️ Hili si tatizo la MCCompanion!\r\n\r\nMCCompanion ilikuelekeza kwa mafanikio kwenye seva iliyoombwa. Ujumbe wa \"Multiplayer Connection Failed\" unaonyesha kuwa seva lengwa haipatikani kwa sasa. Sababu zinazowezekana:\r\n\r\n• Seva lengwa ya Minecraft iko nje ya mtandao au imeelemewa\r\n• Seva inahitaji toleo la mteja lililosasishwa au toleo maalum\r\n• Matatizo ya mtandao kati ya relay na seva lengwa\r\n\r\nJaribu kuunganika kwenye seva tofauti au wasiliana na msaada wa seva husika. Tatizo likiendelea kwenye seva nyingi, washa hali ya utatuzi kwenye MCCompanion na uangalie kumbukumbu.';

  @override
  String get helpNintendoDnsTitle => 'DNS ya Nintendo haifanyi kazi';

  @override
  String get helpNintendoDnsSubtitle => 'Matatizo ya kawaida ya DNS / relay';

  @override
  String get helpNintendoDnsBody => 'Ikiwa hali ya DNS ya Nintendo haifanyi kazi, angalia yafuatayo:\r\n\r\n1. Thibitisha kuwa umetuma usanidi wa DNS kutoka kwenye programu (Send DNS Config).\r\n2. Thibitisha kuwa umetumia relay IP kama DNS Kuu kwenye Switch.\r\n3. Hakikisha seva ya relay iliyochaguliwa (EU/US) iko mtandaoni na haijaelemewa.\r\n4. Baadhi ya mitandao (kwa mfano captive portals) huzuia DNS maalum — jaribu kwenye mtandao tofauti.\r\n\r\nTatizo likiendelea, washa hali ya utatuzi na uangalie kumbukumbu au ujaribu mbadala wa hali ya Marafiki.';

  @override
  String get helpFriendsModeTitle => 'Hali ya Marafiki haifanyi kazi';

  @override
  String get helpFriendsModeSubtitle => 'Matatizo ya kawaida ya marafiki';

  @override
  String get helpFriendsModeBody => 'Vidokezo vya utatuzi wa hali ya Marafiki:\r\n\r\n1. Hakikisha akaunti ya rafiki ya relay imeongezwa/imekubaliwa kwenye konsoli (ikiwa inahitajika).\r\n2. Jaribu kuanzisha tena mchezo na kusasisha kichupo cha Friends/LAN baada ya kuwasha hali ya Marafiki.\r\n\r\nIkiwa seva bado haionekani kwa marafiki, washa hali ya utatuzi na uangalie kumbukumbu ili kutambua makosa.';

  @override
  String get changeLanguageTitle => 'Badilisha lugha';

  @override
  String get changeLanguage => 'Lugha';

  @override
  String get useSystemLanguage => 'Tumia lugha ya mfumo';

  @override
  String get couldNotOpenUrl => 'Haikuweza kufungua URL';

  @override
  String get serverTrackerTitle => 'Kifuatiliaji cha seva';

  @override
  String get removeServerTitle => 'Ondoa seva';

  @override
  String removeServerConfirm(Object name) {
    return 'Ondoa \"$name\" kutoka kwa kifuatiliaji chako?';
  }

  @override
  String get removeServerFailed => 'Imeshindwa kuondoa seva';

  @override
  String get refreshStatus => 'Onyesha upya hali';

  @override
  String get trackerSignInRequired => 'Ingia inahitajika';

  @override
  String get trackerSignInSubtitle => 'Ingia ili kufuatilia seva na kupokea arifa za nje ya mtandao.';

  @override
  String get signIn => 'Ingia';

  @override
  String get noServersTracked => 'Hakuna seva zinazofuatiliwa';

  @override
  String get trackerEmptySubtitle => 'Ongeza seva ya Minecraft ili ufuatilie hali yake na upokee arifa.';

  @override
  String get fillAllFields => 'Tafadhali jaza sehemu zote kwa usahihi';

  @override
  String get slotUsedUpgrade => 'Nafasi yako ya bure imetumika. Boresha kwa seva zaidi.';

  @override
  String get addServerFailed => 'Imeshindwa kuongeza seva. Angalia maelezo yako.';

  @override
  String get ipAddressLabel => 'Anwani ya IP';

  @override
  String get platformLabel => 'Jukwaa';

  @override
  String get bedrockLabel => 'Bedrock';

  @override
  String get addLabel => 'Ongeza';

  @override
  String get statusOnline => 'Mtandaoni';

  @override
  String get statusOffline => 'Nje ya mtandao';

  @override
  String get statusChecking => 'Inakagua...';

  @override
  String get notificationsOn => 'Arifa zimewashwa';

  @override
  String get notificationsOff => 'Arifa zimezimwa';

  @override
  String get failedUpdateNotifications => 'Imeshindwa kusasisha arifa';

  @override
  String get editServerTitle => 'Hariri seva';

  @override
  String get serverNameHint => 'Jina la seva';

  @override
  String get failedSave => 'Imeshindwa kuhifadhi. Jaribu tena.';

  @override
  String get serverRenamed => 'Seva imebadilishwa jina';

  @override
  String get customizeLabel => 'Binafsisha';

  @override
  String get customizeSubtitle => 'Panga upya vigae na ubinafsishe urambazaji';

  @override
  String get resetLabel => 'Weka upya';

  @override
  String get tilesSection => 'VIGAE';

  @override
  String get dragToReorder => 'Buruta kupanga upya';

  @override
  String get navigationSection => 'URAMBAZAJI';

  @override
  String get navFixed => 'Nyumbani, Kiunganishi na Wasifu daima zimefungwa';

  @override
  String get leftSlot => 'Nafasi ya kushoto (karibu na Nyumbani)';

  @override
  String get rightSlot => 'Nafasi ya kulia (karibu na Wasifu)';

  @override
  String get accentColorSection => 'RANGI YA KIVUTIO';

  @override
  String get opacityLabel => 'Uwazi';

  @override
  String get backgroundSection => 'MANDHARI';

  @override
  String get cardsSection => 'KADI';

  @override
  String get editLabel => 'Hariri';

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
  String get chooseUniqueUsername => 'Chagua jina la mtumiaji la kipekee kuanza.';

  @override
  String get usernameFieldLabel => 'Jina la mtumiaji';

  @override
  String get usernameExampleHint => 'mf. CoolPlayer123';

  @override
  String get usernameFormatHint => 'Herufi 3–20 · herufi, nambari na vistari chini tu';

  @override
  String get displayNameOptional => 'Jina la kuonyesha (hiari)';

  @override
  String get displayNameExampleHint => 'mf. Mchezaji Mzuri';

  @override
  String get usernameRequired => 'Jina la mtumiaji linahitajika';

  @override
  String get usernameFormatError => 'Jina la mtumiaji lazima liwe na herufi 3–20 na liwe na herufi, nambari na vistari chini tu';

  @override
  String get usernameTaken => 'Jina hili la mtumiaji tayari limechukuliwa';

  @override
  String get noConnectionError => 'Hakuna muunganiko. Angalia mtandao wako na ujaribu tena.';

  @override
  String get home => 'Nyumbani';

  @override
  String get info => 'Maelezo';

  @override
  String get navProfile => 'Wasifu';

  @override
  String serverRemoved(Object name) {
    return '$name imeondolewa';
  }

  @override
  String serverAdded(Object name) {
    return '$name imeongezwa';
  }
}
