import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sw.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('ja'),
    Locale('nl'),
    Locale('pt'),
    Locale('ru'),
    Locale('sw'),
    Locale('tr'),
    Locale('ur'),
    Locale('zh')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'MCCompanion'**
  String get appName;

  /// No description provided for @console.
  ///
  /// In en, this message translates to:
  /// **'Console'**
  String get console;

  /// No description provided for @consoleOutput.
  ///
  /// In en, this message translates to:
  /// **'Console Output'**
  String get consoleOutput;

  /// No description provided for @noLogsYet.
  ///
  /// In en, this message translates to:
  /// **'No logs yet'**
  String get noLogsYet;

  /// No description provided for @startBroadcastingToSeeOutput.
  ///
  /// In en, this message translates to:
  /// **'Start broadcasting to see output'**
  String get startBroadcastingToSeeOutput;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @joinUs.
  ///
  /// In en, this message translates to:
  /// **'Join Us'**
  String get joinUs;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @howToUseMenu.
  ///
  /// In en, this message translates to:
  /// **'How to use'**
  String get howToUseMenu;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// Detailed help / instructions shown in the help dialog
  ///
  /// In en, this message translates to:
  /// **'Created by {appCreator}.\n\nHow to use:\n1. Enter your Minecraft server address and port (default: 19132)\n   — or select a previously saved server from the dropdown\n2. (Optional) Choose a Relay Server (EU or US) closest to your location\n3. Click \"Start Broadcasting\" to begin\n4. On your console/device: Minecraft > Play > Friends\n5. You should see a LAN server called \"MCCompanion\"\n6. Click it to join your external server via MCCompanion\n\nNintendo Switch (DNS mode):\n1. Enable \"Nintendo Switch\" in the connection panel\n2. Select a Relay Server (EU or US)\n3. Click \"Send DNS Config\" — this sends your config to the relay\n   (it does NOT broadcast a LAN server)\n4. On your Switch, apply your MCCompanion DNS setup and join\n   using the server entry you use for MCCompanion\n\nNotes:\n- For LAN broadcasting, MCCompanion and console must be on the same local network.\n- Tip: Choose the relay server closest to you for the best performance.'**
  String helpText(Object appCreator);

  /// No description provided for @serverDetailsLabel.
  ///
  /// In en, this message translates to:
  /// **'Server Details'**
  String get serverDetailsLabel;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @stop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stop;

  /// No description provided for @labelJava.
  ///
  /// In en, this message translates to:
  /// **'Java'**
  String get labelJava;

  /// No description provided for @startJavaMode.
  ///
  /// In en, this message translates to:
  /// **'Start Java Mode'**
  String get startJavaMode;

  /// No description provided for @javaInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Java Mode'**
  String get javaInfoTitle;

  /// No description provided for @javaInfoText.
  ///
  /// In en, this message translates to:
  /// **'Connect to Java Edition servers'**
  String get javaInfoText;

  /// Title for the Java how-to modal
  ///
  /// In en, this message translates to:
  /// **'Java Mode'**
  String get howToJavaTitle;

  /// Short subtitle for Java menu tile
  ///
  /// In en, this message translates to:
  /// **'Connect to Java Edition servers via MCCompanion'**
  String get howToJavaSubtitle;

  /// No description provided for @aternosSubtext.
  ///
  /// In en, this message translates to:
  /// **'Create your own free Minecraft server'**
  String get aternosSubtext;

  /// Detailed steps for Java mode how-to modal
  ///
  /// In en, this message translates to:
  /// **'Java Mode — quick steps:\n1. In the app, select Java mode.\n2. Enter your Java Edition server address and port (default: 25565).\n3. Press \"Start Java Mode\" — MCCompanion bridges the connection.\n4. Open Minecraft Bedrock and go to the Friends tab.\n5. Select the LAN server named \"MCCompanion\" to join the Java server.\n\n⚠️ Important warnings:\n- A valid Java Edition account (Microsoft) is required.\n- Some servers use anti-cheat systems that may detect and ban your account.\n- Certain servers explicitly prohibit Bedrock clients — always check the server rules.\n- MCCompanion is not responsible for any account bans, suspensions, or other account-related issues that may result from using this feature.\n- Use at your own risk.'**
  String get howToJavaBody;

  /// Your language name in your own language
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// Name of the Discord community / link label
  ///
  /// In en, this message translates to:
  /// **'Discord'**
  String get discord;

  /// Tooltip for toggling debug logging in console
  ///
  /// In en, this message translates to:
  /// **'Toggle debug'**
  String get toggleDebug;

  /// Tooltip / button text to copy console logs
  ///
  /// In en, this message translates to:
  /// **'Copy logs'**
  String get copyLogs;

  /// Button text to clear console logs or fields
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// Generic cancel button label
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Title for delete server confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'Delete Server'**
  String get deleteServer;

  /// Delete action label
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Title for manage servers dialog
  ///
  /// In en, this message translates to:
  /// **'My Servers'**
  String get myServers;

  /// Subtitle for manage servers dialog
  ///
  /// In en, this message translates to:
  /// **'Quick access servers'**
  String get quickAccessServers;

  /// Add server button label / dialog title
  ///
  /// In en, this message translates to:
  /// **'Add Server'**
  String get addServer;

  /// Hint text shown when there are no saved servers
  ///
  /// In en, this message translates to:
  /// **'Add servers to quickly connect later'**
  String get addServersHint;

  /// Form label for server name
  ///
  /// In en, this message translates to:
  /// **'Server Name *'**
  String get serverNameLabel;

  /// Form label for server address
  ///
  /// In en, this message translates to:
  /// **'Address *'**
  String get addressLabel;

  /// Form label for server port
  ///
  /// In en, this message translates to:
  /// **'Port *'**
  String get portLabel;

  /// Form label for server description
  ///
  /// In en, this message translates to:
  /// **'Description (Optional)'**
  String get descriptionLabel;

  /// Save button label
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Shown on splash while app initializes
  ///
  /// In en, this message translates to:
  /// **'Initializing...'**
  String get initializing;

  /// Badge text on splash screen
  ///
  /// In en, this message translates to:
  /// **'Created by NetherDev'**
  String get createdBy;

  /// Subtitle on splash screen
  ///
  /// In en, this message translates to:
  /// **'Bedrock Bridge'**
  String get bedrockBridge;

  /// Snackbar shown when clients disconnect automatically
  ///
  /// In en, this message translates to:
  /// **'Client disconnected — Broadcast stopped'**
  String get clientDisconnected;

  /// Validation message when server address field is empty
  ///
  /// In en, this message translates to:
  /// **'⚠️ Please enter a server address'**
  String get pleaseEnterServer;

  /// Validation message when port is invalid
  ///
  /// In en, this message translates to:
  /// **'⚠️ Invalid port number (1-65535)'**
  String get invalidPort;

  /// Confirmation after sending DNS config to relay
  ///
  /// In en, this message translates to:
  /// **'✅ DNS config sent to relay'**
  String get dnsConfigSent;

  /// Snackbar shown when broadcasting starts
  ///
  /// In en, this message translates to:
  /// **'Broadcasting started'**
  String get broadcastingStarted;

  /// Snackbar shown when broadcasting stops
  ///
  /// In en, this message translates to:
  /// **'Broadcast stopped'**
  String get broadcastStopped;

  /// Shown when a saved server is selected
  ///
  /// In en, this message translates to:
  /// **'📋 Selected: {name}'**
  String selectedServer(Object name);

  /// Shown when a featured server is selected
  ///
  /// In en, this message translates to:
  /// **'Selected: {name}'**
  String selectedFeaturedServer(Object name);

  /// Shown when user tries to copy logs but none exist
  ///
  /// In en, this message translates to:
  /// **'No logs to copy'**
  String get noLogsToCopy;

  /// Shown after copying logs to clipboard
  ///
  /// In en, this message translates to:
  /// **'Copied {count} log entries to clipboard'**
  String copiedLogs(Object count);

  /// Shown when debug logging is enabled/disabled
  ///
  /// In en, this message translates to:
  /// **'Debug logs enabled'**
  String get debugEnabled;

  /// No description provided for @debugDisabled.
  ///
  /// In en, this message translates to:
  /// **'Debug logs disabled'**
  String get debugDisabled;

  /// No description provided for @howToUseTitle.
  ///
  /// In en, this message translates to:
  /// **'How to use MCCompanion'**
  String get howToUseTitle;

  /// No description provided for @iUnderstand.
  ///
  /// In en, this message translates to:
  /// **'I understand'**
  String get iUnderstand;

  /// No description provided for @playOnSwitchTitle.
  ///
  /// In en, this message translates to:
  /// **'Play on Nintendo Switch'**
  String get playOnSwitchTitle;

  /// No description provided for @playWithFriendsTitle.
  ///
  /// In en, this message translates to:
  /// **'Play with Friends'**
  String get playWithFriendsTitle;

  /// DNS instructions shown for Nintendo Switch mode
  ///
  /// In en, this message translates to:
  /// **'Selected: {relayName}\n\nHow to connect:\n1. Go to your Switch Settings and change the DNS to: {relayIp}\n2. Open Minecraft and select a server from the list (like Cubecraft or Hive).\n3. You will now be sent to your own server automatically.'**
  String playInstructionsSwitch(Object relayName, Object relayIp);

  /// Instructions shown for Friends mode
  ///
  /// In en, this message translates to:
  /// **'How to connect:\n1. On your console, add {friend} as a friend.\n2. Open Minecraft and go to the Friends tab.\n3. Look for your server under LAN Worlds and select it to join.'**
  String playInstructionsFriends(Object friend);

  /// Label text above the relay selector
  ///
  /// In en, this message translates to:
  /// **'NETHERLINK SERVER'**
  String get nldServerLabel;

  /// Accessibility label for relay selection button
  ///
  /// In en, this message translates to:
  /// **'Select relay {name}'**
  String selectRelayLabel(Object name);

  /// No description provided for @noSavedServers.
  ///
  /// In en, this message translates to:
  /// **'No saved servers'**
  String get noSavedServers;

  /// No description provided for @savedServers.
  ///
  /// In en, this message translates to:
  /// **'Saved servers'**
  String get savedServers;

  /// No description provided for @serverAddressHint.
  ///
  /// In en, this message translates to:
  /// **'Server Address'**
  String get serverAddressHint;

  /// No description provided for @portHint.
  ///
  /// In en, this message translates to:
  /// **'Port'**
  String get portHint;

  /// No description provided for @manageServers.
  ///
  /// In en, this message translates to:
  /// **'Manage servers'**
  String get manageServers;

  /// No description provided for @manageServersTooltip.
  ///
  /// In en, this message translates to:
  /// **'Manage servers'**
  String get manageServersTooltip;

  /// No description provided for @noServerYet.
  ///
  /// In en, this message translates to:
  /// **'No saved servers yet.\nTap Manage to add one.'**
  String get noServerYet;

  /// No description provided for @serverNotSelected.
  ///
  /// In en, this message translates to:
  /// **'No server selected'**
  String get serverNotSelected;

  /// No description provided for @ready.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get ready;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @vpnDetected.
  ///
  /// In en, this message translates to:
  /// **'VPN Detected'**
  String get vpnDetected;

  /// No description provided for @noWifi.
  ///
  /// In en, this message translates to:
  /// **'Not on Wi-Fi'**
  String get noWifi;

  /// No description provided for @vpnActive.
  ///
  /// In en, this message translates to:
  /// **'We detected that your VPN is active.\n\nPlease disable your VPN before using MCCompanion, otherwise the LAN broadcast may not reach your console.'**
  String get vpnActive;

  /// No description provided for @mobileActive.
  ///
  /// In en, this message translates to:
  /// **'Detected: Mobile Data\n\nMCCompanion needs to be on the same network as your console. Please connect to your home Wi-Fi or hotspot before continuing.'**
  String get mobileActive;

  /// No description provided for @continueAnyway.
  ///
  /// In en, this message translates to:
  /// **'Continue Anyway'**
  String get continueAnyway;

  /// No description provided for @sameWifi.
  ///
  /// In en, this message translates to:
  /// **'Same Wi-Fi Network'**
  String get sameWifi;

  /// No description provided for @needSameWifi.
  ///
  /// In en, this message translates to:
  /// **'The device running MCCompanion MUST be on the same Wi-Fi network as the console you play Minecraft on.'**
  String get needSameWifi;

  /// No description provided for @subscription.
  ///
  /// In en, this message translates to:
  /// **'Online Subscription Required'**
  String get subscription;

  /// No description provided for @needSubscription.
  ///
  /// In en, this message translates to:
  /// **'Each console needs its own active online subscription (Xbox Live, PS Plus, NSO). Without it, MCCompanion won\'t appear.'**
  String get needSubscription;

  /// No description provided for @updateAvailable.
  ///
  /// In en, this message translates to:
  /// **'Update Available'**
  String get updateAvailable;

  /// No description provided for @newVersion.
  ///
  /// In en, this message translates to:
  /// **'A new version of the app is available.\nUpdate now for the latest features and fixes.'**
  String get newVersion;

  /// No description provided for @later.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get later;

  /// No description provided for @updateNow.
  ///
  /// In en, this message translates to:
  /// **'Update Now'**
  String get updateNow;

  /// No description provided for @beforeYouStart.
  ///
  /// In en, this message translates to:
  /// **'BEFORE YOU START'**
  String get beforeYouStart;

  /// No description provided for @stopBroadcasting.
  ///
  /// In en, this message translates to:
  /// **'Stop Broadcasting'**
  String get stopBroadcasting;

  /// No description provided for @startNintendoMode.
  ///
  /// In en, this message translates to:
  /// **'Start Nintendo Mode'**
  String get startNintendoMode;

  /// No description provided for @startFriendsMode.
  ///
  /// In en, this message translates to:
  /// **'Start Friends Mode'**
  String get startFriendsMode;

  /// No description provided for @startBroadcasting.
  ///
  /// In en, this message translates to:
  /// **'Start Broadcasting'**
  String get startBroadcasting;

  /// No description provided for @modeLabel.
  ///
  /// In en, this message translates to:
  /// **'Mode'**
  String get modeLabel;

  /// No description provided for @labelXbox.
  ///
  /// In en, this message translates to:
  /// **'Xbox/PS4-5'**
  String get labelXbox;

  /// No description provided for @labelNintendo.
  ///
  /// In en, this message translates to:
  /// **'Nintendo'**
  String get labelNintendo;

  /// No description provided for @labelFriends.
  ///
  /// In en, this message translates to:
  /// **'Friends'**
  String get labelFriends;

  /// No description provided for @nintendoInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Nintendo Switch DNS mode'**
  String get nintendoInfoTitle;

  /// No description provided for @nintendoInfoText.
  ///
  /// In en, this message translates to:
  /// **'Start in Nintendo mode, set your DNS and join a featured server.'**
  String get nintendoInfoText;

  /// No description provided for @friendModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Friend mode'**
  String get friendModeTitle;

  /// No description provided for @friendModeText.
  ///
  /// In en, this message translates to:
  /// **'Add MCCompanion\'s friends bots as a friend. Start Friends mode and play'**
  String get friendModeText;

  /// Small label used when a relay is selected
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get selectedRelayCheck;

  /// No description provided for @relayFallbackWarning.
  ///
  /// In en, this message translates to:
  /// **'Warning: original relay did not respond. Fallback relay in use: {name}'**
  String relayFallbackWarning(Object name);

  /// No description provided for @relayUnableConnect.
  ///
  /// In en, this message translates to:
  /// **'Unable to connect to ANY MCCompanion relay server. Try again later or check your internet.'**
  String get relayUnableConnect;

  /// Title for the Xbox / PS4-5 how-to modal
  ///
  /// In en, this message translates to:
  /// **'Xbox / PS4-5 (LAN / Proxy)'**
  String get howToXboxTitle;

  /// Short subtitle for Xbox / PS4-5 menu tile
  ///
  /// In en, this message translates to:
  /// **'Play via LAN broadcast or proxy'**
  String get howToXboxSubtitle;

  /// Detailed steps for Xbox/PS4-5 how-to modal
  ///
  /// In en, this message translates to:
  /// **'How to connect (Xbox / PS4 / PS5):\n1. Ensure your device running MCCompanion and your console are on the same local network.\n2. In the app, enter your Minecraft server address and port and press \"Start Broadcasting\".\n3. On the console open Minecraft → Play → look for LAN Worlds or the Friends tab and refresh the list.\n4. Select the LAN server named \"MCCompanion\" to join.\nNotes:\n- If the server does not appear, confirm both devices are on the same subnet and that the app is still broadcasting.\n- Some console models or routers may block LAN discovery; try toggling the app or router settings if needed.'**
  String get howToXboxBody;

  /// Title for the Nintendo how-to modal
  ///
  /// In en, this message translates to:
  /// **'Nintendo Switch (DNS mode)'**
  String get howToNintendoTitle;

  /// Short subtitle for Nintendo menu tile
  ///
  /// In en, this message translates to:
  /// **'DNS relay instructions for Switch'**
  String get howToNintendoSubtitle;

  /// Detailed steps for Nintendo Switch DNS setup
  ///
  /// In en, this message translates to:
  /// **'Nintendo Switch — DNS mode (step-by-step):\n1. In the app enable \"Nintendo\" mode and select a Relay Server (EU or US).\n2. Tap \"Send DNS Config\" to push the DNS IP to the relay.\n3. On your Nintendo Switch go to System Settings → Internet → Internet Settings → (your network) → Change Settings → DNS and set the Primary DNS to the relay IP.\n4. Open Minecraft and join a public server; you will be redirected to your server using the relay DNS.\nNotes:\n- DNS mode does not broadcast a LAN server; it routes game traffic through the relay.\n- Revert your DNS after you are done if you need normal network behavior.'**
  String get howToNintendoBody;

  /// Title for the Friends-mode how-to modal
  ///
  /// In en, this message translates to:
  /// **'Friends mode'**
  String get howToFriendsTitle;

  /// Short subtitle for Friends menu tile
  ///
  /// In en, this message translates to:
  /// **'Invite friends and join via LAN'**
  String get howToFriendsSubtitle;

  /// Detailed steps for Friends mode
  ///
  /// In en, this message translates to:
  /// **'Friends mode — quick steps:\n1. Add the MCCompanion friend account (relay friend) on your console or platform if required.\n2. In the app enable Friends mode and send the relay configuration (if applicable).\n3. On your console open Minecraft → Friends and search for LAN Worlds — your server should appear there as a LAN world.\n4. Select it to join your server with friends.\nNotes:\n- Make sure both you and your friends have the same NAT/settings that allow friend presence.\n- Friend-mode relies on platform friend features and may require accepting friend requests.'**
  String get howToFriendsBody;

  /// Title for help topic when MCCompanion isn't visible on console
  ///
  /// In en, this message translates to:
  /// **'MCCompanion does not appear'**
  String get helpNetherlinkTitle;

  /// Short subtitle for MCCompanion does not appear tile
  ///
  /// In en, this message translates to:
  /// **'Troubleshooting LAN discovery issues'**
  String get helpNetherlinkSubtitle;

  /// Detailed troubleshooting text for MCCompanion not appearing
  ///
  /// In en, this message translates to:
  /// **'If the server isn\'t appearing on your console, try these steps:\n\n✅ Basic Checks:\n1. Same WiFi Network - Your phone/tablet and console MUST be on the same WiFi\n2. Correct Server Address - Double-check the IP and port (default: 19132)\n3. Broadcasting Active - Verify MCCompanion shows \"Broadcasting\" status\n\n🔄 Quick Fixes:\n• Restart the app: Stop broadcasting, close MCCompanion completely, reopen and try again\n• Restart your console: Sometimes the console needs a refresh to detect LAN games\n• Check Friends/LAN tab: The server appears under \"Friends\" or \"LAN Games\", NOT in server list\n• Wait 10-15 seconds after starting broadcasting\n• Disable VPNs: VPNs can block local broadcasts\n\n⚠️ Common Issues:\n\"No route found for user\" → Ensure both devices are on the same Wi‑Fi (avoid Guest networks)\n\"Unable to connect to MCCompanion relay server\" → Check your internet / relay status\n\n📱 Still having issues? Enable Debug Mode in MCCompanion and check logs, or try a different server.'**
  String get helpNetherlinkBody;

  /// Title for help topic when multiplayer connection fails
  ///
  /// In en, this message translates to:
  /// **'Multiplayer Connection Failed'**
  String get helpMultiplayerFailedTitle;

  /// Short subtitle for multiplayer failed tile
  ///
  /// In en, this message translates to:
  /// **'Explanation why this is not a MCCompanion error'**
  String get helpMultiplayerFailedSubtitle;

  /// Explanation shown when multiplayer connection failed appears
  ///
  /// In en, this message translates to:
  /// **'⚠️ This is not an issue with MCCompanion!\n\nMCCompanion successfully redirected you to the requested server. The message \"Multiplayer Connection Failed\" indicates that the target server is currently unreachable. Possible reasons:\n\n• The target Minecraft server is offline or overloaded\n• The server requires an updated client version or specific edition\n• Network issues between the relay and the target server\n\nTry connecting to a different server or contact the server\'s support. If the problem persists for multiple servers, enable Debug Mode in MCCompanion and check logs.'**
  String get helpMultiplayerFailedBody;

  /// Title for Nintendo DNS troubleshooting
  ///
  /// In en, this message translates to:
  /// **'Nintendo DNS does not work'**
  String get helpNintendoDnsTitle;

  /// Short subtitle for Nintendo DNS troubleshooting tile
  ///
  /// In en, this message translates to:
  /// **'Common DNS / relay issues'**
  String get helpNintendoDnsSubtitle;

  /// Detailed placeholder for Nintendo DNS troubleshooting
  ///
  /// In en, this message translates to:
  /// **'If Nintendo DNS mode isn\'t working, check the following:\n\n1. Confirm you pushed DNS config from the app (Send DNS Config).\n2. Verify you applied the relay IP as Primary DNS on the Switch.\n3. Ensure the relay server selected (EU/US) is online and not overloaded.\n4. Some networks (e.g., captive portals) prevent custom DNS — test on a different network.\n\nIf issues persist, enable Debug Mode and check logs or try the Friends-mode alternative.'**
  String get helpNintendoDnsBody;

  /// Title for Friends mode troubleshooting
  ///
  /// In en, this message translates to:
  /// **'Friends mode does not work'**
  String get helpFriendsModeTitle;

  /// Short subtitle for Friends-mode troubleshooting tile
  ///
  /// In en, this message translates to:
  /// **'Common friend issues'**
  String get helpFriendsModeSubtitle;

  /// Detailed placeholder for Friends mode troubleshooting
  ///
  /// In en, this message translates to:
  /// **'Friends mode troubleshooting tips:\n\n1. Make sure the relay friend account is added/accepted on the console (if required).\n2. Try restarting the game and refreshing the Friends/LAN tab after enabling Friends mode.\n\nIf the server still doesn\'t appear to friends, enable Debug Mode and check logs to identify errors.'**
  String get helpFriendsModeBody;

  /// Title for the language selection dialog
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get changeLanguageTitle;
  String get changeLanguage;
  String get useSystemLanguage;
  String get couldNotOpenUrl;
  String get reportUser => 'Report user';
  String reportUserWithName(String username) => 'Report @$username';
  String get reportMessage => 'Report message';
  String get reportDisclaimer => 'Our team will review this report. Thank you for keeping the community safe.';
  String get reportReasonSpam => 'Spam';
  String get reportReasonHarassment => 'Harassment or bullying';
  String get reportReasonInappropriate => 'Inappropriate content';
  String get reportReasonOther => 'Other';
  String get reportAdditionalDetails => 'Additional details (optional)';
  String get reportSubmit => 'Submit report';
  String get reportSuccess => 'Report submitted. Thank you.';
  String get reportFailed => 'Could not submit report. Please try again.';
  String get messagePlaceholder => 'Message...';
  String get noMessagesYet => 'No messages yet.\nSay hello!';
  String get today => 'Today';
  String get yesterday => 'Yesterday';

  String get noConversationsYet => 'No conversations yet';
  String get startChatHint => 'Start a chat from your friends list.';
  String get youPrefix => 'You';

  String get tabProfile => 'PROFILE';
  String get tabFriends => 'FRIENDS';
  String get tabRequests => 'REQUESTS';
  String get tabChats => 'CHATS';

  String get addFriend => 'Add friend';
  String get usernameHint => 'username';
  String get send => 'Send';
  String friendRequestSentTo(String username) => 'Friend request sent to @$username';
  String alreadyFriendsWith(String username) => 'You are already friends with @$username.';
  String requestAlreadyPending(String username) => 'There is already a pending request with @$username.';
  String userNotFoundMsg(String username) => 'User @$username not found.';
  String cannotSendRequest(String username) => 'You cannot send a request to @$username.';
  String get somethingWentWrong => 'Something went wrong. Please try again.';
  String friendRequestAccepted(String username) => 'Friend request from @$username accepted';
  String requestDeclined(String username) => 'Request from @$username declined';
  String get deleteAccountTitle => 'Delete account';
  String get deleteAccountBody => 'This will permanently delete your account, messages, friends and all associated data. This action cannot be undone.';
  String get deletePermanently => 'Delete permanently';
  String get couldNotDeleteAccount => 'Could not delete account. Please try again.';
  String get removeFriendTitle => 'Remove friend';
  String removeFriendConfirm(String username) => 'Do you want to remove @$username as a friend?';
  String get remove => 'Remove';
  String friendRemoved(String username) => '@$username removed from your friends';
  String get noFriendsYet => 'No friends yet';
  String get noFriendsSub => 'Add someone using the button in the top right.';
  String get noPendingRequests => 'No pending requests';
  String get requestsAppearHere => 'Friend requests will appear here.';
  String onlineFriendsLabel(int count) => 'ONLINE — $count';
  String offlineFriendsLabel(int count) => 'OFFLINE — $count';

  String get couldNotUpdateVisibility => 'Could not update visibility. Try again.';
  String get aboutMe => 'About me';
  String get linkedAccountsTitle => 'Linked Accounts';
  String get linkAccountsHint => 'Link your Minecraft accounts to show them on your profile.';
  String get unlinkXboxTitle => 'Unlink Xbox account';
  String removeLabelConfirm(String label) => 'Remove $label from your linked accounts?';
  String get unlinkJavaTitle => 'Unlink Java Edition';
  String removeJavaConfirm(String username) => 'Remove $username from your linked accounts?';
  String get unlink => 'Unlink';
  String get linkXbox => 'Link Xbox';
  String get linkJava => 'Link Java';
  String get appearOfflineLabel => 'Appear offline';
  String get appearOfflineOn => 'Friends see you as offline';
  String get appearOfflineOff => 'Friends can see when you\'re online';
  String get signOut => 'Sign out';
  String get profileCardTitle => 'Profile';
  String get edit => 'Edit';
  String get displayNameLabel => 'Display name';
  String get bioLabel => 'Bio';
  String get yourNameHint => 'Your name';
  String get bioHint => 'Tell something about yourself';
  String get avatarUrlLabel => 'Avatar URL';
  String get usernameDisplayLabel => 'Username';
  String get profileUpdated => 'Profile updated';
  String get findUser => 'Find user';

  String get signIn => 'Sign in';
  String get createAccount => 'Create account';
  String get signInSubtitle => 'Sign in to add friends and share your sessions.';
  String get emailAddressHint => 'Email address';
  String get passwordHint => 'Password';
  String get forgotPassword => 'Forgot password?';
  String get continueWithGoogle => 'Continue with Google';
  String get alreadyHaveAccount => 'Already have an account? Sign in';
  String get noAccountYet => 'No account yet? Register';
  String get orDivider => 'or';
  String get resetPasswordTitle => 'Reset password';
  String get resetPasswordBody => 'Enter your email address and we\'ll send you a link to reset your password.';
  String get sendLink => 'Send link';
  String resetLinkSent(String email) => 'Reset link sent to $email';
  String get noAccountForEmail => 'No account found for this email address.';
  String get invalidEmailError => 'Invalid email address.';
  String get couldNotSendResetEmail => 'Could not send reset email. Please try again.';
  String get incorrectEmailOrPassword => 'Incorrect email or password.';
  String get emailAlreadyInUse => 'This email address is already in use.';
  String get weakPassword => 'Password must be at least 6 characters.';
  String get googleSignInFailed => 'Google sign-in failed. Please try again.';
  String get appleSignInFailed => 'Apple sign-in failed. Please try again.';
  String get emailDifferentMethod => 'An account already exists with this email using a different sign-in method.';
  String get enterEmailAndPassword => 'Please enter your email and password.';
  String get profileNotSetUp => 'Profile not set up yet';
  String get chooseUsernameSubtitle => 'Choose a username to add friends and share your sessions.';
  String get createProfile => 'Create profile';

  // ── Register screen ───────────────────────────────────────────────────────

  String get chooseUniqueUsername => 'Choose a unique username to add friends.';
  String get usernameFieldLabel => 'Username *';
  String get usernameFormatHint => '3–20 characters · only a-z, 0-9 and _';
  String get displayNameOptional => 'Display name (optional)';
  String get usernameRequired => 'Please enter a username.';
  String get usernameFormatError => '3–20 characters, only lowercase letters, numbers and _';
  String get usernameTaken => 'This username is already taken.';
  String get noConnectionError => 'No connection. Please try again.';
  String get usernameExampleHint => 'e.g. jens_mc';
  String get displayNameExampleHint => 'e.g. Jens';

  String get home => 'Home';
  String get info => 'Info';
  String get consoleConnect => 'Console Connect';
  String get consoleConnectSubtitle => 'Connect to Minecraft servers';
  String get minecraftSkins => 'Minecraft Skins';
  String get minecraftSkinsSubtitle => 'View & edit Java & Bedrock skins';
  String get minecraftWiki => 'Minecraft Wiki';
  String get minecraftWikiSubtitle => 'Mobs, blocks, recipes & more';
  String get partnerServersLabel => 'Partner Servers';
  String get partnerServersSubtitle => 'Featured Minecraft servers';
  String get userLookup => 'Minecraft User Lookup';
  String get userLookupSubtitle => 'Look up Java & Bedrock profiles';

  String get navSkins => 'Skins';
  String get navWiki => 'Wiki';
  String get navProfile => 'Profile';

  // ── Skins screen ────────────────────────────────────────────────────────────
  String get skinsUpload => 'Upload';
  String get skinsCreate => 'Create';
  String get skinsSubtitle => 'View and download Minecraft skins.';
  String get skinsSectionRecent => 'RECENT SKINS';
  String get skinsSectionMy => 'MY SKINS';
  String get skinsSectionYours => 'YOUR SKINS';
  String get skinsEmptyMySkins => 'No saved skins yet. Create or upload a skin to get started.';
  String get skinsCouldNotLoad => 'Could not load skins';
  String skinsPageOf(int page, int total) => 'Page $page / $total';
  String get skinsMustBe64 => 'Skin must be 64×64 pixels';
  String get skinsInvalidFile => 'Invalid image file';
  String get skinsDownload => 'Download';
  String get skinsEdit => 'Edit';
  String get skinsNoAccountsTitle => 'No accounts linked';
  String get skinsNoAccountsSubtitle => 'Link Java or Bedrock in Profile to see your skin.';
  String get skinsSignInTitle => 'Sign in to see your skin';
  String get skinsSignInSubtitle => 'Create an account and link Java or Bedrock in Profile.';

  // ── Player Lookup ──────────────────────────────────────────────────────────
  String get playerLookupTitle;
  String get playerLookupSubtitle;
  String get playerLookupHint;
  String get playerLookupLinked;
  String get playerLookupLabelUsername;
  String get playerLookupLabelTier;
  String playerLookupCopied(String label);

  // ── Wiki ───────────────────────────────────────────────────────────────────
  String get wikiTitle;
  String get wikiSearchHint;
  String get wikiMinecraftWiki;
  String wikiCategories(int count);
  String wikiNoResults(String query);
  String get wikiNoPagesFound;
  String get wikiCouldNotLoadPages;
  String get wikiCouldNotReach;
  String get wikiCouldNotLoadContent;
  String get wikiOpenInBrowser;
  String get wikiReadFullArticle;
  String get wikiCrafting;
  String get wikiMobs;
  String get wikiBlocks;
  String get wikiItems;
  String get wikiBiomes;
  String get wikiStructures;
  String get wikiEnchantments;
  String get wikiPotions;
  String get wikiPassive;
  String get wikiNeutral;
  String get wikiHostile;
  String get wikiBoss;
  String get wikiUtility;
  String get wikiNatural;
  String get wikiOres;
  String get wikiWood;
  String get wikiStone;
  String get wikiRedstone;
  String get wikiPlants;
  String get wikiDecoration;
  String get wikiTools;
  String get wikiSwords;
  String get wikiRanged;
  String get wikiArmor;
  String get wikiFood;
  String get wikiBrewing;
  String get wikiMaterials;
  String get wikiOverworld;
  String get wikiNether;
  String get wikiTheEnd;
  String get wikiSword;
  String get wikiTool;
  String get wikiBow;
  String get wikiFishing;
  String get wikiStatusEffects;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'bn', 'de', 'en', 'es', 'fr', 'hi', 'id', 'ja', 'nl', 'pt', 'ru', 'sw', 'tr', 'ur', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'bn': return AppLocalizationsBn();
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'hi': return AppLocalizationsHi();
    case 'id': return AppLocalizationsId();
    case 'ja': return AppLocalizationsJa();
    case 'nl': return AppLocalizationsNl();
    case 'pt': return AppLocalizationsPt();
    case 'ru': return AppLocalizationsRu();
    case 'sw': return AppLocalizationsSw();
    case 'tr': return AppLocalizationsTr();
    case 'ur': return AppLocalizationsUr();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
