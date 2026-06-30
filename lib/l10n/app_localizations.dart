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

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// No description provided for @onboardingThemeTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a theme'**
  String get onboardingThemeTitle;

  /// No description provided for @onboardingThemeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You can fine-tune every color in the settings later.'**
  String get onboardingThemeSubtitle;

  /// No description provided for @onboardingNavTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick access'**
  String get onboardingNavTitle;

  /// No description provided for @onboardingNavSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pick two features for your bottom bar shortcuts.'**
  String get onboardingNavSubtitle;

  /// No description provided for @onboardingNavLeftLabel.
  ///
  /// In en, this message translates to:
  /// **'LEFT SHORTCUT'**
  String get onboardingNavLeftLabel;

  /// No description provided for @onboardingNavRightLabel.
  ///
  /// In en, this message translates to:
  /// **'RIGHT SHORTCUT'**
  String get onboardingNavRightLabel;

  /// No description provided for @onboardingNavPreviewHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get onboardingNavPreviewHome;

  /// No description provided for @onboardingNavPreviewConnector.
  ///
  /// In en, this message translates to:
  /// **'Connector'**
  String get onboardingNavPreviewConnector;

  /// No description provided for @onboardingNavPreviewProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get onboardingNavPreviewProfile;

  /// No description provided for @onboardingNavPreviewEmpty.
  ///
  /// In en, this message translates to:
  /// **'Empty'**
  String get onboardingNavPreviewEmpty;

  /// No description provided for @onboardingStartTitle.
  ///
  /// In en, this message translates to:
  /// **'Start page'**
  String get onboardingStartTitle;

  /// No description provided for @onboardingStartSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The app opens here every time you launch.'**
  String get onboardingStartSubtitle;

  /// No description provided for @onboardingCustomizeDetail.
  ///
  /// In en, this message translates to:
  /// **'Customize in detail →'**
  String get onboardingCustomizeDetail;

  /// No description provided for @startPageHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get startPageHome;

  /// No description provided for @startPageHomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Show the home screen with tiles'**
  String get startPageHomeSubtitle;

  /// No description provided for @startPageFeature.
  ///
  /// In en, this message translates to:
  /// **'Feature'**
  String get startPageFeature;

  /// No description provided for @startPageFeatureSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Open directly on a specific page'**
  String get startPageFeatureSubtitle;

  /// No description provided for @startPageSectionLabel.
  ///
  /// In en, this message translates to:
  /// **'START PAGE'**
  String get startPageSectionLabel;

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
  /// **'MCCompanion SERVER'**
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
  String get helpMCCompanionTitle;

  /// Short subtitle for MCCompanion does not appear tile
  ///
  /// In en, this message translates to:
  /// **'Troubleshooting LAN discovery issues'**
  String get helpMCCompanionSubtitle;

  /// Detailed troubleshooting text for MCCompanion not appearing
  ///
  /// In en, this message translates to:
  /// **'If the server isn\'t appearing on your console, try these steps:\n\n✅ Basic Checks:\n1. Same WiFi Network - Your phone/tablet and console MUST be on the same WiFi\n2. Correct Server Address - Double-check the IP and port (default: 19132)\n3. Broadcasting Active - Verify MCCompanion shows \"Broadcasting\" status\n\n🔄 Quick Fixes:\n• Restart the app: Stop broadcasting, close MCCompanion completely, reopen and try again\n• Restart your console: Sometimes the console needs a refresh to detect LAN games\n• Check Friends/LAN tab: The server appears under \"Friends\" or \"LAN Games\", NOT in server list\n• Wait 10-15 seconds after starting broadcasting\n• Disable VPNs: VPNs can block local broadcasts\n\n⚠️ Common Issues:\n\"No route found for user\" → Ensure both devices are on the same Wi‑Fi (avoid Guest networks)\n\"Unable to connect to MCCompanion relay server\" → Check your internet / relay status\n\n📱 Still having issues? Enable Debug Mode in MCCompanion and check logs, or try a different server.'**
  String get helpMCCompanionBody;

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

  /// Label for the language button in the bottom nav
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get changeLanguage;

  /// Button that resets localization to the system/default locale
  ///
  /// In en, this message translates to:
  /// **'Use system language'**
  String get useSystemLanguage;

  /// Snackbar message when launching an external URL fails
  ///
  /// In en, this message translates to:
  /// **'Could not open URL'**
  String get couldNotOpenUrl;

  /// Title for the server tracker screen
  ///
  /// In en, this message translates to:
  /// **'Server Tracker'**
  String get serverTrackerTitle;

  /// Dialog title for removing a tracked server
  ///
  /// In en, this message translates to:
  /// **'Remove server'**
  String get removeServerTitle;

  /// Confirmation message for removing a server
  ///
  /// In en, this message translates to:
  /// **'Remove \"{name}\" from your tracker?'**
  String removeServerConfirm(Object name);

  /// Error message when removing server fails
  ///
  /// In en, this message translates to:
  /// **'Failed to remove server'**
  String get removeServerFailed;

  /// Tooltip for the refresh button in server tracker
  ///
  /// In en, this message translates to:
  /// **'Refresh status'**
  String get refreshStatus;

  /// Title when user is not signed in on tracker screen
  ///
  /// In en, this message translates to:
  /// **'Sign in required'**
  String get trackerSignInRequired;

  /// Subtitle when user is not signed in on tracker screen
  ///
  /// In en, this message translates to:
  /// **'Sign in to track servers and receive offline notifications.'**
  String get trackerSignInSubtitle;

  /// Sign in button label
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// Title shown when no servers are being tracked
  ///
  /// In en, this message translates to:
  /// **'No servers tracked'**
  String get noServersTracked;

  /// Subtitle shown when no servers are tracked
  ///
  /// In en, this message translates to:
  /// **'Add a Minecraft server to monitor its status and receive notifications.'**
  String get trackerEmptySubtitle;

  /// Validation error when form fields are incomplete
  ///
  /// In en, this message translates to:
  /// **'Please fill in all fields correctly'**
  String get fillAllFields;

  /// Message when user has used their free tracker slot
  ///
  /// In en, this message translates to:
  /// **'Your free slot is used. Upgrade for more servers.'**
  String get slotUsedUpgrade;

  /// Error when adding a tracked server fails
  ///
  /// In en, this message translates to:
  /// **'Failed to add server. Check your details.'**
  String get addServerFailed;

  /// Label for IP address field in add server form
  ///
  /// In en, this message translates to:
  /// **'IP address'**
  String get ipAddressLabel;

  /// Label for platform selector in add server form
  ///
  /// In en, this message translates to:
  /// **'Platform'**
  String get platformLabel;

  /// Bedrock platform option label
  ///
  /// In en, this message translates to:
  /// **'Bedrock'**
  String get bedrockLabel;

  /// Add button label in add server form
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get addLabel;

  /// Server online status label
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get statusOnline;

  /// Server offline status label
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get statusOffline;

  /// Server status while being checked
  ///
  /// In en, this message translates to:
  /// **'Checking...'**
  String get statusChecking;

  /// Tooltip when server notifications are enabled
  ///
  /// In en, this message translates to:
  /// **'Notifications on'**
  String get notificationsOn;

  /// Tooltip when server notifications are disabled
  ///
  /// In en, this message translates to:
  /// **'Notifications off'**
  String get notificationsOff;

  /// Error when toggling server notifications fails
  ///
  /// In en, this message translates to:
  /// **'Failed to update notifications'**
  String get failedUpdateNotifications;

  /// Title for the edit server bottom sheet
  ///
  /// In en, this message translates to:
  /// **'Edit server'**
  String get editServerTitle;

  /// Hint text for server name field in edit form
  ///
  /// In en, this message translates to:
  /// **'Server name'**
  String get serverNameHint;

  /// Error message when saving server edits fails
  ///
  /// In en, this message translates to:
  /// **'Failed to save. Try again.'**
  String get failedSave;

  /// Success message when server is renamed
  ///
  /// In en, this message translates to:
  /// **'Server renamed'**
  String get serverRenamed;

  /// Customize button in the nav bar
  ///
  /// In en, this message translates to:
  /// **'Customize'**
  String get customizeLabel;

  /// Subtitle in the customize bottom sheet
  ///
  /// In en, this message translates to:
  /// **'Reorder tiles and customize navigation'**
  String get customizeSubtitle;

  /// Reset button in customize sheet
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetLabel;

  /// Section header for tiles in customize sheet
  ///
  /// In en, this message translates to:
  /// **'TILES'**
  String get tilesSection;

  /// Hint text below tiles section in customize sheet
  ///
  /// In en, this message translates to:
  /// **'Drag to reorder'**
  String get dragToReorder;

  /// Section header for navigation in customize sheet
  ///
  /// In en, this message translates to:
  /// **'NAVIGATION'**
  String get navigationSection;

  /// Note about fixed navigation items
  ///
  /// In en, this message translates to:
  /// **'Home, Connector and Profile are always fixed'**
  String get navFixed;

  /// Label for left navigation slot selector
  ///
  /// In en, this message translates to:
  /// **'Left slot (next to Home)'**
  String get leftSlot;

  /// Label for right navigation slot selector
  ///
  /// In en, this message translates to:
  /// **'Right slot (next to Profile)'**
  String get rightSlot;

  /// Tooltip on wide-tile icon when tile is already wide — tap to remove
  ///
  /// In en, this message translates to:
  /// **'Remove wide layout'**
  String get tileWideTooltipRemove;

  /// Tooltip on wide-tile icon — tap to make this tile full-width
  ///
  /// In en, this message translates to:
  /// **'Make wide tile'**
  String get tileWideTooltipAdd;

  /// Tooltip on eye icon when tile is hidden — tap to show
  ///
  /// In en, this message translates to:
  /// **'Show tile'**
  String get tileVisibilityShow;

  /// Tooltip on eye icon when tile is visible — tap to hide
  ///
  /// In en, this message translates to:
  /// **'Hide tile'**
  String get tileVisibilityHide;

  /// Tooltip shown when hide is disabled because minimum visible tile count is reached
  ///
  /// In en, this message translates to:
  /// **'Cannot hide (last tile)'**
  String get tileVisibilityMin;

  /// Apply button in the custom colour picker dialog
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get colorPickerApply;

  /// Label for the hex colour input field in the colour picker
  ///
  /// In en, this message translates to:
  /// **'Hex'**
  String get colorPickerHex;

  /// Section header for the text colour customization area
  ///
  /// In en, this message translates to:
  /// **'TEXT COLOR'**
  String get textColorSection;

  /// Title of the text colour picker dialog
  ///
  /// In en, this message translates to:
  /// **'Text Color'**
  String get textColorPickerTitle;

  /// Hint shown below the text colour circle picker
  ///
  /// In en, this message translates to:
  /// **'Tap the circle to pick a custom text colour'**
  String get textColorHint;

  /// Preview label showing primary text colour
  ///
  /// In en, this message translates to:
  /// **'Primary'**
  String get textColorPreviewPrimary;

  /// Preview label showing secondary text colour
  ///
  /// In en, this message translates to:
  /// **'Secondary'**
  String get textColorPreviewSecondary;

  /// Preview label showing muted text colour
  ///
  /// In en, this message translates to:
  /// **'Muted'**
  String get textColorPreviewMuted;

  /// Label on the custom colour swatch in the colour picker section
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get colorSwatchCustom;

  /// Section header for accent color in customize sheet
  ///
  /// In en, this message translates to:
  /// **'ACCENT COLOR'**
  String get accentColorSection;

  /// Label for opacity slider
  ///
  /// In en, this message translates to:
  /// **'Opacity'**
  String get opacityLabel;

  /// Section header for background color in customize sheet
  ///
  /// In en, this message translates to:
  /// **'BACKGROUND'**
  String get backgroundSection;

  /// Section header for card color in customize sheet
  ///
  /// In en, this message translates to:
  /// **'CARDS'**
  String get cardsSection;

  /// Edit button/tooltip label
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get editLabel;

  /// Java Edition label in player lookup
  ///
  /// In en, this message translates to:
  /// **'Java Edition'**
  String get playerLookupJavaEdition;

  /// Bedrock Edition label in player lookup
  ///
  /// In en, this message translates to:
  /// **'Bedrock Edition'**
  String get playerLookupBedrockEdition;

  /// UUID field label
  ///
  /// In en, this message translates to:
  /// **'UUID'**
  String get playerLookupLabelUuid;

  /// Gamertag field label
  ///
  /// In en, this message translates to:
  /// **'Gamertag'**
  String get playerLookupLabelGamertag;

  /// XUID field label
  ///
  /// In en, this message translates to:
  /// **'XUID'**
  String get playerLookupLabelXuid;

  /// Floodgate field label
  ///
  /// In en, this message translates to:
  /// **'Floodgate'**
  String get playerLookupLabelFloodgate;

  /// Xbox account subtitle with xuid
  ///
  /// In en, this message translates to:
  /// **'Xbox · {xuid}'**
  String accountSubtitleXbox(Object xuid);

  /// Java account subtitle with uuid
  ///
  /// In en, this message translates to:
  /// **'Java Edition · {uuid}'**
  String accountSubtitleJava(Object uuid);

  /// Hint text for avatar URL field
  ///
  /// In en, this message translates to:
  /// **'https://example.com/avatar.png'**
  String get avatarUrlHint;

  /// Tooltip/button to report a user
  ///
  /// In en, this message translates to:
  /// **'Report user'**
  String get reportUser;

  /// Title when reporting a specific message
  ///
  /// In en, this message translates to:
  /// **'Report message'**
  String get reportMessage;

  /// Title when reporting a user by name
  ///
  /// In en, this message translates to:
  /// **'Report {name}'**
  String reportUserWithName(Object name);

  /// Disclaimer text shown in the report sheet
  ///
  /// In en, this message translates to:
  /// **'Reports are reviewed by our team. False reports may result in action against your account.'**
  String get reportDisclaimer;

  /// Report reason: spam
  ///
  /// In en, this message translates to:
  /// **'Spam'**
  String get reportReasonSpam;

  /// Report reason: harassment
  ///
  /// In en, this message translates to:
  /// **'Harassment'**
  String get reportReasonHarassment;

  /// Report reason: inappropriate content
  ///
  /// In en, this message translates to:
  /// **'Inappropriate content'**
  String get reportReasonInappropriate;

  /// Report reason: other
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get reportReasonOther;

  /// Hint text for additional details field in report sheet
  ///
  /// In en, this message translates to:
  /// **'Additional details (optional)…'**
  String get reportAdditionalDetails;

  /// Toast shown after a successful report submission
  ///
  /// In en, this message translates to:
  /// **'Report submitted. Thank you.'**
  String get reportSuccess;

  /// Toast shown when report submission fails
  ///
  /// In en, this message translates to:
  /// **'Failed to submit report. Please try again.'**
  String get reportFailed;

  /// Button label to submit a report
  ///
  /// In en, this message translates to:
  /// **'Submit report'**
  String get reportSubmit;

  /// Date divider label for today
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// Date divider label for yesterday
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// Hint text in the chat message input
  ///
  /// In en, this message translates to:
  /// **'Message…'**
  String get messagePlaceholder;

  /// Empty state in chat screen
  ///
  /// In en, this message translates to:
  /// **'No messages yet.\nSay hello!'**
  String get noMessagesYet;

  /// Empty state title on conversations screen
  ///
  /// In en, this message translates to:
  /// **'No conversations yet'**
  String get noConversationsYet;

  /// Empty state subtitle on conversations screen
  ///
  /// In en, this message translates to:
  /// **'Find a friend and start chatting!'**
  String get startChatHint;

  /// Prefix for last message preview when message is from current user
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get youPrefix;

  /// Title of the player lookup screen
  ///
  /// In en, this message translates to:
  /// **'Player Lookup'**
  String get playerLookupTitle;

  /// Subtitle/hint on player lookup screen
  ///
  /// In en, this message translates to:
  /// **'Search for a Java or Bedrock player by username'**
  String get playerLookupSubtitle;

  /// Hint text for player lookup search field
  ///
  /// In en, this message translates to:
  /// **'Enter a username…'**
  String get playerLookupHint;

  /// Badge shown when linked accounts are found
  ///
  /// In en, this message translates to:
  /// **'Linked accounts found'**
  String get playerLookupLinked;

  /// Label for username field in player lookup
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get playerLookupLabelUsername;

  /// Label for tier field in player lookup
  ///
  /// In en, this message translates to:
  /// **'Tier'**
  String get playerLookupLabelTier;

  /// Toast shown after copying a value in player lookup
  ///
  /// In en, this message translates to:
  /// **'{value} copied'**
  String playerLookupCopied(Object value);

  /// Tab label for Profile tab
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get tabProfile;

  /// Tab label for Friends tab
  ///
  /// In en, this message translates to:
  /// **'Friends'**
  String get tabFriends;

  /// Tab label for Requests tab
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get tabRequests;

  /// Tab label for Chats tab
  ///
  /// In en, this message translates to:
  /// **'Chats'**
  String get tabChats;

  /// Title/button for adding a friend
  ///
  /// In en, this message translates to:
  /// **'Add Friend'**
  String get addFriend;

  /// Hint text for username input
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get usernameHint;

  /// Send button label
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// Toast when a friend request is sent
  ///
  /// In en, this message translates to:
  /// **'Friend request sent to {name}'**
  String friendRequestSentTo(Object name);

  /// Error when already friends with user
  ///
  /// In en, this message translates to:
  /// **'You are already friends with {name}'**
  String alreadyFriendsWith(Object name);

  /// Error when friend request is already pending
  ///
  /// In en, this message translates to:
  /// **'A request to {name} is already pending'**
  String requestAlreadyPending(Object name);

  /// Error when user is not found
  ///
  /// In en, this message translates to:
  /// **'User {name} not found'**
  String userNotFoundMsg(Object name);

  /// Error when user is blocked or request is not allowed
  ///
  /// In en, this message translates to:
  /// **'Cannot send a request to {name}'**
  String cannotSendRequest(Object name);

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get somethingWentWrong;

  /// Toast when a friend request is accepted
  ///
  /// In en, this message translates to:
  /// **'You are now friends with {name}'**
  String friendRequestAccepted(Object name);

  /// Toast when a friend request is declined
  ///
  /// In en, this message translates to:
  /// **'Request from {name} declined'**
  String requestDeclined(Object name);

  /// Title for delete account dialog/button
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccountTitle;

  /// Body text for delete account confirmation dialog
  ///
  /// In en, this message translates to:
  /// **'This will permanently delete your account and all data. This action cannot be undone.'**
  String get deleteAccountBody;

  /// Confirm button for permanent deletion
  ///
  /// In en, this message translates to:
  /// **'Delete Permanently'**
  String get deletePermanently;

  /// Error when account deletion fails
  ///
  /// In en, this message translates to:
  /// **'Could not delete account. Please try again.'**
  String get couldNotDeleteAccount;

  /// Dialog title for removing a friend
  ///
  /// In en, this message translates to:
  /// **'Remove Friend'**
  String get removeFriendTitle;

  /// Confirmation text for removing a friend
  ///
  /// In en, this message translates to:
  /// **'Remove {name} from your friends?'**
  String removeFriendConfirm(Object name);

  /// Remove button label
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// Toast shown after removing a friend
  ///
  /// In en, this message translates to:
  /// **'{name} has been removed from your friends'**
  String friendRemoved(Object name);

  /// Error when email already uses a different auth method
  ///
  /// In en, this message translates to:
  /// **'This email is linked to a different sign-in method'**
  String get emailDifferentMethod;

  /// Error when Google sign-in fails
  ///
  /// In en, this message translates to:
  /// **'Google sign-in failed. Please try again.'**
  String get googleSignInFailed;

  /// Error when Apple sign-in fails
  ///
  /// In en, this message translates to:
  /// **'Apple sign-in failed. Please try again.'**
  String get appleSignInFailed;

  /// Title for reset password dialog
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPasswordTitle;

  /// Body text for reset password dialog
  ///
  /// In en, this message translates to:
  /// **'Enter your email address and we will send you a link to reset your password.'**
  String get resetPasswordBody;

  /// Hint text for email address field
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get emailAddressHint;

  /// Button to send the password reset link
  ///
  /// In en, this message translates to:
  /// **'Send link'**
  String get sendLink;

  /// Toast after reset email is sent
  ///
  /// In en, this message translates to:
  /// **'Password reset link sent to {email}'**
  String resetLinkSent(Object email);

  /// Error when no account exists for the email
  ///
  /// In en, this message translates to:
  /// **'No account found for that email address'**
  String get noAccountForEmail;

  /// Error for invalid email format
  ///
  /// In en, this message translates to:
  /// **'The email address is not valid'**
  String get invalidEmailError;

  /// Generic error when sending reset email fails
  ///
  /// In en, this message translates to:
  /// **'Could not send reset email. Please try again.'**
  String get couldNotSendResetEmail;

  /// Validation when email or password is empty on sign-in
  ///
  /// In en, this message translates to:
  /// **'Please enter your email and password'**
  String get enterEmailAndPassword;

  /// Error for wrong credentials
  ///
  /// In en, this message translates to:
  /// **'Incorrect email or password'**
  String get incorrectEmailOrPassword;

  /// Error when email is already registered
  ///
  /// In en, this message translates to:
  /// **'This email address is already in use'**
  String get emailAlreadyInUse;

  /// Error for weak password
  ///
  /// In en, this message translates to:
  /// **'Password is too weak. Please choose a stronger one.'**
  String get weakPassword;

  /// Button/title for creating a new account
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// Subtitle on the sign-in screen
  ///
  /// In en, this message translates to:
  /// **'Sign in to access your profile, friends, and chats.'**
  String get signInSubtitle;

  /// Hint text for password field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordHint;

  /// Link to trigger password reset flow
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// Divider text between email and social sign-in
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get orDivider;

  /// Button label for Google sign-in
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// Toggle to switch back to sign-in mode
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Sign in'**
  String get alreadyHaveAccount;

  /// Toggle to switch to register mode
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Create one'**
  String get noAccountYet;

  /// Title when user is authenticated but has no profile
  ///
  /// In en, this message translates to:
  /// **'Profile not set up'**
  String get profileNotSetUp;

  /// Subtitle shown when profile is not yet set up
  ///
  /// In en, this message translates to:
  /// **'Choose a username to start connecting with other players.'**
  String get chooseUsernameSubtitle;

  /// Button to navigate to profile creation/registration
  ///
  /// In en, this message translates to:
  /// **'Create Profile'**
  String get createProfile;

  /// Tooltip for the search/find user button
  ///
  /// In en, this message translates to:
  /// **'Find user'**
  String get findUser;

  /// Error when toggling appear-offline fails
  ///
  /// In en, this message translates to:
  /// **'Could not update visibility settings'**
  String get couldNotUpdateVisibility;

  /// Sign out button label
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// Label for the appear-offline toggle
  ///
  /// In en, this message translates to:
  /// **'Appear Offline'**
  String get appearOfflineLabel;

  /// Subtitle when appear-offline is enabled
  ///
  /// In en, this message translates to:
  /// **'You appear offline to other players'**
  String get appearOfflineOn;

  /// Subtitle when appear-offline is disabled
  ///
  /// In en, this message translates to:
  /// **'You appear online to other players'**
  String get appearOfflineOff;

  /// Dialog title for unlinking an Xbox account
  ///
  /// In en, this message translates to:
  /// **'Unlink Xbox Account'**
  String get unlinkXboxTitle;

  /// Confirmation text for unlinking a Bedrock/Xbox account
  ///
  /// In en, this message translates to:
  /// **'Remove {name} from your linked accounts?'**
  String removeLabelConfirm(Object name);

  /// Unlink button label
  ///
  /// In en, this message translates to:
  /// **'Unlink'**
  String get unlink;

  /// Dialog title for unlinking a Java account
  ///
  /// In en, this message translates to:
  /// **'Unlink Java Account'**
  String get unlinkJavaTitle;

  /// Confirmation text for unlinking a Java account
  ///
  /// In en, this message translates to:
  /// **'Remove {name} from your linked accounts?'**
  String removeJavaConfirm(Object name);

  /// Section title for linked accounts card
  ///
  /// In en, this message translates to:
  /// **'Linked Accounts'**
  String get linkedAccountsTitle;

  /// Hint when no accounts are linked
  ///
  /// In en, this message translates to:
  /// **'Link your Minecraft accounts to show your skins and stats.'**
  String get linkAccountsHint;

  /// Button to link an Xbox/Bedrock account
  ///
  /// In en, this message translates to:
  /// **'Link Xbox'**
  String get linkXbox;

  /// Button to link a Java account
  ///
  /// In en, this message translates to:
  /// **'Link Java'**
  String get linkJava;

  /// Toast shown after profile is saved
  ///
  /// In en, this message translates to:
  /// **'Profile updated'**
  String get profileUpdated;

  /// Title for the edit profile card
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileCardTitle;

  /// Edit button label
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Label for display name field
  ///
  /// In en, this message translates to:
  /// **'Display Name'**
  String get displayNameLabel;

  /// Hint text for display name field
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get yourNameHint;

  /// Label for bio field
  ///
  /// In en, this message translates to:
  /// **'Bio'**
  String get bioLabel;

  /// Hint text for bio field
  ///
  /// In en, this message translates to:
  /// **'Tell others about yourself…'**
  String get bioHint;

  /// Label for avatar URL field
  ///
  /// In en, this message translates to:
  /// **'Avatar URL'**
  String get avatarUrlLabel;

  /// Label for username row in profile display
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get usernameDisplayLabel;

  /// Label for bio/about-me row in profile display
  ///
  /// In en, this message translates to:
  /// **'About me'**
  String get aboutMe;

  /// Empty state title on friends tab
  ///
  /// In en, this message translates to:
  /// **'No friends yet'**
  String get noFriendsYet;

  /// Empty state subtitle on friends tab
  ///
  /// In en, this message translates to:
  /// **'Add friends to see them here.'**
  String get noFriendsSub;

  /// Section label for online friends
  ///
  /// In en, this message translates to:
  /// **'{count} online'**
  String onlineFriendsLabel(Object count);

  /// Section label for offline friends
  ///
  /// In en, this message translates to:
  /// **'{count} offline'**
  String offlineFriendsLabel(Object count);

  /// Empty state title on requests tab
  ///
  /// In en, this message translates to:
  /// **'No pending requests'**
  String get noPendingRequests;

  /// Empty state subtitle on requests tab
  ///
  /// In en, this message translates to:
  /// **'New friend requests will appear here.'**
  String get requestsAppearHere;

  /// Edit button in skin detail sheet
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get skinsEdit;

  /// Title when no Minecraft accounts are linked
  ///
  /// In en, this message translates to:
  /// **'No Minecraft accounts linked'**
  String get skinsNoAccountsTitle;

  /// Subtitle when no Minecraft accounts are linked
  ///
  /// In en, this message translates to:
  /// **'Link a Java or Bedrock account to view your skins.'**
  String get skinsNoAccountsSubtitle;

  /// Title when user is not signed in on skins screen
  ///
  /// In en, this message translates to:
  /// **'Sign in to view your skins'**
  String get skinsSignInTitle;

  /// Subtitle when user is not signed in on skins screen
  ///
  /// In en, this message translates to:
  /// **'Sign in and link your Minecraft accounts to see your skins here.'**
  String get skinsSignInSubtitle;

  /// Error when uploaded skin is wrong size
  ///
  /// In en, this message translates to:
  /// **'Skin must be 64×64 pixels'**
  String get skinsMustBe64;

  /// Error when the selected file is not a valid image
  ///
  /// In en, this message translates to:
  /// **'Invalid image file'**
  String get skinsInvalidFile;

  /// Button to upload a skin
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get skinsUpload;

  /// Button to create/open skin editor
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get skinsCreate;

  /// Section label for recent Geyser skins
  ///
  /// In en, this message translates to:
  /// **'RECENT SKINS'**
  String get skinsSectionRecent;

  /// Section label for saved/local skins
  ///
  /// In en, this message translates to:
  /// **'MY SKINS'**
  String get skinsSectionMy;

  /// Empty state text for saved skins section
  ///
  /// In en, this message translates to:
  /// **'No saved skins yet. Upload or create one!'**
  String get skinsEmptyMySkins;

  /// Section label for the user's linked account skins
  ///
  /// In en, this message translates to:
  /// **'YOUR SKINS'**
  String get skinsSectionYours;

  /// Error text when recent skins cannot be loaded
  ///
  /// In en, this message translates to:
  /// **'Could not load skins'**
  String get skinsCouldNotLoad;

  /// Pagination label on skins screen
  ///
  /// In en, this message translates to:
  /// **'Page {page} of {total}'**
  String skinsPageOf(Object page, Object total);

  /// Download button in skin detail sheet
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get skinsDownload;

  /// Title of the wiki screen
  ///
  /// In en, this message translates to:
  /// **'Wiki'**
  String get wikiTitle;

  /// Badge/label linking to Minecraft Wiki
  ///
  /// In en, this message translates to:
  /// **'Minecraft Wiki'**
  String get wikiMinecraftWiki;

  /// Hint text for wiki search field
  ///
  /// In en, this message translates to:
  /// **'Search the wiki…'**
  String get wikiSearchHint;

  /// Error when wiki pages fail to load
  ///
  /// In en, this message translates to:
  /// **'Could not load pages. Please try again.'**
  String get wikiCouldNotLoadPages;

  /// Error when the wiki cannot be reached
  ///
  /// In en, this message translates to:
  /// **'Could not reach the wiki. Check your connection.'**
  String get wikiCouldNotReach;

  /// Empty search results message
  ///
  /// In en, this message translates to:
  /// **'No results found for \"{query}\"'**
  String wikiNoResults(Object query);

  /// Empty state when no wiki pages are available
  ///
  /// In en, this message translates to:
  /// **'No pages found'**
  String get wikiNoPagesFound;

  /// Subtitle on wiki section card showing number of subcategories
  ///
  /// In en, this message translates to:
  /// **'{count} categories'**
  String wikiCategories(Object count);

  /// Error when wiki article content fails to load
  ///
  /// In en, this message translates to:
  /// **'Could not load article content.'**
  String get wikiCouldNotLoadContent;

  /// Button to open wiki article in external browser
  ///
  /// In en, this message translates to:
  /// **'Open in browser'**
  String get wikiOpenInBrowser;

  /// Section header for crafting recipes in wiki detail
  ///
  /// In en, this message translates to:
  /// **'Crafting'**
  String get wikiCrafting;

  /// Button at bottom of wiki detail to open full article
  ///
  /// In en, this message translates to:
  /// **'Read full article'**
  String get wikiReadFullArticle;

  /// Wiki category: Mobs
  ///
  /// In en, this message translates to:
  /// **'Mobs'**
  String get wikiMobs;

  /// Wiki category: Blocks
  ///
  /// In en, this message translates to:
  /// **'Blocks'**
  String get wikiBlocks;

  /// Wiki category: Items
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get wikiItems;

  /// Wiki category: Biomes
  ///
  /// In en, this message translates to:
  /// **'Biomes'**
  String get wikiBiomes;

  /// Wiki category: Structures
  ///
  /// In en, this message translates to:
  /// **'Structures'**
  String get wikiStructures;

  /// Wiki category: Enchantments
  ///
  /// In en, this message translates to:
  /// **'Enchantments'**
  String get wikiEnchantments;

  /// Wiki category: Potions
  ///
  /// In en, this message translates to:
  /// **'Potions'**
  String get wikiPotions;

  /// Wiki mob sub-category: Passive
  ///
  /// In en, this message translates to:
  /// **'Passive'**
  String get wikiPassive;

  /// Wiki mob sub-category: Neutral
  ///
  /// In en, this message translates to:
  /// **'Neutral'**
  String get wikiNeutral;

  /// Wiki mob sub-category: Hostile
  ///
  /// In en, this message translates to:
  /// **'Hostile'**
  String get wikiHostile;

  /// Wiki mob sub-category: Boss
  ///
  /// In en, this message translates to:
  /// **'Boss'**
  String get wikiBoss;

  /// Wiki mob sub-category: Utility
  ///
  /// In en, this message translates to:
  /// **'Utility'**
  String get wikiUtility;

  /// Wiki block sub-category: Natural
  ///
  /// In en, this message translates to:
  /// **'Natural'**
  String get wikiNatural;

  /// Wiki block sub-category: Ores
  ///
  /// In en, this message translates to:
  /// **'Ores'**
  String get wikiOres;

  /// Wiki block sub-category: Wood
  ///
  /// In en, this message translates to:
  /// **'Wood'**
  String get wikiWood;

  /// Wiki block sub-category: Stone
  ///
  /// In en, this message translates to:
  /// **'Stone'**
  String get wikiStone;

  /// Wiki block sub-category: Redstone
  ///
  /// In en, this message translates to:
  /// **'Redstone'**
  String get wikiRedstone;

  /// Wiki block sub-category: Plants
  ///
  /// In en, this message translates to:
  /// **'Plants'**
  String get wikiPlants;

  /// Wiki block sub-category: Decoration
  ///
  /// In en, this message translates to:
  /// **'Decoration'**
  String get wikiDecoration;

  /// Wiki item sub-category: Tools
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get wikiTools;

  /// Wiki item sub-category: Swords
  ///
  /// In en, this message translates to:
  /// **'Swords'**
  String get wikiSwords;

  /// Wiki item sub-category: Ranged
  ///
  /// In en, this message translates to:
  /// **'Ranged'**
  String get wikiRanged;

  /// Wiki item sub-category: Armor
  ///
  /// In en, this message translates to:
  /// **'Armor'**
  String get wikiArmor;

  /// Wiki item sub-category: Food
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get wikiFood;

  /// Wiki item sub-category: Brewing
  ///
  /// In en, this message translates to:
  /// **'Brewing'**
  String get wikiBrewing;

  /// Wiki item sub-category: Materials
  ///
  /// In en, this message translates to:
  /// **'Materials'**
  String get wikiMaterials;

  /// Wiki biome/structure sub-category: Overworld
  ///
  /// In en, this message translates to:
  /// **'Overworld'**
  String get wikiOverworld;

  /// Wiki biome/structure sub-category: Nether
  ///
  /// In en, this message translates to:
  /// **'Nether'**
  String get wikiNether;

  /// Wiki biome/structure sub-category: The End
  ///
  /// In en, this message translates to:
  /// **'The End'**
  String get wikiTheEnd;

  /// Wiki enchantment sub-category: Sword
  ///
  /// In en, this message translates to:
  /// **'Sword'**
  String get wikiSword;

  /// Wiki enchantment sub-category: Tool
  ///
  /// In en, this message translates to:
  /// **'Tool'**
  String get wikiTool;

  /// Wiki enchantment sub-category: Bow
  ///
  /// In en, this message translates to:
  /// **'Bow'**
  String get wikiBow;

  /// Wiki enchantment sub-category: Fishing
  ///
  /// In en, this message translates to:
  /// **'Fishing'**
  String get wikiFishing;

  /// Wiki potion sub-category: Status Effects
  ///
  /// In en, this message translates to:
  /// **'Status Effects'**
  String get wikiStatusEffects;

  /// chooseUniqueUsername
  ///
  /// In en, this message translates to:
  /// **'Choose a unique username to get started.'**
  String get chooseUniqueUsername;

  /// usernameFieldLabel
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get usernameFieldLabel;

  /// usernameExampleHint
  ///
  /// In en, this message translates to:
  /// **'e.g. CoolPlayer123'**
  String get usernameExampleHint;

  /// usernameFormatHint
  ///
  /// In en, this message translates to:
  /// **'3–20 characters · letters, numbers and underscores only'**
  String get usernameFormatHint;

  /// displayNameOptional
  ///
  /// In en, this message translates to:
  /// **'Display Name (optional)'**
  String get displayNameOptional;

  /// displayNameExampleHint
  ///
  /// In en, this message translates to:
  /// **'e.g. Cool Player'**
  String get displayNameExampleHint;

  /// usernameRequired
  ///
  /// In en, this message translates to:
  /// **'Username is required'**
  String get usernameRequired;

  /// usernameFormatError
  ///
  /// In en, this message translates to:
  /// **'Username must be 3–20 characters and contain only letters, numbers and underscores'**
  String get usernameFormatError;

  /// usernameTaken
  ///
  /// In en, this message translates to:
  /// **'This username is already taken'**
  String get usernameTaken;

  /// noConnectionError
  ///
  /// In en, this message translates to:
  /// **'No connection. Check your internet and try again.'**
  String get noConnectionError;

  /// home
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// info
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// Profile label in bottom navigation
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// Toast when server is removed
  ///
  /// In en, this message translates to:
  /// **'{name} removed'**
  String serverRemoved(Object name);

  /// Toast when server is added
  ///
  /// In en, this message translates to:
  /// **'{name} added'**
  String serverAdded(Object name);

  /// No description provided for @paywallRestore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get paywallRestore;

  /// No description provided for @paywallMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get paywallMonthly;

  /// No description provided for @paywallYearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get paywallYearly;

  /// No description provided for @paywallSavePercent.
  ///
  /// In en, this message translates to:
  /// **'Save ~17%'**
  String get paywallSavePercent;

  /// No description provided for @paywallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track more servers and get notified\nwhen they go online or offline.'**
  String get paywallSubtitle;

  /// No description provided for @paywallSlotLabel.
  ///
  /// In en, this message translates to:
  /// **'{slots} server slots'**
  String paywallSlotLabel(Object slots);

  /// No description provided for @paywallPopular.
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get paywallPopular;

  /// No description provided for @paywallContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get paywallContinue;

  /// No description provided for @paywallNoPkgs.
  ///
  /// In en, this message translates to:
  /// **'No packages available.'**
  String get paywallNoPkgs;

  /// No description provided for @paywallManaged.
  ///
  /// In en, this message translates to:
  /// **'Managed by Apple/Google. Cancel anytime.'**
  String get paywallManaged;

  /// No description provided for @paywallPurchaseSuccess.
  ///
  /// In en, this message translates to:
  /// **'Purchase successful!'**
  String get paywallPurchaseSuccess;

  /// No description provided for @paywallPurchaseFailed.
  ///
  /// In en, this message translates to:
  /// **'Purchase failed. Please try again.'**
  String get paywallPurchaseFailed;

  /// No description provided for @paywallPurchasesRestored.
  ///
  /// In en, this message translates to:
  /// **'Purchases restored!'**
  String get paywallPurchasesRestored;

  /// No description provided for @paywallNoActivePurchases.
  ///
  /// In en, this message translates to:
  /// **'No active purchases found.'**
  String get paywallNoActivePurchases;

  /// No description provided for @paywallRestoreFailed.
  ///
  /// In en, this message translates to:
  /// **'Restore failed. Please try again.'**
  String get paywallRestoreFailed;

  /// Label for the Relay nav item and sheet title
  ///
  /// In en, this message translates to:
  /// **'Relay'**
  String get relay;

  /// Section label above mode chips in connection panel
  ///
  /// In en, this message translates to:
  /// **'SELECT MODE'**
  String get selectModeSection;

  /// Section label above servers panel in connection panel
  ///
  /// In en, this message translates to:
  /// **'SERVERS'**
  String get serversSection;

  /// Placeholder when no server is entered in connection panel
  ///
  /// In en, this message translates to:
  /// **'No server selected'**
  String get noServerSelected;

  /// Title of the Bedrock account picker bottom sheet
  ///
  /// In en, this message translates to:
  /// **'Select Bedrock account'**
  String get selectBedrockAccount;

  /// Player count label on tracked server card
  ///
  /// In en, this message translates to:
  /// **'{players} / {max} players'**
  String playersCount(Object players, Object max);

  /// Title of the Info & Legal sheet
  ///
  /// In en, this message translates to:
  /// **'Info & Legal'**
  String get infoAndLegal;

  /// Section header in Info sheet
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get legalSection;

  /// Privacy Policy tile title
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// Privacy Policy tile subtitle
  ///
  /// In en, this message translates to:
  /// **'How we collect and protect your data'**
  String get privacyPolicySubtitle;

  /// Terms of Service tile title
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// Terms of Service tile subtitle
  ///
  /// In en, this message translates to:
  /// **'Rules and conditions of use'**
  String get termsOfServiceSubtitle;

  /// Section header for data sources in Info sheet
  ///
  /// In en, this message translates to:
  /// **'Data Sources & Credits'**
  String get dataSourcesSection;

  /// Subtitle for Minecraft Wiki credit tile
  ///
  /// In en, this message translates to:
  /// **'Used as data source for the Wiki feature. Content is provided by the community under Creative Commons.'**
  String get creditMinecraftWikiSubtitle;

  /// Title for Mojang credit tile
  ///
  /// In en, this message translates to:
  /// **'Mojang / Microsoft'**
  String get creditMojangTitle;

  /// Subtitle for Mojang credit tile
  ///
  /// In en, this message translates to:
  /// **'Java player skins, UUIDs, and profile data via the official Mojang API.'**
  String get creditMojangSubtitle;

  /// Title for GeyserMC credit tile
  ///
  /// In en, this message translates to:
  /// **'GeyserMC'**
  String get creditGeyserTitle;

  /// Subtitle for GeyserMC credit tile
  ///
  /// In en, this message translates to:
  /// **'Bedrock skin rendering. Skins for Bedrock players are fetched via the GeyserMC skin server.'**
  String get creditGeyserSubtitle;

  /// Title for Xbox credit tile
  ///
  /// In en, this message translates to:
  /// **'Xbox / Microsoft'**
  String get creditXboxTitle;

  /// Subtitle for Xbox credit tile
  ///
  /// In en, this message translates to:
  /// **'Bedrock account linking via Xbox Live. Gamertags and XUIDs are retrieved through the Microsoft authentication flow.'**
  String get creditXboxSubtitle;

  /// Section header for About MCCompanion in Info sheet
  ///
  /// In en, this message translates to:
  /// **'About MCCompanion'**
  String get aboutMCCompanionSection;

  /// Disclaimer text in About MCCompanion section
  ///
  /// In en, this message translates to:
  /// **'MCCompanion is an independent application and is not affiliated with, endorsed by, or sponsored by Mojang Studios or Microsoft Corporation.'**
  String get aboutMCCompanionDisclaimer;

  /// Minecraft trademark notice
  ///
  /// In en, this message translates to:
  /// **'\"Minecraft\" is a trademark of Microsoft Corporation.'**
  String get minecraftTrademark;

  /// Section label above relay selector in More sheet
  ///
  /// In en, this message translates to:
  /// **'MCCompanion Server'**
  String get nldServerLabelShort;

  /// Title for edit server form in manage servers
  ///
  /// In en, this message translates to:
  /// **'Edit Server'**
  String get editServer;

  /// Example hint text for server name field
  ///
  /// In en, this message translates to:
  /// **'My Awesome Server'**
  String get serverNameExampleHint;

  /// Example hint text for server address field
  ///
  /// In en, this message translates to:
  /// **'play.example.com'**
  String get serverAddressExampleHint;

  /// Example hint text for server description field
  ///
  /// In en, this message translates to:
  /// **'Survival server with friends'**
  String get serverDescriptionExampleHint;

  /// Label for the edition toggle in manage servers form
  ///
  /// In en, this message translates to:
  /// **'Edition'**
  String get editionLabel;

  /// Generic Name field label
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// IP Address field label in edit server form
  ///
  /// In en, this message translates to:
  /// **'IP Address'**
  String get ipAddressFieldLabel;

  /// Port field label in edit server form
  ///
  /// In en, this message translates to:
  /// **'Port'**
  String get portFieldLabel;

  /// Platform field label in edit server form
  ///
  /// In en, this message translates to:
  /// **'Platform'**
  String get platformFieldLabel;

  /// Validation error when server name is invalid
  ///
  /// In en, this message translates to:
  /// **'Name must be 1–50 characters'**
  String get nameValidationError;

  /// Validation error when IP address is empty
  ///
  /// In en, this message translates to:
  /// **'IP address is required'**
  String get ipRequiredError;

  /// Validation error when port is out of range
  ///
  /// In en, this message translates to:
  /// **'Port must be between 1 and 65535'**
  String get portRangeError;

  /// Title for the partner servers screen
  ///
  /// In en, this message translates to:
  /// **'Partner Servers'**
  String get partnerServersTitle;

  /// Empty state text on partner servers screen
  ///
  /// In en, this message translates to:
  /// **'No partner servers available yet.'**
  String get noPartnerServers;

  /// Secondary empty state text on partner servers screen
  ///
  /// In en, this message translates to:
  /// **'Check back later.'**
  String get checkBackLater;

  /// AppBar title for Xbox link screen
  ///
  /// In en, this message translates to:
  /// **'Link Xbox Account'**
  String get xboxLinkTitle;

  /// Loading text when starting Xbox login
  ///
  /// In en, this message translates to:
  /// **'Starting Xbox login…'**
  String get xboxStartingLogin;

  /// Heading on Xbox link waiting screen
  ///
  /// In en, this message translates to:
  /// **'Sign in with Microsoft'**
  String get xboxSignInWithMicrosoft;

  /// Instruction on Xbox link waiting screen
  ///
  /// In en, this message translates to:
  /// **'Go to the link below and enter the code to connect your Xbox account.'**
  String get xboxGoToLink;

  /// Label above the Microsoft device code
  ///
  /// In en, this message translates to:
  /// **'Your code'**
  String get xboxYourCode;

  /// Hint below the code on Xbox link screen
  ///
  /// In en, this message translates to:
  /// **'Tap the code to copy it'**
  String get xboxTapToCopy;

  /// Button label to open Microsoft device auth link
  ///
  /// In en, this message translates to:
  /// **'Open microsoft.com/link'**
  String get xboxOpenLink;

  /// Status text while polling for Xbox login
  ///
  /// In en, this message translates to:
  /// **'Waiting for login…'**
  String get xboxWaitingForLogin;

  /// Success text when Xbox account is linked
  ///
  /// In en, this message translates to:
  /// **'Xbox account linked!'**
  String get xboxAccountLinked;

  /// Snackbar shown after code is copied
  ///
  /// In en, this message translates to:
  /// **'Code copied to clipboard'**
  String get xboxCodeCopied;

  /// Error when Xbox login cannot be started
  ///
  /// In en, this message translates to:
  /// **'Could not start Xbox login. Please try again.'**
  String get xboxCouldNotStart;

  /// Error when Xbox device code expires
  ///
  /// In en, this message translates to:
  /// **'The code expired. Please try again.'**
  String get xboxCodeExpired;

  /// Generic error on Xbox link screen
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get xboxSomethingWrong;

  /// Generic try again button label
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// AppBar title fallback for public profile when username not loaded
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get publicProfileTitle;

  /// Text shown when a user profile cannot be found
  ///
  /// In en, this message translates to:
  /// **'User not found'**
  String get userNotFound;

  /// Section label in public profile for profile info card
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileSectionLabel;

  /// Row label for display name in public profile
  ///
  /// In en, this message translates to:
  /// **'Display name'**
  String get displayNameRowLabel;

  /// Row label for username in public profile
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get usernameRowLabel;

  /// Row label for last seen date in public profile
  ///
  /// In en, this message translates to:
  /// **'Last seen'**
  String get lastSeenLabel;

  /// Section label for bio/about in public profile
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutSectionLabel;

  /// Section label for Xbox/Bedrock account in public profile
  ///
  /// In en, this message translates to:
  /// **'Xbox / Bedrock'**
  String get xboxBedrockLabel;

  /// Toast shown after friend request is sent from public profile
  ///
  /// In en, this message translates to:
  /// **'Friend request sent'**
  String get friendRequestSent;

  /// Error when already friends with user (public profile)
  ///
  /// In en, this message translates to:
  /// **'You are already friends.'**
  String get alreadyFriendsMsg;

  /// Error when friend request is already pending (public profile)
  ///
  /// In en, this message translates to:
  /// **'There is already a pending request.'**
  String get requestAlreadyPendingMsg;

  /// Error when user not found sending friend request from public profile
  ///
  /// In en, this message translates to:
  /// **'User not found.'**
  String get userNotFoundMsg2;

  /// Error when friend request is blocked (public profile)
  ///
  /// In en, this message translates to:
  /// **'Cannot send a request to this user.'**
  String get cannotSendRequestMsg;

  /// Toast when accepted a friend request from public profile
  ///
  /// In en, this message translates to:
  /// **'Now friends with @{username}'**
  String nowFriendsWith(Object username);

  /// Button label to remove a friend on public profile
  ///
  /// In en, this message translates to:
  /// **'Remove friend'**
  String get removeFriendButton;

  /// Disabled button label when request already sent
  ///
  /// In en, this message translates to:
  /// **'Request sent'**
  String get requestSentButton;

  /// Button label to accept a friend request
  ///
  /// In en, this message translates to:
  /// **'Accept request'**
  String get acceptRequestButton;

  /// Button label to add a friend on public profile
  ///
  /// In en, this message translates to:
  /// **'Add friend'**
  String get addFriendButton;

  /// Dialog title when removing a friend from public profile
  ///
  /// In en, this message translates to:
  /// **'Remove friend'**
  String get removeFriendDialogTitle;

  /// Dialog body when removing a friend from public profile
  ///
  /// In en, this message translates to:
  /// **'Remove @{username} as a friend?'**
  String removeFriendDialogBody(Object username);

  /// Banner shown when tracker slot limit is reached
  ///
  /// In en, this message translates to:
  /// **'You\'ve reached your server limit. Upgrade to track more servers.'**
  String get trackerLimitReached;

  /// Button to open paywall/upgrade screen
  ///
  /// In en, this message translates to:
  /// **'Upgrade'**
  String get upgradeButton;

  /// No description provided for @javaLinkTitle.
  ///
  /// In en, this message translates to:
  /// **'Link Java Edition'**
  String get javaLinkTitle;

  /// No description provided for @javaStartingLogin.
  ///
  /// In en, this message translates to:
  /// **'Starting Microsoft login…'**
  String get javaStartingLogin;

  /// No description provided for @javaSignInWithMicrosoft.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Microsoft'**
  String get javaSignInWithMicrosoft;

  /// No description provided for @javaGoToLink.
  ///
  /// In en, this message translates to:
  /// **'Go to the link below and enter the code to connect your Minecraft Java Edition account.'**
  String get javaGoToLink;

  /// No description provided for @javaYourCode.
  ///
  /// In en, this message translates to:
  /// **'Your code'**
  String get javaYourCode;

  /// No description provided for @javaTapToCopy.
  ///
  /// In en, this message translates to:
  /// **'Tap the code to copy it'**
  String get javaTapToCopy;

  /// No description provided for @javaOpenLink.
  ///
  /// In en, this message translates to:
  /// **'Open microsoft.com/link'**
  String get javaOpenLink;

  /// No description provided for @javaWaitingForLogin.
  ///
  /// In en, this message translates to:
  /// **'Waiting for login…'**
  String get javaWaitingForLogin;

  /// No description provided for @javaAccountLinked.
  ///
  /// In en, this message translates to:
  /// **'Java Edition linked!'**
  String get javaAccountLinked;

  /// No description provided for @javaNoJavaTitle.
  ///
  /// In en, this message translates to:
  /// **'No Java Edition found'**
  String get javaNoJavaTitle;

  /// No description provided for @javaNoJavaBody.
  ///
  /// In en, this message translates to:
  /// **'The Microsoft account you signed in with does not own Minecraft Java Edition.'**
  String get javaNoJavaBody;

  /// No description provided for @javaTryDifferentAccount.
  ///
  /// In en, this message translates to:
  /// **'Try a different account'**
  String get javaTryDifferentAccount;

  /// No description provided for @javaCouldNotStart.
  ///
  /// In en, this message translates to:
  /// **'Could not start Microsoft login. Please try again.'**
  String get javaCouldNotStart;

  /// No description provided for @javaCodeExpired.
  ///
  /// In en, this message translates to:
  /// **'The code expired. Please try again.'**
  String get javaCodeExpired;

  /// No description provided for @javaSomethingWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get javaSomethingWrong;

  /// No description provided for @javaCodeCopied.
  ///
  /// In en, this message translates to:
  /// **'Code copied to clipboard'**
  String get javaCodeCopied;

  /// No description provided for @splashFeatureConnect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get splashFeatureConnect;

  /// No description provided for @splashFeatureFriends.
  ///
  /// In en, this message translates to:
  /// **'Friends'**
  String get splashFeatureFriends;

  /// No description provided for @splashFeatureChat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get splashFeatureChat;

  /// No description provided for @splashFeatureSkins.
  ///
  /// In en, this message translates to:
  /// **'Skins'**
  String get splashFeatureSkins;

  /// No description provided for @featureLabelConnector.
  ///
  /// In en, this message translates to:
  /// **'Connector'**
  String get featureLabelConnector;

  /// No description provided for @featureLabelSkins.
  ///
  /// In en, this message translates to:
  /// **'Skins'**
  String get featureLabelSkins;

  /// No description provided for @featureLabelWiki.
  ///
  /// In en, this message translates to:
  /// **'Wiki'**
  String get featureLabelWiki;

  /// No description provided for @featureLabelPartners.
  ///
  /// In en, this message translates to:
  /// **'Partners'**
  String get featureLabelPartners;

  /// No description provided for @featureLabelLookup.
  ///
  /// In en, this message translates to:
  /// **'Lookup'**
  String get featureLabelLookup;

  /// No description provided for @featureLabelTracker.
  ///
  /// In en, this message translates to:
  /// **'Server Tracker'**
  String get featureLabelTracker;

  /// No description provided for @featureSubtitleConnector.
  ///
  /// In en, this message translates to:
  /// **'Connect consoles to Minecraft'**
  String get featureSubtitleConnector;

  /// No description provided for @featureSubtitleSkins.
  ///
  /// In en, this message translates to:
  /// **'Browse & manage Minecraft skins'**
  String get featureSubtitleSkins;

  /// No description provided for @featureSubtitleWiki.
  ///
  /// In en, this message translates to:
  /// **'Minecraft encyclopedia'**
  String get featureSubtitleWiki;

  /// No description provided for @featureSubtitlePartners.
  ///
  /// In en, this message translates to:
  /// **'Featured servers'**
  String get featureSubtitlePartners;

  /// No description provided for @featureSubtitleLookup.
  ///
  /// In en, this message translates to:
  /// **'Look up Java & Bedrock profiles'**
  String get featureSubtitleLookup;

  /// No description provided for @featureSubtitleTracker.
  ///
  /// In en, this message translates to:
  /// **'Monitor server status & get notified'**
  String get featureSubtitleTracker;

  /// No description provided for @userSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Username, gamertag or Java name…'**
  String get userSearchHint;

  /// No description provided for @userSearchSub.
  ///
  /// In en, this message translates to:
  /// **'Search by username, Xbox gamertag or Java name'**
  String get userSearchSub;

  /// Label shown when a friend is online
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get onlineStatus;

  /// Toast shown on Windows when user taps the upgrade button
  ///
  /// In en, this message translates to:
  /// **'Upgrade available via the Microsoft Store'**
  String get upgradeWindowsHint;

  /// Subtitle on the empty chat screen
  ///
  /// In en, this message translates to:
  /// **'Be the first to say something!'**
  String get chatEmptyHint;

  /// Toast when skin is saved
  ///
  /// In en, this message translates to:
  /// **'Skin saved'**
  String get skinSaved;

  /// Toast when skin saved with name
  ///
  /// In en, this message translates to:
  /// **'Saved as \"{name}\"'**
  String skinSavedAs(String name);

  /// Toast when skin export fails
  ///
  /// In en, this message translates to:
  /// **'Export failed'**
  String get skinExportFailed;

  /// Toast when skin is exported successfully
  ///
  /// In en, this message translates to:
  /// **'Skin exported successfully'**
  String get skinExported;

  /// Label for account danger zone section
  ///
  /// In en, this message translates to:
  /// **'ACCOUNT'**
  String get accountActions;

  /// Label for bug report type
  ///
  /// In en, this message translates to:
  /// **'Bug Report'**
  String get feedbackBugReport;

  /// Label for feature request type
  ///
  /// In en, this message translates to:
  /// **'Feature Request'**
  String get feedbackFeatureRequest;

  /// Subtitle in feedback screen header
  ///
  /// In en, this message translates to:
  /// **'Goes straight to GitHub'**
  String get feedbackGoesToGithub;

  /// Label above title field in feedback form
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get feedbackTitleLabel;

  /// Hint text for title field when type is bug
  ///
  /// In en, this message translates to:
  /// **'e.g. App crashes when opening skin editor'**
  String get feedbackTitleHintBug;

  /// Hint text for title field when type is feature
  ///
  /// In en, this message translates to:
  /// **'e.g. Show player ping in the server list'**
  String get feedbackTitleHintFeature;

  /// Label above description field when type is bug
  ///
  /// In en, this message translates to:
  /// **'What happened?'**
  String get feedbackWhatHappened;

  /// Label above description field when type is feature
  ///
  /// In en, this message translates to:
  /// **'Describe your idea'**
  String get feedbackDescribeIdea;

  /// Hint in description field when type is bug
  ///
  /// In en, this message translates to:
  /// **'Describe the bug — what did you do, what did you expect, and what happened instead?'**
  String get feedbackDescHintBug;

  /// Hint in description field when type is feature
  ///
  /// In en, this message translates to:
  /// **'Explain what you\'d like and why it would be useful.'**
  String get feedbackDescHintFeature;

  /// Label above email field in feedback form
  ///
  /// In en, this message translates to:
  /// **'Email (optional)'**
  String get feedbackEmailLabel;

  /// Hint text for email field
  ///
  /// In en, this message translates to:
  /// **'So we can follow up with you'**
  String get feedbackEmailHint;

  /// Note below email field
  ///
  /// In en, this message translates to:
  /// **'Your email is never shared publicly.'**
  String get feedbackEmailNote;

  /// Submit button label when type is bug
  ///
  /// In en, this message translates to:
  /// **'Submit Bug Report'**
  String get feedbackSubmitBug;

  /// Submit button label when type is feature
  ///
  /// In en, this message translates to:
  /// **'Submit Feature Request'**
  String get feedbackSubmitFeature;

  /// Small disclaimer below submit button
  ///
  /// In en, this message translates to:
  /// **'Creates a public issue on GitHub · Don\'t include passwords'**
  String get feedbackDisclaimer;

  /// Success screen title
  ///
  /// In en, this message translates to:
  /// **'Thanks for the feedback!'**
  String get feedbackSuccessTitle;

  /// Success screen body text
  ///
  /// In en, this message translates to:
  /// **'Your report has been submitted and a GitHub issue has been created. We\'ll look into it as soon as possible.'**
  String get feedbackSuccessBody;

  /// Button to open GitHub issue
  ///
  /// In en, this message translates to:
  /// **'View on GitHub'**
  String get feedbackViewOnGithub;

  /// Button to reset and submit another report
  ///
  /// In en, this message translates to:
  /// **'Submit another'**
  String get feedbackSubmitAnother;

  /// Button to go back to the app
  ///
  /// In en, this message translates to:
  /// **'Back to app'**
  String get feedbackBackToApp;

  /// Validation error when title is too short
  ///
  /// In en, this message translates to:
  /// **'Title must be at least 5 characters.'**
  String get feedbackTitleTooShort;

  /// Validation error when description is too short
  ///
  /// In en, this message translates to:
  /// **'Description must be at least 10 characters.'**
  String get feedbackDescTooShort;

  /// Error toast when submit fails
  ///
  /// In en, this message translates to:
  /// **'Failed to submit. Please try again.'**
  String get feedbackSubmitFailed;

  /// Title on feedback tile on landing screen
  ///
  /// In en, this message translates to:
  /// **'Report a bug or suggest a feature'**
  String get feedbackTileTitle;

  /// Short label for feedback/bug report in desktop sidebar
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get reportBug;

  /// Subtitle on feedback tile on landing screen
  ///
  /// In en, this message translates to:
  /// **'Help us improve MCCompanion'**
  String get feedbackTileSubtitle;

  /// Friends how-to: step 1 - open Xbox app
  ///
  /// In en, this message translates to:
  /// **'Open the Xbox app on your phone or console.'**
  String get friendsHowToStep1;

  /// Friends how-to: step 2 - add bot as friend
  ///
  /// In en, this message translates to:
  /// **'Add one of the bots below as a friend on Xbox.'**
  String get friendsHowToStep2;

  /// Friends how-to: step 3 - open Minecraft friends tab
  ///
  /// In en, this message translates to:
  /// **'Open Minecraft and go to the Friends tab.'**
  String get friendsHowToStep3;

  /// Friends how-to: step 4 - join via LAN Worlds
  ///
  /// In en, this message translates to:
  /// **'Look for your server under LAN Worlds and join.'**
  String get friendsHowToStep4;

  /// Friends how-to: warning note about starting mode
  ///
  /// In en, this message translates to:
  /// **'⚠️ Every time you want to play, you need to start Friends mode in the MCCompanion app first. You can close the app after starting.'**
  String get friendsHowToNote;

  /// Friends how-to: error when bot list fails to load
  ///
  /// In en, this message translates to:
  /// **'⚠️ Could not load bot list. Try again later.'**
  String get friendsBotLoadError;

  /// Region label: Europe
  ///
  /// In en, this message translates to:
  /// **'Europe'**
  String get regionEurope;

  /// Region label: United States
  ///
  /// In en, this message translates to:
  /// **'United States'**
  String get regionUnitedStates;

  /// Badge label indicating the user's own region
  ///
  /// In en, this message translates to:
  /// **'YOUR REGION'**
  String get yourRegion;

  /// Bot status: offline
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get botStatusOffline;

  /// Bot status: full
  ///
  /// In en, this message translates to:
  /// **'Full'**
  String get botStatusFull;

  /// Bot friend count display
  ///
  /// In en, this message translates to:
  /// **'{current} / {max} friends'**
  String botFriendCount(Object current, Object max);

  /// Toast message when gamertag is copied
  ///
  /// In en, this message translates to:
  /// **'Copied {gamertag}'**
  String botCopied(Object gamertag);

  /// Copy button label
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copyLabel;

  /// Toast when skin is saved to documents
  ///
  /// In en, this message translates to:
  /// **'Skin saved to Documents'**
  String get skinSavedToDocuments;

  /// Skin context menu: export option
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get skinMenuExport;

  /// Skin context menu: delete option
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get skinMenuDelete;

  /// Title of the resource pack screen
  ///
  /// In en, this message translates to:
  /// **'Resource Pack'**
  String get rpScreenTitle;

  /// Section title for the what-is-this explanation card
  ///
  /// In en, this message translates to:
  /// **'What is this?'**
  String get rpWhatIsThis;

  /// Body text explaining what the resource pack feature does
  ///
  /// In en, this message translates to:
  /// **'Customize how Minecraft looks on your console with a resource pack. Upload a file or paste a direct link. MCCompanion sends it to your console automatically every time you connect.'**
  String get rpExplanation;

  /// Label for the pack URL text field
  ///
  /// In en, this message translates to:
  /// **'Pack URL'**
  String get rpPackUrlLabel;

  /// Hint/placeholder for the pack URL text field
  ///
  /// In en, this message translates to:
  /// **'https://example.com/pack.mcpack'**
  String get rpPackUrlHint;

  /// Label for the enable resource pack toggle
  ///
  /// In en, this message translates to:
  /// **'Enable resource pack'**
  String get rpEnableToggle;

  /// Section title for the supported formats card
  ///
  /// In en, this message translates to:
  /// **'Supported formats'**
  String get rpWhatWorks;

  /// No description provided for @rpSupportedBedrockOnly.
  ///
  /// In en, this message translates to:
  /// **'Bedrock Edition only (.mcpack or .zip)'**
  String get rpSupportedBedrockOnly;

  /// No description provided for @rpSupportedBedrockOnlyHint.
  ///
  /// In en, this message translates to:
  /// **'Java packs don\'t work on consoles.'**
  String get rpSupportedBedrockOnlyHint;

  /// No description provided for @rpSupportedTexture.
  ///
  /// In en, this message translates to:
  /// **'Resource packs & texture packs'**
  String get rpSupportedTexture;

  /// No description provided for @rpSupportedTextureHint.
  ///
  /// In en, this message translates to:
  /// **'These are officially supported and work reliably.'**
  String get rpSupportedTextureHint;

  /// No description provided for @rpUnsupportedShaders.
  ///
  /// In en, this message translates to:
  /// **'Shaders, behavior packs, skin packs'**
  String get rpUnsupportedShaders;

  /// No description provided for @rpUnsupportedShadersHint.
  ///
  /// In en, this message translates to:
  /// **'These won\'t load on consoles via MCCompanion.'**
  String get rpUnsupportedShadersHint;

  /// No description provided for @rpUnsupportedAddons.
  ///
  /// In en, this message translates to:
  /// **'Add-ons & UI mods'**
  String get rpUnsupportedAddons;

  /// No description provided for @rpUnsupportedAddonsHint.
  ///
  /// In en, this message translates to:
  /// **'May sometimes work, but not officially supported. Use at your own risk.'**
  String get rpUnsupportedAddonsHint;

  /// Bullet: Discord links don't work (warning)
  ///
  /// In en, this message translates to:
  /// **'Discord links'**
  String get rpNoDiscord;

  /// Bullet: Google Drive/Dropbox links don't work (warning)
  ///
  /// In en, this message translates to:
  /// **'Google Drive / Dropbox share links'**
  String get rpNoDrive;

  /// Bullet: encrypted packs don't work (warning)
  ///
  /// In en, this message translates to:
  /// **'Encrypted or password-protected packs'**
  String get rpNoEncrypted;

  /// No description provided for @rpConsolePerformanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Console performance'**
  String get rpConsolePerformanceTitle;

  /// No description provided for @rpConsolePerformanceBody.
  ///
  /// In en, this message translates to:
  /// **'High-resolution texture packs can cause lag or crashes on consoles. If you experience issues, switch to a lower-resolution pack or select a lighter subpack if the pack supports it.'**
  String get rpConsolePerformanceBody;

  /// Inline warning shown when user enters a Discord CDN URL
  ///
  /// In en, this message translates to:
  /// **'Discord links expire and will stop working. Use a permanent host instead.'**
  String get rpWarnDiscord;

  /// Inline warning when URL does not start with https://
  ///
  /// In en, this message translates to:
  /// **'URL must start with https://'**
  String get rpWarnHttps;

  /// Inline warning when URL does not end with .mcpack or .zip
  ///
  /// In en, this message translates to:
  /// **'URL must end in .mcpack or .zip'**
  String get rpWarnExtension;

  /// Toast shown when save is pressed with pack enabled but no URL
  ///
  /// In en, this message translates to:
  /// **'Enter a URL before enabling the resource pack.'**
  String get rpToastEnterUrl;

  /// Toast shown after resource pack settings are saved successfully
  ///
  /// In en, this message translates to:
  /// **'Resource pack settings saved.'**
  String get rpToastSaved;

  /// Error shown when user uploads a Java Edition resource pack instead of Bedrock
  ///
  /// In en, this message translates to:
  /// **'This is a Java Edition pack and is not supported. Please use a Bedrock Edition resource pack.'**
  String get rpInvalidPackFormat;

  /// Section title: already connected before info card
  ///
  /// In en, this message translates to:
  /// **'First time with this pack?'**
  String get rpClearMinecraftTitle;

  /// Explanation of why Minecraft cache needs clearing when switching to MCCompanion resource pack
  ///
  /// In en, this message translates to:
  /// **'Minecraft caches resource packs locally. If you connected to this server before enabling MCCompanion\'s resource pack, Minecraft already has the original pack cached and won\'t re-download the merged version.'**
  String get rpClearMinecraftBody;

  /// Step 1: open Minecraft storage settings
  ///
  /// In en, this message translates to:
  /// **'Open Minecraft on your console and go to Settings → Storage'**
  String get rpClearStep1;

  /// Step 2: clear resource packs in Minecraft storage
  ///
  /// In en, this message translates to:
  /// **'Tap ‘Clear’ or ‘Reset’ next to Resource Packs. This removes all locally cached packs.'**
  String get rpClearStep2;

  /// Step 3: reconnect to get merged pack
  ///
  /// In en, this message translates to:
  /// **'Reconnect through MCCompanion. The merged pack will download automatically.'**
  String get rpClearStep3;

  /// Section title: pack looks wrong info card
  ///
  /// In en, this message translates to:
  /// **'Pack looks wrong?'**
  String get rpRelayTitle;

  /// Explanation of what to do when merged pack has issues — toggle pack off/on and reconnect
  ///
  /// In en, this message translates to:
  /// **'The relay caches the merged pack for 1 hour using your overlay URL as the cache key. To force a fresh merge, change your pack URL slightly (e.g. add ?v=2 at the end) and save. After that, also clear Minecraft\'s pack cache. The merged pack still uses the server\'s UUID, so Minecraft will otherwise serve the old cached version.'**
  String get rpRelayBody;

  /// No description provided for @rpWorksGithubHint.
  ///
  /// In en, this message translates to:
  /// **'Direct download link, always accessible.'**
  String get rpWorksGithubHint;

  /// No description provided for @rpWorksCloudflareHint.
  ///
  /// In en, this message translates to:
  /// **'Public cloud storage, fast and reliable.'**
  String get rpWorksCloudflareHint;

  /// No description provided for @rpWorksDirectHint.
  ///
  /// In en, this message translates to:
  /// **'Any public HTTPS .mcpack or .zip URL'**
  String get rpWorksDirectHint;

  /// No description provided for @rpNoDiscordHint.
  ///
  /// In en, this message translates to:
  /// **'Links expire after a few hours and can\'t be used as a permanent pack URL.'**
  String get rpNoDiscordHint;

  /// No description provided for @rpNoDriveHint.
  ///
  /// In en, this message translates to:
  /// **'Not a direct download, sends you to a preview page instead.'**
  String get rpNoDriveHint;

  /// No description provided for @rpNoEncryptedHint.
  ///
  /// In en, this message translates to:
  /// **'MCCompanion cannot read or merge encrypted pack content.'**
  String get rpNoEncryptedHint;

  /// No description provided for @rpClearWhy.
  ///
  /// In en, this message translates to:
  /// **'Minecraft caches resource packs by their UUID. The merged pack keeps the server\'s original UUID, so if Minecraft already has the server\'s pack cached from a previous session, it won\'t re-download the new merged version. Clear the cache so Minecraft picks up the fresh merged pack.'**
  String get rpClearWhy;

  /// Tab label for uploading a pack file
  ///
  /// In en, this message translates to:
  /// **'Upload'**
  String get rpUploadTab;

  /// Tab label for entering a pack URL
  ///
  /// In en, this message translates to:
  /// **'URL'**
  String get rpUrlTab;

  /// Upload area primary label
  ///
  /// In en, this message translates to:
  /// **'Tap to select your pack'**
  String get rpUploadButton;

  /// Upload area hint
  ///
  /// In en, this message translates to:
  /// **'.mcpack or .zip • max 100 MB'**
  String get rpUploadHint;

  /// Shown while upload is in progress
  ///
  /// In en, this message translates to:
  /// **'Uploading...'**
  String get rpUploading;

  /// No description provided for @rpMergerTitle.
  ///
  /// In en, this message translates to:
  /// **'RP Merger'**
  String get rpMergerTitle;

  /// No description provided for @rpMergerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Combine up to 4 resource packs'**
  String get rpMergerSubtitle;

  /// No description provided for @rpMergerPriorityHint.
  ///
  /// In en, this message translates to:
  /// **'Top pack has highest priority — its files win conflicts.'**
  String get rpMergerPriorityHint;

  /// No description provided for @rpMergerTopBadge.
  ///
  /// In en, this message translates to:
  /// **'TOP'**
  String get rpMergerTopBadge;

  /// No description provided for @rpMergerAddPacks.
  ///
  /// In en, this message translates to:
  /// **'Add resource packs'**
  String get rpMergerAddPacks;

  /// No description provided for @rpMergerAddAnother.
  ///
  /// In en, this message translates to:
  /// **'Add another pack ({current}/4)'**
  String rpMergerAddAnother(int current);

  /// No description provided for @rpMergerFileTypes.
  ///
  /// In en, this message translates to:
  /// **'.zip or .mcpack'**
  String get rpMergerFileTypes;

  /// No description provided for @rpMergerMerging.
  ///
  /// In en, this message translates to:
  /// **'Merging…'**
  String get rpMergerMerging;

  /// No description provided for @rpMergerButton.
  ///
  /// In en, this message translates to:
  /// **'Merge {count} packs'**
  String rpMergerButton(int count);

  /// No description provided for @rpMergerComplete.
  ///
  /// In en, this message translates to:
  /// **'Merge complete!'**
  String get rpMergerComplete;

  /// No description provided for @rpMergerConflicts.
  ///
  /// In en, this message translates to:
  /// **'{count} conflict(s) resolved — top pack won.'**
  String rpMergerConflicts(int count);

  /// No description provided for @rpMergerSetActive.
  ///
  /// In en, this message translates to:
  /// **'Set as active resource pack'**
  String get rpMergerSetActive;

  /// No description provided for @rpMergerSetActiveToast.
  ///
  /// In en, this message translates to:
  /// **'Set as active resource pack'**
  String get rpMergerSetActiveToast;

  /// No description provided for @rpMergerOpenButton.
  ///
  /// In en, this message translates to:
  /// **'Merge resource packs'**
  String get rpMergerOpenButton;

  /// No description provided for @rpMergerOpenSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Combine 2–4 packs into one'**
  String get rpMergerOpenSubtitle;

  /// Status label when the resource pack is disabled
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get rpDisabled;

  /// Shown in the active pack banner when no pack is configured
  ///
  /// In en, this message translates to:
  /// **'No resource pack selected'**
  String get rpNoPackSelected;

  /// Status label when pack is enabled and will be applied
  ///
  /// In en, this message translates to:
  /// **'Active — applied on connect'**
  String get rpActiveOnConnect;

  /// Subtitle shown at the top of the Browse tab
  ///
  /// In en, this message translates to:
  /// **'Curated packs, ready to use'**
  String get rpBrowseSubtitle;

  /// Empty state title in Browse tab
  ///
  /// In en, this message translates to:
  /// **'No packs available yet'**
  String get rpBrowseEmpty;

  /// Empty state subtitle in Browse tab
  ///
  /// In en, this message translates to:
  /// **'Check back later for curated packs.'**
  String get rpBrowseEmptyHint;

  /// Button to replace the currently uploaded pack file
  ///
  /// In en, this message translates to:
  /// **'Replace with another file'**
  String get rpReplaceFile;

  /// Label shown when a file is dragged over the upload area
  ///
  /// In en, this message translates to:
  /// **'Drop to upload'**
  String get rpDropToUpload;

  /// Info text shown under the Browse tab
  ///
  /// In en, this message translates to:
  /// **'Browse curated packs selected by MCCompanion. Tap Use to activate a pack instantly — no upload or link needed.'**
  String get rpTabBrowseInfo;

  /// Info text shown under the Upload tab
  ///
  /// In en, this message translates to:
  /// **'Upload your own .mcpack or .zip file. MCCompanion stores it securely in the cloud and sends it to your console every time you connect.'**
  String get rpTabUploadInfo;

  /// Info text shown under the URL tab
  ///
  /// In en, this message translates to:
  /// **'Paste a direct download link to a .mcpack or .zip file. The URL must be publicly accessible — no Discord or Google Drive links.'**
  String get rpTabUrlInfo;

  /// Info text shown under the RP Merger tab
  ///
  /// In en, this message translates to:
  /// **'Combine 2 to 4 packs into one. The merged pack is uploaded to MCCompanion Cloud and activated automatically.'**
  String get rpTabMergeInfo;

  /// Share button label
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareLabel;

  /// Section header for linked Minecraft accounts
  ///
  /// In en, this message translates to:
  /// **'Minecraft Accounts'**
  String get sectionMinecraftAccounts;

  /// Section header for settings
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get sectionSettings;

  /// Toast when avatar upload succeeds
  ///
  /// In en, this message translates to:
  /// **'Avatar updated'**
  String get avatarUpdated;

  /// Toast when avatar upload fails
  ///
  /// In en, this message translates to:
  /// **'Upload failed'**
  String get uploadFailed;

  /// Toast when profile URL is copied to clipboard on desktop
  ///
  /// In en, this message translates to:
  /// **'Profile link copied!'**
  String get profileLinkCopied;

  /// Tooltip on share icon button in public profile app bar
  ///
  /// In en, this message translates to:
  /// **'Share profile'**
  String get shareProfileTooltip;

  /// AppBar title when profile user is not yet loaded
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileFallbackTitle;

  /// Empty state in user search
  ///
  /// In en, this message translates to:
  /// **'No users found'**
  String get noUsersFound;

  /// Label when user has exactly one skin
  ///
  /// In en, this message translates to:
  /// **'SKIN'**
  String get skinLabel;

  /// Label when user has multiple skins
  ///
  /// In en, this message translates to:
  /// **'SKINS'**
  String get skinsLabel;

  /// Java edition badge on skin/account
  ///
  /// In en, this message translates to:
  /// **'Java'**
  String get javaEditionBadge;

  /// Bedrock edition badge on skin/account
  ///
  /// In en, this message translates to:
  /// **'Bedrock'**
  String get bedrockEditionBadge;

  /// Download button label
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get downloadLabel;

  /// Relative time: less than 2 minutes ago
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get justNow;

  /// Relative time in minutes
  ///
  /// In en, this message translates to:
  /// **'{count}m ago'**
  String minutesAgo(int count);

  /// Relative time in hours
  ///
  /// In en, this message translates to:
  /// **'{count}h ago'**
  String hoursAgo(int count);

  /// Relative time in days
  ///
  /// In en, this message translates to:
  /// **'{count}d ago'**
  String daysAgo(int count);

  /// rpPackInfo label
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get rpPackInfo;

  /// rpUseThisPack label
  ///
  /// In en, this message translates to:
  /// **'Use this pack'**
  String get rpUseThisPack;

  /// rpViewOnWebsite label
  ///
  /// In en, this message translates to:
  /// **'View on website →'**
  String get rpViewOnWebsite;

  /// Download count label
  ///
  /// In en, this message translates to:
  /// **'{count} downloads'**
  String rpDownloads(int count);

  /// rpPackDetailTitle label
  ///
  /// In en, this message translates to:
  /// **'Pack details'**
  String get rpPackDetailTitle;

  /// Toast when cloud skin is saved to local library
  ///
  /// In en, this message translates to:
  /// **'Saved to My Skins'**
  String get skinsSavedToMySkins;

  /// Toast when skin download fails
  ///
  /// In en, this message translates to:
  /// **'Download failed'**
  String get skinsDownloadFailed;

  /// Toast when cloud skin is deleted
  ///
  /// In en, this message translates to:
  /// **'Deleted from cloud'**
  String get skinsDeletedFromCloud;

  /// Toast when skin delete fails
  ///
  /// In en, this message translates to:
  /// **'Delete failed'**
  String get skinsDeleteFailed;

  /// Toast when user tries to upload without being logged in
  ///
  /// In en, this message translates to:
  /// **'Log in to upload skins'**
  String get skinsLoginToUpload;

  /// Toast while skin is uploading
  ///
  /// In en, this message translates to:
  /// **'Uploading…'**
  String get skinsUploading;

  /// Toast when skin upload succeeds
  ///
  /// In en, this message translates to:
  /// **'Skin uploaded!'**
  String get skinUploaded;

  /// Toast when skin upload fails
  ///
  /// In en, this message translates to:
  /// **'Upload failed: {error}'**
  String skinUploadFailed(String error);

  /// Skins tab label
  ///
  /// In en, this message translates to:
  /// **'Skins'**
  String get skinsTabSkins;

  /// Recent tab label on skins screen
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get skinsTabRecent;

  /// Empty state for cloud skins tab
  ///
  /// In en, this message translates to:
  /// **'No cloud skins yet. Upload a skin to see it here.'**
  String get skinsEmptyCloudSkins;

  /// Empty state for local skins tab
  ///
  /// In en, this message translates to:
  /// **'No skins yet. Create or upload a skin to get started.'**
  String get skinsEmptyLocalSkins;

  /// Menu option to upload skin to website
  ///
  /// In en, this message translates to:
  /// **'Upload to website'**
  String get skinUploadToWebsite;

  /// Menu option to re-upload skin to website
  ///
  /// In en, this message translates to:
  /// **'Re-upload to website'**
  String get skinReuploadToWebsite;

  /// Edit button in cloud skin menu
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get skinCloudEdit;

  /// Save to device button in cloud skin menu
  ///
  /// In en, this message translates to:
  /// **'Save to device'**
  String get skinCloudSaveToDevice;

  /// Delete from cloud button in cloud skin menu
  ///
  /// In en, this message translates to:
  /// **'Delete from cloud'**
  String get skinCloudDelete;

  /// Gallery tab label on skins screen
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get skinsTabGallery;

  /// Empty state for public gallery tab
  ///
  /// In en, this message translates to:
  /// **'No community skins yet.'**
  String get skinsGalleryEmpty;

  /// Section header for top 30 liked skins
  ///
  /// In en, this message translates to:
  /// **'Top 30'**
  String get skinsTopLabel;

  /// Section header for all gallery skins
  ///
  /// In en, this message translates to:
  /// **'All Skins'**
  String get skinsAllLabel;

  /// Dialog title for uploading skin to cloud
  ///
  /// In en, this message translates to:
  /// **'Upload to Cloud'**
  String get skinUploadToCloud;

  /// Dialog title for saving skin locally
  ///
  /// In en, this message translates to:
  /// **'Save Skin'**
  String get skinSaveDialog;

  /// Hint text for skin name input field
  ///
  /// In en, this message translates to:
  /// **'Skin name'**
  String get skinNameHint;

  /// Default name for a new skin
  ///
  /// In en, this message translates to:
  /// **'My Skin'**
  String get skinDefaultName;

  /// Toast when cloud skin is updated
  ///
  /// In en, this message translates to:
  /// **'Skin updated in cloud'**
  String get skinUpdatedInCloud;

  /// Creator attribution on skin cards and preview sheet
  ///
  /// In en, this message translates to:
  /// **'by {name}'**
  String skinByCreator(String name);

  /// Like count shown under skin name in preview sheet
  ///
  /// In en, this message translates to:
  /// **'{count} likes'**
  String skinLikesCount(int count);

  /// Section header for the recent activity feed in the profile tab
  ///
  /// In en, this message translates to:
  /// **'Recent Activity'**
  String get sectionRecentActivity;

  /// Shown when the activity feed is empty
  ///
  /// In en, this message translates to:
  /// **'No recent activity yet.'**
  String get activityNoEvents;

  /// Activity feed row: user uploaded a skin
  ///
  /// In en, this message translates to:
  /// **'Uploaded skin'**
  String get activitySkinUploaded;

  /// Activity feed row: user liked a skin
  ///
  /// In en, this message translates to:
  /// **'Liked a skin'**
  String get activitySkinLiked;

  /// Activity feed row: user submitted a resource pack
  ///
  /// In en, this message translates to:
  /// **'Submitted pack'**
  String get activityPackSubmitted;

  /// Activity feed row: pack was approved
  ///
  /// In en, this message translates to:
  /// **'Pack approved'**
  String get activityPackApproved;

  /// Activity feed row: pack was not approved
  ///
  /// In en, this message translates to:
  /// **'Pack not approved'**
  String get activityPackRejected;

  /// Relative timestamp: less than a minute ago
  ///
  /// In en, this message translates to:
  /// **'just now'**
  String get timeJustNow;

  /// Relative timestamp: X minutes ago
  ///
  /// In en, this message translates to:
  /// **'{count}m ago'**
  String timeMinutesAgo(int count);

  /// Relative timestamp: X hours ago
  ///
  /// In en, this message translates to:
  /// **'{count}h ago'**
  String timeHoursAgo(int count);

  /// Relative timestamp: X days ago
  ///
  /// In en, this message translates to:
  /// **'{count}d ago'**
  String timeDaysAgo(int count);

  /// Relative timestamp: X months ago
  ///
  /// In en, this message translates to:
  /// **'{count}mo ago'**
  String timeMonthsAgo(int count);

  /// Section header for the notifications feed in the bell tab
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get sectionNotifications;

  /// Section header for notification preference toggles
  ///
  /// In en, this message translates to:
  /// **'Notification Types'**
  String get sectionNotificationTypes;

  /// Button to mark all notifications as read
  ///
  /// In en, this message translates to:
  /// **'Mark all read'**
  String get notifMarkAllRead;

  /// Shown when the notification feed is empty
  ///
  /// In en, this message translates to:
  /// **'No notifications yet. Likes, comments, and friend activity will appear here.'**
  String get notifEmpty;

  /// Fallback actor name when sender is unknown
  ///
  /// In en, this message translates to:
  /// **'Someone'**
  String get notifSomeone;

  /// Notification title: someone liked the user's skin
  ///
  /// In en, this message translates to:
  /// **'{actor} liked your skin'**
  String notifSkinLiked(String actor);

  /// Notification title: someone commented on the user's skin
  ///
  /// In en, this message translates to:
  /// **'{actor} commented on your skin'**
  String notifCommentReceived(String actor);

  /// Notification title: a submitted pack was approved
  ///
  /// In en, this message translates to:
  /// **'Pack approved'**
  String get notifPackApproved;

  /// Notification title: a submitted pack was rejected
  ///
  /// In en, this message translates to:
  /// **'Pack not approved'**
  String get notifPackRejected;

  /// Notification title: someone sent a friend request
  ///
  /// In en, this message translates to:
  /// **'{actor} sent you a friend request'**
  String notifFriendRequest(String actor);

  /// Notification title: someone accepted the user's friend request
  ///
  /// In en, this message translates to:
  /// **'{actor} accepted your request'**
  String notifFriendAccepted(String actor);

  /// Notification title: new direct message received
  ///
  /// In en, this message translates to:
  /// **'New message from {actor}'**
  String notifMessageReceived(String actor);

  /// Notification preference toggle label: skin liked
  ///
  /// In en, this message translates to:
  /// **'Skin liked'**
  String get notifPrefSkinLiked;

  /// Notification preference toggle label: comment received
  ///
  /// In en, this message translates to:
  /// **'Comment received'**
  String get notifPrefCommentReceived;

  /// Notification preference toggle label: pack approved
  ///
  /// In en, this message translates to:
  /// **'Pack approved'**
  String get notifPrefPackApproved;

  /// Notification preference toggle label: pack rejected
  ///
  /// In en, this message translates to:
  /// **'Pack rejected'**
  String get notifPrefPackRejected;

  /// Notification preference toggle label: friend request
  ///
  /// In en, this message translates to:
  /// **'Friend request'**
  String get notifPrefFriendRequest;

  /// Notification preference toggle label: friend accepted
  ///
  /// In en, this message translates to:
  /// **'Friend accepted'**
  String get notifPrefFriendAccepted;

  /// Notification preference toggle label: new message
  ///
  /// In en, this message translates to:
  /// **'New message'**
  String get notifPrefMessageReceived;
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
