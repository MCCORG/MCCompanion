// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'MCCompanion';

  @override
  String get console => 'Console';

  @override
  String get consoleOutput => 'Console Uitvoer';

  @override
  String get noLogsYet => 'Nog geen logs';

  @override
  String get startBroadcastingToSeeOutput =>
      'Start uitzenden om uitvoer te zien';

  @override
  String get close => 'Sluit';

  @override
  String get ok => 'OK';

  @override
  String get back => 'Terug';

  @override
  String get next => 'Volgende';

  @override
  String get done => 'Klaar';

  @override
  String get none => 'Geen';

  @override
  String get onboardingThemeTitle => 'Kies een thema';

  @override
  String get onboardingThemeSubtitle =>
      'Je kunt elke kleur later aanpassen in de instellingen.';

  @override
  String get onboardingNavTitle => 'Snelle toegang';

  @override
  String get onboardingNavSubtitle =>
      'Kies twee functies voor je navigatiebalk.';

  @override
  String get onboardingNavLeftLabel => 'LINKER KNOP';

  @override
  String get onboardingNavRightLabel => 'RECHTER KNOP';

  @override
  String get onboardingNavPreviewHome => 'Home';

  @override
  String get onboardingNavPreviewConnector => 'Connector';

  @override
  String get onboardingNavPreviewProfile => 'Profiel';

  @override
  String get onboardingNavPreviewEmpty => 'Leeg';

  @override
  String get onboardingStartTitle => 'Startpagina';

  @override
  String get onboardingStartSubtitle =>
      'De app opent hier elke keer bij het opstarten.';

  @override
  String get onboardingCustomizeDetail => 'In detail aanpassen →';

  @override
  String get startPageHome => 'Home';

  @override
  String get startPageHomeSubtitle => 'Toon het startscherm met tegels';

  @override
  String get startPageFeature => 'Functie';

  @override
  String get startPageFeatureSubtitle => 'Open direct op een specifieke pagina';

  @override
  String get startPageSectionLabel => 'STARTPAGINA';

  @override
  String get joinUs => 'Word lid';

  @override
  String get more => 'Meer';

  @override
  String get website => 'Website';

  @override
  String get howToUseMenu => 'Hoe gebruiken';

  @override
  String get support => 'Ondersteuning';

  @override
  String helpText(Object appCreator) {
    return 'Gemaakt door $appCreator.\n\nHoe te gebruiken:\n1. Voer uw Minecraft server adres en poort in (standaard: 19132)\n   - of selecteer een eerder opgeslagen server uit de dropdown\n2. (Optioneel) Kies een Relay server(EU of US) die het dichtst bij uw locatie is\n3. Klik op \"Start uitzending\"\n4 Om te starten ga op je console/apparaat: Minecraft > Play > Vrienden\n5. Je zou een LAN server moeten zien genaamd \"MCCompanion\"\n6. Klik op de server om toe te treden tot uw externe server via MCCompanion\n\nNintendo Switch (DNS-modus):\n1. Schakel \"Nintendo Switch\" in in het verbindingspaneel\n2. Selecteer een RelayServer (EU of US)\n3. Klik op \"Stuur DNS Config\" - dit stuurt uw configuratie naar het relais\n   (het zend NIET een LAN server)\n4. Op uw Switch, Pas uw MCCompanion DNS setup toe en neem deel aan\n   met behulp van de server die u gebruikt voor MCCompanion\n\nNotities:\n- voor LAN uitzendingen, MCCompanion en console moeten op hetzelfde lokale netwerk zitten.\n- Tip: Kies de dichtstbijzijnde server voor de beste prestaties.';
  }

  @override
  String get serverDetailsLabel => 'Serverdetails';

  @override
  String get start => 'Starten';

  @override
  String get stop => 'Stoppen';

  @override
  String get labelJava => 'Java';

  @override
  String get startJavaMode => 'Java-modus starten';

  @override
  String get javaInfoTitle => 'Java-modus';

  @override
  String get javaInfoText => 'Verbinden met Java Edition-servers';

  @override
  String get howToJavaTitle => 'Java-modus';

  @override
  String get howToJavaSubtitle =>
      'Verbinden met Java Edition-servers via MCCompanion';

  @override
  String get aternosSubtext => 'Maak je eigen gratis Minecraft-server';

  @override
  String get howToJavaBody =>
      'Java-modus: snelle stappen:\n1. Selecteer in de app de Java-modus.\n2. Voer het adres en de poort van je Java Edition-server in (standaard: 25565).\n3. Druk op \"Java-modus starten\": MCCompanion overbrugt de verbinding.\n4. Open Minecraft Bedrock en ga naar het tabblad Vrienden.\n5. Selecteer de LAN-server met de naam \"MCCompanion\" om deel te nemen aan de Java-server.\n\n⚠️ Belangrijke waarschuwingen:\n- Een geldig Java Edition-account (Microsoft) is vereist.\n- Sommige servers gebruiken anti-cheat-systemen die je account kunnen detecteren en verbannen.\n- Sommige servers verbieden Bedrock-clients expliciet, controleer altijd de serverregels.\n- MCCompanion is niet verantwoordelijk voor accountverboden, schorsingen of andere accountgerelateerde problemen die uit het gebruik van deze functie kunnen voortkomen.\n- Gebruik op eigen risico.';

  @override
  String get language => 'Nederlands';

  @override
  String get discord => 'Discord';

  @override
  String get toggleDebug => 'Schakel debug aan/uit';

  @override
  String get copyLogs => 'Logs kopiëren';

  @override
  String get clear => 'Wis';

  @override
  String get cancel => 'Annuleren';

  @override
  String get deleteServer => 'Server Verwijderen';

  @override
  String get delete => 'Verwijderen';

  @override
  String get myServers => 'Mijn Servers';

  @override
  String get quickAccessServers => 'Snelle toegang tot servers';

  @override
  String get addServer => 'Server toevoegen';

  @override
  String get addServersHint => 'Servers toevoegen om later snel te verbinden';

  @override
  String get serverNameLabel => 'Server Naam *';

  @override
  String get addressLabel => 'Adres *';

  @override
  String get portLabel => 'Poort *';

  @override
  String get descriptionLabel => 'Beschrijving (optioneel)';

  @override
  String get save => 'Opslaan';

  @override
  String get initializing => 'Initialiseren...';

  @override
  String get createdBy => 'Gemaakt door NetherDev';

  @override
  String get bedrockBridge => 'Bedrock Brug';

  @override
  String get clientDisconnected => 'Client verbroken - Uitzending gestopt';

  @override
  String get pleaseEnterServer => '⚠️ Voer een serveradres in';

  @override
  String get invalidPort => '⚠️ Ongeldig poortnummer (1-65535)';

  @override
  String get dataSentToServers =>
      'Gegevens verstuurd naar de MCCompanion-servers';

  @override
  String get broadcastingStarted => 'Uitzending gestart';

  @override
  String get broadcastStopped => 'Uitzending gestopt';

  @override
  String selectedServer(Object name) {
    return '📋 Geselecteerd: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'Geselecteerd: $name';
  }

  @override
  String get noLogsToCopy => 'Geen logs om te kopiëren';

  @override
  String copiedLogs(Object count) {
    return 'Gekopieerd $count logs naar het klembord';
  }

  @override
  String get debugEnabled => 'Debug logs ingeschakeld';

  @override
  String get debugDisabled => 'Debug logs uitgeschakeld';

  @override
  String get howToUseTitle => 'Hoe gebruik je MCCompanion';

  @override
  String get iUnderstand => 'Ik begrijp het';

  @override
  String get playOnSwitchTitle => 'Speel op Nintendo Switch';

  @override
  String get playWithFriendsTitle => 'Spelen via vrienden';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'Geselecteerd: $relayName\n\nHoe te verbinden:\n1. Ga naar uw Switch Instellingen en wijzig de DNS naar: $relayIp\n2. Open Minecraft en selecteer een server uit de lijst (zoals Cubecraft of Hive).\n3. Je wordt nu automatisch naar je eigen server verzonden.';
  }

  @override
  String playInstructionsFriends(Object friend) {
    return 'Hoe te verbinden:\n1. Voeg $friend toe als vriend op je console.\n2. Open Minecraft en ga naar het tabblad Vrienden.\n3. Zoek naar je server onder LAN werelden en selecteer om mee te doen.';
  }

  @override
  String get nldServerLabel => 'MCCompanion-SERVER';

  @override
  String selectRelayLabel(Object name) {
    return 'Geselecteerd: $name';
  }

  @override
  String get noSavedServers => 'Geen opgeslagen servers';

  @override
  String get savedServers => 'Opgeslagen servers';

  @override
  String get serverAddressHint => 'Serveradres';

  @override
  String get portHint => 'Poort';

  @override
  String get manageServers => 'Beheer servers';

  @override
  String get manageServersTooltip => 'Beheer servers';

  @override
  String get noServerYet =>
      'Nog geen servers opgeslagen.\nTik op Beheren om er een toe te voegen.';

  @override
  String get serverNotSelected => 'Geen server geselecteerd';

  @override
  String get ready => 'Klaar';

  @override
  String get active => 'Actief';

  @override
  String get vpnDetected => 'VPN gedetecteerd';

  @override
  String get noWifi => 'Niet op wifi';

  @override
  String get vpnActive =>
      'We hebben gedetecteerd dat je VPN actief is.\n\nSchakel je VPN uit voordat je MCCompanion gebruikt, anders bereikt de LAN-uitzending je console mogelijk niet.';

  @override
  String get mobileActive =>
      'Gedetecteerd: mobiele data\n\nMCCompanion moet zich op hetzelfde netwerk bevinden als je console. Verbind eerst met je wifi of hotspot voordat je doorgaat.';

  @override
  String get continueAnyway => 'Toch doorgaan';

  @override
  String get sameWifi => 'Zelfde wifi-netwerk';

  @override
  String get needSameWifi =>
      'Het apparaat waarop MCCompanion draait MOET zich op hetzelfde wifi-netwerk bevinden als de console waarop je Minecraft speelt.';

  @override
  String get subscription => 'Online abonnement vereist';

  @override
  String get needSubscription =>
      'Elke console heeft een eigen actief online abonnement nodig (Xbox Live, PS Plus, NSO). Zonder dat verschijnt MCCompanion niet.';

  @override
  String get updateAvailable => 'Update beschikbaar';

  @override
  String get newVersion =>
      'Er is een nieuwe versie van de app beschikbaar.\nWerk nu bij voor de nieuwste functies en verbeteringen.';

  @override
  String get later => 'Later';

  @override
  String get updateNow => 'Nu bijwerken';

  @override
  String get beforeYouStart => 'VOORDAT JE BEGINT';

  @override
  String get stopBroadcasting => 'Uitzenden stoppen';

  @override
  String get startNintendoMode => 'Nintendo Modus starten';

  @override
  String get startFriendsMode => 'Start vrienden modus';

  @override
  String get startBroadcasting => 'Uitzending starten';

  @override
  String get modeLabel => 'Modus';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'Vrienden';

  @override
  String get nintendoInfoTitle => 'Nintendo Switch DNS-modus';

  @override
  String get nintendoInfoText =>
      'Start in Nintendo modus, stel uw DNS in en word lid van een featured server.';

  @override
  String get friendModeTitle => 'Vriend modus';

  @override
  String get friendModeText =>
      'Voeg MCCompanion\'s vriend bots toe als vriend, Start vriend modus en speel';

  @override
  String get selectedRelayCheck => 'Geselecteerd';

  @override
  String relayFallbackWarning(Object name) {
    return 'Waarschuwing: origineel Relay heeft niet gereageerd. Fallback Relay in gebruik: $name';
  }

  @override
  String get relayUnableConnect =>
      'Kan geen verbinding maken met geen enkele MCCompanion relay server. Probeer het later opnieuw of controleer je internet.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / proxyverbinding)';

  @override
  String get howToXboxSubtitle => 'Spelen via LAN of proxy';

  @override
  String get howToXboxBody =>
      'Hoe verbinding te maken (Xbox / PS4 / PS5):\n1. Zorg ervoor dat MCCompanion en jouw console op hetzelfde lokale netwerk zitten.\n2. Voer in de app uw Minecraft serveradres en poort in en druk op \"Uitzending Starten\".\n3. In de console open Minecraft → Play → zoek naar LAN werelden of het tabblad Vrienden en ververs de lijst.\n4. Selecteer de LAN-server genaamd \"MCCompanion\" om toe te treden.\nnotities:\n- Als de server niet verschijnt, bevestig dan dat beide apparaten op hetzelfde subnet staan en dat de app nog steeds wordt uitgezonden.\n- Sommige console modellen of routers kunnen LAN ontdekking blokkeren; probeer indien nodig de app of router aan te zetten.';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (DNS-modus)';

  @override
  String get howToNintendoSubtitle => 'Instructies voor DNS-relay voor Switch';

  @override
  String get howToNintendoBody =>
      'Nintendo Switch - DNS modus (stap voor stap):\n1. In de app \"Nintendo\" modus inschakelen en selecteer een Relay Server (EU of US).\n2. Tik op \"Stuur DNS Config\" om de gegevens naar het relay te sturen.\n3. Op uw Nintendo Switch ga naar Systeeminstellingen → Internet → internetinstellingen → (uw netwerk) → Instellingen wijzigen → DNS en stel de primaire DNS in op het relais-IP.\n4. Open Minecraft en word lid van een openbare server; je wordt omgeleid naar je server met behulp van de relay DNS.\nOpmerkingen:\n- DNS-modus zend geen LAN-server uit; het stuurt spelverkeer door de relais.\n- Zet je DNS terug nadat je klaar bent als je een normaal netwerkgedrag nodig hebt.';

  @override
  String get howToFriendsTitle => 'Vrienden modus';

  @override
  String get howToFriendsSubtitle => 'Nodig vrienden uit en doe mee via LAN';

  @override
  String get howToFriendsBody =>
      'Vrienden-modus - snelle stappen:\n1. Voeg het MCCompanionvriend-account (relay vriend) toe op uw console of platform indien nodig.\n2. Schakel in de app Vrienden modus in en stuur de relay configuratie.\n3. Open op je console Minecraft → Vrienden en zoek naar LAN Worlds - jouw server zou daar als een LAN-wereld moeten verschijnen.\n4. Selecteer het om je server te betreden.\nOpmerkingen:\n- Vriendschapsmodus is afhankelijk van de functies van het platform vriend en kan het vereisen dat je vriendschapsverzoeken accepteert.';

  @override
  String get helpMCCompanionTitle => 'MCCompanion verschijnt niet';

  @override
  String get helpMCCompanionSubtitle =>
      'Problemen met het oplossen van LAN ontdekking';

  @override
  String get helpMCCompanionBody =>
      'Als de server niet verschijnt op je console, probeer dan deze stappen:\n\n✅ Basiscontroles:\n\n1. Zelfde wifi-netwerk – Je telefoon/tablet en console MOETEN op dezelfde wifi zitten\n2. Correct serveradres – Controleer het IP-adres en de poort (standaard: 19132)\n3. Broadcasting actief – Controleer of MCCompanion de status \"Broadcasting\" toont\n\n🔄 Snelle oplossingen:\n• Herstart de app: Stop het uitzenden, sluit MCCompanion volledig af, open het opnieuw en probeer het opnieuw\n• Herstart je console: Soms heeft de console een refresh nodig om LAN-games te detecteren\n• Controleer het tabblad Vrienden/LAN: De server verschijnt onder \"Vrienden\" of \"LAN-games\", NIET in de serverlijst\n• Wacht 10–15 seconden na het starten van het uitzenden\n• Schakel VPN’s uit: VPN’s kunnen lokale broadcasts blokkeren\n\n⚠️ Veelvoorkomende problemen:\n\"Geen route gevonden voor gebruiker\" → Zorg ervoor dat beide apparaten op dezelfde wifi zitten (vermijd gastnetwerken)\n\"Kan geen verbinding maken met de MCCompanion relay-server\" → Controleer je internet / relay-status\n\n📱 Nog steeds problemen? Schakel de debugmodus in MCCompanion in en bekijk de logs, of probeer een andere server.';

  @override
  String get helpMultiplayerFailedTitle => 'Multiplayer verbinding mislukt';

  @override
  String get helpMultiplayerFailedSubtitle =>
      'Uitleg waarom dit geen MCCompanion fout is';

  @override
  String get helpMultiplayerFailedBody =>
      '⚠️ Dit is geen probleem met MCCompanion!\n\nMCCompanion heeft je met succes doorgestuurd naar de server. Het bericht \"Multiplayer Verbinding Mislukt\" geeft aan dat de doelserver op dit moment niet bereikbaar is. Mogelijke redenen:\n\n• De doel Minecraft-server is offline of overgeladen\n• De server vereist een bijgewerkte clientversie of specifieke editie\n• Netwerkproblemen tussen het relais en de doelserver\n\nProbeer verbinding te maken met een andere server of neem contact op met de ondersteuning van de server. Als het probleem aanhoudt voor meerdere servers, schakel dan Debug Mode in MCCompanion in en controleer de logs.';

  @override
  String get helpNintendoDnsTitle => 'Nintendo DNS werkt niet';

  @override
  String get helpNintendoDnsSubtitle =>
      'Voorkomende problemen met DNS / Relay (placeholder)';

  @override
  String get helpNintendoDnsBody =>
      'Als Nintendo DNS modus niet werkt, controleer dan het volgende:\n\n1. Bevestig dat je DNS-configuratie hebt gestuurd (Send DNS Config).\n2. Controleer of u het relais-IP als primaire DNS heeft toegepast op de Switch.\n3. Zorg ervoor dat de relaisserver (EU/US) online is en niet overbelast.\n4. Sommige netwerken (bijv. captive portals) voorkomen aangepaste DNS, test op een ander netwerk.\n\nAls problemen aanhouden, schakel dan Debug Mode in en bekijk de logs of probeer het alternatief Vriends-modus.';

  @override
  String get helpFriendsModeTitle => 'Vrienden modus werkt niet';

  @override
  String get helpFriendsModeSubtitle =>
      'Veelvoorkomende vriend/vinden problemen (placeholder)';

  @override
  String get helpFriendsModeBody =>
      'Vrienden-modus probleemoplossingstips:\n\n1. Zorg ervoor dat de relay account is toegevoegd/geaccepteerd in de console (indien nodig).\n2. Zorg ervoor dat zowel jij als je vrienden zichtbaarheid / NAT instellingen hebben die aanwezigheid toestaan.\n3. Probeer het spel opnieuw te starten en het tabblad Vrienden/LAN te verversen na het inschakelen van Vrienden-modus.\n\nAls de server nog steeds niet bij vrienden verschijnt, schakel dan Debugmodus in en controleer de logs om fouten te identificeren.';

  @override
  String get changeLanguageTitle => 'Taal wijzigen';

  @override
  String get changeLanguage => 'Taal';

  @override
  String get useSystemLanguage => 'Systeemtaal gebruiken';

  @override
  String get couldNotOpenUrl => 'Kon URL niet openen';

  @override
  String get serverTrackerTitle => 'Servertracker';

  @override
  String get removeServerTitle => 'Server verwijderen';

  @override
  String removeServerConfirm(Object name) {
    return '\"$name\" uit je tracker verwijderen?';
  }

  @override
  String get removeServerFailed => 'Server verwijderen mislukt';

  @override
  String get refreshStatus => 'Status vernieuwen';

  @override
  String get trackerSignInRequired => 'Aanmelden vereist';

  @override
  String get trackerSignInSubtitle =>
      'Meld je aan om servers bij te houden en offline meldingen te ontvangen.';

  @override
  String get signIn => 'Aanmelden';

  @override
  String get noServersTracked => 'Geen servers bijgehouden';

  @override
  String get trackerEmptySubtitle =>
      'Voeg een Minecraft-server toe om de status te monitoren en meldingen te ontvangen.';

  @override
  String get fillAllFields => 'Vul alle velden correct in';

  @override
  String get slotUsedUpgrade =>
      'Je gratis slot is gebruikt. Upgrade voor meer servers.';

  @override
  String get addServerFailed =>
      'Server toevoegen mislukt. Controleer je gegevens.';

  @override
  String get ipAddressLabel => 'IP-adres';

  @override
  String get platformLabel => 'Platform';

  @override
  String get bedrockLabel => 'Bedrock';

  @override
  String get addLabel => 'Toevoegen';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusChecking => 'Controleren...';

  @override
  String get notificationsOn => 'Meldingen aan';

  @override
  String get notificationsOff => 'Meldingen uit';

  @override
  String get failedUpdateNotifications => 'Meldingen bijwerken mislukt';

  @override
  String get editServerTitle => 'Server bewerken';

  @override
  String get serverNameHint => 'Servernaam';

  @override
  String get failedSave => 'Opslaan mislukt. Probeer opnieuw.';

  @override
  String get serverRenamed => 'Server hernoemd';

  @override
  String get customizeLabel => 'Aanpassen';

  @override
  String get customizeSubtitle => 'Tegels herordenen en navigatie aanpassen';

  @override
  String get resetLabel => 'Resetten';

  @override
  String get tilesSection => 'TEGELS';

  @override
  String get dragToReorder => 'Slepen om te herordenen';

  @override
  String get navigationSection => 'NAVIGATIE';

  @override
  String get navFixed => 'Start, Connector en Profiel zijn altijd vast';

  @override
  String get leftSlot => 'Linker slot (naast Start)';

  @override
  String get rightSlot => 'Rechter slot (naast Profiel)';

  @override
  String get tileWideTooltipRemove => 'Brede indeling verwijderen';

  @override
  String get tileWideTooltipAdd => 'Brede tegel maken';

  @override
  String get tileVisibilityShow => 'Tegel tonen';

  @override
  String get tileVisibilityHide => 'Tegel verbergen';

  @override
  String get tileVisibilityMin => 'Kan niet verbergen (laatste tegel)';

  @override
  String get colorPickerApply => 'Toepassen';

  @override
  String get colorPickerHex => 'Hex';

  @override
  String get textColorSection => 'TEKSTKLEUR';

  @override
  String get textColorPickerTitle => 'Tekstkleur';

  @override
  String get textColorHint =>
      'Tik op de cirkel om een aangepaste tekstkleur te kiezen';

  @override
  String get textColorPreviewPrimary => 'Primair';

  @override
  String get textColorPreviewSecondary => 'Secundair';

  @override
  String get textColorPreviewMuted => 'Gedempt';

  @override
  String get colorSwatchCustom => 'Aangepast';

  @override
  String get accentColorSection => 'ACCENTKLEUR';

  @override
  String get opacityLabel => 'Doorzichtigheid';

  @override
  String get backgroundSection => 'ACHTERGROND';

  @override
  String get cardsSection => 'KAARTEN';

  @override
  String get editLabel => 'Bewerken';

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
  String get reportUser => 'Gebruiker melden';

  @override
  String get reportMessage => 'Bericht melden';

  @override
  String reportUserWithName(Object name) {
    return '$name melden';
  }

  @override
  String get reportDisclaimer =>
      'Rapporten worden beoordeeld door ons team. Valse rapporten kunnen gevolgen hebben.';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonHarassment => 'Intimidatie';

  @override
  String get reportReasonInappropriate => 'Ongepaste inhoud';

  @override
  String get reportReasonOther => 'Anders';

  @override
  String get reportAdditionalDetails => 'Aanvullende details (optioneel)…';

  @override
  String get reportSuccess => 'Rapport ingediend. Dank je.';

  @override
  String get reportFailed =>
      'Rapport kon niet worden ingediend. Probeer opnieuw.';

  @override
  String get reportSubmit => 'Rapport indienen';

  @override
  String get today => 'Vandaag';

  @override
  String get yesterday => 'Gisteren';

  @override
  String get messagePlaceholder => 'Bericht…';

  @override
  String get noMessagesYet => 'Nog geen berichten.\nZeg hallo!';

  @override
  String get noConversationsYet => 'Nog geen gesprekken';

  @override
  String get startChatHint => 'Vind een vriend en begin te chatten!';

  @override
  String get youPrefix => 'Jij';

  @override
  String get playerLookupTitle => 'Speler opzoeken';

  @override
  String get playerLookupSubtitle =>
      'Zoek een Java- of Bedrock-speler op gebruikersnaam';

  @override
  String get playerLookupHint => 'Voer een gebruikersnaam in…';

  @override
  String get playerLookupLinked => 'Gekoppelde accounts gevonden';

  @override
  String get playerLookupLabelUsername => 'Gebruikersnaam';

  @override
  String get playerLookupLabelTier => 'Tier';

  @override
  String playerLookupCopied(Object value) {
    return '$value gekopieerd';
  }

  @override
  String get tabProfile => 'Profiel';

  @override
  String get tabFriends => 'Vrienden';

  @override
  String get tabRequests => 'Verzoeken';

  @override
  String get tabChats => 'Chats';

  @override
  String get addFriend => 'Vriend toevoegen';

  @override
  String get usernameHint => 'Gebruikersnaam';

  @override
  String get send => 'Versturen';

  @override
  String friendRequestSentTo(Object name) {
    return 'Vriendschapsverzoek verstuurd naar $name';
  }

  @override
  String alreadyFriendsWith(Object name) {
    return 'Je bent al vrienden met $name';
  }

  @override
  String requestAlreadyPending(Object name) {
    return 'Een verzoek aan $name is al in behandeling';
  }

  @override
  String userNotFoundMsg(Object name) {
    return 'Gebruiker $name niet gevonden';
  }

  @override
  String cannotSendRequest(Object name) {
    return 'Kan geen verzoek sturen naar $name';
  }

  @override
  String get somethingWentWrong => 'Er is iets misgegaan. Probeer opnieuw.';

  @override
  String friendRequestAccepted(Object name) {
    return 'Je bent nu vrienden met $name';
  }

  @override
  String requestDeclined(Object name) {
    return 'Verzoek van $name afgewezen';
  }

  @override
  String get deleteAccountTitle => 'Account verwijderen';

  @override
  String get deleteAccountBody =>
      'Dit verwijdert je account en alle gegevens permanent. Deze actie kan niet ongedaan worden gemaakt.';

  @override
  String get deletePermanently => 'Permanent verwijderen';

  @override
  String get couldNotDeleteAccount =>
      'Kon account niet verwijderen. Probeer opnieuw.';

  @override
  String get removeFriendTitle => 'Vriend verwijderen';

  @override
  String removeFriendConfirm(Object name) {
    return '$name verwijderen uit je vrienden?';
  }

  @override
  String get remove => 'Verwijderen';

  @override
  String friendRemoved(Object name) {
    return '$name is verwijderd uit je vrienden';
  }

  @override
  String get emailDifferentMethod =>
      'Dit e-mail is gekoppeld aan een andere aanmeldingsmethode';

  @override
  String get googleSignInFailed =>
      'Google aanmelding mislukt. Probeer opnieuw.';

  @override
  String get appleSignInFailed => 'Apple aanmelding mislukt. Probeer opnieuw.';

  @override
  String get resetPasswordTitle => 'Wachtwoord resetten';

  @override
  String get resetPasswordBody =>
      'Voer je e-mailadres in en we sturen je een link om je wachtwoord te resetten.';

  @override
  String get emailAddressHint => 'E-mailadres';

  @override
  String get sendLink => 'Link versturen';

  @override
  String resetLinkSent(Object email) {
    return 'Bestaat er een account voor $email, dan is er een resetlink onderweg';
  }

  @override
  String get noAccountForEmail => 'Geen account gevonden voor dat e-mailadres';

  @override
  String get invalidEmailError => 'Het e-mailadres is niet geldig';

  @override
  String get couldNotSendResetEmail =>
      'Kon reset-e-mail niet versturen. Probeer opnieuw.';

  @override
  String get enterEmailAndPassword => 'Voer je e-mail en wachtwoord in';

  @override
  String get incorrectEmailOrPassword => 'Onjuist e-mail of wachtwoord';

  @override
  String get emailAlreadyInUse => 'Dit e-mailadres is al in gebruik';

  @override
  String get weakPassword =>
      'Wachtwoord is te zwak. Kies een sterker wachtwoord.';

  @override
  String get createAccount => 'Account aanmaken';

  @override
  String get signInSubtitle =>
      'Log in om toegang te krijgen tot je profiel, vrienden en chats.';

  @override
  String get passwordHint => 'Wachtwoord';

  @override
  String get forgotPassword => 'Wachtwoord vergeten?';

  @override
  String get orDivider => 'of';

  @override
  String get continueWithGoogle => 'Doorgaan met Google';

  @override
  String get alreadyHaveAccount => 'Al een account? Inloggen';

  @override
  String get noAccountYet => 'Nog geen account? Maak er een';

  @override
  String get profileNotSetUp => 'Profiel niet ingesteld';

  @override
  String get chooseUsernameSubtitle =>
      'Kies een gebruikersnaam zodat andere spelers je kunnen vinden.';

  @override
  String get createProfile => 'Profiel aanmaken';

  @override
  String get findUser => 'Gebruiker zoeken';

  @override
  String get couldNotUpdateVisibility =>
      'Kon zichtbaarheidsinstellingen niet bijwerken';

  @override
  String get signOut => 'Uitloggen';

  @override
  String get appearOfflineLabel => 'Offline lijken';

  @override
  String get appearOfflineOn => 'Je lijkt offline voor andere spelers';

  @override
  String get appearOfflineOff => 'Je lijkt online voor andere spelers';

  @override
  String get unlinkXboxTitle => 'Xbox-account ontkoppelen';

  @override
  String removeLabelConfirm(Object name) {
    return '$name verwijderen uit je gekoppelde accounts?';
  }

  @override
  String get unlink => 'Ontkoppelen';

  @override
  String get unlinkJavaTitle => 'Java-account ontkoppelen';

  @override
  String removeJavaConfirm(Object name) {
    return '$name verwijderen uit je gekoppelde accounts?';
  }

  @override
  String get linkedAccountsTitle => 'Gekoppelde accounts';

  @override
  String get linkAccountsHint =>
      'Koppel je Minecraft-accounts om je skins en stats te tonen.';

  @override
  String get linkXbox => 'Xbox koppelen';

  @override
  String get linkJava => 'Java koppelen';

  @override
  String get profileUpdated => 'Profiel bijgewerkt';

  @override
  String get profileCardTitle => 'Profiel';

  @override
  String get edit => 'Bewerken';

  @override
  String get displayNameLabel => 'Weergavenaam';

  @override
  String get yourNameHint => 'Jouw naam';

  @override
  String get bioLabel => 'Bio';

  @override
  String get bioHint => 'Vertel anderen over jezelf…';

  @override
  String get avatarUrlLabel => 'Avatar URL';

  @override
  String get usernameDisplayLabel => 'Gebruikersnaam';

  @override
  String get aboutMe => 'Over mij';

  @override
  String get noFriendsYet => 'Nog geen vrienden';

  @override
  String get noFriendsSub => 'Voeg vrienden toe om ze hier te zien.';

  @override
  String onlineFriendsLabel(Object count) {
    return '$count online';
  }

  @override
  String offlineFriendsLabel(Object count) {
    return '$count offline';
  }

  @override
  String get noPendingRequests => 'Geen openstaande verzoeken';

  @override
  String get requestsAppearHere =>
      'Nieuwe vriendschapsverzoeken verschijnen hier.';

  @override
  String get skinsEdit => 'Bewerken';

  @override
  String get skinsNoAccountsTitle => 'Geen Minecraft-accounts gekoppeld';

  @override
  String get skinsNoAccountsSubtitle =>
      'Koppel een Java- of Bedrock-account om je skins te bekijken.';

  @override
  String get skinsSignInTitle => 'Log in om je skins te bekijken';

  @override
  String get skinsSignInSubtitle =>
      'Log in en koppel je Minecraft-accounts om je skins hier te zien.';

  @override
  String get skinsMustBe64 => 'Skin moet 64×64 pixels zijn';

  @override
  String get skinsInvalidFile => 'Ongeldig afbeeldingsbestand';

  @override
  String get skinsUpload => 'Uploaden';

  @override
  String get skinsCreate => 'Aanmaken';

  @override
  String get skinsSectionRecent => 'RECENTE SKINS';

  @override
  String get skinsSectionMy => 'MIJN SKINS';

  @override
  String get skinsEmptyMySkins =>
      'Nog geen opgeslagen skins. Upload er een of maak er een!';

  @override
  String get skinsSectionYours => 'JOUW SKINS';

  @override
  String get skinsCouldNotLoad => 'Skins konden niet worden geladen';

  @override
  String skinsPageOf(Object page, Object total) {
    return 'Pagina $page van $total';
  }

  @override
  String get skinsDownload => 'Downloaden';

  @override
  String get wikiTitle => 'Wiki';

  @override
  String get wikiMinecraftWiki => 'Minecraft Wiki';

  @override
  String get wikiSearchHint => 'Zoek in de wiki…';

  @override
  String get wikiCouldNotLoadPages =>
      'Pagina\'s konden niet worden geladen. Probeer opnieuw.';

  @override
  String get wikiCouldNotReach =>
      'Wiki kon niet worden bereikt. Controleer je verbinding.';

  @override
  String wikiNoResults(Object query) {
    return 'Geen resultaten gevonden voor \"$query\"';
  }

  @override
  String get wikiNoPagesFound => 'Geen pagina\'s gevonden';

  @override
  String wikiCategories(Object count) {
    return '$count categorieën';
  }

  @override
  String get wikiCouldNotLoadContent =>
      'Artikelinhoud kon niet worden geladen.';

  @override
  String get wikiOpenInBrowser => 'Openen in browser';

  @override
  String get wikiCrafting => 'Ambacht';

  @override
  String get wikiReadFullArticle => 'Volledig artikel lezen';

  @override
  String get wikiRecent => 'Onlangs bekeken';

  @override
  String get wikiFavourites => 'Favorieten';

  @override
  String get wikiMobs => 'Mobs';

  @override
  String get wikiBlocks => 'Blokken';

  @override
  String get wikiItems => 'Voorwerpen';

  @override
  String get wikiBiomes => 'Biotopen';

  @override
  String get wikiStructures => 'Structuren';

  @override
  String get wikiEnchantments => 'Betoveringen';

  @override
  String get wikiPotions => 'Drankjes';

  @override
  String get wikiPassive => 'Passief';

  @override
  String get wikiNeutral => 'Neutraal';

  @override
  String get wikiHostile => 'Vijandig';

  @override
  String get wikiBoss => 'Baas';

  @override
  String get wikiUtility => 'Nut';

  @override
  String get wikiNatural => 'Natuurlijk';

  @override
  String get wikiOres => 'Ertsen';

  @override
  String get wikiWood => 'Hout';

  @override
  String get wikiStone => 'Steen';

  @override
  String get wikiRedstone => 'Redstone';

  @override
  String get wikiPlants => 'Planten';

  @override
  String get wikiDecoration => 'Decoratie';

  @override
  String get wikiTools => 'Gereedschappen';

  @override
  String get wikiSwords => 'Zwaarden';

  @override
  String get wikiRanged => 'Afstand';

  @override
  String get wikiArmor => 'Wapenrusting';

  @override
  String get wikiFood => 'Eten';

  @override
  String get wikiBrewing => 'Brouwen';

  @override
  String get wikiMaterials => 'Materialen';

  @override
  String get wikiOverworld => 'Overworld';

  @override
  String get wikiNether => 'Nether';

  @override
  String get wikiTheEnd => 'The End';

  @override
  String get wikiSword => 'Zwaard';

  @override
  String get wikiTool => 'Gereedschap';

  @override
  String get wikiBow => 'Boog';

  @override
  String get wikiFishing => 'Vissen';

  @override
  String get wikiStatusEffects => 'Statuseffecten';

  @override
  String get chooseUniqueUsername =>
      'Kies een unieke gebruikersnaam om te beginnen.';

  @override
  String get usernameFieldLabel => 'Gebruikersnaam';

  @override
  String get usernameExampleHint => 'bijv. CoolPlayer123';

  @override
  String get usernameFormatHint =>
      '3–20 tekens · letters, cijfers en underscores';

  @override
  String get displayNameOptional => 'Weergavenaam (optioneel)';

  @override
  String get displayNameExampleHint => 'bijv. Coole Speler';

  @override
  String get usernameRequired => 'Gebruikersnaam is verplicht';

  @override
  String get usernameFormatError =>
      'De gebruikersnaam moet 3–20 tekens lang zijn en mag alleen letters, cijfers en underscores bevatten';

  @override
  String get usernameTaken => 'Deze gebruikersnaam is al bezet';

  @override
  String get noConnectionError =>
      'Geen verbinding. Controleer je internet en probeer opnieuw.';

  @override
  String get home => 'Home';

  @override
  String get info => 'Info';

  @override
  String get navProfile => 'Profiel';

  @override
  String serverRemoved(Object name) {
    return '$name verwijderd';
  }

  @override
  String serverAdded(Object name) {
    return '$name toegevoegd';
  }

  @override
  String get paywallRestore => 'Herstellen';

  @override
  String get paywallMonthly => 'Maandelijks';

  @override
  String get paywallYearly => 'Jaarlijks';

  @override
  String get paywallSavePercent => 'Bespaar ~17%';

  @override
  String get paywallSubtitle =>
      'Volg meer servers en ontvang meldingen\nwanneer ze online of offline gaan.';

  @override
  String paywallSlotLabel(Object slots) {
    return '$slots serverslots';
  }

  @override
  String get paywallPopular => 'Populair';

  @override
  String get paywallContinue => 'Doorgaan';

  @override
  String get paywallNoPkgs => 'Geen pakketten beschikbaar.';

  @override
  String get paywallManaged =>
      'Beheerd door Apple/Google. Op elk moment annuleren.';

  @override
  String get paywallPurchaseSuccess => 'Aankoop geslaagd!';

  @override
  String get paywallPurchaseFailed => 'Aankoop mislukt. Probeer opnieuw.';

  @override
  String get paywallPurchasesRestored => 'Aankopen hersteld!';

  @override
  String get paywallNoActivePurchases => 'Geen actieve aankopen gevonden.';

  @override
  String get paywallRestoreFailed => 'Herstellen mislukt. Probeer opnieuw.';

  @override
  String get relay => 'Relay';

  @override
  String get selectModeSection => 'MODUS KIEZEN';

  @override
  String get serversSection => 'SERVERS';

  @override
  String get noServerSelected => 'Geen server geselecteerd';

  @override
  String get selectBedrockAccount => 'Bedrock-account kiezen';

  @override
  String playersCount(Object players, Object max) {
    return '$players / $max spelers';
  }

  @override
  String get infoAndLegal => 'Info & Juridisch';

  @override
  String get legalSection => 'Juridisch';

  @override
  String get privacyPolicy => 'Privacybeleid';

  @override
  String get privacyPolicySubtitle =>
      'Hoe we je gegevens verzamelen en beschermen';

  @override
  String get termsOfService => 'Servicevoorwaarden';

  @override
  String get termsOfServiceSubtitle => 'Regels en gebruiksvoorwaarden';

  @override
  String get dataSourcesSection => 'Gegevensbronnen & credits';

  @override
  String get creditMinecraftWikiSubtitle =>
      'Gebruikt als gegevensbron voor de Wiki-functie. Inhoud wordt door de community geleverd onder Creative Commons.';

  @override
  String get creditMojangTitle => 'Mojang / Microsoft';

  @override
  String get creditMojangSubtitle =>
      'Java-speler skins, UUID\'s en profielgegevens via de officiële Mojang API.';

  @override
  String get creditGeyserTitle => 'GeyserMC';

  @override
  String get creditGeyserSubtitle =>
      'Bedrock skin rendering. Skins voor Bedrock-spelers worden opgehaald via de GeyserMC skin-server.';

  @override
  String get creditXboxTitle => 'Xbox / Microsoft';

  @override
  String get creditXboxSubtitle =>
      'Bedrock-accountkoppeling via Xbox Live. Gamertags en XUID\'s worden opgehaald via de Microsoft-authenticatiestroom.';

  @override
  String get aboutMCCompanionSection => 'Over MCCompanion';

  @override
  String get aboutMCCompanionDisclaimer =>
      'MCCompanion is een onafhankelijke applicatie en is niet gelieerd aan, goedgekeurd door of gesponsord door Mojang Studios of Microsoft Corporation.';

  @override
  String get minecraftTrademark =>
      '\"Minecraft\" is een handelsmerk van Microsoft Corporation.';

  @override
  String get nldServerLabelShort => 'MCCompanion Server';

  @override
  String get editServer => 'Server bewerken';

  @override
  String get serverNameExampleHint => 'Mijn Geweldige Server';

  @override
  String get serverAddressExampleHint => 'play.voorbeeld.com';

  @override
  String get serverDescriptionExampleHint => 'Survival server met vrienden';

  @override
  String get editionLabel => 'Editie';

  @override
  String get nameLabel => 'Naam';

  @override
  String get ipAddressFieldLabel => 'IP-adres';

  @override
  String get portFieldLabel => 'Poort';

  @override
  String get platformFieldLabel => 'Platform';

  @override
  String get nameValidationError => 'Naam moet 1–50 tekens zijn';

  @override
  String get ipRequiredError => 'IP-adres is verplicht';

  @override
  String get portRangeError => 'Poort moet tussen 1 en 65535 zijn';

  @override
  String get partnerServersTitle => 'Partnerservers';

  @override
  String get noPartnerServers => 'Nog geen partnerservers beschikbaar.';

  @override
  String get checkBackLater => 'Kom later terug.';

  @override
  String get xboxLinkTitle => 'Xbox-account koppelen';

  @override
  String get xboxStartingLogin => 'Xbox-login starten…';

  @override
  String get xboxSignInWithMicrosoft => 'Aanmelden met Microsoft';

  @override
  String get xboxGoToLink =>
      'Ga naar de onderstaande link en voer de code in om je Xbox-account te koppelen.';

  @override
  String get xboxYourCode => 'Jouw code';

  @override
  String get xboxTapToCopy => 'Tik op de code om te kopiëren';

  @override
  String get xboxOpenLink => 'Open microsoft.com/link';

  @override
  String get xboxWaitingForLogin => 'Wachten op login…';

  @override
  String get xboxAccountLinked => 'Xbox-account gekoppeld!';

  @override
  String get xboxCodeCopied => 'Code gekopieerd naar klembord';

  @override
  String get xboxCouldNotStart =>
      'Kon Xbox-login niet starten. Probeer opnieuw.';

  @override
  String get xboxCodeExpired => 'De code is verlopen. Probeer opnieuw.';

  @override
  String get xboxSomethingWrong => 'Er is iets misgegaan. Probeer opnieuw.';

  @override
  String get tryAgain => 'Opnieuw proberen';

  @override
  String get publicProfileTitle => 'Profiel';

  @override
  String get userNotFound => 'Gebruiker niet gevonden';

  @override
  String get profileSectionLabel => 'Profiel';

  @override
  String get displayNameRowLabel => 'Weergavenaam';

  @override
  String get usernameRowLabel => 'Gebruikersnaam';

  @override
  String get lastSeenLabel => 'Laatst gezien';

  @override
  String get aboutSectionLabel => 'Over';

  @override
  String get xboxBedrockLabel => 'Xbox / Bedrock';

  @override
  String get friendRequestSent => 'Vriendschapsverzoek verstuurd';

  @override
  String get alreadyFriendsMsg => 'Jullie zijn al vrienden.';

  @override
  String get requestAlreadyPendingMsg => 'Er is al een openstaand verzoek.';

  @override
  String get userNotFoundMsg2 => 'Gebruiker niet gevonden.';

  @override
  String get cannotSendRequestMsg =>
      'Kan geen verzoek sturen naar deze gebruiker.';

  @override
  String nowFriendsWith(Object username) {
    return 'Nu vrienden met @$username';
  }

  @override
  String get removeFriendButton => 'Vriend verwijderen';

  @override
  String get requestSentButton => 'Verzoek verstuurd';

  @override
  String get acceptRequestButton => 'Verzoek accepteren';

  @override
  String get addFriendButton => 'Vriend toevoegen';

  @override
  String get removeFriendDialogTitle => 'Vriend verwijderen';

  @override
  String removeFriendDialogBody(Object username) {
    return '@$username als vriend verwijderen?';
  }

  @override
  String get trackerLimitReached =>
      'Je hebt je serverlimiet bereikt. Upgrade om meer servers te volgen.';

  @override
  String get upgradeButton => 'Upgraden';

  @override
  String get javaLinkTitle => 'Java Edition koppelen';

  @override
  String get javaStartingLogin => 'Microsoft-aanmelding starten…';

  @override
  String get javaSignInWithMicrosoft => 'Aanmelden met Microsoft';

  @override
  String get javaGoToLink =>
      'Ga naar de onderstaande link en voer de code in om je Minecraft Java Edition-account te koppelen.';

  @override
  String get javaYourCode => 'Jouw code';

  @override
  String get javaTapToCopy => 'Tik op de code om te kopiëren';

  @override
  String get javaOpenLink => 'Open microsoft.com/link';

  @override
  String get javaWaitingForLogin => 'Wachten op aanmelding…';

  @override
  String get javaAccountLinked => 'Java Edition gekoppeld!';

  @override
  String get javaNoJavaTitle => 'Geen Java Edition gevonden';

  @override
  String get javaNoJavaBody =>
      'Het Microsoft-account waarmee je bent aangemeld, bezit geen Minecraft Java Edition.';

  @override
  String get javaTryDifferentAccount => 'Probeer een ander account';

  @override
  String get javaCouldNotStart =>
      'Kon Microsoft-aanmelding niet starten. Probeer opnieuw.';

  @override
  String get javaCodeExpired => 'De code is verlopen. Probeer opnieuw.';

  @override
  String get javaSomethingWrong => 'Er ging iets mis. Probeer opnieuw.';

  @override
  String get javaCodeCopied => 'Code gekopieerd naar klembord';

  @override
  String get splashFeatureConnect => 'Verbinden';

  @override
  String get splashFeatureFriends => 'Vrienden';

  @override
  String get splashFeatureChat => 'Chat';

  @override
  String get splashFeatureSkins => 'Skins';

  @override
  String get featureLabelConnector => 'Connector';

  @override
  String get featureLabelSkins => 'Skins';

  @override
  String get featureLabelWiki => 'Wiki';

  @override
  String get featureLabelPartners => 'Partners';

  @override
  String get featureLabelLookup => 'Opzoeken';

  @override
  String get featureLabelTracker => 'Server Tracker';

  @override
  String get featureSubtitleConnector => 'Verbind consoles met Minecraft';

  @override
  String get featureSubtitleSkins => 'Blader door en beheer Minecraft-skins';

  @override
  String get featureSubtitleWiki => 'Minecraft-encyclopedie';

  @override
  String get featureSubtitlePartners => 'Aanbevolen servers';

  @override
  String get featureSubtitleLookup => 'Zoek Java- en Bedrock-profielen op';

  @override
  String get featureSubtitleTracker =>
      'Monitor serverstatus en ontvang meldingen';

  @override
  String get userSearchHint => 'Gebruikersnaam, gamertag of Java-naam…';

  @override
  String get userSearchSub =>
      'Zoek op gebruikersnaam, Xbox-gamertag of Java-naam';

  @override
  String get onlineStatus => 'Online';

  @override
  String get upgradeWindowsHint => 'Upgrade beschikbaar via de Microsoft Store';

  @override
  String get chatEmptyHint => 'Wees de eerste om iets te zeggen!';

  @override
  String get skinSaved => 'Skin opgeslagen';

  @override
  String skinSavedAs(String name) {
    return 'Opgeslagen als \"$name\"';
  }

  @override
  String get skinExportFailed => 'Exporteren mislukt';

  @override
  String get skinExported => 'Skin succesvol geexporteerd';

  @override
  String get accountActions => 'ACCOUNT';

  @override
  String get feedbackBugReport => 'Bugmelding';

  @override
  String get feedbackFeatureRequest => 'Functieverzoek';

  @override
  String get feedbackGoesToGithub => 'Gaat direct naar GitHub';

  @override
  String get feedbackTitleLabel => 'Titel';

  @override
  String get feedbackTitleHintBug =>
      'bijv. App crasht bij openen van de skin-editor';

  @override
  String get feedbackTitleHintFeature =>
      'bijv. Toon ping van speler in de serverlijst';

  @override
  String get feedbackWhatHappened => 'Wat is er gebeurd?';

  @override
  String get feedbackDescribeIdea => 'Beschrijf je idee';

  @override
  String get feedbackDescHintBug =>
      'Beschrijf de bug: wat heb je gedaan, wat verwachtte je, en wat gebeurde er in plaats daarvan?';

  @override
  String get feedbackDescHintFeature =>
      'Leg uit wat je wilt en waarom het nuttig zou zijn.';

  @override
  String get feedbackEmailLabel => 'E-mail';

  @override
  String get feedbackEmailHint => 'Zodat we contact met je kunnen opnemen';

  @override
  String get feedbackEmailNote => 'Je e-mail wordt nooit openbaar gedeeld.';

  @override
  String get feedbackSubmitBug => 'Bugmelding indienen';

  @override
  String get feedbackSubmitFeature => 'Functieverzoek indienen';

  @override
  String get feedbackDisclaimer =>
      'Maakt een openbaar issue op GitHub · Geen wachtwoorden invullen';

  @override
  String get feedbackSuccessTitle => 'Bedankt voor de feedback!';

  @override
  String get feedbackSuccessBody =>
      'Bedankt! Je melding staat erin. We bekijken het zo snel mogelijk.';

  @override
  String get feedbackViewOnGithub => 'Bekijk op GitHub';

  @override
  String get feedbackSubmitAnother => 'Nog een indienen';

  @override
  String get feedbackBackToApp => 'Terug naar app';

  @override
  String get feedbackTitleTooShort => 'Titel moet minimaal 5 tekens zijn.';

  @override
  String get feedbackDescTooShort =>
      'Beschrijving moet minimaal 10 tekens zijn.';

  @override
  String get feedbackEmailInvalid => 'Voer een geldig e-mailadres in.';

  @override
  String get feedbackSubmitFailed => 'Indienen mislukt. Probeer het opnieuw.';

  @override
  String get feedbackTileTitle => 'Meld een bug of stel een functie voor';

  @override
  String get reportBug => 'Feedback';

  @override
  String get feedbackTileSubtitle => 'Help ons MCCompanion te verbeteren';

  @override
  String get friendsHowToStep1 => 'Open de Xbox-app op je telefoon of console.';

  @override
  String get friendsHowToStep2 =>
      'Voeg een van de bots hieronder toe als vriend op Xbox.';

  @override
  String get friendsHowToStep3 =>
      'Open Minecraft en ga naar het tabblad Vrienden.';

  @override
  String get friendsHowToStep4 =>
      'Zoek naar je server onder LAN-werelden en sluit je aan.';

  @override
  String get friendsHowToNote =>
      '⚠️ Elke keer dat je wilt spelen, moet je eerst Vriendenmodus starten in de MCCompanion-app. Je kunt de app daarna sluiten.';

  @override
  String get friendsBotLoadError =>
      '⚠️ Kan de botlijst niet laden. Probeer het later opnieuw.';

  @override
  String get regionEurope => 'Europa';

  @override
  String get regionUnitedStates => 'Verenigde Staten';

  @override
  String get yourRegion => 'JOUW REGIO';

  @override
  String get botStatusOffline => 'Offline';

  @override
  String get botStatusFull => 'Vol';

  @override
  String botFriendCount(Object current, Object max) {
    return '$current / $max vrienden';
  }

  @override
  String botCopied(Object gamertag) {
    return '$gamertag gekopieerd';
  }

  @override
  String get copyLabel => 'Kopieer';

  @override
  String get skinSavedToDocuments => 'Skin opgeslagen in Documenten';

  @override
  String get skinMenuExport => 'Exporteren';

  @override
  String get skinMenuDelete => 'Verwijderen';

  @override
  String get rpScreenTitle => 'Resourcepakket';

  @override
  String get rpWhatIsThis => 'Wat is dit?';

  @override
  String get rpExplanation =>
      'Een resourcepakket verandert hoe Minecraft er op jouw console uitziet, nieuwe blokken, kleuren of geluiden. Plak hieronder de link van een .mcpack bestand, zet het aan en sla op. MCCompanion laadt het automatisch elke keer als je verbindt.';

  @override
  String get rpPackUrlLabel => 'Pack-URL';

  @override
  String get rpPackUrlHint => 'https://example.com/pack.mcpack';

  @override
  String get rpEnableToggle => 'Resourcepakket inschakelen';

  @override
  String get rpWhatWorks => 'Wat werkt';

  @override
  String get rpSupportedBedrockOnly =>
      'Alleen Bedrock Edition (.mcpack of .zip)';

  @override
  String get rpSupportedBedrockOnlyHint =>
      'Java-packs werken niet op consoles.';

  @override
  String get rpSupportedTexture => 'Resourcepaketten & texturepaketten';

  @override
  String get rpSupportedTextureHint =>
      'Deze worden officieel ondersteund en werken betrouwbaar.';

  @override
  String get rpUnsupportedShaders => 'Shaders, gedragspaketten, skinpaketten';

  @override
  String get rpUnsupportedShadersHint =>
      'Deze worden niet geladen op consoles via MCCompanion.';

  @override
  String get rpUnsupportedAddons => 'Add-ons & UI-mods';

  @override
  String get rpUnsupportedAddonsHint =>
      'Kunnen soms werken, maar worden niet officieel ondersteund. Gebruik op eigen risico.';

  @override
  String get rpNoDiscord =>
      'Discord-links: geen .mcpack-extensie en verlopen na een paar uur';

  @override
  String get rpNoDrive =>
      'Gedeelde links van Google Drive / Dropbox, geen directe downloads';

  @override
  String get rpNoEncrypted =>
      'Servers met versleutelde of wachtwoordbeveiligde packs';

  @override
  String get rpConsolePerformanceTitle => 'Consoleprestaties';

  @override
  String get rpConsolePerformanceBody =>
      'Texturepaketten met hoge resolutie kunnen lag of crashes veroorzaken op consoles. Als je problemen ervaart, schakel over op een pakket met lagere resolutie of selecteer een lichter subpakket als dat beschikbaar is.';

  @override
  String get rpWarnDiscord =>
      'Discord-links verlopen en werken dan niet meer. Gebruik een permanente host.';

  @override
  String get rpWarnHttps => 'URL moet beginnen met https://';

  @override
  String get rpWarnExtension => 'URL moet eindigen op .mcpack of .zip';

  @override
  String get rpToastEnterUrl =>
      'Voer een URL in voordat je het resourcepakket inschakelt.';

  @override
  String get rpToastSaved => 'Instellingen resourcepakket opgeslagen.';

  @override
  String get rpInvalidPackFormat =>
      'Dit is een Java Edition-pakket en wordt niet ondersteund. Gebruik een Bedrock Edition-resourcepakket.';

  @override
  String get rpBehaviorContentWarning =>
      'Dit pakket bevat behavior pack-data, die werkt niet op servers. De textures werken wel gewoon.';

  @override
  String get rpClearMinecraftTitle => 'Eerste keer met dit pakket?';

  @override
  String get rpClearMinecraftBody =>
      'Minecraft slaat resourcepakketten lokaal op in de cache. Als je eerder verbinding hebt gemaakt met deze server vóór het inschakelen van MCCompanion\'s resourcepakket, heeft Minecraft het originele pakket al gecached en zal de samengevoegde versie niet opnieuw downloaden.';

  @override
  String get rpClearStep1 =>
      'Open Minecraft op je console en ga naar Instellingen → Opslag';

  @override
  String get rpClearStep2 =>
      'Tik op ‘Wissen’ of ‘Opnieuw instellen’ naast Resourcepakketten, dit verwijdert alle lokaal opgeslagen packs';

  @override
  String get rpClearStep3 =>
      'Verbind opnieuw via MCCompanion: het samengevoegde pakket wordt automatisch gedownload';

  @override
  String get rpRelayTitle => 'Pack ziet er niet goed uit?';

  @override
  String get rpRelayBody =>
      'De relay bewaart de samengevoegde pack 1 uur in de cache op basis van jouw overlay-URL. Om een verse samenvoeging te forceren: pas de pack-URL iets aan (bijv. voeg ?v=2 toe) en sla op. Wis daarna ook de Minecraft-packcache, de samengevoegde pack gebruikt nog steeds de UUID van de server, dus Minecraft serveert anders gewoon de oude gecachte versie.';

  @override
  String get rpWorksGithubHint => 'Directe downloadlink: altijd bereikbaar';

  @override
  String get rpWorksCloudflareHint =>
      'Publieke cloudopslag: snel en betrouwbaar';

  @override
  String get rpWorksDirectHint => 'Elke publieke HTTPS .mcpack of .zip URL';

  @override
  String get rpNoDiscordHint => 'Discord CDN-links verlopen na korte tijd';

  @override
  String get rpNoDriveHint =>
      'Geen directe download: stuurt door naar een voorbeeldpagina';

  @override
  String get rpNoEncryptedHint =>
      'MCCompanion kan versleutelde packinhoud niet samenvoegen';

  @override
  String get rpClearWhy =>
      'Minecraft slaat resourcepakketten op via hun UUID. De samengevoegde pack behoudt de originele UUID van de server, als Minecraft de serverpack al gecacht heeft van een vorige sessie (vóór MCCompanion was ingeschakeld), downloadt het de nieuwe samengevoegde versie niet opnieuw. Wis de cache zodat Minecraft de verse samengevoegde pack oppikt.';

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
  String get rpMergerTitle => 'RP Merger';

  @override
  String get rpMergerSubtitle => 'Combineer tot 4 resourcepacks';

  @override
  String get rpMergerPriorityHint =>
      'Het bovenste pack heeft de hoogste prioriteit, zijn bestanden winnen conflicten.';

  @override
  String get rpMergerTopBadge => 'TOP';

  @override
  String get rpMergerAddPacks => 'Resourcepacks toevoegen';

  @override
  String rpMergerAddAnother(int current) {
    return 'Nog een pack toevoegen ($current/4)';
  }

  @override
  String get rpMergerFileTypes => '.zip of .mcpack';

  @override
  String get rpMergerMerging => 'Samenvoegen…';

  @override
  String rpMergerButton(int count) {
    return '$count packs samenvoegen';
  }

  @override
  String get rpMergerComplete => 'Samenvoegen voltooid!';

  @override
  String rpMergerConflicts(int count) {
    return '$count conflict(en) opgelost: bovenste pack won.';
  }

  @override
  String get rpMergerSetActive => 'Instellen als actief resourcepack';

  @override
  String get rpMergerSetActiveToast => 'Ingesteld als actief resourcepack';

  @override
  String get rpMergerOpenButton => 'Resourcepacks samenvoegen';

  @override
  String get rpMergerOpenSubtitle => 'Combineer 2-4 packs in een';

  @override
  String get rpDisabled => 'Uitgeschakeld';

  @override
  String get rpNoPackSelected => 'Geen resource pack geselecteerd';

  @override
  String get rpActiveOnConnect => 'Actief: toegepast bij verbinding';

  @override
  String get rpBrowseSubtitle => 'Gecureerde packs, klaar voor gebruik';

  @override
  String get rpBrowseEmpty => 'Nog geen packs beschikbaar';

  @override
  String get rpBrowseEmptyHint => 'Kom later terug voor gecureerde packs.';

  @override
  String get rpReplaceFile => 'Vervang door een ander bestand';

  @override
  String get rpDropToUpload => 'Laat los om te uploaden';

  @override
  String get rpTabBrowseInfo =>
      'Blader door packs geselecteerd door MCCompanion. Tik op Gebruik om een pack direct te activeren, geen upload of link nodig.';

  @override
  String get rpTabUploadInfo =>
      'Upload je eigen .mcpack of .zip bestand. MCCompanion slaat het veilig op in de cloud en stuurt het elke keer naar je console wanneer je verbindt.';

  @override
  String get rpTabUrlInfo =>
      'Plak een directe downloadlink naar een .mcpack of .zip bestand. De URL moet publiek toegankelijk zijn, geen Discord- of Google Drive-links.';

  @override
  String get rpTabMergeInfo =>
      'Combineer 2 tot 4 packs tot één. Het samengevoegde pack wordt geüpload naar MCCompanion Cloud en automatisch geactiveerd.';

  @override
  String get shareLabel => 'Delen';

  @override
  String get sectionMinecraftAccounts => 'Minecraft-accounts';

  @override
  String get sectionSettings => 'Instellingen';

  @override
  String get avatarUpdated => 'Avatar bijgewerkt';

  @override
  String get uploadFailed => 'Upload mislukt';

  @override
  String get profileLinkCopied => 'Profiellink gekopieerd!';

  @override
  String get shareProfileTooltip => 'Profiel delen';

  @override
  String get profileFallbackTitle => 'Profiel';

  @override
  String get noUsersFound => 'Geen gebruikers gevonden';

  @override
  String get skinLabel => 'SKIN';

  @override
  String get skinsLabel => 'SKINS';

  @override
  String get javaEditionBadge => 'Java';

  @override
  String get bedrockEditionBadge => 'Bedrock';

  @override
  String get downloadLabel => 'Downloaden';

  @override
  String get justNow => 'Zojuist';

  @override
  String minutesAgo(int count) {
    return '${count}m geleden';
  }

  @override
  String hoursAgo(int count) {
    return '${count}u geleden';
  }

  @override
  String daysAgo(int count) {
    return '${count}d geleden';
  }

  @override
  String get rpPackInfo => 'Info';

  @override
  String get rpUseThisPack => 'Gebruik dit pack';

  @override
  String get rpViewOnWebsite => 'Bekijk op website →';

  @override
  String rpDownloads(int count) {
    return '$count downloads';
  }

  @override
  String get rpPackDetailTitle => 'Pack details';

  @override
  String get skinsSavedToMySkins => 'Opgeslagen in Mijn Skins';

  @override
  String get skinsDownloadFailed => 'Download mislukt';

  @override
  String get skinsDeletedFromCloud => 'Verwijderd uit de cloud';

  @override
  String get skinsDeleteFailed => 'Verwijderen mislukt';

  @override
  String get skinsLoginToUpload => 'Log in om skins te uploaden';

  @override
  String get skinsUploading => 'Uploaden…';

  @override
  String get skinUploaded => 'Skin geüpload!';

  @override
  String skinUploadFailed(String error) {
    return 'Upload mislukt: $error';
  }

  @override
  String get skinsTabSkins => 'Skins';

  @override
  String get skinsTabRecent => 'Recent';

  @override
  String get skinsEmptyCloudSkins =>
      'Nog geen cloud-skins. Upload een skin om deze hier te zien.';

  @override
  String get skinsEmptyLocalSkins =>
      'Nog geen skins. Maak of upload een skin om te beginnen.';

  @override
  String get skinUploadToWebsite => 'Uploaden naar website';

  @override
  String get skinReuploadToWebsite => 'Opnieuw uploaden naar website';

  @override
  String get skinCloudEdit => 'Bewerken';

  @override
  String get skinCloudSaveToDevice => 'Opslaan op apparaat';

  @override
  String get skinCloudDelete => 'Verwijderen uit cloud';

  @override
  String get skinsTabGallery => 'Galerij';

  @override
  String get skinsGalleryEmpty => 'Nog geen community-skins.';

  @override
  String get skinsTopLabel => 'Top 30';

  @override
  String get skinsAllLabel => 'Alle Skins';

  @override
  String get skinUploadToCloud => 'Uploaden naar cloud';

  @override
  String get skinSaveDialog => 'Skin opslaan';

  @override
  String get skinNameHint => 'Skin naam';

  @override
  String get skinDefaultName => 'Mijn skin';

  @override
  String get skinUpdatedInCloud => 'Skin bijgewerkt in cloud';

  @override
  String skinByCreator(String name) {
    return 'door $name';
  }

  @override
  String skinLikesCount(int count) {
    return '$count likes';
  }

  @override
  String get sectionRecentActivity => 'Recente activiteit';

  @override
  String get activityNoEvents => 'Nog geen recente activiteit.';

  @override
  String get activitySkinUploaded => 'Skin geüpload';

  @override
  String get activitySkinLiked => 'Skin geliket';

  @override
  String get activityPackSubmitted => 'Pack ingediend';

  @override
  String get activityPackApproved => 'Pack goedgekeurd';

  @override
  String get activityPackRejected => 'Pack niet goedgekeurd';

  @override
  String get timeJustNow => 'zojuist';

  @override
  String timeMinutesAgo(int count) {
    return '${count}m geleden';
  }

  @override
  String timeHoursAgo(int count) {
    return '${count}u geleden';
  }

  @override
  String timeDaysAgo(int count) {
    return '${count}d geleden';
  }

  @override
  String timeMonthsAgo(int count) {
    return '${count}ma geleden';
  }

  @override
  String get sectionNotifications => 'Meldingen';

  @override
  String get sectionNotificationTypes => 'Meldingstypen';

  @override
  String get notifMarkAllRead => 'Alles als gelezen markeren';

  @override
  String get notifEmpty =>
      'Nog geen meldingen. Likes, reacties en vriendenactiviteit verschijnen hier.';

  @override
  String get notifSomeone => 'Iemand';

  @override
  String notifSkinLiked(String actor) {
    return '$actor vindt je skin leuk';
  }

  @override
  String notifCommentReceived(String actor) {
    return '$actor reageerde op je skin';
  }

  @override
  String get notifPackApproved => 'Pack goedgekeurd';

  @override
  String get notifPackRejected => 'Pack niet goedgekeurd';

  @override
  String notifFriendRequest(String actor) {
    return '$actor stuurde je een vriendschapsverzoek';
  }

  @override
  String notifFriendAccepted(String actor) {
    return '$actor accepteerde je verzoek';
  }

  @override
  String notifMessageReceived(String actor) {
    return 'Nieuw bericht van $actor';
  }

  @override
  String get notifPrefSkinLiked => 'Skin geliket';

  @override
  String get notifPrefCommentReceived => 'Reactie ontvangen';

  @override
  String get notifPrefPackApproved => 'Pack goedgekeurd';

  @override
  String get notifPrefPackRejected => 'Pack afgewezen';

  @override
  String get notifPrefFriendRequest => 'Vriendschapsverzoek';

  @override
  String get notifPrefFriendAccepted => 'Vriend toegevoegd';

  @override
  String get notifPrefMessageReceived => 'Nieuw bericht';

  @override
  String get commentsTitle => 'Reacties';

  @override
  String get commentsEmpty => 'Nog geen reacties. Wees de eerste!';

  @override
  String get commentsPlaceholder => 'Schrijf een reactie…';

  @override
  String get loadMore => 'Meer laden';

  @override
  String get skinLayerInner => 'Binnen';

  @override
  String get skinLayerOuter => 'Buiten';

  @override
  String get feedbackLoginRequiredTitle => 'Log in om feedback te sturen';

  @override
  String get feedbackLoginRequiredBody =>
      'Feedback is gekoppeld aan je MCCompanion-account zodat we je rechtstreeks in de app kunnen antwoorden.';

  @override
  String get feedbackLoginButton => 'Inloggen';

  @override
  String get supportInboxTitle => 'Supportinbox';

  @override
  String get supportInboxSubtitle =>
      'Alle supportgesprekken, gedeeld met alle admins';

  @override
  String get adminBadge => 'Admin';

  @override
  String get skinShareSubject => 'Minecraft-skin';

  @override
  String get skinEditorTitle => 'Skin-editor';

  @override
  String get skinToolUndo => 'Ongedaan maken';

  @override
  String get skinSaveToMySkins => 'Opslaan bij mijn skins';

  @override
  String get skinUpdateInCloud => 'Bijwerken in cloud';

  @override
  String get skinExportPng => 'PNG exporteren';

  @override
  String get skinToolDraw => 'Tekenen';

  @override
  String get skinToolFill => 'Vullen';

  @override
  String get skinToolErase => 'Wissen';

  @override
  String get customColour => 'Eigen kleur';

  @override
  String get featuredServerLabel => 'UITGELICHTE SERVER';

  @override
  String get featuredServerTagline => 'Spring erin en begin met spelen.';

  @override
  String get featuredServerPlay => 'Spelen';

  @override
  String rpUploadFailedCode(int code) {
    return 'Uploaden mislukt ($code)';
  }

  @override
  String rpUploadFailed(String error) {
    return 'Uploaden mislukt: $error';
  }

  @override
  String get rpLoadFailed => 'Kon packs niet laden';

  @override
  String get rpRetry => 'Opnieuw';

  @override
  String get rpSearchHint => 'Zoek packs…';

  @override
  String rpMergeFailed(String error) {
    return 'Samenvoegen mislukt: $error';
  }

  @override
  String get rpMergerSize => 'Grootte';

  @override
  String get rpMergerCreated => 'Aangemaakt';

  @override
  String get rpMergerSourcePacks => 'Bronpacks';

  @override
  String get rpMergerDropToAdd => 'Sleep hierheen';

  @override
  String get rpMergerSavedMerges => 'Opgeslagen merges';

  @override
  String get rpMergerUse => 'Gebruiken';

  @override
  String get supportInboxShared => 'Gedeeld met alle admins';

  @override
  String get supportInboxEmpty => 'Nog geen supportgesprekken';

  @override
  String get supportReplyingAs => 'Je antwoordt als MCCompanion Support';

  @override
  String get supportReplyHint => 'Antwoord als support…';

  @override
  String get relayBlocked =>
      'Je IP of account is geblokkeerd door MCCompanion. Denk je dat dit een vergissing is, kom dan naar onze Discord.';

  @override
  String relayBlockedWithReason(String reason) {
    return 'Je IP of account is geblokkeerd door MCCompanion.\nReden: $reason\nDenk je dat dit een vergissing is, kom dan naar onze Discord.';
  }

  @override
  String relayConfigFailed(int code) {
    return 'Kon de relay niet instellen (status $code). Probeer een andere relay of kom naar onze Discord.';
  }

  @override
  String relayConfigFailedDetail(int code, String detail) {
    return 'Kon de relay niet instellen (status $code): $detail. Probeer een andere relay of kom naar onze Discord.';
  }

  @override
  String get relayTimeout => 'De relay reageerde niet op tijd.';

  @override
  String get relayUnreachable => 'Kon de relay niet bereiken.';

  @override
  String get lookupNotFound => 'Speler niet gevonden.';

  @override
  String get lookupNetworkError => 'Netwerkfout. Probeer het opnieuw.';

  @override
  String get lookupBedrockUnavailable =>
      'Bedrock-lookup is nu niet beschikbaar.';

  @override
  String get lookupFailed => 'Zoeken mislukt.';

  @override
  String get myFeedbackTitle => 'Mijn feedback';

  @override
  String get myFeedbackEmpty => 'Je hebt ons nog niets gestuurd.';

  @override
  String get myFeedbackOpenList => 'Mijn feedback';

  @override
  String get fbStatusOpen => 'Open';

  @override
  String get fbStatusPlanned => 'Gepland';

  @override
  String get fbStatusInProgress => 'Mee bezig';

  @override
  String get fbStatusImplemented => 'Klaar';

  @override
  String get fbStatusNotPlanned => 'Niet gepland';

  @override
  String get fbStatusDuplicate => 'Dubbel';

  @override
  String get fbNoReplies => 'Nog geen antwoord. We laten het hier weten.';

  @override
  String get fbReplyHint => 'Voeg iets toe aan deze melding…';

  @override
  String get fbFromTeam => 'MCCompanion';

  @override
  String get fbFromYou => 'Jij';

  @override
  String get feedbackGoesToTeam => 'Gaat rechtstreeks naar het team';

  @override
  String get notifFeedbackStatus => 'Update over je feedback';

  @override
  String get notifFeedbackReply => 'Antwoord op je feedback';

  @override
  String get adminTicketsHeader => 'Meldingen en verzoeken';

  @override
  String get adminGeneralChat => 'Algemene chat';

  @override
  String get adminTicketReplyHint => 'Antwoord over dit ticket…';

  @override
  String get adminNoTicketsForUser => 'Geen tickets van deze gebruiker';

  @override
  String get hideConversation => 'Verbergen';

  @override
  String get conversationHidden => 'Gesprek verborgen';

  @override
  String get undo => 'Ongedaan maken';

  @override
  String get chooseServerTitle => 'Kies een server';

  @override
  String get changeLabel => 'Wijzigen';

  @override
  String get howToAutoShow => 'Dit tonen als ik start';
}
