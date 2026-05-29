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
    return 'Gemaakt door $appCreator.\n\nHoe te gebruiken:\n1. Voer uw Minecraft server adres en poort in (standaard: 19132)\n   - of selecteer een eerder opgeslagen server uit de dropdown\n2. (Optioneel) Kies een Relay server(EU of US) die het dichtst bij uw locatie is\n3. Klik op \"Start uitzending\"\n4 Om te starten ga op je console/apparaat: Minecraft > Play > Vrienden\n5. Je zou een LAN server moeten zien genaamd \"MCCompanion\"\n6. Klik op de server om toe te treden tot uw externe server via MCCompanion\n\nNintendo Switch (DNS-modus):\n1. Schakel \"Nintendo Switch\" in in het verbindingspaneel\n2. Selecteer een RelayServer (EU of US)\n3. Klik op \"Stuur DNS Config\" - dit stuurt uw configuratie naar het relais\n   (het zend NIET een LAN server)\n4. Op uw Switch, Pas uw MCCompanion DNS setup toe en neem deel aan\n   met behulp van de server die u gebruikt voor MCCompanion\n\nNotities:\n- voor LAN uitzendingen, Netherlink en console moeten op hetzelfde lokale netwerk zitten.\n- Tip: Kies de dichtstbijzijnde server voor de beste prestaties.';
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
  String get howToJavaSubtitle => 'Verbinden met Java Edition-servers via MCCompanion';

  @override
  String get aternosSubtext => 'Maak je eigen gratis Minecraft-server';

  @override
  String get howToJavaBody => 'Java-modus — snelle stappen:\n1. Selecteer in de app de Java-modus.\n2. Voer het adres en de poort van je Java Edition-server in (standaard: 25565).\n3. Druk op \"Java-modus starten\" — MCCompanion overbrugt de verbinding.\n4. Open Minecraft Bedrock en ga naar het tabblad Vrienden.\n5. Selecteer de LAN-server met de naam \"MCCompanion\" om deel te nemen aan de Java-server.\n\n⚠️ Belangrijke waarschuwingen:\n- Een geldig Java Edition-account (Microsoft) is vereist.\n- Sommige servers gebruiken anti-cheat-systemen die je account kunnen detecteren en verbannen.\n- Sommige servers verbieden Bedrock-clients expliciet — controleer altijd de serverregels.\n- MCCompanion is niet verantwoordelijk voor accountverboden, schorsingen of andere accountgerelateerde problemen die uit het gebruik van deze functie kunnen voortkomen.\n- Gebruik op eigen risico.';

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
  String get vpnActive => 'We hebben gedetecteerd dat je VPN actief is.\n\nSchakel je VPN uit voordat je MCCompanion gebruikt, anders bereikt de LAN-uitzending je console mogelijk niet.';

  @override
  String get mobileActive => 'Gedetecteerd: mobiele data\n\nMCCompanion moet zich op hetzelfde netwerk bevinden als je console. Verbind eerst met je wifi of hotspot voordat je doorgaat.';

  @override
  String get continueAnyway => 'Toch doorgaan';

  @override
  String get sameWifi => 'Zelfde wifi-netwerk';

  @override
  String get needSameWifi => 'Het apparaat waarop MCCompanion draait MOET zich op hetzelfde wifi-netwerk bevinden als de console waarop je Minecraft speelt.';

  @override
  String get subscription => 'Online abonnement vereist';

  @override
  String get needSubscription => 'Elke console heeft een eigen actief online abonnement nodig (Xbox Live, PS Plus, NSO). Zonder dat verschijnt MCCompanion niet.';

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
  String get friendModeText => 'Voeg MCCompanion\'s vriend bots toe als vriend, Start vriend modus en speel';

  @override
  String get selectedRelayCheck => 'Geselecteerd';

  @override
  String relayFallbackWarning(Object name) {
    return 'Waarschuwing: origineel Relay heeft niet gereageerd. Fallback Relay in gebruik: $name';
  }

  @override
  String get relayUnableConnect => 'Kan geen verbinding maken met geen enkele MCCompanion relay server. Probeer het later opnieuw of controleer je internet.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / proxyverbinding)';

  @override
  String get howToXboxSubtitle => 'Spelen via LAN of proxy';

  @override
  String get howToXboxBody => 'Hoe verbinding te maken (Xbox / PS4 / PS5):\n1. Zorg ervoor dat MCCompanion en jouw console op hetzelfde lokale netwerk zitten.\n2. Voer in de app uw Minecraft serveradres en poort in en druk op \"Uitzending Starten\".\n3. In de console open Minecraft → Play → zoek naar LAN werelden of het tabblad Vrienden en ververs de lijst.\n4. Selecteer de LAN-server genaamd \"MCCompanion\" om toe te treden.\nnotities:\n- Als de server niet verschijnt, bevestig dan dat beide apparaten op hetzelfde subnet staan en dat de app nog steeds wordt uitgezonden.\n- Sommige console modellen of routers kunnen LAN ontdekking blokkeren; probeer indien nodig de app of router aan te zetten.';

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
  String get howToFriendsBody => 'Vrienden-modus - snelle stappen:\n1. Voeg het MCCompanionvriend-account (relay vriend) toe op uw console of platform indien nodig.\n2. Schakel in de app Vrienden modus in en stuur de relay configuratie.\n3. Open op je console Minecraft → Vrienden en zoek naar LAN Worlds - jouw server zou daar als een LAN-wereld moeten verschijnen.\n4. Selecteer het om je server te betreden.\nOpmerkingen:\n- Vriendschapsmodus is afhankelijk van de functies van het platform vriend en kan het vereisen dat je vriendschapsverzoeken accepteert.';

  @override
  String get helpNetherlinkTitle => 'Netherlink verschijnt niet';

  @override
  String get helpNetherlinkSubtitle => 'Problemen met het oplossen van LAN ontdekking';

  @override
  String get helpNetherlinkBody => 'Als de server niet verschijnt op je console, probeer dan deze stappen:\n\n✅ Basiscontroles:\n\n1. Zelfde wifi-netwerk – Je telefoon/tablet en console MOETEN op dezelfde wifi zitten\n2. Correct serveradres – Controleer het IP-adres en de poort (standaard: 19132)\n3. Broadcasting actief – Controleer of MCCompanion de status \"Broadcasting\" toont\n\n🔄 Snelle oplossingen:\n• Herstart de app: Stop het uitzenden, sluit MCCompanion volledig af, open het opnieuw en probeer het opnieuw\n• Herstart je console: Soms heeft de console een refresh nodig om LAN-games te detecteren\n• Controleer het tabblad Vrienden/LAN: De server verschijnt onder \"Vrienden\" of \"LAN-games\", NIET in de serverlijst\n• Wacht 10–15 seconden na het starten van het uitzenden\n• Schakel VPN’s uit: VPN’s kunnen lokale broadcasts blokkeren\n\n⚠️ Veelvoorkomende problemen:\n\"Geen route gevonden voor gebruiker\" → Zorg ervoor dat beide apparaten op dezelfde wifi zitten (vermijd gastnetwerken)\n\"Kan geen verbinding maken met de MCCompanion relay-server\" → Controleer je internet / relay-status\n\n📱 Nog steeds problemen? Schakel de debugmodus in MCCompanion in en bekijk de logs, of probeer een andere server.';

  @override
  String get helpMultiplayerFailedTitle => 'Multiplayer verbinding mislukt';

  @override
  String get helpMultiplayerFailedSubtitle => 'Uitleg waarom dit geen MCCompanion fout is';

  @override
  String get helpMultiplayerFailedBody => '⚠️ Dit is geen probleem met MCCompanion!\n\nMCCompanion heeft je met succes doorgestuurd naar de server. Het bericht \"Multiplayer Verbinding Mislukt\" geeft aan dat de doelserver op dit moment niet bereikbaar is. Mogelijke redenen:\n\n• De doel Minecraft-server is offline of overgeladen\n• De server vereist een bijgewerkte clientversie of specifieke editie\n• Netwerkproblemen tussen het relais en de doelserver\n\nProbeer verbinding te maken met een andere server of neem contact op met de ondersteuning van de server. Als het probleem aanhoudt voor meerdere servers, schakel dan Debug Mode in MCCompanion in en controleer de logs.';

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
  String get reportUser => 'Gebruiker melden';

  @override
  String reportUserWithName(String username) => 'Meld @$username';

  @override
  String get reportMessage => 'Bericht melden';

  @override
  String get reportDisclaimer => 'Ons team zal dit rapport bekijken. Bedankt voor het veilig houden van de community.';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonHarassment => 'Pesten of intimidatie';

  @override
  String get reportReasonInappropriate => 'Ongepaste inhoud';

  @override
  String get reportReasonOther => 'Anders';

  @override
  String get reportAdditionalDetails => 'Extra details (optioneel)';

  @override
  String get reportSubmit => 'Rapport versturen';

  @override
  String get reportSuccess => 'Rapport ingediend. Bedankt.';

  @override
  String get reportFailed => 'Kon rapport niet versturen. Probeer opnieuw.';

  @override
  String get messagePlaceholder => 'Bericht...';

  @override
  String get noMessagesYet => 'Nog geen berichten.\nZeg hallo!';

  @override
  String get today => 'Vandaag';

  @override
  String get yesterday => 'Gisteren';

  @override
  String get noConversationsYet => 'Nog geen gesprekken';

  @override
  String get startChatHint => 'Start een gesprek vanuit je vriendenlijst.';

  @override
  String get youPrefix => 'Jij';

  @override
  String get tabProfile => 'PROFIEL';

  @override
  String get tabFriends => 'VRIENDEN';

  @override
  String get tabRequests => 'VERZOEKEN';

  @override
  String get tabChats => 'CHATS';

  @override
  String get addFriend => 'Vriend toevoegen';

  @override
  String get usernameHint => 'gebruikersnaam';

  @override
  String get send => 'Sturen';

  @override
  String friendRequestSentTo(String username) => 'Vriendschapsverzoek gestuurd naar @$username';

  @override
  String alreadyFriendsWith(String username) => 'Je bent al bevriend met @$username.';

  @override
  String requestAlreadyPending(String username) => 'Er is al een openstaand verzoek met @$username.';

  @override
  String userNotFoundMsg(String username) => 'Gebruiker @$username niet gevonden.';

  @override
  String cannotSendRequest(String username) => 'Je kunt geen verzoek sturen naar @$username.';

  @override
  String get somethingWentWrong => 'Er is iets misgegaan. Probeer opnieuw.';

  @override
  String friendRequestAccepted(String username) => 'Vriendschapsverzoek van @$username geaccepteerd';

  @override
  String requestDeclined(String username) => 'Verzoek van @$username afgewezen';

  @override
  String get deleteAccountTitle => 'Account verwijderen';

  @override
  String get deleteAccountBody => 'Dit verwijdert permanent je account, berichten, vrienden en alle bijbehorende gegevens. Deze actie kan niet ongedaan worden gemaakt.';

  @override
  String get deletePermanently => 'Definitief verwijderen';

  @override
  String get couldNotDeleteAccount => 'Kon account niet verwijderen. Probeer opnieuw.';

  @override
  String get removeFriendTitle => 'Vriend verwijderen';

  @override
  String removeFriendConfirm(String username) => 'Wil je @$username als vriend verwijderen?';

  @override
  String get remove => 'Verwijderen';

  @override
  String friendRemoved(String username) => '@$username verwijderd uit je vrienden';

  @override
  String get noFriendsYet => 'Nog geen vrienden';

  @override
  String get noFriendsSub => 'Voeg iemand toe via de knop rechtsboven.';

  @override
  String get noPendingRequests => 'Geen openstaande verzoeken';

  @override
  String get requestsAppearHere => 'Vriendschapsverzoeken verschijnen hier.';

  @override
  String onlineFriendsLabel(int count) => 'ONLINE — $count';

  @override
  String offlineFriendsLabel(int count) => 'OFFLINE — $count';

  @override
  String get couldNotUpdateVisibility => 'Kon zichtbaarheid niet bijwerken. Probeer opnieuw.';

  @override
  String get aboutMe => 'Over mij';

  @override
  String get linkedAccountsTitle => 'Gekoppelde accounts';

  @override
  String get linkAccountsHint => 'Koppel je Minecraft-accounts om ze op je profiel te tonen.';

  @override
  String get unlinkXboxTitle => 'Xbox-account ontkoppelen';

  @override
  String removeLabelConfirm(String label) => '$label verwijderen uit je gekoppelde accounts?';

  @override
  String get unlinkJavaTitle => 'Java Edition ontkoppelen';

  @override
  String removeJavaConfirm(String username) => '$username verwijderen uit je gekoppelde accounts?';

  @override
  String get unlink => 'Ontkoppelen';

  @override
  String get linkXbox => 'Xbox koppelen';

  @override
  String get linkJava => 'Java koppelen';

  @override
  String get appearOfflineLabel => 'Als offline verschijnen';

  @override
  String get appearOfflineOn => 'Vrienden zien je als offline';

  @override
  String get appearOfflineOff => 'Vrienden kunnen zien wanneer je online bent';

  @override
  String get signOut => 'Uitloggen';

  @override
  String get profileCardTitle => 'Profiel';

  @override
  String get edit => 'Bewerken';

  @override
  String get displayNameLabel => 'Weergavenaam';

  @override
  String get bioLabel => 'Bio';

  @override
  String get yourNameHint => 'Jouw naam';

  @override
  String get bioHint => 'Vertel iets over jezelf';

  @override
  String get avatarUrlLabel => 'Avatar-URL';

  @override
  String get usernameDisplayLabel => 'Gebruikersnaam';

  @override
  String get profileUpdated => 'Profiel bijgewerkt';

  @override
  String get findUser => 'Gebruiker zoeken';

  @override
  String get signIn => 'Inloggen';

  @override
  String get createAccount => 'Account aanmaken';

  @override
  String get signInSubtitle => 'Log in om vrienden toe te voegen en je sessies te delen.';

  @override
  String get emailAddressHint => 'E-mailadres';

  @override
  String get passwordHint => 'Wachtwoord';

  @override
  String get forgotPassword => 'Wachtwoord vergeten?';

  @override
  String get continueWithGoogle => 'Doorgaan met Google';

  @override
  String get alreadyHaveAccount => 'Al een account? Inloggen';

  @override
  String get noAccountYet => 'Nog geen account? Registreren';

  @override
  String get orDivider => 'of';

  @override
  String get resetPasswordTitle => 'Wachtwoord opnieuw instellen';

  @override
  String get resetPasswordBody => 'Voer je e-mailadres in en we sturen je een link om je wachtwoord opnieuw in te stellen.';

  @override
  String get sendLink => 'Link sturen';

  @override
  String resetLinkSent(String email) => 'Resetlink verstuurd naar $email';

  @override
  String get noAccountForEmail => 'Geen account gevonden voor dit e-mailadres.';

  @override
  String get invalidEmailError => 'Ongeldig e-mailadres.';

  @override
  String get couldNotSendResetEmail => 'Kon geen reset-e-mail sturen. Probeer opnieuw.';

  @override
  String get incorrectEmailOrPassword => 'Onjuist e-mailadres of wachtwoord.';

  @override
  String get emailAlreadyInUse => 'Dit e-mailadres is al in gebruik.';

  @override
  String get weakPassword => 'Wachtwoord moet minimaal 6 tekens bevatten.';

  @override
  String get googleSignInFailed => 'Inloggen met Google mislukt. Probeer opnieuw.';

  @override
  String get appleSignInFailed => 'Inloggen met Apple mislukt. Probeer opnieuw.';

  @override
  String get emailDifferentMethod => 'Er bestaat al een account met dit e-mailadres via een andere inlogmethode.';

  @override
  String get enterEmailAndPassword => 'Vul je e-mailadres en wachtwoord in.';

  @override
  String get profileNotSetUp => 'Profiel nog niet ingesteld';

  @override
  String get chooseUsernameSubtitle => 'Kies een gebruikersnaam om vrienden toe te voegen en je sessies te delen.';

  @override
  String get createProfile => 'Profiel aanmaken';

  @override
  String get chooseUniqueUsername => 'Kies een unieke gebruikersnaam om vrienden toe te voegen.';

  @override
  String get usernameFieldLabel => 'Gebruikersnaam *';

  @override
  String get usernameFormatHint => '3–20 tekens · alleen a-z, 0-9 en _';

  @override
  String get displayNameOptional => 'Weergavenaam (optioneel)';

  @override
  String get usernameRequired => 'Voer een gebruikersnaam in.';

  @override
  String get usernameFormatError => '3–20 tekens, alleen kleine letters, cijfers en _';

  @override
  String get usernameTaken => 'Deze gebruikersnaam is al in gebruik.';

  @override
  String get noConnectionError => 'Geen verbinding. Probeer opnieuw.';

  @override
  String get usernameExampleHint => 'bijv. jens_mc';

  @override
  String get displayNameExampleHint => 'bijv. Jens';

  // ── Landing / Home ─────────────────────────────────────────────────────────

  @override
  String get home => 'Startpagina';

  @override
  String get info => 'Info';

  @override
  String get consoleConnect => 'Console Connect';

  @override
  String get consoleConnectSubtitle => 'Verbinden met Minecraft-servers';

  @override
  String get minecraftSkins => 'Minecraft Skins';

  @override
  String get minecraftSkinsSubtitle => 'Java & Bedrock-skins bekijken & bewerken';

  @override
  String get minecraftWiki => 'Minecraft Wiki';

  @override
  String get minecraftWikiSubtitle => 'Mobs, blokken, recepten & meer';

  @override
  String get partnerServersLabel => 'Partnerservers';

  @override
  String get partnerServersSubtitle => 'Uitgelichte Minecraft-servers';

  @override
  String get userLookup => 'Minecraft gebruikersopzoeker';

  @override
  String get userLookupSubtitle => 'Java & Bedrock-profielen opzoeken';

  @override
  String get navSkins => 'Skins';
  @override
  String get navWiki => 'Wiki';
  @override
  String get navProfile => 'Profiel';

  @override
  String get skinsUpload => 'Uploaden';
  @override
  String get skinsCreate => 'Aanmaken';
  @override
  String get skinsSubtitle => 'Minecraft-skins bekijken en downloaden.';
  @override
  String get skinsSectionRecent => 'RECENTE SKINS';
  @override
  String get skinsSectionMy => 'MIJN SKINS';
  @override
  String get skinsSectionYours => 'JOUW SKINS';
  @override
  String get skinsEmptyMySkins => 'Nog geen opgeslagen skins. Maak een skin aan of upload er een.';
  @override
  String get skinsCouldNotLoad => 'Skins konden niet worden geladen';
  @override
  String skinsPageOf(int page, int total) => 'Pagina $page / $total';
  @override
  String get skinsMustBe64 => 'Skin moet 64×64 pixels zijn';
  @override
  String get skinsInvalidFile => 'Ongeldig afbeeldingsbestand';
  @override
  String get skinsDownload => 'Downloaden';
  @override
  String get skinsEdit => 'Bewerken';
  @override
  String get skinsNoAccountsTitle => 'Geen accounts gekoppeld';
  @override
  String get skinsNoAccountsSubtitle => 'Koppel Java of Bedrock in Profiel om je skin te zien.';
  @override
  String get skinsSignInTitle => 'Inloggen om je skin te zien';
  @override
  String get skinsSignInSubtitle => 'Maak een account aan en koppel Java of Bedrock in Profiel.';

  // ── Player Lookup ────────────────────────────────────────────────────────
  @override
  String get playerLookupTitle => 'Speler Opzoeken';
  @override
  String get playerLookupSubtitle => 'Zoek op Java-gebruikersnaam, UUID, Bedrock-gamertag of XUID.';
  @override
  String get playerLookupHint => 'Gebruikersnaam, gamertag, UUID of XUID…';
  @override
  String get playerLookupLinked => 'Accounts gekoppeld via GeyserMC';
  @override
  String get playerLookupLabelUsername => 'Gebruikersnaam';
  @override
  String get playerLookupLabelTier => 'Rang';
  @override
  String playerLookupCopied(String label) => '$label gekopieerd';
  // ── Wiki ──────────────────────────────────────────────────────────────────
  @override
  String get wikiTitle => 'Wiki';
  @override
  String get wikiSearchHint => 'Zoek mobs, items, blokken…';
  @override
  String get wikiMinecraftWiki => 'minecraft.wiki';
  @override
  String wikiCategories(int count) => '$count categorieën';
  @override
  String wikiNoResults(String query) => 'Geen resultaten voor "$query"';
  @override
  String get wikiNoPagesFound => 'Geen pagina\'s gevonden in deze categorie.';
  @override
  String get wikiCouldNotLoadPages => 'Kon pagina\'s niet laden.';
  @override
  String get wikiCouldNotReach => 'Kon de Minecraft Wiki niet bereiken.';
  @override
  String get wikiCouldNotLoadContent => 'Kon paginainhoud niet laden.';
  @override
  String get wikiOpenInBrowser => 'Openen in browser';
  @override
  String get wikiReadFullArticle => 'Lees volledig artikel op minecraft.wiki';
  @override
  String get wikiCrafting => 'Knutselen';
  @override
  String get wikiMobs => 'Mobs';
  @override
  String get wikiBlocks => 'Blokken';
  @override
  String get wikiItems => 'Items';
  @override
  String get wikiBiomes => 'Biomen';
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
  String get wikiUtility => 'Hulpvaardig';
  @override
  String get wikiNatural => 'Natuurlijk';
  @override
  String get wikiOres => 'Ertsen';
  @override
  String get wikiWood => 'Hout';
  @override
  String get wikiStone => 'Steen';
  @override
  String get wikiRedstone => 'Roodsteen';
  @override
  String get wikiPlants => 'Planten';
  @override
  String get wikiDecoration => 'Decoratie';
  @override
  String get wikiTools => 'Gereedschappen';
  @override
  String get wikiSwords => 'Zwaarden';
  @override
  String get wikiRanged => 'Afstandswapens';
  @override
  String get wikiArmor => 'Wapenrusting';
  @override
  String get wikiFood => 'Voedsel';
  @override
  String get wikiBrewing => 'Brouwen';
  @override
  String get wikiMaterials => 'Materialen';
  @override
  String get wikiOverworld => 'Bovenwereld';
  @override
  String get wikiNether => 'Nether';
  @override
  String get wikiTheEnd => 'Het Einde';
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
}
