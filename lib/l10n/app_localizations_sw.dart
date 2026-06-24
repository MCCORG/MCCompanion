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
  String get tileWideTooltipRemove => 'Ondoa mpangilio mpana';

  @override
  String get tileWideTooltipAdd => 'Fanya tile pana';

  @override
  String get tileVisibilityShow => 'Onyesha tile';

  @override
  String get tileVisibilityHide => 'Ficha tile';

  @override
  String get tileVisibilityMin => 'Haiwezi kufichwa (tile ya mwisho)';

  @override
  String get colorPickerApply => 'Tumia';

  @override
  String get colorPickerHex => 'Hex';

  @override
  String get textColorSection => 'RANGI YA MAANDISHI';

  @override
  String get textColorPickerTitle => 'Rangi ya Maandishi';

  @override
  String get textColorHint => 'Gonga duara ili kuchagua rangi ya maandishi ya kibinafsi';

  @override
  String get textColorPreviewPrimary => 'Msingi';

  @override
  String get textColorPreviewSecondary => 'Sekondari';

  @override
  String get textColorPreviewMuted => 'Fifu';

  @override
  String get colorSwatchCustom => 'Maalum';

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
  String get featureLabelConnector => 'Kiunganishi';

  @override
  String get featureLabelSkins => 'Ngozi';

  @override
  String get featureLabelWiki => 'Wiki';

  @override
  String get featureLabelPartners => 'Washirika';

  @override
  String get featureLabelLookup => 'Tafuta';

  @override
  String get featureLabelTracker => 'Kifuatiliaji Seva';

  @override
  String get featureSubtitleConnector => 'Unganisha konsoli na Minecraft';

  @override
  String get featureSubtitleSkins => 'Vinjari na usimamie ngozi za Minecraft';

  @override
  String get featureSubtitleWiki => 'Kamusi ya Minecraft';

  @override
  String get featureSubtitlePartners => 'Seva zilizoangaziwa';

  @override
  String get featureSubtitleLookup => 'Tafuta wasifu wa Java na Bedrock';

  @override
  String get featureSubtitleTracker => 'Fuatilia hali ya seva na upokee arifa';

  @override
  String get userSearchHint => 'Jina la mtumiaji, gamertag au jina la Java…';

  @override
  String get userSearchSub => 'Tafuta kwa jina la mtumiaji, gamertag ya Xbox au jina la Java';

  @override
  String get onlineStatus => 'Mtandaoni';

  @override
  String get upgradeWindowsHint => 'Uboreshaji unapatikana kwenye Microsoft Store';

  @override
  String get chatEmptyHint => 'Kuwa wa kwanza kusema kitu!';

  @override
  String get skinSaved => 'Skin imehifadhiwa';

  @override
  String skinSavedAs(String name) {
    return 'Imehifadhiwa kama \"$name\"';
  }

  @override
  String get skinExportFailed => 'Usafirishaji umeshindwa';

  @override
  String get skinExported => 'Skin imesafirishwa';

  @override
  String get accountActions => 'ACCOUNT';

  @override
  String get feedbackBugReport => 'Ripoti ya Hitilafu';

  @override
  String get feedbackFeatureRequest => 'Ombi la Kipengele';

  @override
  String get feedbackGoesToGithub => 'Inaenda moja kwa moja kwenye GitHub';

  @override
  String get feedbackTitleLabel => 'Kichwa';

  @override
  String get feedbackTitleHintBug => 'mfano: Programu inaanguka wakati wa kufungua kihariri cha ngozi';

  @override
  String get feedbackTitleHintFeature => 'mfano: Onyesha ping ya mchezaji kwenye orodha ya seva';

  @override
  String get feedbackWhatHappened => 'Nini kilitokea?';

  @override
  String get feedbackDescribeIdea => 'Elezea wazo lako';

  @override
  String get feedbackDescHintBug => 'Elezea hitilafu — ulifanya nini, ulitegemea nini na badala yake nini kilitokea?';

  @override
  String get feedbackDescHintFeature => 'Eleza unachotaka na kwa nini itakuwa ya manufaa.';

  @override
  String get feedbackEmailLabel => 'Barua pepe (si lazima)';

  @override
  String get feedbackEmailHint => 'Ili tuweze kukuwasiliana';

  @override
  String get feedbackEmailNote => 'Barua pepe yako haitashirikiwa hadharani kamwe.';

  @override
  String get feedbackSubmitBug => 'Tuma Ripoti ya Hitilafu';

  @override
  String get feedbackSubmitFeature => 'Tuma Ombi la Kipengele';

  @override
  String get feedbackDisclaimer => 'Inaunda suala la umma kwenye GitHub · Usijumuishe nywila';

  @override
  String get feedbackSuccessTitle => 'Asante kwa maoni yako!';

  @override
  String get feedbackSuccessBody => 'Ripoti yako imetumwa na suala la GitHub limeundwa. Tutaangalia haraka iwezekanavyo.';

  @override
  String get feedbackViewOnGithub => 'Tazama kwenye GitHub';

  @override
  String get feedbackSubmitAnother => 'Tuma nyingine';

  @override
  String get feedbackBackToApp => 'Rudi kwenye programu';

  @override
  String get feedbackTitleTooShort => 'Kichwa lazima kiwe na angalau herufi 5.';

  @override
  String get feedbackDescTooShort => 'Maelezo lazima yawe na angalau herufi 10.';

  @override
  String get feedbackSubmitFailed => 'Imeshindwa kutuma. Tafadhali jaribu tena.';

  @override
  String get feedbackTileTitle => 'Ripoti hitilafu au pendekeza kipengele';

  @override
  String get reportBug => 'Feedback';

  @override
  String get feedbackTileSubtitle => 'Tusaidie kuboresha MCCompanion';

  @override
  String get friendsHowToStep1 => 'Fungua programu ya Xbox kwenye simu au konsoli yako.';

  @override
  String get friendsHowToStep2 => 'Ongeza moja ya boti zilizo hapa chini kama rafiki kwenye Xbox.';

  @override
  String get friendsHowToStep3 => 'Fungua Minecraft na nenda kwenye kichupo cha Marafiki.';

  @override
  String get friendsHowToStep4 => 'Tafuta seva yako chini ya Ulimwengu wa LAN na jiunge.';

  @override
  String get friendsHowToNote => '⚠️ Kila wakati unapotaka kucheza, lazima kwanza uanzishe hali ya Marafiki kwenye programu ya MCCompanion. Unaweza kufunga programu baada ya kuanzisha.';

  @override
  String get friendsBotLoadError => '⚠️ Haikuweza kupakia orodha ya boti. Jaribu tena baadaye.';

  @override
  String get regionEurope => 'Ulaya';

  @override
  String get regionUnitedStates => 'Marekani';

  @override
  String get yourRegion => 'ENEO LAKO';

  @override
  String get botStatusOffline => 'Nje ya mtandao';

  @override
  String get botStatusFull => 'Imejaa';

  @override
  String botFriendCount(Object current, Object max) {
    return '$current / $max marafiki';
  }

  @override
  String botCopied(Object gamertag) {
    return '$gamertag imenakiliwa';
  }

  @override
  String get copyLabel => 'Nakili';

  @override
  String get skinSavedToDocuments => 'Skin imehifadhiwa kwenye Nyaraka';

  @override
  String get skinMenuExport => 'Hamisha';

  @override
  String get skinMenuDelete => 'Futa';

  @override
  String get rpScreenTitle => 'Kifurushi cha Rasilimali';

  @override
  String get rpWhatIsThis => 'Hii ni nini?';

  @override
  String get rpExplanation => 'Pakiti ya rasilimali hubadilisha mwonekano wa Minecraft kwenye konsoli yako — vitalu, rangi au sauti mpya. Bandika kiungo cha faili la .mcpack hapa chini, washa na uhifadhi. MCCompanion hupakia kiotomatiki kila wakati unapoungana.';

  @override
  String get rpPackUrlLabel => 'URL ya Pakiti';

  @override
  String get rpPackUrlHint => 'https://example.com/pack.mcpack';

  @override
  String get rpEnableToggle => 'Wezesha kifurushi cha rasilimali';

  @override
  String get rpWhatWorks => 'Kinachofanya kazi';

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
  String get rpNoDiscord => 'Viungo vya Discord — hakuna ugani wa .mcpack na vinaisha baada ya masaa machache';

  @override
  String get rpNoDrive => 'Viungo vya kushiriki vya Google Drive / Dropbox — si upakuaji wa moja kwa moja';

  @override
  String get rpNoEncrypted => 'Seva zenye pakiti zilizosimbwa au zilindwa na nywila';

  @override
  String get rpConsolePerformanceTitle => 'Console performance';

  @override
  String get rpConsolePerformanceBody => 'High-resolution texture packs can cause lag or crashes on consoles. If you experience issues, switch to a lower-resolution pack or select a lighter subpack if the pack supports it.';

  @override
  String get rpWarnDiscord => 'Viungo vya Discord vinaisha na vitaacha kufanya kazi. Tumia seva ya kudumu badala yake.';

  @override
  String get rpWarnHttps => 'URL lazima ianze na https://';

  @override
  String get rpWarnExtension => 'URL lazima iishie .mcpack au .zip';

  @override
  String get rpToastEnterUrl => 'Ingiza URL kabla ya kuwezesha kifurushi cha rasilimali.';

  @override
  String get rpToastSaved => 'Mipangilio ya kifurushi cha rasilimali imehifadhiwa.';

  @override
  String get rpInvalidPackFormat => 'This is a Java Edition pack and is not supported. Please use a Bedrock Edition resource pack.';

  @override
  String get rpClearMinecraftTitle => 'Mara ya kwanza na pakiti hii?';

  @override
  String get rpClearMinecraftBody => 'Minecraft huhifadhi pakiti za rasilimali kwenye cache ya ndani. Ikiwa uliounganika kwenye seva hii kabla ya kuwezesha pakiti ya MCCompanion, Minecraft tayari ina pakiti asili kwenye cache na haitaipakua tena toleo lililounganishwa.';

  @override
  String get rpClearStep1 => 'Fungua Minecraft kwenye konsoli yako na nenda Mipangilio → Hifadhi';

  @override
  String get rpClearStep2 => 'Gonga \'Futa\' au \'Weka upya\' karibu na Pakiti za Rasilimali — hii huondoa pakiti zote zilizohifadhiwa ndani';

  @override
  String get rpClearStep3 => 'Unganisha tena kupitia MCCompanion — pakiti iliyochanganywa itapakuliwa kiotomatiki';

  @override
  String get rpRelayTitle => 'Pack inaonekana vibaya?';

  @override
  String get rpRelayBody => 'Relay huhifadhi pakiti iliyounganishwa kwa saa 1 ukitumia URL ya overlay kama ufunguo wa akiba. Kulazimisha muunganiko mpya: badilisha kidogo URL ya pakiti (mfano ongeza ?v=2) na uhifadhi. Kisha futa pia akiba ya pakiti ya Minecraft — pakiti iliyounganishwa bado inatumia UUID ya seva, kwa hivyo Minecraft vinginevyo itaonyesha toleo la zamani kutoka akibani.';

  @override
  String get rpWorksGithubHint => 'Kiungo cha kupakua moja kwa moja — daima kinafikiwa';

  @override
  String get rpWorksCloudflareHint => 'Hifadhi ya wingu ya umma — haraka na ya kuaminika';

  @override
  String get rpWorksDirectHint => 'URL yoyote ya umma ya HTTPS .mcpack au .zip';

  @override
  String get rpNoDiscordHint => 'Viungo vya Discord CDN vinaisha baada ya muda mfupi';

  @override
  String get rpNoDriveHint => 'Hakuna upakuaji wa moja kwa moja — inaelekeza kwenye ukurasa wa hakiki';

  @override
  String get rpNoEncryptedHint => 'MCCompanion haiwezi kuchanganya maudhui ya pakiti zilizosimbwa';

  @override
  String get rpClearWhy => 'Minecraft huhifadhi pakiti za rasilimali kwa UUID zao. Pakiti iliyounganishwa inabaki na UUID ya asili ya seva — ikiwa Minecraft tayari imehifadhi pakiti ya seva kutoka kipindi kilichopita (kabla ya MCCompanion kuwezeshwa), haitapakua toleo jipya lililounganishwa. Futa akiba ili Minecraft ipakue pakiti mpya iliyounganishwa.';

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
  String get rpMergerTitle => 'Muunganisho wa RP';

  @override
  String get rpMergerSubtitle => 'Unganisha hadi pakiti 4 za rasilimali';

  @override
  String get rpMergerPriorityHint => 'Pakiti ya juu ina kipaumbele zaidi — faili zake zinashinda migogoro.';

  @override
  String get rpMergerTopBadge => 'JUU';

  @override
  String get rpMergerAddPacks => 'Ongeza pakiti za rasilimali';

  @override
  String rpMergerAddAnother(int current) {
    return 'Ongeza pakiti nyingine ($current/4)';
  }

  @override
  String get rpMergerFileTypes => '.zip au .mcpack';

  @override
  String get rpMergerMerging => 'Inaunganisha…';

  @override
  String rpMergerButton(int count) {
    return 'Unganisha pakiti $count';
  }

  @override
  String get rpMergerComplete => 'Uunganisho umekamilika!';

  @override
  String rpMergerConflicts(int count) {
    return 'Migogoro $count imetatuliwa — pakiti ya juu ilishinda.';
  }

  @override
  String get rpMergerSetActive => 'Weka kama pakiti ya rasilimali inayotumika';

  @override
  String get rpMergerSetActiveToast => 'Imewekwa kama pakiti ya rasilimali inayotumika';

  @override
  String get rpMergerOpenButton => 'Unganisha pakiti za rasilimali';

  @override
  String get rpMergerOpenSubtitle => 'Unganisha pakiti 2–4 kuwa moja';

  @override
  String get shareLabel => 'Shiriki';

  @override
  String get sectionMinecraftAccounts => 'Akaunti za Minecraft';

  @override
  String get sectionSettings => 'Mipangilio';

  @override
  String get avatarUpdated => 'Picha ya wasifu imesasishwa';

  @override
  String get uploadFailed => 'Upakiaji umeshindwa';

  @override
  String get profileLinkCopied => 'Kiungo cha wasifu kamenakiliwa!';

  @override
  String get shareProfileTooltip => 'Shiriki wasifu';

  @override
  String get profileFallbackTitle => 'Wasifu';

  @override
  String get noUsersFound => 'Hakuna watumiaji waliopatikana';

  @override
  String get skinLabel => 'NGOZI';

  @override
  String get skinsLabel => 'NGOZI';

  @override
  String get javaEditionBadge => 'Java';

  @override
  String get bedrockEditionBadge => 'Bedrock';

  @override
  String get downloadLabel => 'Pakua';

  @override
  String get justNow => 'Sasa hivi';

  @override
  String minutesAgo(int count) {
    return 'Dakika $count zilizopita';
  }

  @override
  String hoursAgo(int count) {
    return 'Saa $count zilizopita';
  }

  @override
  String daysAgo(int count) {
    return 'Siku $count zilizopita';
  }
}
