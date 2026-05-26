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
  String get nldServerLabel => 'SEVA YA NETHERLINK';

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
  String get helpNetherlinkTitle => 'MCCompanion haionekani';

  @override
  String get helpNetherlinkSubtitle => 'Utatuzi wa matatizo ya ugunduzi wa LAN';

  @override
  String get helpNetherlinkBody => 'Ikiwa seva haionekani kwenye konsoli yako, jaribu hatua hizi:\r\n\r\n✅ Ukaguzi wa msingi:\r\n1. Mtandao ule ule wa WiFi - Simu/tablet yako na konsoli LAZIMA ziwe kwenye WiFi ile ile\r\n2. Anwani sahihi ya seva - Hakiki tena IP na port (chaguo-msingi: 19132)\r\n3. Utangazaji uko hai - Hakikisha MCCompanion inaonyesha hali ya \"Inatangaza\"\r\n\r\n🔄 Marekebisho ya haraka:\r\n• Anzisha tena programu: simamisha utangazaji, funga MCCompanion kabisa, ifungue tena na ujaribu upya\r\n• Anzisha tena konsoli yako: wakati mwingine konsoli huhitaji kusasishwa ili kugundua michezo ya LAN\r\n• Angalia kichupo cha Friends/LAN: seva huonekana chini ya \"Friends\" au \"LAN Games\", SI kwenye orodha ya seva\r\n• Subiri sekunde 10-15 baada ya kuanza kutangaza\r\n• Zima VPN: VPN zinaweza kuzuia matangazo ya ndani\r\n\r\n⚠️ Matatizo ya kawaida:\r\n\"No route found for user\" → Hakikisha vifaa vyote viwili viko kwenye Wi‑Fi ile ile (epuka mitandao ya wageni)\r\n\"Unable to connect to MCCompanion relay server\" → Angalia intaneti yako / hali ya relay\r\n\r\n📱 Bado una matatizo? Washa hali ya utatuzi kwenye MCCompanion na uangalie kumbukumbu, au jaribu seva tofauti.';

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
  String get reportUser => 'Ripoti mtumiaji';
  @override
  String reportUserWithName(String username) => 'Ripoti @$username';
  @override
  String get reportMessage => 'Ripoti ujumbe';
  @override
  String get reportDisclaimer => 'Timu yetu itapitia ripoti hii. Asante kwa kulinda usalama wa jamii.';
  @override
  String get reportReasonSpam => 'Barua taka';
  @override
  String get reportReasonHarassment => 'Unyanyasaji au udhalimu';
  @override
  String get reportReasonInappropriate => 'Maudhui yasiyofaa';
  @override
  String get reportReasonOther => 'Nyingine';
  @override
  String get reportAdditionalDetails => 'Maelezo ya ziada (hiari)';
  @override
  String get reportSubmit => 'Tuma ripoti';
  @override
  String get reportSuccess => 'Ripoti imetumwa. Asante.';
  @override
  String get reportFailed => 'Imeshindwa kutuma ripoti. Jaribu tena.';
  @override
  String get messagePlaceholder => 'Ujumbe...';
  @override
  String get noMessagesYet => 'Hakuna ujumbe bado.\nSema habari!';
  @override
  String get today => 'Leo';
  @override
  String get yesterday => 'Jana';
  @override
  String get noConversationsYet => 'Hakuna mazungumzo bado';
  @override
  String get startChatHint => 'Anza mazungumzo kutoka kwenye orodha ya marafiki.';
  @override
  String get youPrefix => 'Wewe';
  @override
  String get tabProfile => 'WASIFU';
  @override
  String get tabFriends => 'MARAFIKI';
  @override
  String get tabRequests => 'MAOMBI';
  @override
  String get tabChats => 'MAZUNGUMZO';
  @override
  String get addFriend => 'Ongeza rafiki';
  @override
  String get usernameHint => 'jina la mtumiaji';
  @override
  String get send => 'Tuma';
  @override
  String friendRequestSentTo(String username) => 'Ombi la urafiki limetumwa kwa @$username';
  @override
  String alreadyFriendsWith(String username) => 'Tayari ni marafiki na @$username.';
  @override
  String requestAlreadyPending(String username) => 'Tayari kuna ombi linalosubiri na @$username.';
  @override
  String userNotFoundMsg(String username) => 'Mtumiaji @$username hajapatikana.';
  @override
  String cannotSendRequest(String username) => 'Huwezi kutuma ombi kwa @$username.';
  @override
  String get somethingWentWrong => 'Kitu kimekwenda vibaya. Jaribu tena.';
  @override
  String friendRequestAccepted(String username) => 'Ombi la urafiki kutoka @$username limekubaliwa';
  @override
  String requestDeclined(String username) => 'Ombi kutoka @$username limekataliwa';
  @override
  String get deleteAccountTitle => 'Futa akaunti';
  @override
  String get deleteAccountBody => 'Hii itafuta akaunti yako, ujumbe, marafiki na data zote zinazohusiana milele. Hatua hii haiwezi kutenduliwa.';
  @override
  String get deletePermanently => 'Futa milele';
  @override
  String get couldNotDeleteAccount => 'Imeshindwa kufuta akaunti. Jaribu tena.';
  @override
  String get removeFriendTitle => 'Ondoa rafiki';
  @override
  String removeFriendConfirm(String username) => 'Unataka kuondoa @$username kama rafiki?';
  @override
  String get remove => 'Ondoa';
  @override
  String friendRemoved(String username) => '@$username ameondolewa kwenye marafiki wako';
  @override
  String get noFriendsYet => 'Hakuna marafiki bado';
  @override
  String get noFriendsSub => 'Ongeza mtu kwa kutumia kitufe juu kulia.';
  @override
  String get noPendingRequests => 'Hakuna maombi yanayosubiri';
  @override
  String get requestsAppearHere => 'Maombi ya urafiki yataonekana hapa.';
  @override
  String onlineFriendsLabel(int count) => 'MTANDAONI — $count';
  @override
  String offlineFriendsLabel(int count) => 'NJE YA MTANDAO — $count';
  @override
  String get couldNotUpdateVisibility => 'Imeshindwa kusasisha mwonekano. Jaribu tena.';
  @override
  String get aboutMe => 'Kuhusu mimi';
  @override
  String get linkedAccountsTitle => 'Akaunti zilizounganishwa';
  @override
  String get linkAccountsHint => 'Unganisha akaunti zako za Minecraft kuzionyesha kwenye wasifu wako.';
  @override
  String get unlinkXboxTitle => 'Tenganisha akaunti ya Xbox';
  @override
  String removeLabelConfirm(String label) => 'Ondoa $label kutoka kwenye akaunti zilizounganishwa?';
  @override
  String get unlinkJavaTitle => 'Tenganisha Java Edition';
  @override
  String removeJavaConfirm(String username) => 'Ondoa $username kutoka kwenye akaunti zilizounganishwa?';
  @override
  String get unlink => 'Tenganisha';
  @override
  String get linkXbox => 'Unganisha Xbox';
  @override
  String get linkJava => 'Unganisha Java';
  @override
  String get appearOfflineLabel => 'Onekana nje ya mtandao';
  @override
  String get appearOfflineOn => 'Marafiki wanakuona nje ya mtandao';
  @override
  String get appearOfflineOff => 'Marafiki wanaweza kuona unapokuwa mtandaoni';
  @override
  String get signOut => 'Toka';
  @override
  String get profileCardTitle => 'Wasifu';
  @override
  String get edit => 'Hariri';
  @override
  String get displayNameLabel => 'Jina la kuonyesha';
  @override
  String get bioLabel => 'Bio';
  @override
  String get yourNameHint => 'Jina lako';
  @override
  String get bioHint => 'Jiambie kidogo kuhusu wewe mwenyewe';
  @override
  String get avatarUrlLabel => 'URL ya avatar';
  @override
  String get usernameDisplayLabel => 'Jina la mtumiaji';
  @override
  String get profileUpdated => 'Wasifu umesasishwa';
  @override
  String get findUser => 'Tafuta mtumiaji';
  @override
  String get signIn => 'Ingia';
  @override
  String get createAccount => 'Fungua akaunti';
  @override
  String get signInSubtitle => 'Ingia ili kuongeza marafiki na kushiriki vikao vyako.';
  @override
  String get emailAddressHint => 'Anwani ya barua pepe';
  @override
  String get passwordHint => 'Nenosiri';
  @override
  String get forgotPassword => 'Umesahau nenosiri?';
  @override
  String get continueWithGoogle => 'Endelea na Google';
  @override
  String get alreadyHaveAccount => 'Una akaunti tayari? Ingia';
  @override
  String get noAccountYet => 'Bado huna akaunti? Jisajili';
  @override
  String get orDivider => 'au';
  @override
  String get resetPasswordTitle => 'Weka upya nenosiri';
  @override
  String get resetPasswordBody => 'Ingiza anwani yako ya barua pepe na tutakutumia kiungo cha kuweka upya nenosiri lako.';
  @override
  String get sendLink => 'Tuma kiungo';
  @override
  String resetLinkSent(String email) => 'Kiungo cha kuweka upya kimetumwa kwa $email';
  @override
  String get noAccountForEmail => 'Hakuna akaunti iliyopatikana kwa anwani hii ya barua pepe.';
  @override
  String get invalidEmailError => 'Anwani ya barua pepe si sahihi.';
  @override
  String get couldNotSendResetEmail => 'Imeshindwa kutuma barua pepe ya kuweka upya. Jaribu tena.';
  @override
  String get incorrectEmailOrPassword => 'Barua pepe au nenosiri si sahihi.';
  @override
  String get emailAlreadyInUse => 'Anwani hii ya barua pepe tayari inatumika.';
  @override
  String get weakPassword => 'Nenosiri lazima liwe na herufi angalau 6.';
  @override
  String get googleSignInFailed => 'Kuingia kwa Google kumeshindwa. Jaribu tena.';
  @override
  String get appleSignInFailed => 'Kuingia kwa Apple kumeshindwa. Jaribu tena.';
  @override
  String get emailDifferentMethod => 'Akaunti tayari ipo na barua pepe hii kwa njia tofauti ya kuingia.';
  @override
  String get enterEmailAndPassword => 'Tafadhali ingiza barua pepe na nenosiri lako.';
  @override
  String get profileNotSetUp => 'Wasifu bado haujasanidiwa';
  @override
  String get chooseUsernameSubtitle => 'Chagua jina la mtumiaji ili kuongeza marafiki na kushiriki vikao vyako.';
  @override
  String get createProfile => 'Unda wasifu';
  @override
  String get chooseUniqueUsername => 'Chagua jina la mtumiaji la kipekee ili kuongeza marafiki.';
  @override
  String get usernameFieldLabel => 'Jina la mtumiaji *';
  @override
  String get usernameFormatHint => 'Herufi 3–20 · a-z, 0-9 na _ tu';
  @override
  String get displayNameOptional => 'Jina la kuonyesha (hiari)';
  @override
  String get usernameRequired => 'Tafadhali ingiza jina la mtumiaji.';
  @override
  String get usernameFormatError => 'Herufi 3–20, herufi ndogo, nambari na _ tu';
  @override
  String get usernameTaken => 'Jina hili la mtumiaji tayari linachukuliwa.';
  @override
  String get noConnectionError => 'Hakuna muunganisho. Jaribu tena.';
  @override
  String get usernameExampleHint => 'mfano: jens_mc';
  @override
  String get displayNameExampleHint => 'mfano: Jens';
  @override
  String get home => 'Nyumbani';
  @override
  String get info => 'Maelezo';
  @override
  String get consoleConnect => 'Console Connect';
  @override
  String get consoleConnectSubtitle => 'Unganika na seva za Minecraft';
  @override
  String get minecraftSkins => 'Nguo za Minecraft';
  @override
  String get minecraftSkinsSubtitle => 'Ona na hariri nguo za Java na Bedrock';
  @override
  String get minecraftWiki => 'Wiki ya Minecraft';
  @override
  String get minecraftWikiSubtitle => 'Viumbe, vitalu, mapishi na zaidi';
  @override
  String get partnerServersLabel => 'Seva za Washirika';
  @override
  String get partnerServersSubtitle => 'Seva maarufu za Minecraft';
  @override
  String get userLookup => 'Utafutaji wa Mtumiaji wa Minecraft';
  @override
  String get userLookupSubtitle => 'Tafuta maelezo ya Java na Bedrock';

  @override
  String get navSkins => 'Skins';
  @override
  String get navWiki => 'Wiki';
  @override
  String get navProfile => 'Wasifu';

  @override
  String get skinsUpload => 'Pakia';
  @override
  String get skinsCreate => 'Unda';
  @override
  String get skinsSubtitle => 'Tazama na pakua skins za Minecraft.';
  @override
  String get skinsSectionRecent => 'SKINS ZA HIVI KARIBUNI';
  @override
  String get skinsSectionMy => 'SKINS ZANGU';
  @override
  String get skinsSectionYours => 'SKINS ZAKO';
  @override
  String get skinsEmptyMySkins => 'Hakuna skins zilizohifadhiwa bado. Unda au pakia skin ili kuanza.';
  @override
  String get skinsCouldNotLoad => 'Haikuwezekana kupakia skins';
  @override
  String skinsPageOf(int page, int total) => 'Ukurasa $page / $total';
  @override
  String get skinsMustBe64 => 'Skin lazima iwe pikseli 64×64';
  @override
  String get skinsInvalidFile => 'Faili la picha lisilo sahihi';
  @override
  String get skinsDownload => 'Pakua';
  @override
  String get skinsEdit => 'Hariri';
  @override
  String get skinsNoAccountsTitle => 'Hakuna akaunti zilizounganishwa';
  @override
  String get skinsNoAccountsSubtitle => 'Unganisha Java au Bedrock kwenye Wasifu kuona skin yako.';
  @override
  String get skinsSignInTitle => 'Ingia ili kuona skin yako';
  @override
  String get skinsSignInSubtitle => 'Unda akaunti na uunganishe Java au Bedrock kwenye Wasifu.';
}
