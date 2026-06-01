// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appName => 'NetherLink';

  @override
  String get console => 'Console';

  @override
  String get consoleOutput => 'Console Uitvoer';

  @override
  String get noLogsYet => 'Nog geen logs';

  @override
  String get startBroadcastingToSeeOutput => 'Start uitzenden om uitvoer te zien';

  @override
  String get close => 'Sluit';

  @override
  String get ok => 'OK';

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
    return 'Gemaakt door $appCreator.\n\nHoe te gebruiken:\n1. Voer uw Minecraft server adres en poort in (standaard: 19132)\n   - of selecteer een eerder opgeslagen server uit de dropdown\n2. (Optioneel) Kies een Relay server(EU of US) die het dichtst bij uw locatie is\n3. Klik op \"Start uitzending\"\n4 Om te starten ga op je console/apparaat: Minecraft > Play > Vrienden\n5. Je zou een LAN server moeten zien genaamd \"NetherLink\"\n6. Klik op de server om toe te treden tot uw externe server via NetherLink\n\nNintendo Switch (DNS-modus):\n1. Schakel \"Nintendo Switch\" in in het verbindingspaneel\n2. Selecteer een RelayServer (EU of US)\n3. Klik op \"Stuur DNS Config\" - dit stuurt uw configuratie naar het relais\n   (het zend NIET een LAN server)\n4. Op uw Switch, Pas uw NetherLink DNS setup toe en neem deel aan\n   met behulp van de server die u gebruikt voor NetherLink\n\nNotities:\n- voor LAN uitzendingen, Netherlink en console moeten op hetzelfde lokale netwerk zitten.\n- Tip: Kies de dichtstbijzijnde server voor de beste prestaties.';
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
  String get howToJavaSubtitle => 'Verbinden met Java Edition-servers via NetherLink';

  @override
  String get aternosSubtext => 'Maak je eigen gratis Minecraft-server';

  @override
  String get howToJavaBody => 'Java-modus — snelle stappen:\n1. Selecteer in de app de Java-modus.\n2. Voer het adres en de poort van je Java Edition-server in (standaard: 25565).\n3. Druk op \"Java-modus starten\" — NetherLink overbrugt de verbinding.\n4. Open Minecraft Bedrock en ga naar het tabblad Vrienden.\n5. Selecteer de LAN-server met de naam \"NetherLink\" om deel te nemen aan de Java-server.\n\n⚠️ Belangrijke waarschuwingen:\n- Een geldig Java Edition-account (Microsoft) is vereist.\n- Sommige servers gebruiken anti-cheat-systemen die je account kunnen detecteren en verbannen.\n- Sommige servers verbieden Bedrock-clients expliciet — controleer altijd de serverregels.\n- NetherLink is niet verantwoordelijk voor accountverboden, schorsingen of andere accountgerelateerde problemen die uit het gebruik van deze functie kunnen voortkomen.\n- Gebruik op eigen risico.';

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
  String get dnsConfigSent => '✅ DNS configuratie verzonden naar relay';

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
  String get howToUseTitle => 'Hoe gebruik je NetherLink';

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
  String get nldServerLabel => 'NETHERLINK-SERVER';

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
  String get noServerYet => 'Nog geen servers opgeslagen.\nTik op Beheren om er een toe te voegen.';

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
  String get vpnActive => 'We hebben gedetecteerd dat je VPN actief is.\n\nSchakel je VPN uit voordat je NetherLink gebruikt, anders bereikt de LAN-uitzending je console mogelijk niet.';

  @override
  String get mobileActive => 'Gedetecteerd: mobiele data\n\nNetherLink moet zich op hetzelfde netwerk bevinden als je console. Verbind eerst met je wifi of hotspot voordat je doorgaat.';

  @override
  String get continueAnyway => 'Toch doorgaan';

  @override
  String get sameWifi => 'Zelfde wifi-netwerk';

  @override
  String get needSameWifi => 'Het apparaat waarop NetherLink draait MOET zich op hetzelfde wifi-netwerk bevinden als de console waarop je Minecraft speelt.';

  @override
  String get subscription => 'Online abonnement vereist';

  @override
  String get needSubscription => 'Elke console heeft een eigen actief online abonnement nodig (Xbox Live, PS Plus, NSO). Zonder dat verschijnt NetherLink niet.';

  @override
  String get updateAvailable => 'Update beschikbaar';

  @override
  String get newVersion => 'Er is een nieuwe versie van de app beschikbaar.\nWerk nu bij voor de nieuwste functies en verbeteringen.';

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
  String get nintendoInfoText => 'Start in Nintendo modus, stel uw DNS in en word lid van een featured server.';

  @override
  String get friendModeTitle => 'Vriend modus';

  @override
  String get friendModeText => 'Voeg NetherLink\'s vriend bots toe als vriend, Start vriend modus en speel';

  @override
  String get selectedRelayCheck => 'Geselecteerd';

  @override
  String relayFallbackWarning(Object name) {
    return 'Waarschuwing: origineel Relay heeft niet gereageerd. Fallback Relay in gebruik: $name';
  }

  @override
  String get relayUnableConnect => 'Kan geen verbinding maken met geen enkele NetherLink relay server. Probeer het later opnieuw of controleer je internet.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / proxyverbinding)';

  @override
  String get howToXboxSubtitle => 'Spelen via LAN of proxy';

  @override
  String get howToXboxBody => 'Hoe verbinding te maken (Xbox / PS4 / PS5):\n1. Zorg ervoor dat NetherLink en jouw console op hetzelfde lokale netwerk zitten.\n2. Voer in de app uw Minecraft serveradres en poort in en druk op \"Uitzending Starten\".\n3. In de console open Minecraft → Play → zoek naar LAN werelden of het tabblad Vrienden en ververs de lijst.\n4. Selecteer de LAN-server genaamd \"NetherLink\" om toe te treden.\nnotities:\n- Als de server niet verschijnt, bevestig dan dat beide apparaten op hetzelfde subnet staan en dat de app nog steeds wordt uitgezonden.\n- Sommige console modellen of routers kunnen LAN ontdekking blokkeren; probeer indien nodig de app of router aan te zetten.';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (DNS-modus)';

  @override
  String get howToNintendoSubtitle => 'Instructies voor DNS-relay voor Switch';

  @override
  String get howToNintendoBody => 'Nintendo Switch - DNS modus (stap voor stap):\n1. In de app \"Nintendo\" modus inschakelen en selecteer een Relay Server (EU of US).\n2. Tik op \"Stuur DNS Config\" om de gegevens naar het relay te sturen.\n3. Op uw Nintendo Switch ga naar Systeeminstellingen → Internet → internetinstellingen → (uw netwerk) → Instellingen wijzigen → DNS en stel de primaire DNS in op het relais-IP.\n4. Open Minecraft en word lid van een openbare server; je wordt omgeleid naar je server met behulp van de relay DNS.\nOpmerkingen:\n- DNS-modus zend geen LAN-server uit; het stuurt spelverkeer door de relais.\n- Zet je DNS terug nadat je klaar bent als je een normaal netwerkgedrag nodig hebt.';

  @override
  String get howToFriendsTitle => 'Vrienden modus';

  @override
  String get howToFriendsSubtitle => 'Nodig vrienden uit en doe mee via LAN';

  @override
  String get howToFriendsBody => 'Vrienden-modus - snelle stappen:\n1. Voeg het NetherLinkvriend-account (relay vriend) toe op uw console of platform indien nodig.\n2. Schakel in de app Vrienden modus in en stuur de relay configuratie.\n3. Open op je console Minecraft → Vrienden en zoek naar LAN Worlds - jouw server zou daar als een LAN-wereld moeten verschijnen.\n4. Selecteer het om je server te betreden.\nOpmerkingen:\n- Vriendschapsmodus is afhankelijk van de functies van het platform vriend en kan het vereisen dat je vriendschapsverzoeken accepteert.';

  @override
  String get helpNetherlinkTitle => 'Netherlink verschijnt niet';

  @override
  String get helpNetherlinkSubtitle => 'Problemen met het oplossen van LAN ontdekking';

  @override
  String get helpNetherlinkBody => 'Als de server niet verschijnt op je console, probeer dan deze stappen:\n\n✅ Basiscontroles:\n\n1. Zelfde wifi-netwerk – Je telefoon/tablet en console MOETEN op dezelfde wifi zitten\n2. Correct serveradres – Controleer het IP-adres en de poort (standaard: 19132)\n3. Broadcasting actief – Controleer of NetherLink de status \"Broadcasting\" toont\n\n🔄 Snelle oplossingen:\n• Herstart de app: Stop het uitzenden, sluit NetherLink volledig af, open het opnieuw en probeer het opnieuw\n• Herstart je console: Soms heeft de console een refresh nodig om LAN-games te detecteren\n• Controleer het tabblad Vrienden/LAN: De server verschijnt onder \"Vrienden\" of \"LAN-games\", NIET in de serverlijst\n• Wacht 10–15 seconden na het starten van het uitzenden\n• Schakel VPN’s uit: VPN’s kunnen lokale broadcasts blokkeren\n\n⚠️ Veelvoorkomende problemen:\n\"Geen route gevonden voor gebruiker\" → Zorg ervoor dat beide apparaten op dezelfde wifi zitten (vermijd gastnetwerken)\n\"Kan geen verbinding maken met de NetherLink relay-server\" → Controleer je internet / relay-status\n\n📱 Nog steeds problemen? Schakel de debugmodus in NetherLink in en bekijk de logs, of probeer een andere server.';

  @override
  String get helpMultiplayerFailedTitle => 'Multiplayer verbinding mislukt';

  @override
  String get helpMultiplayerFailedSubtitle => 'Uitleg waarom dit geen NetherLink fout is';

  @override
  String get helpMultiplayerFailedBody => '⚠️ Dit is geen probleem met NetherLink!\n\nNetherLink heeft je met succes doorgestuurd naar de server. Het bericht \"Multiplayer Verbinding Mislukt\" geeft aan dat de doelserver op dit moment niet bereikbaar is. Mogelijke redenen:\n\n• De doel Minecraft-server is offline of overgeladen\n• De server vereist een bijgewerkte clientversie of specifieke editie\n• Netwerkproblemen tussen het relais en de doelserver\n\nProbeer verbinding te maken met een andere server of neem contact op met de ondersteuning van de server. Als het probleem aanhoudt voor meerdere servers, schakel dan Debug Mode in NetherLink in en controleer de logs.';

  @override
  String get helpNintendoDnsTitle => 'Nintendo DNS werkt niet';

  @override
  String get helpNintendoDnsSubtitle => 'Voorkomende problemen met DNS / Relay (placeholder)';

  @override
  String get helpNintendoDnsBody => 'Als Nintendo DNS modus niet werkt, controleer dan het volgende:\n\n1. Bevestig dat je DNS-configuratie hebt gestuurd (Send DNS Config).\n2. Controleer of u het relais-IP als primaire DNS heeft toegepast op de Switch.\n3. Zorg ervoor dat de relaisserver (EU/US) online is en niet overbelast.\n4. Sommige netwerken (bijv. captive portals) voorkomen aangepaste DNS — test op een ander netwerk.\n\nAls problemen aanhouden, schakel dan Debug Mode in en bekijk de logs of probeer het alternatief Vriends-modus.';

  @override
  String get helpFriendsModeTitle => 'Vrienden modus werkt niet';

  @override
  String get helpFriendsModeSubtitle => 'Veelvoorkomende vriend/vinden problemen (placeholder)';

  @override
  String get helpFriendsModeBody => 'Vrienden-modus probleemoplossingstips:\n\n1. Zorg ervoor dat de relay account is toegevoegd/geaccepteerd in de console (indien nodig).\n2. Zorg ervoor dat zowel jij als je vrienden zichtbaarheid / NAT instellingen hebben die aanwezigheid toestaan.\n3. Probeer het spel opnieuw te starten en het tabblad Vrienden/LAN te verversen na het inschakelen van Vrienden-modus.\n\nAls de server nog steeds niet bij vrienden verschijnt, schakel dan Debugmodus in en controleer de logs om fouten te identificeren.';

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
  String get trackerSignInSubtitle => 'Meld je aan om servers bij te houden en offline meldingen te ontvangen.';

  @override
  String get signIn => 'Aanmelden';

  @override
  String get noServersTracked => 'Geen servers bijgehouden';

  @override
  String get trackerEmptySubtitle => 'Voeg een Minecraft-server toe om de status te monitoren en meldingen te ontvangen.';

  @override
  String get fillAllFields => 'Vul alle velden correct in';

  @override
  String get slotUsedUpgrade => 'Je gratis slot is gebruikt. Upgrade voor meer servers.';

  @override
  String get addServerFailed => 'Server toevoegen mislukt. Controleer je gegevens.';

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
  String get chooseUniqueUsername => 'Kies een unieke gebruikersnaam om te beginnen.';

  @override
  String get usernameFieldLabel => 'Gebruikersnaam';

  @override
  String get usernameExampleHint => 'bijv. CoolPlayer123';

  @override
  String get usernameFormatHint => '3–20 tekens · letters, cijfers en underscores';

  @override
  String get displayNameOptional => 'Weergavenaam (optioneel)';

  @override
  String get displayNameExampleHint => 'bijv. Coole Speler';

  @override
  String get usernameRequired => 'Gebruikersnaam is verplicht';

  @override
  String get usernameFormatError => 'De gebruikersnaam moet 3–20 tekens lang zijn en mag alleen letters, cijfers en underscores bevatten';

  @override
  String get usernameTaken => 'Deze gebruikersnaam is al bezet';

  @override
  String get noConnectionError => 'Geen verbinding. Controleer je internet en probeer opnieuw.';

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
}
