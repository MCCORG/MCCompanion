// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appName => 'MCCompanion';

  @override
  String get console => 'Konsole';

  @override
  String get consoleOutput => 'Konsolenausgabe';

  @override
  String get noLogsYet => 'Noch keine Protokolle';

  @override
  String get startBroadcastingToSeeOutput => 'Starte die Übertragung, um die Ausgabe zu sehen';

  @override
  String get close => 'Schließen';

  @override
  String get ok => 'OK';

  @override
  String get joinUs => 'Mach mit';

  @override
  String get more => 'Mehr';

  @override
  String get website => 'Webseite';

  @override
  String get howToUseMenu => 'Verwendung';

  @override
  String get support => 'Hilfe';

  @override
  String helpText(Object appCreator) {
    return 'Erstellt von $appCreator.\r\n\r\nSo wird es verwendet:\r\n1. Gib die Adresse und den Port deines Minecraft-Servers ein (Standard: 19132)\r\n   — oder wähle einen zuvor gespeicherten Server aus dem Dropdown-Menü\r\n2. (Optional) Wähle einen Relay-Server (EU oder US) in deiner Nähe\r\n3. Klicke auf \\\"Übertragung starten\\\", um zu beginnen\r\n4. Auf deiner Konsole/deinem Gerät: Minecraft > Spielen > Freunde\r\n5. Du solltest einen LAN-Server mit dem Namen \\\"MCCompanion\\\" sehen\r\n6. Klicke darauf, um deinem externen Server über MCCompanion beizutreten\r\n\r\nNintendo Switch (DNS-Modus):\r\n1. Aktiviere \\\"Nintendo Switch\\\" im Verbindungsbereich\r\n2. Wähle einen Relay-Server (EU oder US)\r\n3. Klicke auf \\\"DNS-Konfiguration senden\\\" — dadurch wird deine Konfiguration an das Relay gesendet\r\n   (es wird KEIN LAN-Server ausgestrahlt)\r\n4. Wende auf deiner Switch deine MCCompanion-DNS-Einstellungen an und tritt bei\r\n   über den Servereintrag bei, den du für MCCompanion verwendest\r\n\r\nHinweise:\r\n- Für LAN-Übertragung müssen MCCompanion und die Konsole im selben lokalen Netzwerk sein.\r\n- Tipp: Wähle den Relay-Server, der dir am nächsten ist, für die beste Leistung.';
  }

  @override
  String get serverDetailsLabel => 'Serverdetails';

  @override
  String get start => 'Starten';

  @override
  String get stop => 'Stopp';

  @override
  String get labelJava => 'Java';

  @override
  String get startJavaMode => 'Java-Modus starten';

  @override
  String get javaInfoTitle => 'Java-Modus';

  @override
  String get javaInfoText => 'Mit Java-Edition-Servern verbinden';

  @override
  String get howToJavaTitle => 'Java-Modus';

  @override
  String get howToJavaSubtitle => 'Über MCCompanion mit Java-Edition-Servern verbinden';

  @override
  String get aternosSubtext => 'Erstelle deinen eigenen kostenlosen Minecraft-Server';

  @override
  String get howToJavaBody => 'Java-Modus — Kurzanleitung:\n1. Wähle in der App den Java-Modus aus.\n2. Gib die Adresse und den Port deines Java-Edition-Servers ein (Standard: 25565).\n3. Drücke auf \"Java-Modus starten\" — MCCompanion überbrückt die Verbindung.\n4. Öffne Minecraft Bedrock und gehe zum Freunde-Tab.\n5. Wähle den LAN-Server namens \"MCCompanion\", um dem Java-Server beizutreten.\n\n⚠️ Wichtige Warnungen:\n- Ein gültiges Java-Edition-Konto (Microsoft) ist erforderlich.\n- Einige Server verwenden Anti-Cheat-Systeme, die dein Konto erkennen und sperren können.\n- Manche Server verbieten Bedrock-Clients ausdrücklich — prüfe immer die Serverregeln.\n- MCCompanion ist nicht verantwortlich für Sperren, Einschränkungen oder andere kontobezogene Probleme, die durch die Nutzung dieser Funktion entstehen.\n- Nutzung auf eigenes Risiko.';

  @override
  String get language => 'Deutsch';

  @override
  String get discord => 'Discord';

  @override
  String get toggleDebug => 'Debug umschalten';

  @override
  String get copyLogs => 'Protokolle kopieren';

  @override
  String get clear => 'Leeren';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get deleteServer => 'Server löschen';

  @override
  String get delete => 'Löschen';

  @override
  String get myServers => 'Meine Server';

  @override
  String get quickAccessServers => 'Schnellzugriffsserver';

  @override
  String get addServer => 'Server hinzufügen';

  @override
  String get addServersHint => 'Füge Server hinzu, um dich später schnell zu verbinden';

  @override
  String get serverNameLabel => 'Servername *';

  @override
  String get addressLabel => 'Adresse *';

  @override
  String get portLabel => 'Port *';

  @override
  String get descriptionLabel => 'Beschreibung (optional)';

  @override
  String get save => 'Speichern';

  @override
  String get initializing => 'Initialisierung...';

  @override
  String get createdBy => 'Erstellt von NetherDev';

  @override
  String get bedrockBridge => 'Bedrock-Brücke';

  @override
  String get clientDisconnected => 'Client getrennt — Übertragung gestoppt';

  @override
  String get pleaseEnterServer => '⚠️ Bitte gib eine Serveradresse ein';

  @override
  String get invalidPort => '⚠️ Ungültige Portnummer (1-65535)';

  @override
  String get dnsConfigSent => '✅ DNS-Konfiguration an Relay gesendet';

  @override
  String get broadcastingStarted => 'Übertragung gestartet';

  @override
  String get broadcastStopped => 'Übertragung gestoppt';

  @override
  String selectedServer(Object name) {
    return '📋 Ausgewählt: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'Ausgewählt: $name';
  }

  @override
  String get noLogsToCopy => 'Keine Protokolle zum Kopieren';

  @override
  String copiedLogs(Object count) {
    return '$count Protokolleinträge in die Zwischenablage kopiert';
  }

  @override
  String get debugEnabled => 'Debug-Protokolle aktiviert';

  @override
  String get debugDisabled => 'Debug-Protokolle deaktiviert';

  @override
  String get howToUseTitle => 'So verwendest du MCCompanion';

  @override
  String get iUnderstand => 'Ich verstehe';

  @override
  String get playOnSwitchTitle => 'Auf Nintendo Switch spielen';

  @override
  String get playWithFriendsTitle => 'Mit Freunden spielen';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'Ausgewählt: $relayName\r\n\r\nSo verbindest du dich:\r\n1. Gehe in die Einstellungen deiner Switch und ändere das DNS zu: $relayIp\r\n2. Öffne Minecraft und wähle einen Server aus der Liste (wie Cubecraft oder Hive).\r\n3. Du wirst nun automatisch zu deinem eigenen Server weitergeleitet.';
  }

  @override
  String playInstructionsFriends(Object friend) {
    return 'So verbindest du dich:\r\n1. Füge auf deiner Konsole $friend als Freund hinzu.\r\n2. Öffne Minecraft und gehe zum Tab Freunde.\r\n3. Suche deinen Server unter LAN-Welten und wähle ihn aus, um beizutreten.';
  }

  @override
  String get nldServerLabel => 'NETHERLINK-SERVER';

  @override
  String selectRelayLabel(Object name) {
    return 'Relay auswählen $name';
  }

  @override
  String get noSavedServers => 'Keine gespeicherten Server';

  @override
  String get savedServers => 'Gespeicherte Server';

  @override
  String get serverAddressHint => 'Serveradresse';

  @override
  String get portHint => 'Port';

  @override
  String get manageServers => 'Server verwalten';

  @override
  String get manageServersTooltip => 'Server verwalten';

  @override
  String get noServerYet => 'Noch keine Server gespeichert.\nTippe auf Verwalten, um einen hinzuzufügen.';

  @override
  String get serverNotSelected => 'Kein Server ausgewählt';

  @override
  String get ready => 'Bereit';

  @override
  String get active => 'Aktiv';

  @override
  String get vpnDetected => 'VPN erkannt';

  @override
  String get noWifi => 'Nicht im WLAN';

  @override
  String get vpnActive => 'Wir haben erkannt, dass dein VPN aktiv ist.\n\nBitte deaktiviere dein VPN, bevor du MCCompanion verwendest, sonst erreicht die LAN-Übertragung deine Konsole möglicherweise nicht.';

  @override
  String get mobileActive => 'Erkannt: Mobile Daten\n\nMCCompanion muss sich im selben Netzwerk wie deine Konsole befinden. Bitte verbinde dich mit deinem WLAN oder Hotspot, bevor du fortfährst.';

  @override
  String get continueAnyway => 'Trotzdem fortfahren';

  @override
  String get sameWifi => 'Gleiches WLAN';

  @override
  String get needSameWifi => 'Das Gerät mit MCCompanion MUSS sich im selben WLAN wie die Konsole befinden, auf der du Minecraft spielst.';

  @override
  String get subscription => 'Online-Abonnement erforderlich';

  @override
  String get needSubscription => 'Jede Konsole benötigt ein eigenes aktives Online-Abonnement (Xbox Live, PS Plus, NSO). Andernfalls wird MCCompanion nicht angezeigt.';

  @override
  String get updateAvailable => 'Update verfügbar';

  @override
  String get newVersion => 'Eine neue Version der App ist verfügbar.\nAktualisiere jetzt für die neuesten Funktionen und Fehlerbehebungen.';

  @override
  String get later => 'Später';

  @override
  String get updateNow => 'Jetzt aktualisieren';

  @override
  String get beforeYouStart => 'BEVOR DU BEGINNST';

  @override
  String get stopBroadcasting => 'Übertragung stoppen';

  @override
  String get startNintendoMode => 'Nintendo-Modus starten';

  @override
  String get startFriendsMode => 'Freunde-Modus starten';

  @override
  String get startBroadcasting => 'Übertragung starten';

  @override
  String get modeLabel => 'Modus';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'Freunde';

  @override
  String get nintendoInfoTitle => 'Nintendo Switch DNS-Modus';

  @override
  String get nintendoInfoText => 'Starte im Nintendo-Modus, richte dein DNS ein und tritt einem hervorgehobenen Server bei.';

  @override
  String get friendModeTitle => 'Freunde-Modus';

  @override
  String get friendModeText => 'Füge MCCompanions Freundes-Bots als Freunde hinzu. Starte den Freunde-Modus und spiele';

  @override
  String get selectedRelayCheck => 'Ausgewählt';

  @override
  String relayFallbackWarning(Object name) {
    return 'Warnung: Das ursprüngliche Relay hat nicht geantwortet. Ersatz-Relay wird verwendet: $name';
  }

  @override
  String get relayUnableConnect => 'Verbindung zu KEINEM MCCompanion-Relay-Server möglich. Versuche es später erneut oder überprüfe dein Internet.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / Proxy-Modus)';

  @override
  String get howToXboxSubtitle => 'Spiele über LAN-Übertragung oder Proxy';

  @override
  String get howToXboxBody => 'So verbindest du dich (Xbox / PS4 / PS5):\r\n1. Stelle sicher, dass dein Gerät mit MCCompanion und deine Konsole sich im selben lokalen Netzwerk befinden.\r\n2. Gib in der App die Adresse und den Port deines Minecraft-Servers ein und drücke \\\"Übertragung starten\\\".\r\n3. Öffne auf der Konsole Minecraft → Spielen → suche nach LAN-Welten oder dem Freunde-Tab und aktualisiere die Liste.\r\n4. Wähle den LAN-Server namens \\\"MCCompanion\\\" aus, um beizutreten.\r\nHinweise:\r\n- Wenn der Server nicht erscheint, stelle sicher, dass sich beide Geräte im selben Subnetz befinden und die App noch sendet.\r\n- Einige Konsolenmodelle oder Router können die LAN-Erkennung blockieren; versuche bei Bedarf, die App- oder Router-Einstellungen zu ändern.';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (DNS-Modus)';

  @override
  String get howToNintendoSubtitle => 'DNS-Relay-Anweisungen für Switch';

  @override
  String get howToNintendoBody => 'Nintendo Switch — DNS-Modus (Schritt für Schritt):\r\n1. Aktiviere in der App den \\\"Nintendo\\\"-Modus und wähle einen Relay-Server (EU oder US).\r\n2. Tippe auf \\\"DNS-Konfiguration senden\\\", um die DNS-IP an das Relay zu senden.\r\n3. Gehe auf deiner Nintendo Switch zu Systemeinstellungen → Internet → Interneteinstellungen → (dein Netzwerk) → Einstellungen ändern → DNS und setze den primären DNS auf die Relay-IP.\r\n4. Öffne Minecraft und tritt einem öffentlichen Server bei; du wirst mithilfe des Relay-DNS zu deinem Server weitergeleitet.\r\nHinweise:\r\n- Der DNS-Modus sendet keinen LAN-Server aus; er leitet den Spielverkehr über das Relay weiter.\r\n- Setze dein DNS nach der Nutzung zurück, wenn du normales Netzwerkverhalten benötigst.';

  @override
  String get howToFriendsTitle => 'Freunde-Modus';

  @override
  String get howToFriendsSubtitle => 'Lade Freunde ein und trete über LAN bei';

  @override
  String get howToFriendsBody => 'Freunde-Modus — schnelle Schritte:\r\n1. Füge das MCCompanion-Freundeskonto (Relay-Freund) auf deiner Konsole oder Plattform hinzu, falls erforderlich.\r\n2. Aktiviere in der App den Freunde-Modus und sende die Relay-Konfiguration (falls zutreffend).\r\n3. Öffne auf deiner Konsole Minecraft → Freunde und suche nach LAN-Welten — dein Server sollte dort als LAN-Welt erscheinen.\r\n4. Wähle ihn aus, um deinem Server mit Freunden beizutreten.\r\nHinweise:\r\n- Stelle sicher, dass du und deine Freunde dieselben NAT-/Einstellungen habt, die die Freundespräsenz erlauben.\r\n- Der Freunde-Modus hängt von den Freundesfunktionen der Plattform ab und kann das Annehmen von Freundschaftsanfragen erfordern.';

  @override
  String get helpNetherlinkTitle => 'MCCompanion erscheint nicht';

  @override
  String get helpNetherlinkSubtitle => 'Behebung von LAN-Erkennungsproblemen';

  @override
  String get helpNetherlinkBody => 'Wenn der Server auf deiner Konsole nicht erscheint, versuche diese Schritte:\r\n\r\n✅ Grundlegende Prüfungen:\r\n1. Gleiches WiFi-Netzwerk - Dein Telefon/Tablet und deine Konsole MÜSSEN im selben WiFi sein\r\n2. Richtige Serveradresse - Überprüfe IP und Port erneut (Standard: 19132)\r\n3. Übertragung aktiv - Vergewissere dich, dass MCCompanion den Status \\\"Übertragung läuft\\\" anzeigt\r\n\r\n🔄 Schnelle Lösungen:\r\n• Starte die App neu: Stoppe die Übertragung, schließe MCCompanion vollständig, öffne es erneut und versuche es noch einmal\r\n• Starte deine Konsole neu: Manchmal muss die Konsole aktualisiert werden, um LAN-Spiele zu erkennen\r\n• Prüfe den Freunde-/LAN-Tab: Der Server erscheint unter \\\"Freunde\\\" oder \\\"LAN-Spiele\\\", NICHT in der Serverliste\r\n• Warte 10-15 Sekunden nach dem Start der Übertragung\r\n• Deaktiviere VPNs: VPNs können lokale Übertragungen blockieren\r\n\r\n⚠️ Häufige Probleme:\r\n\\\"No route found for user\\\" → Stelle sicher, dass beide Geräte im selben Wi‑Fi sind (vermeide Gastnetzwerke)\r\n\\\"Unable to connect to MCCompanion relay server\\\" → Prüfe dein Internet / den Status des Relays\r\n\r\n📱 Immer noch Probleme? Aktiviere den Debug-Modus in MCCompanion und prüfe die Protokolle oder versuche einen anderen Server.';

  @override
  String get helpMultiplayerFailedTitle => 'Mehrspieler-Verbindung fehlgeschlagen';

  @override
  String get helpMultiplayerFailedSubtitle => 'Erklärung, warum dies kein MCCompanion-Fehler ist';

  @override
  String get helpMultiplayerFailedBody => '⚠️ Das ist kein Problem mit MCCompanion!\r\n\r\nMCCompanion hat dich erfolgreich zum angeforderten Server weitergeleitet. Die Meldung \\\"Mehrspieler-Verbindung fehlgeschlagen\\\" bedeutet, dass der Zielserver derzeit nicht erreichbar ist. Mögliche Gründe:\r\n\r\n• Der Ziel-Minecraft-Server ist offline oder überlastet\r\n• Der Server erfordert eine aktualisierte Client-Version oder eine bestimmte Edition\r\n• Netzwerkprobleme zwischen dem Relay und dem Zielserver\r\n\r\nVersuche, dich mit einem anderen Server zu verbinden, oder kontaktiere den Support des Servers. Wenn das Problem bei mehreren Servern weiterhin besteht, aktiviere den Debug-Modus in MCCompanion und prüfe die Protokolle.';

  @override
  String get helpNintendoDnsTitle => 'Nintendo-DNS funktioniert nicht';

  @override
  String get helpNintendoDnsSubtitle => 'Häufige DNS-/Relay-Probleme';

  @override
  String get helpNintendoDnsBody => 'Wenn der Nintendo-DNS-Modus nicht funktioniert, überprüfe Folgendes:\r\n\r\n1. Bestätige, dass du die DNS-Konfiguration aus der App gesendet hast (DNS-Konfiguration senden).\r\n2. Vergewissere dich, dass du die Relay-IP als primären DNS auf der Switch gesetzt hast.\r\n3. Stelle sicher, dass der ausgewählte Relay-Server (EU/US) online und nicht überlastet ist.\r\n4. Einige Netzwerke (z. B. Captive Portals) verhindern benutzerdefiniertes DNS — teste es in einem anderen Netzwerk.\r\n\r\nWenn die Probleme weiterhin bestehen, aktiviere den Debug-Modus und prüfe die Protokolle oder probiere die Alternative Freunde-Modus aus.';

  @override
  String get helpFriendsModeTitle => 'Freunde-Modus funktioniert nicht';

  @override
  String get helpFriendsModeSubtitle => 'Häufige Freundesprobleme';

  @override
  String get helpFriendsModeBody => 'Tipps zur Fehlerbehebung für den Freunde-Modus:\r\n\r\n1. Stelle sicher, dass das Relay-Freundeskonto auf der Konsole hinzugefügt/akzeptiert wurde (falls erforderlich).\r\n2. Versuche, das Spiel neu zu starten und den Freunde-/LAN-Tab zu aktualisieren, nachdem du den Freunde-Modus aktiviert hast.\r\n\r\nWenn der Server für Freunde immer noch nicht erscheint, aktiviere den Debug-Modus und prüfe die Protokolle, um Fehler zu identifizieren.';

  @override
  String get changeLanguageTitle => 'Sprache ändern';

  @override
  String get changeLanguage => 'Sprache';

  @override
  String get useSystemLanguage => 'Systemsprache verwenden';

  @override
  String get couldNotOpenUrl => 'URL konnte nicht geöffnet werden';

  @override
  String get reportUser => 'Benutzer melden';
  @override
  String reportUserWithName(String username) => 'Melde @$username';
  @override
  String get reportMessage => 'Nachricht melden';
  @override
  String get reportDisclaimer => 'Unser Team wird diesen Bericht überprüfen. Danke, dass du die Community sicher hältst.';
  @override
  String get reportReasonSpam => 'Spam';
  @override
  String get reportReasonHarassment => 'Belästigung oder Mobbing';
  @override
  String get reportReasonInappropriate => 'Unangemessene Inhalte';
  @override
  String get reportReasonOther => 'Sonstiges';
  @override
  String get reportAdditionalDetails => 'Zusätzliche Details (optional)';
  @override
  String get reportSubmit => 'Bericht absenden';
  @override
  String get reportSuccess => 'Bericht eingereicht. Danke.';
  @override
  String get reportFailed => 'Bericht konnte nicht gesendet werden. Bitte erneut versuchen.';
  @override
  String get messagePlaceholder => 'Nachricht...';
  @override
  String get noMessagesYet => 'Noch keine Nachrichten.\nSag Hallo!';
  @override
  String get today => 'Heute';
  @override
  String get yesterday => 'Gestern';
  @override
  String get noConversationsYet => 'Noch keine Unterhaltungen';
  @override
  String get startChatHint => 'Starte einen Chat über deine Freundesliste.';
  @override
  String get youPrefix => 'Du';
  @override
  String get tabProfile => 'PROFIL';
  @override
  String get tabFriends => 'FREUNDE';
  @override
  String get tabRequests => 'ANFRAGEN';
  @override
  String get tabChats => 'CHATS';
  @override
  String get addFriend => 'Freund hinzufügen';
  @override
  String get usernameHint => 'Benutzername';
  @override
  String get send => 'Senden';
  @override
  String friendRequestSentTo(String username) => 'Freundschaftsanfrage an @$username gesendet';
  @override
  String alreadyFriendsWith(String username) => 'Du bist bereits mit @$username befreundet.';
  @override
  String requestAlreadyPending(String username) => 'Es gibt bereits eine ausstehende Anfrage mit @$username.';
  @override
  String userNotFoundMsg(String username) => 'Benutzer @$username nicht gefunden.';
  @override
  String cannotSendRequest(String username) => 'Du kannst keine Anfrage an @$username senden.';
  @override
  String get somethingWentWrong => 'Etwas ist schiefgelaufen. Bitte erneut versuchen.';
  @override
  String friendRequestAccepted(String username) => 'Freundschaftsanfrage von @$username angenommen';
  @override
  String requestDeclined(String username) => 'Anfrage von @$username abgelehnt';
  @override
  String get deleteAccountTitle => 'Konto löschen';
  @override
  String get deleteAccountBody => 'Dadurch werden dein Konto, Nachrichten, Freunde und alle zugehörigen Daten dauerhaft gelöscht. Diese Aktion kann nicht rückgängig gemacht werden.';
  @override
  String get deletePermanently => 'Dauerhaft löschen';
  @override
  String get couldNotDeleteAccount => 'Konto konnte nicht gelöscht werden. Bitte erneut versuchen.';
  @override
  String get removeFriendTitle => 'Freund entfernen';
  @override
  String removeFriendConfirm(String username) => 'Möchtest du @$username als Freund entfernen?';
  @override
  String get remove => 'Entfernen';
  @override
  String friendRemoved(String username) => '@$username aus deinen Freunden entfernt';
  @override
  String get noFriendsYet => 'Noch keine Freunde';
  @override
  String get noFriendsSub => 'Füge jemanden über die Schaltfläche oben rechts hinzu.';
  @override
  String get noPendingRequests => 'Keine ausstehenden Anfragen';
  @override
  String get requestsAppearHere => 'Freundschaftsanfragen erscheinen hier.';
  @override
  String onlineFriendsLabel(int count) => 'ONLINE — $count';
  @override
  String offlineFriendsLabel(int count) => 'OFFLINE — $count';
  @override
  String get couldNotUpdateVisibility => 'Sichtbarkeit konnte nicht aktualisiert werden. Erneut versuchen.';
  @override
  String get aboutMe => 'Über mich';
  @override
  String get linkedAccountsTitle => 'Verknüpfte Konten';
  @override
  String get linkAccountsHint => 'Verknüpfe deine Minecraft-Konten, um sie in deinem Profil anzuzeigen.';
  @override
  String get unlinkXboxTitle => 'Xbox-Konto trennen';
  @override
  String removeLabelConfirm(String label) => '$label aus deinen verknüpften Konten entfernen?';
  @override
  String get unlinkJavaTitle => 'Java Edition trennen';
  @override
  String removeJavaConfirm(String username) => '$username aus deinen verknüpften Konten entfernen?';
  @override
  String get unlink => 'Trennen';
  @override
  String get linkXbox => 'Xbox verknüpfen';
  @override
  String get linkJava => 'Java verknüpfen';
  @override
  String get appearOfflineLabel => 'Als offline anzeigen';
  @override
  String get appearOfflineOn => 'Freunde sehen dich als offline';
  @override
  String get appearOfflineOff => 'Freunde können sehen, wenn du online bist';
  @override
  String get signOut => 'Abmelden';
  @override
  String get profileCardTitle => 'Profil';
  @override
  String get edit => 'Bearbeiten';
  @override
  String get displayNameLabel => 'Anzeigename';
  @override
  String get bioLabel => 'Bio';
  @override
  String get yourNameHint => 'Dein Name';
  @override
  String get bioHint => 'Erzähl etwas über dich';
  @override
  String get avatarUrlLabel => 'Avatar-URL';
  @override
  String get usernameDisplayLabel => 'Benutzername';
  @override
  String get profileUpdated => 'Profil aktualisiert';
  @override
  String get findUser => 'Benutzer suchen';
  @override
  String get signIn => 'Anmelden';
  @override
  String get createAccount => 'Konto erstellen';
  @override
  String get signInSubtitle => 'Melde dich an, um Freunde hinzuzufügen und deine Sitzungen zu teilen.';
  @override
  String get emailAddressHint => 'E-Mail-Adresse';
  @override
  String get passwordHint => 'Passwort';
  @override
  String get forgotPassword => 'Passwort vergessen?';
  @override
  String get continueWithGoogle => 'Mit Google fortfahren';
  @override
  String get alreadyHaveAccount => 'Bereits ein Konto? Anmelden';
  @override
  String get noAccountYet => 'Noch kein Konto? Registrieren';
  @override
  String get orDivider => 'oder';
  @override
  String get resetPasswordTitle => 'Passwort zurücksetzen';
  @override
  String get resetPasswordBody => 'Gib deine E-Mail-Adresse ein und wir senden dir einen Link zum Zurücksetzen deines Passworts.';
  @override
  String get sendLink => 'Link senden';
  @override
  String resetLinkSent(String email) => 'Reset-Link an $email gesendet';
  @override
  String get noAccountForEmail => 'Kein Konto für diese E-Mail-Adresse gefunden.';
  @override
  String get invalidEmailError => 'Ungültige E-Mail-Adresse.';
  @override
  String get couldNotSendResetEmail => 'Reset-E-Mail konnte nicht gesendet werden. Bitte erneut versuchen.';
  @override
  String get incorrectEmailOrPassword => 'Falsche E-Mail-Adresse oder Passwort.';
  @override
  String get emailAlreadyInUse => 'Diese E-Mail-Adresse wird bereits verwendet.';
  @override
  String get weakPassword => 'Passwort muss mindestens 6 Zeichen lang sein.';
  @override
  String get googleSignInFailed => 'Google-Anmeldung fehlgeschlagen. Bitte erneut versuchen.';
  @override
  String get appleSignInFailed => 'Apple-Anmeldung fehlgeschlagen. Bitte erneut versuchen.';
  @override
  String get emailDifferentMethod => 'Es existiert bereits ein Konto mit dieser E-Mail über eine andere Anmeldemethode.';
  @override
  String get enterEmailAndPassword => 'Bitte E-Mail-Adresse und Passwort eingeben.';
  @override
  String get profileNotSetUp => 'Profil noch nicht eingerichtet';
  @override
  String get chooseUsernameSubtitle => 'Wähle einen Benutzernamen, um Freunde hinzuzufügen und deine Sitzungen zu teilen.';
  @override
  String get createProfile => 'Profil erstellen';
  @override
  String get chooseUniqueUsername => 'Wähle einen eindeutigen Benutzernamen, um Freunde hinzuzufügen.';
  @override
  String get usernameFieldLabel => 'Benutzername *';
  @override
  String get usernameFormatHint => '3–20 Zeichen · nur a-z, 0-9 und _';
  @override
  String get displayNameOptional => 'Anzeigename (optional)';
  @override
  String get usernameRequired => 'Bitte einen Benutzernamen eingeben.';
  @override
  String get usernameFormatError => '3–20 Zeichen, nur Kleinbuchstaben, Zahlen und _';
  @override
  String get usernameTaken => 'Dieser Benutzername ist bereits vergeben.';
  @override
  String get noConnectionError => 'Keine Verbindung. Bitte erneut versuchen.';
  @override
  String get usernameExampleHint => 'z.B. jens_mc';
  @override
  String get displayNameExampleHint => 'z.B. Jens';
  @override
  String get home => 'Startseite';
  @override
  String get info => 'Info';
  @override
  String get consoleConnect => 'Console Connect';
  @override
  String get consoleConnectSubtitle => 'Mit Minecraft-Servern verbinden';
  @override
  String get minecraftSkins => 'Minecraft Skins';
  @override
  String get minecraftSkinsSubtitle => 'Java & Bedrock-Skins ansehen & bearbeiten';
  @override
  String get minecraftWiki => 'Minecraft Wiki';
  @override
  String get minecraftWikiSubtitle => 'Mobs, Blöcke, Rezepte & mehr';
  @override
  String get partnerServersLabel => 'Partnerserver';
  @override
  String get partnerServersSubtitle => 'Ausgewählte Minecraft-Server';
  @override
  String get userLookup => 'Minecraft Benutzersuche';
  @override
  String get userLookupSubtitle => 'Java & Bedrock-Profile nachschlagen';

  @override
  String get navSkins => 'Skins';
  @override
  String get navWiki => 'Wiki';
  @override
  String get navProfile => 'Profil';

  @override
  String get skinsUpload => 'Hochladen';
  @override
  String get skinsCreate => 'Erstellen';
  @override
  String get skinsSubtitle => 'Minecraft-Skins ansehen und herunterladen.';
  @override
  String get skinsSectionRecent => 'AKTUELLE SKINS';
  @override
  String get skinsSectionMy => 'MEINE SKINS';
  @override
  String get skinsSectionYours => 'DEINE SKINS';
  @override
  String get skinsEmptyMySkins => 'Noch keine gespeicherten Skins. Erstelle oder lade einen Skin hoch.';
  @override
  String get skinsCouldNotLoad => 'Skins konnten nicht geladen werden';
  @override
  String skinsPageOf(int page, int total) => 'Seite $page / $total';
  @override
  String get skinsMustBe64 => 'Skin muss 64×64 Pixel sein';
  @override
  String get skinsInvalidFile => 'Ungültige Bilddatei';
  @override
  String get skinsDownload => 'Herunterladen';
  @override
  String get skinsEdit => 'Bearbeiten';
  @override
  String get skinsNoAccountsTitle => 'Keine Accounts verknüpft';
  @override
  String get skinsNoAccountsSubtitle => 'Verknüpfe Java oder Bedrock im Profil, um deinen Skin zu sehen.';
  @override
  String get skinsSignInTitle => 'Anmelden, um deinen Skin zu sehen';
  @override
  String get skinsSignInSubtitle => 'Erstelle ein Konto und verknüpfe Java oder Bedrock im Profil.';
}
