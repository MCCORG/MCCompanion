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
  String get startBroadcastingToSeeOutput =>
      'Starte die Übertragung, um die Ausgabe zu sehen';

  @override
  String get close => 'Schließen';

  @override
  String get ok => 'OK';

  @override
  String get back => 'Zurück';

  @override
  String get next => 'Weiter';

  @override
  String get done => 'Fertig';

  @override
  String get none => 'Keine';

  @override
  String get onboardingThemeTitle => 'Thema wählen';

  @override
  String get onboardingThemeSubtitle =>
      'Du kannst alle Farben später in den Einstellungen anpassen.';

  @override
  String get onboardingNavTitle => 'Schnellzugriff';

  @override
  String get onboardingNavSubtitle =>
      'Wähle zwei Funktionen für deine Navigationsleiste.';

  @override
  String get onboardingNavLeftLabel => 'LINKE TASTE';

  @override
  String get onboardingNavRightLabel => 'RECHTE TASTE';

  @override
  String get onboardingNavPreviewHome => 'Home';

  @override
  String get onboardingNavPreviewConnector => 'Verbinden';

  @override
  String get onboardingNavPreviewProfile => 'Profil';

  @override
  String get onboardingNavPreviewEmpty => 'Leer';

  @override
  String get onboardingStartTitle => 'Startseite';

  @override
  String get onboardingStartSubtitle => 'Die App öffnet hier bei jedem Start.';

  @override
  String get onboardingCustomizeDetail => 'Im Detail anpassen →';

  @override
  String get startPageHome => 'Home';

  @override
  String get startPageHomeSubtitle => 'Startbildschirm mit Kacheln anzeigen';

  @override
  String get startPageFeature => 'Funktion';

  @override
  String get startPageFeatureSubtitle =>
      'Direkt auf einer bestimmten Seite öffnen';

  @override
  String get startPageSectionLabel => 'STARTSEITE';

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
    return 'Erstellt von $appCreator.\r\n\r\nSo wird es verwendet:\r\n1. Gib die Adresse und den Port deines Minecraft-Servers ein (Standard: 19132)\r\n  , oder wähle einen zuvor gespeicherten Server aus dem Dropdown-Menü\r\n2. (Optional) Wähle einen Relay-Server (EU oder US) in deiner Nähe\r\n3. Klicke auf \\\"Übertragung starten\\\", um zu beginnen\r\n4. Auf deiner Konsole/deinem Gerät: Minecraft > Spielen > Freunde\r\n5. Du solltest einen LAN-Server mit dem Namen \\\"MCCompanion\\\" sehen\r\n6. Klicke darauf, um deinem externen Server über MCCompanion beizutreten\r\n\r\nNintendo Switch (DNS-Modus):\r\n1. Aktiviere \\\"Nintendo Switch\\\" im Verbindungsbereich\r\n2. Wähle einen Relay-Server (EU oder US)\r\n3. Klicke auf \\\"DNS-Konfiguration senden\\\", dadurch wird deine Konfiguration an das Relay gesendet\r\n   (es wird KEIN LAN-Server ausgestrahlt)\r\n4. Wende auf deiner Switch deine MCCompanion-DNS-Einstellungen an und tritt bei\r\n   über den Servereintrag bei, den du für MCCompanion verwendest\r\n\r\nHinweise:\r\n- Für LAN-Übertragung müssen MCCompanion und die Konsole im selben lokalen Netzwerk sein.\r\n- Tipp: Wähle den Relay-Server, der dir am nächsten ist, für die beste Leistung.';
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
  String get howToJavaSubtitle =>
      'Über MCCompanion mit Java-Edition-Servern verbinden';

  @override
  String get aternosSubtext =>
      'Erstelle deinen eigenen kostenlosen Minecraft-Server';

  @override
  String get howToJavaBody =>
      'Java-Modus: Kurzanleitung:\n1. Wähle in der App den Java-Modus aus.\n2. Gib die Adresse und den Port deines Java-Edition-Servers ein (Standard: 25565).\n3. Drücke auf \"Java-Modus starten\": MCCompanion überbrückt die Verbindung.\n4. Öffne Minecraft Bedrock und gehe zum Freunde-Tab.\n5. Wähle den LAN-Server namens \"MCCompanion\", um dem Java-Server beizutreten.\n\n⚠️ Wichtige Warnungen:\n- Ein gültiges Java-Edition-Konto (Microsoft) ist erforderlich.\n- Einige Server verwenden Anti-Cheat-Systeme, die dein Konto erkennen und sperren können.\n- Manche Server verbieten Bedrock-Clients ausdrücklich, prüfe immer die Serverregeln.\n- MCCompanion ist nicht verantwortlich für Sperren, Einschränkungen oder andere kontobezogene Probleme, die durch die Nutzung dieser Funktion entstehen.\n- Nutzung auf eigenes Risiko.';

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
  String get addServersHint =>
      'Füge Server hinzu, um dich später schnell zu verbinden';

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
  String get clientDisconnected => 'Client getrennt: Übertragung gestoppt';

  @override
  String get pleaseEnterServer => '⚠️ Bitte gib eine Serveradresse ein';

  @override
  String get invalidPort => '⚠️ Ungültige Portnummer (1-65535)';

  @override
  String get dataSentToServers => 'Daten an die MCCompanion-Server gesendet';

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
  String get noServerYet =>
      'Noch keine Server gespeichert.\nTippe auf Verwalten, um einen hinzuzufügen.';

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
  String get vpnActive =>
      'Wir haben erkannt, dass dein VPN aktiv ist.\n\nBitte deaktiviere dein VPN, bevor du MCCompanion verwendest, sonst erreicht die LAN-Übertragung deine Konsole möglicherweise nicht.';

  @override
  String get mobileActive =>
      'Erkannt: Mobile Daten\n\nMCCompanion muss sich im selben Netzwerk wie deine Konsole befinden. Bitte verbinde dich mit deinem WLAN oder Hotspot, bevor du fortfährst.';

  @override
  String get continueAnyway => 'Trotzdem fortfahren';

  @override
  String get sameWifi => 'Gleiches WLAN';

  @override
  String get needSameWifi =>
      'Das Gerät mit MCCompanion MUSS sich im selben WLAN wie die Konsole befinden, auf der du Minecraft spielst.';

  @override
  String get subscription => 'Online-Abonnement erforderlich';

  @override
  String get needSubscription =>
      'Jede Konsole benötigt ein eigenes aktives Online-Abonnement (Xbox Live, PS Plus, NSO). Andernfalls wird MCCompanion nicht angezeigt.';

  @override
  String get updateAvailable => 'Update verfügbar';

  @override
  String get newVersion =>
      'Eine neue Version der App ist verfügbar.\nAktualisiere jetzt für die neuesten Funktionen und Fehlerbehebungen.';

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
  String get nintendoInfoText =>
      'Starte im Nintendo-Modus, richte dein DNS ein und tritt einem hervorgehobenen Server bei.';

  @override
  String get friendModeTitle => 'Freunde-Modus';

  @override
  String get friendModeText =>
      'Füge MCCompanions Freundes-Bots als Freunde hinzu. Starte den Freunde-Modus und spiele';

  @override
  String get selectedRelayCheck => 'Ausgewählt';

  @override
  String relayFallbackWarning(Object name) {
    return 'Warnung: Das ursprüngliche Relay hat nicht geantwortet. Ersatz-Relay wird verwendet: $name';
  }

  @override
  String get relayUnableConnect =>
      'Verbindung zu KEINEM MCCompanion-Relay-Server möglich. Versuche es später erneut oder überprüfe dein Internet.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / Proxy-Modus)';

  @override
  String get howToXboxSubtitle => 'Spiele über LAN-Übertragung oder Proxy';

  @override
  String get howToXboxBody =>
      'So verbindest du dich (Xbox / PS4 / PS5):\r\n1. Stelle sicher, dass dein Gerät mit MCCompanion und deine Konsole sich im selben lokalen Netzwerk befinden.\r\n2. Gib in der App die Adresse und den Port deines Minecraft-Servers ein und drücke \\\"Übertragung starten\\\".\r\n3. Öffne auf der Konsole Minecraft → Spielen → suche nach LAN-Welten oder dem Freunde-Tab und aktualisiere die Liste.\r\n4. Wähle den LAN-Server namens \\\"MCCompanion\\\" aus, um beizutreten.\r\nHinweise:\r\n- Wenn der Server nicht erscheint, stelle sicher, dass sich beide Geräte im selben Subnetz befinden und die App noch sendet.\r\n- Einige Konsolenmodelle oder Router können die LAN-Erkennung blockieren; versuche bei Bedarf, die App- oder Router-Einstellungen zu ändern.';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (DNS-Modus)';

  @override
  String get howToNintendoSubtitle => 'DNS-Relay-Anweisungen für Switch';

  @override
  String get howToNintendoBody =>
      'Nintendo Switch: DNS-Modus (Schritt für Schritt):\r\n1. Aktiviere in der App den \\\"Nintendo\\\"-Modus und wähle einen Relay-Server (EU oder US).\r\n2. Tippe auf \\\"DNS-Konfiguration senden\\\", um die DNS-IP an das Relay zu senden.\r\n3. Gehe auf deiner Nintendo Switch zu Systemeinstellungen → Internet → Interneteinstellungen → (dein Netzwerk) → Einstellungen ändern → DNS und setze den primären DNS auf die Relay-IP.\r\n4. Öffne Minecraft und tritt einem öffentlichen Server bei; du wirst mithilfe des Relay-DNS zu deinem Server weitergeleitet.\r\nHinweise:\r\n- Der DNS-Modus sendet keinen LAN-Server aus; er leitet den Spielverkehr über das Relay weiter.\r\n- Setze dein DNS nach der Nutzung zurück, wenn du normales Netzwerkverhalten benötigst.';

  @override
  String get howToFriendsTitle => 'Freunde-Modus';

  @override
  String get howToFriendsSubtitle => 'Lade Freunde ein und trete über LAN bei';

  @override
  String get howToFriendsBody =>
      'Freunde-Modus: schnelle Schritte:\r\n1. Füge das MCCompanion-Freundeskonto (Relay-Freund) auf deiner Konsole oder Plattform hinzu, falls erforderlich.\r\n2. Aktiviere in der App den Freunde-Modus und sende die Relay-Konfiguration (falls zutreffend).\r\n3. Öffne auf deiner Konsole Minecraft → Freunde und suche nach LAN-Welten, dein Server sollte dort als LAN-Welt erscheinen.\r\n4. Wähle ihn aus, um deinem Server mit Freunden beizutreten.\r\nHinweise:\r\n- Stelle sicher, dass du und deine Freunde dieselben NAT-/Einstellungen habt, die die Freundespräsenz erlauben.\r\n- Der Freunde-Modus hängt von den Freundesfunktionen der Plattform ab und kann das Annehmen von Freundschaftsanfragen erfordern.';

  @override
  String get helpMCCompanionTitle => 'MCCompanion erscheint nicht';

  @override
  String get helpMCCompanionSubtitle => 'Behebung von LAN-Erkennungsproblemen';

  @override
  String get helpMCCompanionBody =>
      'Wenn der Server auf deiner Konsole nicht erscheint, versuche diese Schritte:\r\n\r\n✅ Grundlegende Prüfungen:\r\n1. Gleiches WiFi-Netzwerk - Dein Telefon/Tablet und deine Konsole MÜSSEN im selben WiFi sein\r\n2. Richtige Serveradresse - Überprüfe IP und Port erneut (Standard: 19132)\r\n3. Übertragung aktiv - Vergewissere dich, dass MCCompanion den Status \\\"Übertragung läuft\\\" anzeigt\r\n\r\n🔄 Schnelle Lösungen:\r\n• Starte die App neu: Stoppe die Übertragung, schließe MCCompanion vollständig, öffne es erneut und versuche es noch einmal\r\n• Starte deine Konsole neu: Manchmal muss die Konsole aktualisiert werden, um LAN-Spiele zu erkennen\r\n• Prüfe den Freunde-/LAN-Tab: Der Server erscheint unter \\\"Freunde\\\" oder \\\"LAN-Spiele\\\", NICHT in der Serverliste\r\n• Warte 10-15 Sekunden nach dem Start der Übertragung\r\n• Deaktiviere VPNs: VPNs können lokale Übertragungen blockieren\r\n\r\n⚠️ Häufige Probleme:\r\n\\\"No route found for user\\\" → Stelle sicher, dass beide Geräte im selben Wi‑Fi sind (vermeide Gastnetzwerke)\r\n\\\"Unable to connect to MCCompanion relay server\\\" → Prüfe dein Internet / den Status des Relays\r\n\r\n📱 Immer noch Probleme? Aktiviere den Debug-Modus in MCCompanion und prüfe die Protokolle oder versuche einen anderen Server.';

  @override
  String get helpMultiplayerFailedTitle =>
      'Mehrspieler-Verbindung fehlgeschlagen';

  @override
  String get helpMultiplayerFailedSubtitle =>
      'Erklärung, warum dies kein MCCompanion-Fehler ist';

  @override
  String get helpMultiplayerFailedBody =>
      '⚠️ Das ist kein Problem mit MCCompanion!\r\n\r\nMCCompanion hat dich erfolgreich zum angeforderten Server weitergeleitet. Die Meldung \\\"Mehrspieler-Verbindung fehlgeschlagen\\\" bedeutet, dass der Zielserver derzeit nicht erreichbar ist. Mögliche Gründe:\r\n\r\n• Der Ziel-Minecraft-Server ist offline oder überlastet\r\n• Der Server erfordert eine aktualisierte Client-Version oder eine bestimmte Edition\r\n• Netzwerkprobleme zwischen dem Relay und dem Zielserver\r\n\r\nVersuche, dich mit einem anderen Server zu verbinden, oder kontaktiere den Support des Servers. Wenn das Problem bei mehreren Servern weiterhin besteht, aktiviere den Debug-Modus in MCCompanion und prüfe die Protokolle.';

  @override
  String get helpNintendoDnsTitle => 'Nintendo-DNS funktioniert nicht';

  @override
  String get helpNintendoDnsSubtitle => 'Häufige DNS-/Relay-Probleme';

  @override
  String get helpNintendoDnsBody =>
      'Wenn der Nintendo-DNS-Modus nicht funktioniert, überprüfe Folgendes:\r\n\r\n1. Bestätige, dass du die DNS-Konfiguration aus der App gesendet hast (DNS-Konfiguration senden).\r\n2. Vergewissere dich, dass du die Relay-IP als primären DNS auf der Switch gesetzt hast.\r\n3. Stelle sicher, dass der ausgewählte Relay-Server (EU/US) online und nicht überlastet ist.\r\n4. Einige Netzwerke (z. B. Captive Portals) verhindern benutzerdefiniertes DNS, teste es in einem anderen Netzwerk.\r\n\r\nWenn die Probleme weiterhin bestehen, aktiviere den Debug-Modus und prüfe die Protokolle oder probiere die Alternative Freunde-Modus aus.';

  @override
  String get helpFriendsModeTitle => 'Freunde-Modus funktioniert nicht';

  @override
  String get helpFriendsModeSubtitle => 'Häufige Freundesprobleme';

  @override
  String get helpFriendsModeBody =>
      'Tipps zur Fehlerbehebung für den Freunde-Modus:\r\n\r\n1. Stelle sicher, dass das Relay-Freundeskonto auf der Konsole hinzugefügt/akzeptiert wurde (falls erforderlich).\r\n2. Versuche, das Spiel neu zu starten und den Freunde-/LAN-Tab zu aktualisieren, nachdem du den Freunde-Modus aktiviert hast.\r\n\r\nWenn der Server für Freunde immer noch nicht erscheint, aktiviere den Debug-Modus und prüfe die Protokolle, um Fehler zu identifizieren.';

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
  String get trackerSignInSubtitle =>
      'Melde dich an, um Server zu verfolgen und Offline-Benachrichtigungen zu erhalten.';

  @override
  String get signIn => 'Anmelden';

  @override
  String get noServersTracked => 'Keine Server verfolgt';

  @override
  String get trackerEmptySubtitle =>
      'Füge einen Minecraft-Server hinzu, um seinen Status zu überwachen und Benachrichtigungen zu erhalten.';

  @override
  String get fillAllFields => 'Bitte fülle alle Felder korrekt aus';

  @override
  String get slotUsedUpgrade =>
      'Dein kostenloser Slot ist belegt. Upgrade für mehr Server.';

  @override
  String get addServerFailed =>
      'Server konnte nicht hinzugefügt werden. Überprüfe deine Angaben.';

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
  String get failedUpdateNotifications =>
      'Benachrichtigungen konnten nicht aktualisiert werden';

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
  String get customizeSubtitle =>
      'Kacheln neu anordnen und Navigation anpassen';

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
  String get tileWideTooltipRemove => 'Breites Layout entfernen';

  @override
  String get tileWideTooltipAdd => 'Als breite Kachel festlegen';

  @override
  String get tileVisibilityShow => 'Kachel anzeigen';

  @override
  String get tileVisibilityHide => 'Kachel ausblenden';

  @override
  String get tileVisibilityMin =>
      'Kann nicht ausgeblendet werden (letzte Kachel)';

  @override
  String get colorPickerApply => 'Anwenden';

  @override
  String get colorPickerHex => 'Hex';

  @override
  String get textColorSection => 'TEXTFARBE';

  @override
  String get textColorPickerTitle => 'Textfarbe';

  @override
  String get textColorHint =>
      'Tippe auf den Kreis, um eine benutzerdefinierte Textfarbe auszuwählen';

  @override
  String get textColorPreviewPrimary => 'Primär';

  @override
  String get textColorPreviewSecondary => 'Sekundär';

  @override
  String get textColorPreviewMuted => 'Gedämpft';

  @override
  String get colorSwatchCustom => 'Benutzerdefiniert';

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
  String get reportUser => 'Benutzer melden';

  @override
  String get reportMessage => 'Nachricht melden';

  @override
  String reportUserWithName(Object name) {
    return '$name melden';
  }

  @override
  String get reportDisclaimer => 'Berichte werden von unserem Team überprüft.';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonHarassment => 'Belästigung';

  @override
  String get reportReasonInappropriate => 'Unangemessener Inhalt';

  @override
  String get reportReasonOther => 'Sonstiges';

  @override
  String get reportAdditionalDetails => 'Zusätzliche Details (optional)…';

  @override
  String get reportSuccess => 'Bericht gesendet. Danke.';

  @override
  String get reportFailed => 'Bericht konnte nicht gesendet werden.';

  @override
  String get reportSubmit => 'Bericht senden';

  @override
  String get today => 'Heute';

  @override
  String get yesterday => 'Gestern';

  @override
  String get messagePlaceholder => 'Nachricht…';

  @override
  String get noMessagesYet => 'Noch keine Nachrichten.\nSag Hallo!';

  @override
  String get noConversationsYet => 'Noch keine Gespräche';

  @override
  String get startChatHint => 'Finde einen Freund und fange an zu chatten!';

  @override
  String get youPrefix => 'Du';

  @override
  String get playerLookupTitle => 'Spieler suchen';

  @override
  String get playerLookupSubtitle => 'Java- oder Bedrock-Spieler suchen';

  @override
  String get playerLookupHint => 'Benutzernamen eingeben…';

  @override
  String get playerLookupLinked => 'Verknüpfte Konten gefunden';

  @override
  String get playerLookupLabelUsername => 'Benutzername';

  @override
  String get playerLookupLabelTier => 'Stufe';

  @override
  String playerLookupCopied(Object value) {
    return '$value kopiert';
  }

  @override
  String get tabProfile => 'Profil';

  @override
  String get tabFriends => 'Freunde';

  @override
  String get tabRequests => 'Anfragen';

  @override
  String get tabChats => 'Chats';

  @override
  String get addFriend => 'Freund hinzufügen';

  @override
  String get usernameHint => 'Benutzername';

  @override
  String get send => 'Senden';

  @override
  String friendRequestSentTo(Object name) {
    return 'Freundschaftsanfrage an $name gesendet';
  }

  @override
  String alreadyFriendsWith(Object name) {
    return 'Du bist bereits mit $name befreundet';
  }

  @override
  String requestAlreadyPending(Object name) {
    return 'Eine Anfrage an $name ist bereits ausstehend';
  }

  @override
  String userNotFoundMsg(Object name) {
    return 'Benutzer $name nicht gefunden';
  }

  @override
  String cannotSendRequest(Object name) {
    return 'Anfrage an $name kann nicht gesendet werden';
  }

  @override
  String get somethingWentWrong =>
      'Etwas ist schiefgelaufen. Erneut versuchen.';

  @override
  String friendRequestAccepted(Object name) {
    return 'Du bist jetzt mit $name befreundet';
  }

  @override
  String requestDeclined(Object name) {
    return 'Anfrage von $name abgelehnt';
  }

  @override
  String get deleteAccountTitle => 'Konto löschen';

  @override
  String get deleteAccountBody =>
      'Damit wird dein Konto und alle Daten dauerhaft gelöscht.';

  @override
  String get deletePermanently => 'Dauerhaft löschen';

  @override
  String get couldNotDeleteAccount => 'Konto konnte nicht gelöscht werden.';

  @override
  String get removeFriendTitle => 'Freund entfernen';

  @override
  String removeFriendConfirm(Object name) {
    return '$name aus deinen Freunden entfernen?';
  }

  @override
  String get remove => 'Entfernen';

  @override
  String friendRemoved(Object name) {
    return '$name wurde aus deinen Freunden entfernt';
  }

  @override
  String get emailDifferentMethod =>
      'Diese E-Mail ist mit einer anderen Methode verknüpft';

  @override
  String get googleSignInFailed => 'Google-Anmeldung fehlgeschlagen.';

  @override
  String get appleSignInFailed =>
      'Apple-Anmeldung fehlgeschlagen. Erneut versuchen.';

  @override
  String get resetPasswordTitle => 'Passwort zurücksetzen';

  @override
  String get resetPasswordBody =>
      'Gib deine E-Mail ein, um einen Reset-Link zu erhalten.';

  @override
  String get emailAddressHint => 'E-Mail-Adresse';

  @override
  String get sendLink => 'Link senden';

  @override
  String resetLinkSent(Object email) {
    return 'Falls es ein Konto für $email gibt, ist ein Link unterwegs';
  }

  @override
  String get noAccountForEmail => 'Kein Konto für diese E-Mail gefunden';

  @override
  String get invalidEmailError => 'Die E-Mail-Adresse ist nicht gültig';

  @override
  String get couldNotSendResetEmail => 'E-Mail konnte nicht gesendet werden.';

  @override
  String get enterEmailAndPassword => 'E-Mail und Passwort eingeben';

  @override
  String get incorrectEmailOrPassword =>
      'Falsche E-Mail oder falsches Passwort';

  @override
  String get emailAlreadyInUse => 'Diese E-Mail-Adresse wird bereits verwendet';

  @override
  String get weakPassword => 'Passwort zu schwach.';

  @override
  String get createAccount => 'Konto erstellen';

  @override
  String get signInSubtitle => 'Melde dich an, um auf dein Profil zuzugreifen.';

  @override
  String get passwordHint => 'Passwort';

  @override
  String get forgotPassword => 'Passwort vergessen?';

  @override
  String get orDivider => 'oder';

  @override
  String get continueWithGoogle => 'Mit Google fortfahren';

  @override
  String get alreadyHaveAccount => 'Bereits ein Konto? Anmelden';

  @override
  String get noAccountYet => 'Noch kein Konto? Erstelle eines';

  @override
  String get profileNotSetUp => 'Profil nicht eingerichtet';

  @override
  String get chooseUsernameSubtitle =>
      'Wähle einen Benutzernamen, damit andere Spieler dich finden können.';

  @override
  String get createProfile => 'Profil erstellen';

  @override
  String get findUser => 'Benutzer suchen';

  @override
  String get couldNotUpdateVisibility =>
      'Sichtbarkeit konnte nicht aktualisiert werden';

  @override
  String get signOut => 'Abmelden';

  @override
  String get appearOfflineLabel => 'Offline erscheinen';

  @override
  String get appearOfflineOn => 'Du erscheinst offline';

  @override
  String get appearOfflineOff => 'Du erscheinst online';

  @override
  String get unlinkXboxTitle => 'Xbox-Konto trennen';

  @override
  String removeLabelConfirm(Object name) {
    return '$name aus deinen verknüpften Konten entfernen?';
  }

  @override
  String get unlink => 'Verknüpfung aufheben';

  @override
  String get unlinkJavaTitle => 'Java-Konto trennen';

  @override
  String removeJavaConfirm(Object name) {
    return '$name aus deinen verknüpften Konten entfernen?';
  }

  @override
  String get linkedAccountsTitle => 'Verknüpfte Konten';

  @override
  String get linkAccountsHint => 'Verknüpfe deine Minecraft-Konten.';

  @override
  String get linkXbox => 'Xbox verknüpfen';

  @override
  String get linkJava => 'Java verknüpfen';

  @override
  String get profileUpdated => 'Profil aktualisiert';

  @override
  String get profileCardTitle => 'Profil';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get displayNameLabel => 'Anzeigename';

  @override
  String get yourNameHint => 'Dein Name';

  @override
  String get bioLabel => 'Bio';

  @override
  String get bioHint => 'Erzähl anderen von dir…';

  @override
  String get avatarUrlLabel => 'Avatar-URL';

  @override
  String get usernameDisplayLabel => 'Benutzername';

  @override
  String get aboutMe => 'Über mich';

  @override
  String get noFriendsYet => 'Noch keine Freunde';

  @override
  String get noFriendsSub => 'Füge Freunde hinzu, um sie hier zu sehen.';

  @override
  String onlineFriendsLabel(Object count) {
    return '$count online';
  }

  @override
  String offlineFriendsLabel(Object count) {
    return '$count offline';
  }

  @override
  String get noPendingRequests => 'Keine ausstehenden Anfragen';

  @override
  String get requestsAppearHere =>
      'Neue Freundschaftsanfragen erscheinen hier.';

  @override
  String get skinsEdit => 'Bearbeiten';

  @override
  String get skinsNoAccountsTitle => 'Keine Minecraft-Konten verknüpft';

  @override
  String get skinsNoAccountsSubtitle =>
      'Verknüpfe ein Konto, um deine Skins zu sehen.';

  @override
  String get skinsSignInTitle => 'Anmelden zum Anzeigen';

  @override
  String get skinsSignInSubtitle => 'Melde dich an, um deine Skins zu sehen.';

  @override
  String get skinsMustBe64 => 'Skin muss 64×64 Pixel sein';

  @override
  String get skinsInvalidFile => 'Ungültige Bilddatei';

  @override
  String get skinsUpload => 'Hochladen';

  @override
  String get skinsCreate => 'Erstellen';

  @override
  String get skinsSectionRecent => 'AKTUELLE SKINS';

  @override
  String get skinsSectionMy => 'MEINE SKINS';

  @override
  String get skinsEmptyMySkins => 'Noch keine Skins. Lade einen hoch!';

  @override
  String get skinsSectionYours => 'DEINE SKINS';

  @override
  String get skinsCouldNotLoad => 'Skins konnten nicht geladen werden';

  @override
  String skinsPageOf(Object page, Object total) {
    return 'Seite $page von $total';
  }

  @override
  String get skinsDownload => 'Herunterladen';

  @override
  String get wikiTitle => 'Wiki';

  @override
  String get wikiMinecraftWiki => 'Minecraft Wiki';

  @override
  String get wikiSearchHint => 'Im Wiki suchen…';

  @override
  String get wikiCouldNotLoadPages => 'Seiten konnten nicht geladen werden.';

  @override
  String get wikiCouldNotReach => 'Wiki nicht erreichbar.';

  @override
  String wikiNoResults(Object query) {
    return 'Keine Ergebnisse für \"$query\"';
  }

  @override
  String get wikiNoPagesFound => 'Keine Seiten gefunden';

  @override
  String wikiCategories(Object count) {
    return '$count Kategorien';
  }

  @override
  String get wikiCouldNotLoadContent => 'Inhalt konnte nicht geladen werden.';

  @override
  String get wikiOpenInBrowser => 'Im Browser öffnen';

  @override
  String get wikiCrafting => 'Handwerk';

  @override
  String get wikiReadFullArticle => 'Vollständigen Artikel lesen';

  @override
  String get wikiRecent => 'Zuletzt angesehen';

  @override
  String get wikiFavourites => 'Favoriten';

  @override
  String get wikiMobs => 'Mobs';

  @override
  String get wikiBlocks => 'Blöcke';

  @override
  String get wikiItems => 'Gegenstände';

  @override
  String get wikiBiomes => 'Biome';

  @override
  String get wikiStructures => 'Strukturen';

  @override
  String get wikiEnchantments => 'Verzauberungen';

  @override
  String get wikiPotions => 'Tränke';

  @override
  String get wikiPassive => 'Passiv';

  @override
  String get wikiNeutral => 'Neutral';

  @override
  String get wikiHostile => 'Feindselig';

  @override
  String get wikiBoss => 'Boss';

  @override
  String get wikiUtility => 'Nutzmob';

  @override
  String get wikiNatural => 'Natürlich';

  @override
  String get wikiOres => 'Erze';

  @override
  String get wikiWood => 'Holz';

  @override
  String get wikiStone => 'Stein';

  @override
  String get wikiRedstone => 'Redstone';

  @override
  String get wikiPlants => 'Pflanzen';

  @override
  String get wikiDecoration => 'Dekoration';

  @override
  String get wikiTools => 'Werkzeuge';

  @override
  String get wikiSwords => 'Schwerter';

  @override
  String get wikiRanged => 'Fernkampf';

  @override
  String get wikiArmor => 'Rüstung';

  @override
  String get wikiFood => 'Essen';

  @override
  String get wikiBrewing => 'Brauen';

  @override
  String get wikiMaterials => 'Materialien';

  @override
  String get wikiOverworld => 'Oberwelt';

  @override
  String get wikiNether => 'Nether';

  @override
  String get wikiTheEnd => 'The End';

  @override
  String get wikiSword => 'Schwert';

  @override
  String get wikiTool => 'Werkzeug';

  @override
  String get wikiBow => 'Bogen';

  @override
  String get wikiFishing => 'Angeln';

  @override
  String get wikiStatusEffects => 'Statuseffekte';

  @override
  String get chooseUniqueUsername => 'Wähle einen einzigartigen Benutzernamen.';

  @override
  String get usernameFieldLabel => 'Benutzername';

  @override
  String get usernameExampleHint => 'z.B. CoolPlayer123';

  @override
  String get usernameFormatHint =>
      '3–20 Zeichen · Buchstaben, Zahlen und Unterstriche';

  @override
  String get displayNameOptional => 'Anzeigename (optional)';

  @override
  String get displayNameExampleHint => 'z.B. Cooler Spieler';

  @override
  String get usernameRequired => 'Benutzername ist erforderlich';

  @override
  String get usernameFormatError =>
      'Der Benutzername muss 3–20 Zeichen lang sein und darf nur Buchstaben, Zahlen und Unterstriche enthalten';

  @override
  String get usernameTaken => 'Dieser Benutzername ist bereits vergeben';

  @override
  String get noConnectionError =>
      'Keine Verbindung. Überprüfe dein Internet und versuche es erneut.';

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

  @override
  String get paywallRestore => 'Wiederherstellen';

  @override
  String get paywallMonthly => 'Monatlich';

  @override
  String get paywallYearly => 'Jährlich';

  @override
  String get paywallSavePercent => '~17% sparen';

  @override
  String get paywallSubtitle =>
      'Verfolge mehr Server und erhalte Benachrichtigungen.';

  @override
  String paywallSlotLabel(Object slots) {
    return '$slots Server-Slots';
  }

  @override
  String get paywallPopular => 'Beliebt';

  @override
  String get paywallContinue => 'Weiter';

  @override
  String get paywallNoPkgs => 'Keine Pakete verfügbar.';

  @override
  String get paywallManaged => 'Verwaltet von Apple/Google. Jederzeit kündbar.';

  @override
  String get paywallPurchaseSuccess => 'Kauf erfolgreich!';

  @override
  String get paywallPurchaseFailed => 'Kauf fehlgeschlagen.';

  @override
  String get paywallPurchasesRestored => 'Käufe wiederhergestellt!';

  @override
  String get paywallNoActivePurchases => 'Keine aktiven Käufe gefunden.';

  @override
  String get paywallRestoreFailed => 'Wiederherstellung fehlgeschlagen.';

  @override
  String get relay => 'Relay';

  @override
  String get selectModeSection => 'MODUS WÄHLEN';

  @override
  String get serversSection => 'SERVER';

  @override
  String get noServerSelected => 'Kein Server ausgewählt';

  @override
  String get selectBedrockAccount => 'Bedrock-Konto wählen';

  @override
  String playersCount(Object players, Object max) {
    return '$players / $max Spieler';
  }

  @override
  String get infoAndLegal => 'Info & Rechtliches';

  @override
  String get legalSection => 'Rechtliches';

  @override
  String get privacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get privacyPolicySubtitle => 'Wie wir deine Daten schützen';

  @override
  String get termsOfService => 'Nutzungsbedingungen';

  @override
  String get termsOfServiceSubtitle => 'Regeln und Bedingungen';

  @override
  String get dataSourcesSection => 'Datenquellen & Credits';

  @override
  String get creditMinecraftWikiSubtitle =>
      'Wiki-Datenquelle. Inhalt unter Creative Commons.';

  @override
  String get creditMojangTitle => 'Mojang / Microsoft';

  @override
  String get creditMojangSubtitle =>
      'Java-Spielerskins und Profile über die Mojang-API.';

  @override
  String get creditGeyserTitle => 'GeyserMC';

  @override
  String get creditGeyserSubtitle => 'Bedrock-Skin-Rendering über GeyserMC.';

  @override
  String get creditXboxTitle => 'Xbox / Microsoft';

  @override
  String get creditXboxSubtitle => 'Bedrock-Kontoverknüpfung über Xbox Live.';

  @override
  String get aboutMCCompanionSection => 'Über MCCompanion';

  @override
  String get aboutMCCompanionDisclaimer =>
      'MCCompanion ist eine unabhängige App, nicht mit Mojang oder Microsoft verbunden.';

  @override
  String get minecraftTrademark =>
      '\"Minecraft\" ist ein Warenzeichen von Microsoft Corporation.';

  @override
  String get nldServerLabelShort => 'MCCompanion Server';

  @override
  String get editServer => 'Server bearbeiten';

  @override
  String get serverNameExampleHint => 'Mein toller Server';

  @override
  String get serverAddressExampleHint => 'play.beispiel.de';

  @override
  String get serverDescriptionExampleHint => 'Survival-Server mit Freunden';

  @override
  String get editionLabel => 'Edition';

  @override
  String get nameLabel => 'Name';

  @override
  String get ipAddressFieldLabel => 'IP-Adresse';

  @override
  String get portFieldLabel => 'Port';

  @override
  String get platformFieldLabel => 'Plattform';

  @override
  String get nameValidationError => 'Name muss 1–50 Zeichen haben';

  @override
  String get ipRequiredError => 'IP-Adresse erforderlich';

  @override
  String get portRangeError => 'Port muss zwischen 1 und 65535 liegen';

  @override
  String get partnerServersTitle => 'Partnerserver';

  @override
  String get noPartnerServers => 'Noch keine Partnerserver verfügbar.';

  @override
  String get checkBackLater => 'Schau später nochmal.';

  @override
  String get xboxLinkTitle => 'Xbox-Konto verknüpfen';

  @override
  String get xboxStartingLogin => 'Xbox-Anmeldung starten…';

  @override
  String get xboxSignInWithMicrosoft => 'Mit Microsoft anmelden';

  @override
  String get xboxGoToLink => 'Geh zum Link und gib den Code ein.';

  @override
  String get xboxYourCode => 'Dein Code';

  @override
  String get xboxTapToCopy => 'Code antippen zum Kopieren';

  @override
  String get xboxOpenLink => 'microsoft.com/link öffnen';

  @override
  String get xboxWaitingForLogin => 'Warte auf Anmeldung…';

  @override
  String get xboxAccountLinked => 'Xbox-Konto verknüpft!';

  @override
  String get xboxCodeCopied => 'Code in die Zwischenablage kopiert';

  @override
  String get xboxCouldNotStart =>
      'Xbox-Anmeldung konnte nicht gestartet werden.';

  @override
  String get xboxCodeExpired => 'Code abgelaufen. Erneut versuchen.';

  @override
  String get xboxSomethingWrong => 'Etwas ist schiefgelaufen.';

  @override
  String get tryAgain => 'Erneut versuchen';

  @override
  String get publicProfileTitle => 'Profil';

  @override
  String get userNotFound => 'Benutzer nicht gefunden';

  @override
  String get profileSectionLabel => 'Profil';

  @override
  String get displayNameRowLabel => 'Anzeigename';

  @override
  String get usernameRowLabel => 'Benutzername';

  @override
  String get lastSeenLabel => 'Zuletzt gesehen';

  @override
  String get aboutSectionLabel => 'Über';

  @override
  String get xboxBedrockLabel => 'Xbox / Bedrock';

  @override
  String get friendRequestSent => 'Freundschaftsanfrage gesendet';

  @override
  String get alreadyFriendsMsg => 'Ihr seid bereits befreundet.';

  @override
  String get requestAlreadyPendingMsg => 'Eine Anfrage ist bereits ausstehend.';

  @override
  String get userNotFoundMsg2 => 'Benutzer nicht gefunden.';

  @override
  String get cannotSendRequestMsg => 'Anfrage kann nicht gesendet werden.';

  @override
  String nowFriendsWith(Object username) {
    return 'Jetzt befreundet mit @$username';
  }

  @override
  String get removeFriendButton => 'Freund entfernen';

  @override
  String get requestSentButton => 'Anfrage gesendet';

  @override
  String get acceptRequestButton => 'Anfrage annehmen';

  @override
  String get addFriendButton => 'Freund hinzufügen';

  @override
  String get removeFriendDialogTitle => 'Freund entfernen';

  @override
  String removeFriendDialogBody(Object username) {
    return '@$username als Freund entfernen?';
  }

  @override
  String get trackerLimitReached => 'Limit erreicht. Upgrade für mehr Server.';

  @override
  String get upgradeButton => 'Upgrade';

  @override
  String get javaLinkTitle => 'Java Edition verknüpfen';

  @override
  String get javaStartingLogin => 'Microsoft-Anmeldung starten…';

  @override
  String get javaSignInWithMicrosoft => 'Mit Microsoft anmelden';

  @override
  String get javaGoToLink =>
      'Geh zum Link und gib den Code ein, um dein Minecraft Java Edition-Konto zu verknüpfen.';

  @override
  String get javaYourCode => 'Dein Code';

  @override
  String get javaTapToCopy => 'Code antippen zum Kopieren';

  @override
  String get javaOpenLink => 'microsoft.com/link öffnen';

  @override
  String get javaWaitingForLogin => 'Warte auf Anmeldung…';

  @override
  String get javaAccountLinked => 'Java Edition verknüpft!';

  @override
  String get javaNoJavaTitle => 'Kein Java Edition gefunden';

  @override
  String get javaNoJavaBody =>
      'Das angemeldete Microsoft-Konto besitzt kein Minecraft Java Edition.';

  @override
  String get javaTryDifferentAccount => 'Anderes Konto versuchen';

  @override
  String get javaCouldNotStart =>
      'Microsoft-Anmeldung konnte nicht gestartet werden. Erneut versuchen.';

  @override
  String get javaCodeExpired => 'Code abgelaufen. Erneut versuchen.';

  @override
  String get javaSomethingWrong =>
      'Etwas ist schiefgelaufen. Erneut versuchen.';

  @override
  String get javaCodeCopied => 'Code in die Zwischenablage kopiert';

  @override
  String get splashFeatureConnect => 'Verbinden';

  @override
  String get splashFeatureFriends => 'Freunde';

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
  String get featureLabelPartners => 'Partner';

  @override
  String get featureLabelLookup => 'Suche';

  @override
  String get featureLabelTracker => 'Server-Tracker';

  @override
  String get featureSubtitleConnector => 'Konsolen mit Minecraft verbinden';

  @override
  String get featureSubtitleSkins => 'Minecraft-Skins durchsuchen & verwalten';

  @override
  String get featureSubtitleWiki => 'Minecraft-Enzyklopädie';

  @override
  String get featureSubtitlePartners => 'Empfohlene Server';

  @override
  String get featureSubtitleLookup => 'Java- & Bedrock-Profile nachschlagen';

  @override
  String get featureSubtitleTracker =>
      'Serverstatus überwachen & benachrichtigt werden';

  @override
  String get userSearchHint => 'Benutzername, Gamertag oder Java-Name…';

  @override
  String get userSearchSub =>
      'Suche nach Benutzername, Xbox-Gamertag oder Java-Name';

  @override
  String get onlineStatus => 'Online';

  @override
  String get upgradeWindowsHint => 'Upgrade im Microsoft Store verfügbar';

  @override
  String get chatEmptyHint => 'Sag als Erster etwas!';

  @override
  String get skinSaved => 'Skin gespeichert';

  @override
  String skinSavedAs(String name) {
    return 'Gespeichert als \"$name\"';
  }

  @override
  String get skinExportFailed => 'Export fehlgeschlagen';

  @override
  String get skinExported => 'Skin erfolgreich exportiert';

  @override
  String get accountActions => 'KONTO';

  @override
  String get feedbackBugReport => 'Fehlermeldung';

  @override
  String get feedbackFeatureRequest => 'Funktionsanfrage';

  @override
  String get feedbackGoesToGithub => 'Direkt an GitHub gesendet';

  @override
  String get feedbackTitleLabel => 'Titel';

  @override
  String get feedbackTitleHintBug =>
      'z.B. App stürzt beim Öffnen des Skin-Editors ab';

  @override
  String get feedbackTitleHintFeature =>
      'z.B. Ping des Spielers in der Serverliste anzeigen';

  @override
  String get feedbackWhatHappened => 'Was ist passiert?';

  @override
  String get feedbackDescribeIdea => 'Beschreibe deine Idee';

  @override
  String get feedbackDescHintBug =>
      'Beschreibe den Fehler: was hast du getan, was hast du erwartet und was ist stattdessen passiert?';

  @override
  String get feedbackDescHintFeature =>
      'Erkläre, was du möchtest und warum es nützlich wäre.';

  @override
  String get feedbackEmailLabel => 'E-Mail';

  @override
  String get feedbackEmailHint => 'Damit wir uns bei dir melden können';

  @override
  String get feedbackEmailNote => 'Deine E-Mail wird nie öffentlich geteilt.';

  @override
  String get feedbackSubmitBug => 'Fehlermeldung senden';

  @override
  String get feedbackSubmitFeature => 'Funktionsanfrage senden';

  @override
  String get feedbackDisclaimer =>
      'Erstellt ein öffentliches GitHub-Issue · Keine Passwörter eingeben';

  @override
  String get feedbackSuccessTitle => 'Danke für das Feedback!';

  @override
  String get feedbackSuccessBody =>
      'Danke! Dein Bericht ist eingegangen. Wir schauen uns das so bald wie möglich an.';

  @override
  String get feedbackViewOnGithub => 'Auf GitHub ansehen';

  @override
  String get feedbackSubmitAnother => 'Noch einen einreichen';

  @override
  String get feedbackBackToApp => 'Zurück zur App';

  @override
  String get feedbackTitleTooShort =>
      'Titel muss mindestens 5 Zeichen lang sein.';

  @override
  String get feedbackDescTooShort =>
      'Beschreibung muss mindestens 10 Zeichen lang sein.';

  @override
  String get feedbackEmailInvalid =>
      'Bitte gib eine gültige E-Mail-Adresse ein.';

  @override
  String get feedbackSubmitFailed =>
      'Senden fehlgeschlagen. Bitte erneut versuchen.';

  @override
  String get feedbackTileTitle =>
      'Einen Fehler melden oder eine Funktion vorschlagen';

  @override
  String get reportBug => 'Feedback';

  @override
  String get feedbackTileSubtitle => 'Hilf uns, MCCompanion zu verbessern';

  @override
  String get friendsHowToStep1 =>
      'Öffne die Xbox-App auf deinem Handy oder deiner Konsole.';

  @override
  String get friendsHowToStep2 =>
      'Füge einen der unten aufgeführten Bots als Freund auf Xbox hinzu.';

  @override
  String get friendsHowToStep3 =>
      'Öffne Minecraft und gehe zum Tab „Freunde\".';

  @override
  String get friendsHowToStep4 =>
      'Suche deinen Server unter LAN-Welten und tritt bei.';

  @override
  String get friendsHowToNote =>
      '⚠️ Jedes Mal, wenn du spielen möchtest, musst du zuerst den Freundesmodus in der MCCompanion-App starten. Du kannst die App danach schließen.';

  @override
  String get friendsBotLoadError =>
      '⚠️ Bot-Liste konnte nicht geladen werden. Versuche es später erneut.';

  @override
  String get regionEurope => 'Europa';

  @override
  String get regionUnitedStates => 'Vereinigte Staaten';

  @override
  String get yourRegion => 'DEINE REGION';

  @override
  String get botStatusOffline => 'Offline';

  @override
  String get botStatusFull => 'Voll';

  @override
  String botFriendCount(Object current, Object max) {
    return '$current / $max Freunde';
  }

  @override
  String botCopied(Object gamertag) {
    return '$gamertag kopiert';
  }

  @override
  String get copyLabel => 'Kopieren';

  @override
  String get skinSavedToDocuments => 'Skin in Dokumente gespeichert';

  @override
  String get skinMenuExport => 'Exportieren';

  @override
  String get skinMenuDelete => 'Löschen';

  @override
  String get rpScreenTitle => 'Ressourcenpaket';

  @override
  String get rpWhatIsThis => 'Was ist das?';

  @override
  String get rpExplanation =>
      'Ein Ressourcenpaket verändert das Aussehen von Minecraft auf deiner Konsole, neue Blöcke, Farben oder Sounds. Füge den Link zu einer .mcpack-Datei unten ein, aktiviere es und speichere. MCCompanion lädt es automatisch bei jeder Verbindung.';

  @override
  String get rpPackUrlLabel => 'Paket-URL';

  @override
  String get rpPackUrlHint => 'https://example.com/pack.mcpack';

  @override
  String get rpEnableToggle => 'Ressourcenpaket aktivieren';

  @override
  String get rpWhatWorks => 'Was funktioniert';

  @override
  String get rpSupportedBedrockOnly =>
      'Nur Bedrock Edition (.mcpack oder .zip)';

  @override
  String get rpSupportedBedrockOnlyHint =>
      'Java-Packs funktionieren nicht auf Konsolen.';

  @override
  String get rpSupportedTexture => 'Ressourcenpakete & Texturpakete';

  @override
  String get rpSupportedTextureHint =>
      'Diese werden offiziell unterstützt und funktionieren zuverlässig.';

  @override
  String get rpUnsupportedShaders => 'Shader, Verhaltenspakete, Skin-Packs';

  @override
  String get rpUnsupportedShadersHint =>
      'Diese werden auf Konsolen über MCCompanion nicht geladen.';

  @override
  String get rpUnsupportedAddons => 'Add-ons & UI-Mods';

  @override
  String get rpUnsupportedAddonsHint =>
      'Funktionieren manchmal, werden aber nicht offiziell unterstützt. Nutzung auf eigene Gefahr.';

  @override
  String get rpNoDiscord =>
      'Discord-Links: keine .mcpack-Erweiterung und laufen nach wenigen Stunden ab';

  @override
  String get rpNoDrive =>
      'Google Drive / Dropbox-Freigabelinks: keine direkten Downloads';

  @override
  String get rpNoEncrypted =>
      'Server mit verschlüsselten oder passwortgeschützten Paketen';

  @override
  String get rpConsolePerformanceTitle => 'Konsolenleistung';

  @override
  String get rpConsolePerformanceBody =>
      'Texturpakete mit hoher Auflösung können auf Konsolen Lag oder Abstürze verursachen. Bei Problemen wechsle zu einem Paket mit niedrigerer Auflösung oder wähle ein leichteres Subpaket, falls vorhanden.';

  @override
  String get rpWarnDiscord =>
      'Discord-Links laufen ab und funktionieren dann nicht mehr. Verwende stattdessen einen dauerhaften Host.';

  @override
  String get rpWarnHttps => 'Die URL muss mit https:// beginnen';

  @override
  String get rpWarnExtension => 'Die URL muss auf .mcpack oder .zip enden';

  @override
  String get rpToastEnterUrl =>
      'Gib eine URL ein, bevor du das Ressourcenpaket aktivierst.';

  @override
  String get rpToastSaved => 'Ressourcenpaket-Einstellungen gespeichert.';

  @override
  String get rpInvalidPackFormat =>
      'Dies ist ein Java-Edition-Paket und wird nicht unterstützt. Bitte verwende ein Bedrock-Edition-Ressourcenpaket.';

  @override
  String get rpBehaviorContentWarning =>
      'Dieses Paket enthält Verhaltenspaket-Daten, die auf Servern nicht funktionieren. Die Texturen funktionieren trotzdem.';

  @override
  String get rpClearMinecraftTitle => 'Erstes Mal mit diesem Paket?';

  @override
  String get rpClearMinecraftBody =>
      'Minecraft speichert Ressourcenpakete lokal im Cache. Wenn du dich vor der Aktivierung von MCCompanions Ressourcenpaket mit diesem Server verbunden hast, hat Minecraft das Originalpaket bereits gecacht und lädt die zusammengeführte Version nicht erneut herunter.';

  @override
  String get rpClearStep1 =>
      'Offne Minecraft auf deiner Konsole und gehe zu Einstellungen → Speicher';

  @override
  String get rpClearStep2 =>
      'Tippe neben Ressourcenpakete auf ‘Löschen’ oder ‘Zurücksetzen’, das entfernt alle lokal gecachten Packs';

  @override
  String get rpClearStep3 =>
      'Verbinde dich erneut über MCCompanion: das zusammengeführte Pack wird automatisch heruntergeladen';

  @override
  String get rpRelayTitle => 'Paket sieht falsch aus?';

  @override
  String get rpRelayBody =>
      'Der Relay speichert das zusammengeführte Pack 1 Stunde lang anhand der Overlay-URL als Cache-Schlüssel. Um eine neue Zusammenführung zu erzwingen: Pack-URL leicht ändern (z. B. ?v=2 anhängen) und speichern. Danach auch den Minecraft-Pack-Cache leeren, da das zusammengeführte Pack weiterhin die UUID des Servers verwendet, würde Minecraft sonst die alte gecachte Version anzeigen.';

  @override
  String get rpWorksGithubHint => 'Direkter Download-Link: immer erreichbar';

  @override
  String get rpWorksCloudflareHint =>
      'Offentlicher Cloud-Speicher: schnell und zuverlässig';

  @override
  String get rpWorksDirectHint =>
      'Jede offentliche HTTPS .mcpack- oder .zip-URL';

  @override
  String get rpNoDiscordHint => 'Discord CDN-Links laufen nach kurzer Zeit ab';

  @override
  String get rpNoDriveHint =>
      'Kein Direktdownload: leitet zu einer Vorschauseite weiter';

  @override
  String get rpNoEncryptedHint =>
      'MCCompanion kann verschlüsselten Pack-Inhalt nicht zusammenführen';

  @override
  String get rpClearWhy =>
      'Minecraft speichert Ressourcenpakete anhand ihrer UUID. Das zusammengeführte Paket behält die ursprüngliche UUID des Servers, wenn Minecraft das Serverpaket bereits aus einer früheren Sitzung (vor MCCompanion) gecacht hat, lädt es die neue zusammengeführte Version nicht erneut herunter. Leere den Cache, damit Minecraft das frische Paket lädt.';

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
  String get rpMergerSubtitle => 'Bis zu 4 Ressourcenpakete kombinieren';

  @override
  String get rpMergerPriorityHint =>
      'Das oberste Paket hat höchste Priorität: seine Dateien gewinnen Konflikte.';

  @override
  String get rpMergerTopBadge => 'TOP';

  @override
  String get rpMergerAddPacks => 'Ressourcenpakete hinzufügen';

  @override
  String rpMergerAddAnother(int current) {
    return 'Weiteres Paket hinzufügen ($current/4)';
  }

  @override
  String get rpMergerFileTypes => '.zip oder .mcpack';

  @override
  String get rpMergerMerging => 'Zusammenführen…';

  @override
  String rpMergerButton(int count) {
    return '$count Pakete zusammenführen';
  }

  @override
  String get rpMergerComplete => 'Zusammenführung abgeschlossen!';

  @override
  String rpMergerConflicts(int count) {
    return '$count Konflikt(e) gelöst: oberstes Paket gewann.';
  }

  @override
  String get rpMergerSetActive => 'Als aktives Ressourcenpaket festlegen';

  @override
  String get rpMergerSetActiveToast => 'Als aktives Ressourcenpaket festgelegt';

  @override
  String get rpMergerOpenButton => 'Ressourcenpakete zusammenführen';

  @override
  String get rpMergerOpenSubtitle => '2–4 Pakete zu einem kombinieren';

  @override
  String get rpDisabled => 'Deaktiviert';

  @override
  String get rpNoPackSelected => 'Kein Ressourcenpaket ausgewählt';

  @override
  String get rpActiveOnConnect => 'Aktiv: wird beim Verbinden angewendet';

  @override
  String get rpBrowseSubtitle => 'Kuratierte Packs, sofort einsatzbereit';

  @override
  String get rpBrowseEmpty => 'Noch keine Packs verfügbar';

  @override
  String get rpBrowseEmptyHint => 'Schau später für kuratierte Packs vorbei.';

  @override
  String get rpReplaceFile => 'Durch eine andere Datei ersetzen';

  @override
  String get rpDropToUpload => 'Zum Hochladen ablegen';

  @override
  String get rpTabBrowseInfo =>
      'Durchsuche von MCCompanion ausgewählte Packs. Tippe auf Verwenden, um ein Pack sofort zu aktivieren, kein Upload oder Link erforderlich.';

  @override
  String get rpTabUploadInfo =>
      'Lade deine eigene .mcpack- oder .zip-Datei hoch. MCCompanion speichert sie sicher in der Cloud und sendet sie bei jeder Verbindung an deine Konsole.';

  @override
  String get rpTabUrlInfo =>
      'Füge einen direkten Download-Link zu einer .mcpack- oder .zip-Datei ein. Die URL muss öffentlich zugänglich sein, keine Discord- oder Google Drive-Links.';

  @override
  String get rpTabMergeInfo =>
      'Kombiniere 2 bis 4 Packs zu einem. Das zusammengeführte Pack wird in die MCCompanion Cloud hochgeladen und automatisch aktiviert.';

  @override
  String get shareLabel => 'Teilen';

  @override
  String get sectionMinecraftAccounts => 'Minecraft-Konten';

  @override
  String get sectionSettings => 'Einstellungen';

  @override
  String get avatarUpdated => 'Avatar aktualisiert';

  @override
  String get uploadFailed => 'Upload fehlgeschlagen';

  @override
  String get profileLinkCopied => 'Profillink kopiert!';

  @override
  String get shareProfileTooltip => 'Profil teilen';

  @override
  String get profileFallbackTitle => 'Profil';

  @override
  String get noUsersFound => 'Keine Nutzer gefunden';

  @override
  String get skinLabel => 'SKIN';

  @override
  String get skinsLabel => 'SKINS';

  @override
  String get javaEditionBadge => 'Java';

  @override
  String get bedrockEditionBadge => 'Bedrock';

  @override
  String get downloadLabel => 'Herunterladen';

  @override
  String get justNow => 'Gerade eben';

  @override
  String minutesAgo(int count) {
    return 'Vor ${count}m';
  }

  @override
  String hoursAgo(int count) {
    return 'Vor ${count}h';
  }

  @override
  String daysAgo(int count) {
    return 'Vor ${count}d';
  }

  @override
  String get rpPackInfo => 'Info';

  @override
  String get rpUseThisPack => 'Dieses Pack verwenden';

  @override
  String get rpViewOnWebsite => 'Auf Website ansehen →';

  @override
  String rpDownloads(int count) {
    return '$count Downloads';
  }

  @override
  String get rpPackDetailTitle => 'Pack-Details';

  @override
  String get skinsSavedToMySkins => 'In Meine Skins gespeichert';

  @override
  String get skinsDownloadFailed => 'Download fehlgeschlagen';

  @override
  String get skinsDeletedFromCloud => 'Aus der Cloud gelöscht';

  @override
  String get skinsDeleteFailed => 'Löschen fehlgeschlagen';

  @override
  String get skinsLoginToUpload => 'Anmelden, um Skins hochzuladen';

  @override
  String get skinsUploading => 'Wird hochgeladen…';

  @override
  String get skinUploaded => 'Skin hochgeladen!';

  @override
  String skinUploadFailed(String error) {
    return 'Upload fehlgeschlagen: $error';
  }

  @override
  String get skinsTabSkins => 'Skins';

  @override
  String get skinsTabRecent => 'Zuletzt';

  @override
  String get skinsEmptyCloudSkins =>
      'Noch keine Cloud-Skins. Lade einen Skin hoch, um ihn hier zu sehen.';

  @override
  String get skinsEmptyLocalSkins =>
      'Noch keine Skins. Erstelle oder lade einen Skin hoch, um loszulegen.';

  @override
  String get skinUploadToWebsite => 'Auf Website hochladen';

  @override
  String get skinReuploadToWebsite => 'Erneut auf Website hochladen';

  @override
  String get skinCloudEdit => 'Bearbeiten';

  @override
  String get skinCloudSaveToDevice => 'Auf Gerät speichern';

  @override
  String get skinCloudDelete => 'Aus Cloud löschen';

  @override
  String get skinsTabGallery => 'Galerie';

  @override
  String get skinsGalleryEmpty => 'Noch keine Community-Skins.';

  @override
  String get skinsTopLabel => 'Top 30';

  @override
  String get skinsAllLabel => 'Alle Skins';

  @override
  String get skinUploadToCloud => 'In Cloud laden';

  @override
  String get skinSaveDialog => 'Skin speichern';

  @override
  String get skinNameHint => 'Skin-Name';

  @override
  String get skinDefaultName => 'Mein Skin';

  @override
  String get skinUpdatedInCloud => 'Skin in der Cloud aktualisiert';

  @override
  String skinByCreator(String name) {
    return 'von $name';
  }

  @override
  String skinLikesCount(int count) {
    return '$count Likes';
  }

  @override
  String get sectionRecentActivity => 'Letzte Aktivitäten';

  @override
  String get activityNoEvents => 'Noch keine Aktivitäten.';

  @override
  String get activitySkinUploaded => 'Skin hochgeladen';

  @override
  String get activitySkinLiked => 'Skin geliket';

  @override
  String get activityPackSubmitted => 'Pack eingereicht';

  @override
  String get activityPackApproved => 'Pack genehmigt';

  @override
  String get activityPackRejected => 'Pack nicht genehmigt';

  @override
  String get timeJustNow => 'gerade eben';

  @override
  String timeMinutesAgo(int count) {
    return 'vor $count Min.';
  }

  @override
  String timeHoursAgo(int count) {
    return 'vor $count Std.';
  }

  @override
  String timeDaysAgo(int count) {
    return 'vor $count Tagen';
  }

  @override
  String timeMonthsAgo(int count) {
    return 'vor $count Mon.';
  }

  @override
  String get sectionNotifications => 'Benachrichtigungen';

  @override
  String get sectionNotificationTypes => 'Benachrichtigungstypen';

  @override
  String get notifMarkAllRead => 'Alle als gelesen markieren';

  @override
  String get notifEmpty =>
      'Noch keine Benachrichtigungen. Likes, Kommentare und Freundesaktivitäten erscheinen hier.';

  @override
  String get notifSomeone => 'Jemand';

  @override
  String notifSkinLiked(String actor) {
    return '$actor mag deinen Skin';
  }

  @override
  String notifCommentReceived(String actor) {
    return '$actor hat deinen Skin kommentiert';
  }

  @override
  String get notifPackApproved => 'Pack genehmigt';

  @override
  String get notifPackRejected => 'Pack nicht genehmigt';

  @override
  String notifFriendRequest(String actor) {
    return '$actor hat dir eine Freundschaftsanfrage geschickt';
  }

  @override
  String notifFriendAccepted(String actor) {
    return '$actor hat deine Anfrage akzeptiert';
  }

  @override
  String notifMessageReceived(String actor) {
    return 'Neue Nachricht von $actor';
  }

  @override
  String get notifPrefSkinLiked => 'Skin geliket';

  @override
  String get notifPrefCommentReceived => 'Kommentar erhalten';

  @override
  String get notifPrefPackApproved => 'Pack genehmigt';

  @override
  String get notifPrefPackRejected => 'Pack abgelehnt';

  @override
  String get notifPrefFriendRequest => 'Freundschaftsanfrage';

  @override
  String get notifPrefFriendAccepted => 'Freund hinzugefügt';

  @override
  String get notifPrefMessageReceived => 'Neue Nachricht';

  @override
  String get commentsTitle => 'Kommentare';

  @override
  String get commentsEmpty => 'Noch keine Kommentare. Sei der Erste!';

  @override
  String get commentsPlaceholder => 'Kommentar schreiben…';

  @override
  String get loadMore => 'Mehr laden';

  @override
  String get skinLayerInner => 'Innen';

  @override
  String get skinLayerOuter => 'Außen';

  @override
  String get feedbackLoginRequiredTitle =>
      'Melde dich an, um Feedback zu senden';

  @override
  String get feedbackLoginRequiredBody =>
      'Feedback ist mit deinem MCCompanion-Konto verknüpft, damit wir dir direkt in der App antworten können.';

  @override
  String get feedbackLoginButton => 'Anmelden';

  @override
  String get supportInboxTitle => 'Support-Postfach';

  @override
  String get supportInboxSubtitle =>
      'Alle Support-Chats, für alle Admins sichtbar';

  @override
  String get adminBadge => 'Admin';

  @override
  String get skinShareSubject => 'Minecraft-Skin';

  @override
  String get skinEditorTitle => 'Skin-Editor';

  @override
  String get skinToolUndo => 'Rückgängig';

  @override
  String get skinSaveToMySkins => 'In meinen Skins speichern';

  @override
  String get skinUpdateInCloud => 'In Cloud aktualisieren';

  @override
  String get skinExportPng => 'PNG exportieren';

  @override
  String get skinToolDraw => 'Zeichnen';

  @override
  String get skinToolFill => 'Füllen';

  @override
  String get skinToolErase => 'Radieren';

  @override
  String get customColour => 'Eigene Farbe';

  @override
  String get featuredServerLabel => 'EMPFOHLENER SERVER';

  @override
  String get featuredServerTagline => 'Rein und losspielen.';

  @override
  String get featuredServerPlay => 'Spielen';

  @override
  String rpUploadFailedCode(int code) {
    return 'Upload fehlgeschlagen ($code)';
  }

  @override
  String rpUploadFailed(String error) {
    return 'Upload fehlgeschlagen: $error';
  }

  @override
  String get rpLoadFailed => 'Packs konnten nicht geladen werden';

  @override
  String get rpRetry => 'Erneut versuchen';

  @override
  String get rpSearchHint => 'Packs suchen…';

  @override
  String rpMergeFailed(String error) {
    return 'Zusammenführen fehlgeschlagen: $error';
  }

  @override
  String get rpMergerSize => 'Größe';

  @override
  String get rpMergerCreated => 'Erstellt';

  @override
  String get rpMergerSourcePacks => 'Quell-Packs';

  @override
  String get rpMergerDropToAdd => 'Zum Hinzufügen ablegen';

  @override
  String get rpMergerSavedMerges => 'Gespeicherte Merges';

  @override
  String get rpMergerUse => 'Verwenden';

  @override
  String get supportInboxShared => 'Mit allen Admins geteilt';

  @override
  String get supportInboxEmpty => 'Noch keine Support-Chats';

  @override
  String get supportReplyingAs => 'Du antwortest als MCCompanion Support';

  @override
  String get supportReplyHint => 'Als Support antworten…';

  @override
  String get relayBlocked =>
      'Deine IP oder dein Konto wurde von MCCompanion gesperrt. Wenn das ein Fehler ist, komm auf unseren Discord.';

  @override
  String relayBlockedWithReason(String reason) {
    return 'Deine IP oder dein Konto wurde von MCCompanion gesperrt.\nGrund: $reason\nWenn das ein Fehler ist, komm auf unseren Discord.';
  }

  @override
  String relayConfigFailed(int code) {
    return 'Relay konnte nicht eingerichtet werden (Status $code). Probier ein anderes Relay oder komm auf unseren Discord.';
  }

  @override
  String relayConfigFailedDetail(int code, String detail) {
    return 'Relay konnte nicht eingerichtet werden (Status $code): $detail. Probier ein anderes Relay oder komm auf unseren Discord.';
  }

  @override
  String get relayTimeout => 'Das Relay hat nicht rechtzeitig geantwortet.';

  @override
  String get relayUnreachable => 'Relay nicht erreichbar.';

  @override
  String get lookupNotFound => 'Spieler nicht gefunden.';

  @override
  String get lookupNetworkError => 'Netzwerkfehler. Bitte versuch es erneut.';

  @override
  String get lookupBedrockUnavailable =>
      'Bedrock-Suche ist gerade nicht verfügbar.';

  @override
  String get lookupFailed => 'Suche fehlgeschlagen.';

  @override
  String get myFeedbackTitle => 'Mein Feedback';

  @override
  String get myFeedbackEmpty => 'Du hast uns noch nichts geschickt.';

  @override
  String get myFeedbackOpenList => 'Mein Feedback';

  @override
  String get fbStatusOpen => 'Offen';

  @override
  String get fbStatusPlanned => 'Geplant';

  @override
  String get fbStatusInProgress => 'In Arbeit';

  @override
  String get fbStatusImplemented => 'Fertig';

  @override
  String get fbStatusNotPlanned => 'Nicht geplant';

  @override
  String get fbStatusDuplicate => 'Duplikat';

  @override
  String get fbNoReplies => 'Noch keine Antwort. Wir melden uns hier.';

  @override
  String get fbReplyHint => 'Etwas zu dieser Meldung hinzufügen…';

  @override
  String get fbFromTeam => 'MCCompanion';

  @override
  String get fbFromYou => 'Du';

  @override
  String get feedbackGoesToTeam => 'Geht direkt an das Team';

  @override
  String get notifFeedbackStatus => 'Update zu deinem Feedback';

  @override
  String get notifFeedbackReply => 'Antwort auf dein Feedback';

  @override
  String get adminTicketsHeader => 'Meldungen und Wünsche';

  @override
  String get adminGeneralChat => 'Allgemeiner Chat';

  @override
  String get adminTicketReplyHint => 'Antwort zu diesem Ticket…';

  @override
  String get adminNoTicketsForUser => 'Keine Tickets von diesem Nutzer';

  @override
  String get hideConversation => 'Ausblenden';

  @override
  String get conversationHidden => 'Unterhaltung ausgeblendet';

  @override
  String get undo => 'Rückgängig';

  @override
  String get chooseServerTitle => 'Server auswählen';

  @override
  String get changeLabel => 'Ändern';

  @override
  String get howToAutoShow => 'Beim Starten anzeigen';

  @override
  String get skinEditorLoadFailed =>
      'Dieser Skin konnte nicht geladen werden. Wir starten mit dem Standard-Skin.';

  @override
  String get skinToolRecolour => 'Umfärben';

  @override
  String get skinToolPick => 'Pipette';

  @override
  String get skinBases => 'Vorlagen';

  @override
  String get skinBasesTitle => 'Mit einer Vorlage starten';

  @override
  String get skinBasesSubtitle =>
      'Das ersetzt die aktuelle Zeichnung. Rückgängig stellt sie wieder her.';

  @override
  String get skinMirror => 'Spiegeln';

  @override
  String get skinSurprise => 'Überrasch mich';

  @override
  String get skinToolFillHint => 'Füllt die angetippte Fläche';

  @override
  String get skinToolRecolourHint => 'Ändert diese Farbe überall';

  @override
  String get skinToolPickHint => 'Übernimmt die angetippte Farbe';

  @override
  String get skinModelClassic => 'Breit';

  @override
  String get skinModelSlim => 'Schmal';

  @override
  String get shareServerLabel => 'Server teilen';

  @override
  String get shareServerOn => 'Freunde sehen, auf welchem Server du bist';

  @override
  String get shareServerOff => 'Freunde sehen, dass du spielst, aber nicht wo';
}
