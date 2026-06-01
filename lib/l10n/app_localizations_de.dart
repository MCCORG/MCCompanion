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
  String get nldServerLabel => 'MCCompanion-SERVER';

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
  String get helpMCCompanionTitle => 'MCCompanion erscheint nicht';

  @override
  String get helpMCCompanionSubtitle => 'Behebung von LAN-Erkennungsproblemen';

  @override
  String get helpMCCompanionBody => 'Wenn der Server auf deiner Konsole nicht erscheint, versuche diese Schritte:\r\n\r\n✅ Grundlegende Prüfungen:\r\n1. Gleiches WiFi-Netzwerk - Dein Telefon/Tablet und deine Konsole MÜSSEN im selben WiFi sein\r\n2. Richtige Serveradresse - Überprüfe IP und Port erneut (Standard: 19132)\r\n3. Übertragung aktiv - Vergewissere dich, dass MCCompanion den Status \\\"Übertragung läuft\\\" anzeigt\r\n\r\n🔄 Schnelle Lösungen:\r\n• Starte die App neu: Stoppe die Übertragung, schließe MCCompanion vollständig, öffne es erneut und versuche es noch einmal\r\n• Starte deine Konsole neu: Manchmal muss die Konsole aktualisiert werden, um LAN-Spiele zu erkennen\r\n• Prüfe den Freunde-/LAN-Tab: Der Server erscheint unter \\\"Freunde\\\" oder \\\"LAN-Spiele\\\", NICHT in der Serverliste\r\n• Warte 10-15 Sekunden nach dem Start der Übertragung\r\n• Deaktiviere VPNs: VPNs können lokale Übertragungen blockieren\r\n\r\n⚠️ Häufige Probleme:\r\n\\\"No route found for user\\\" → Stelle sicher, dass beide Geräte im selben Wi‑Fi sind (vermeide Gastnetzwerke)\r\n\\\"Unable to connect to MCCompanion relay server\\\" → Prüfe dein Internet / den Status des Relays\r\n\r\n📱 Immer noch Probleme? Aktiviere den Debug-Modus in MCCompanion und prüfe die Protokolle oder versuche einen anderen Server.';

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
  String get serverTrackerTitle => 'Server-Tracker';

  @override
  String get removeServerTitle => 'Server entfernen';

  @override
  String removeServerConfirm(Object name) {
    return '\"$name\" aus deinem Tracker entfernen?';
  }

  @override
  String get removeServerFailed => 'Server konnte nicht entfernt werden';

  @override
  String get refreshStatus => 'Status aktualisieren';

  @override
  String get trackerSignInRequired => 'Anmeldung erforderlich';

  @override
  String get trackerSignInSubtitle => 'Melde dich an, um Server zu verfolgen und Offline-Benachrichtigungen zu erhalten.';

  @override
  String get signIn => 'Anmelden';

  @override
  String get noServersTracked => 'Keine Server verfolgt';

  @override
  String get trackerEmptySubtitle => 'Füge einen Minecraft-Server hinzu, um seinen Status zu überwachen und Benachrichtigungen zu erhalten.';

  @override
  String get fillAllFields => 'Bitte fülle alle Felder korrekt aus';

  @override
  String get slotUsedUpgrade => 'Dein kostenloser Slot ist belegt. Upgrade für mehr Server.';

  @override
  String get addServerFailed => 'Server konnte nicht hinzugefügt werden. Überprüfe deine Angaben.';

  @override
  String get ipAddressLabel => 'IP-Adresse';

  @override
  String get platformLabel => 'Plattform';

  @override
  String get bedrockLabel => 'Bedrock';

  @override
  String get addLabel => 'Hinzufügen';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusChecking => 'Wird geprüft...';

  @override
  String get notificationsOn => 'Benachrichtigungen an';

  @override
  String get notificationsOff => 'Benachrichtigungen aus';

  @override
  String get failedUpdateNotifications => 'Benachrichtigungen konnten nicht aktualisiert werden';

  @override
  String get editServerTitle => 'Server bearbeiten';

  @override
  String get serverNameHint => 'Servername';

  @override
  String get failedSave => 'Speichern fehlgeschlagen. Erneut versuchen.';

  @override
  String get serverRenamed => 'Server umbenannt';

  @override
  String get customizeLabel => 'Anpassen';

  @override
  String get customizeSubtitle => 'Kacheln neu anordnen und Navigation anpassen';

  @override
  String get resetLabel => 'Zurücksetzen';

  @override
  String get tilesSection => 'KACHELN';

  @override
  String get dragToReorder => 'Zum Neuordnen ziehen';

  @override
  String get navigationSection => 'NAVIGATION';

  @override
  String get navFixed => 'Startseite, Connector und Profil sind immer fixiert';

  @override
  String get leftSlot => 'Linker Slot (neben Startseite)';

  @override
  String get rightSlot => 'Rechter Slot (neben Profil)';

  @override
  String get accentColorSection => 'AKZENTFARBE';

  @override
  String get opacityLabel => 'Deckkraft';

  @override
  String get backgroundSection => 'HINTERGRUND';

  @override
  String get cardsSection => 'KARTEN';

  @override
  String get editLabel => 'Bearbeiten';

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
  String get chooseUniqueUsername => 'Wähle einen einzigartigen Benutzernamen.';

  @override
  String get usernameFieldLabel => 'Benutzername';

  @override
  String get usernameExampleHint => 'z.B. CoolPlayer123';

  @override
  String get usernameFormatHint => '3–20 Zeichen · Buchstaben, Zahlen und Unterstriche';

  @override
  String get displayNameOptional => 'Anzeigename (optional)';

  @override
  String get displayNameExampleHint => 'z.B. Cooler Spieler';

  @override
  String get usernameRequired => 'Benutzername ist erforderlich';

  @override
  String get usernameFormatError => 'Der Benutzername muss 3–20 Zeichen lang sein und darf nur Buchstaben, Zahlen und Unterstriche enthalten';

  @override
  String get usernameTaken => 'Dieser Benutzername ist bereits vergeben';

  @override
  String get noConnectionError => 'Keine Verbindung. Überprüfe dein Internet und versuche es erneut.';

  @override
  String get home => 'Startseite';

  @override
  String get info => 'Info';

  @override
  String get navProfile => 'Profil';

  @override
  String serverRemoved(Object name) {
    return '$name entfernt';
  }

  @override
  String serverAdded(Object name) {
    return '$name hinzugefügt';
  }
}
