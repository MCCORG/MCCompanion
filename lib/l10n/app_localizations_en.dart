// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get console => 'Console';

  @override
  String get modeLabel => 'Mode';

  @override
  String get statusLabel => 'Status';

  @override
  String get seeAll => 'See all';

  @override
  String get sectionHelp => 'Help';

  @override
  String get sectionAdvanced => 'Advanced';

  @override
  String get versionLabel => 'Version';

  @override
  String get consoleOutput => 'Console Output';

  @override
  String get noLogsYet => 'No logs yet';

  @override
  String get startBroadcastingToSeeOutput => 'Start broadcasting to see output';

  @override
  String get close => 'Close';

  @override
  String get ok => 'OK';

  @override
  String get back => 'Back';

  @override
  String get next => 'Next';

  @override
  String get done => 'Done';

  @override
  String get none => 'None';

  @override
  String get onboardingThemeTitle => 'Choose a theme';

  @override
  String get onboardingThemeSubtitle =>
      'You can fine-tune every color in the settings later.';

  @override
  String get onboardingNavTitle => 'Quick access';

  @override
  String get onboardingNavSubtitle =>
      'Pick two features for your bottom bar shortcuts.';

  @override
  String get onboardingNavLeftLabel => 'LEFT SHORTCUT';

  @override
  String get onboardingNavRightLabel => 'RIGHT SHORTCUT';

  @override
  String get onboardingNavPreviewConnector => 'Connector';

  @override
  String get onboardingNavPreviewProfile => 'Profile';

  @override
  String get onboardingNavPreviewEmpty => 'Empty';

  @override
  String get onboardingCustomizeDetail => 'Customize in detail →';

  @override
  String get website => 'Website';

  @override
  String get howToUseMenu => 'How to use';

  @override
  String get support => 'Support';

  @override
  String get start => 'Start';

  @override
  String get stop => 'Stop';

  @override
  String get labelJava => 'Java';

  @override
  String get language => 'English';

  @override
  String get discord => 'Discord';

  @override
  String get toggleDebug => 'Toggle debug';

  @override
  String get copyLogs => 'Copy logs';

  @override
  String get clear => 'Clear';

  @override
  String get cancel => 'Cancel';

  @override
  String get deleteServer => 'Delete Server';

  @override
  String get delete => 'Delete';

  @override
  String get addServer => 'Add Server';

  @override
  String get addServersHint => 'Add servers to quickly connect later';

  @override
  String get serverNameLabel => 'Server Name *';

  @override
  String get addressLabel => 'Address *';

  @override
  String get portLabel => 'Port *';

  @override
  String get descriptionLabel => 'Description (Optional)';

  @override
  String get save => 'Save';

  @override
  String get clientDisconnected => 'Client disconnected: Broadcast stopped';

  @override
  String get pleaseEnterServer => '⚠️ Please enter a server address';

  @override
  String get invalidPort => '⚠️ Invalid port number (1-65535)';

  @override
  String get dataSentToServers => 'Data sent to MCCompanion servers';

  @override
  String selectedServer(Object name) {
    return '📋 Selected: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'Selected: $name';
  }

  @override
  String copiedLogs(Object count) {
    return 'Copied $count log entries to clipboard';
  }

  @override
  String get debugEnabled => 'Debug logs enabled';

  @override
  String get iUnderstand => 'I understand';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'Selected: $relayName\n\nHow to connect:\n1. Go to your Switch Settings and change the DNS to: $relayIp\n2. Open Minecraft and select a server from the list (like Cubecraft or Hive).\n3. You will now be sent to your own server automatically.';
  }

  @override
  String get noSavedServers => 'No saved servers';

  @override
  String get savedServers => 'Saved servers';

  @override
  String get manageServers => 'Manage servers';

  @override
  String get active => 'Active';

  @override
  String get vpnDetected => 'VPN Detected';

  @override
  String get noWifi => 'Not on Wi-Fi';

  @override
  String get vpnActive =>
      'We detected that your VPN is active.\n\nPlease disable your VPN before using MCCompanion, otherwise the LAN broadcast may not reach your console.';

  @override
  String get mobileActive =>
      'Detected: Mobile Data\n\nMCCompanion needs to be on the same network as your console. Please connect to your home Wi-Fi or hotspot before continuing.';

  @override
  String get continueAnyway => 'Continue Anyway';

  @override
  String get updateAvailable => 'Update Available';

  @override
  String get stopBroadcasting => 'Stop Broadcasting';

  @override
  String get startNintendoMode => 'Start Nintendo Mode';

  @override
  String get startFriendsMode => 'Start Friends Mode';

  @override
  String get startBroadcasting => 'Start Broadcasting';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'Friends';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / Proxy)';

  @override
  String get howToXboxSubtitle => 'Connect via LAN';

  @override
  String get howToXboxBody =>
      'How to connect (Xbox / PS4 / PS5):\n1. Ensure your device running MCCompanion and your console are on the same local network.\n2. In the app, enter your Minecraft server address and port and press \"Start Broadcasting\".\n3. On the console open Minecraft → Play → look for LAN Worlds or the Friends tab and refresh the list.\n4. Select the LAN server named \"MCCompanion\" to join.\nNotes:\n- If the server does not appear, confirm both devices are on the same subnet and that the app is still broadcasting.\n- Some console models or routers may block LAN discovery; try toggling the app or router settings if needed.';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (DNS mode)';

  @override
  String get howToNintendoSubtitle => 'Connect via DNS';

  @override
  String get howToFriendsTitle => 'Friends mode';

  @override
  String get howToFriendsSubtitle => 'Connect via Friends';

  @override
  String get helpMCCompanionTitle => 'MCCompanion does not appear';

  @override
  String get helpMCCompanionSubtitle => 'Troubleshooting LAN discovery issues';

  @override
  String get helpMCCompanionBody =>
      'If the server isn\'t appearing on your console, try these steps:\n\n✅ Basic Checks:\n1. Same WiFi Network - Your phone/tablet and console MUST be on the same WiFi\n2. Correct Server Address - Double-check the IP and port (default: 19132)\n3. Broadcasting Active - Verify MCCompanion shows \"Broadcasting\" status\n\n🔄 Quick Fixes:\n• Restart the app: Stop broadcasting, close MCCompanion completely, reopen and try again\n• Restart your console: Sometimes the console needs a refresh to detect LAN games\n• Check Friends/LAN tab: The server appears under \"Friends\" or \"LAN Games\", NOT in server list\n• Wait 10-15 seconds after starting broadcasting\n• Disable VPNs: VPNs can block local broadcasts\n\n⚠️ Common Issues:\n\"No route found for user\" → Ensure both devices are on the same Wi‑Fi (avoid Guest networks)\n\"Unable to connect to MCCompanion relay server\" → Check your internet / relay status\n\n📱 Still having issues? Enable Debug Mode in MCCompanion and check logs, or try a different server.';

  @override
  String get helpMultiplayerFailedTitle => 'Multiplayer Connection Failed';

  @override
  String get helpMultiplayerFailedSubtitle =>
      'Explanation why this is not a MCCompanion error';

  @override
  String get helpMultiplayerFailedBody =>
      '⚠️ This is not an issue with MCCompanion!\n\nMCCompanion successfully redirected you to the requested server. The message \"Multiplayer Connection Failed\" indicates that the target server is currently unreachable. Possible reasons:\n\n• The target Minecraft server is offline or overloaded\n• The server requires an updated client version or specific edition\n• Network issues between the relay and the target server\n\nTry connecting to a different server or contact the server\'s support. If the problem persists for multiple servers, enable Debug Mode in MCCompanion and check logs.';

  @override
  String get helpNintendoDnsTitle => 'Nintendo DNS does not work';

  @override
  String get helpNintendoDnsSubtitle => 'Common DNS / relay issues';

  @override
  String get helpNintendoDnsBody =>
      'If Nintendo DNS mode isn\'t working, check the following:\n\n1. Confirm you pushed DNS config from the app (Send DNS Config).\n2. Verify you applied the relay IP as Primary DNS on the Switch.\n3. Ensure the relay server selected (EU/US) is online and not overloaded.\n4. Some networks (e.g., captive portals) prevent custom DNS, test on a different network.\n\nIf issues persist, enable Debug Mode and check logs or try the Friends-mode alternative.';

  @override
  String get helpFriendsModeTitle => 'Friends mode does not work';

  @override
  String get helpFriendsModeSubtitle => 'Common friend issues';

  @override
  String get helpFriendsModeBody =>
      'Friends mode troubleshooting tips:\n\n1. Make sure the relay friend account is added/accepted on the console (if required).\n2. Try restarting the game and refreshing the Friends/LAN tab after enabling Friends mode.\n\nIf the server still doesn\'t appear to friends, enable Debug Mode and check logs to identify errors.';

  @override
  String get changeLanguageTitle => 'Change language';

  @override
  String get changeLanguage => 'Language';

  @override
  String get couldNotOpenUrl => 'Could not open URL';

  @override
  String get serverTrackerTitle => 'Server Tracker';

  @override
  String get removeServerTitle => 'Remove server';

  @override
  String removeServerConfirm(Object name) {
    return 'Remove \"$name\" from your tracker?';
  }

  @override
  String get removeServerFailed => 'Failed to remove server';

  @override
  String get refreshStatus => 'Refresh status';

  @override
  String get trackerSignInRequired => 'Sign in required';

  @override
  String get trackerSignInSubtitle =>
      'Sign in to track servers and receive offline notifications.';

  @override
  String get signIn => 'Sign in';

  @override
  String get noServersTracked => 'No servers tracked';

  @override
  String get trackerEmptySubtitle =>
      'Add a Minecraft server to monitor its status and receive notifications.';

  @override
  String get fillAllFields => 'Please fill in all fields correctly';

  @override
  String get slotUsedUpgrade =>
      'Your free slot is used. Upgrade for more servers.';

  @override
  String get addServerFailed => 'Failed to add server. Check your details.';

  @override
  String get ipAddressLabel => 'IP address';

  @override
  String get platformLabel => 'Platform';

  @override
  String get bedrockLabel => 'Bedrock';

  @override
  String get addLabel => 'Add';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusChecking => 'Checking...';

  @override
  String get failedUpdateNotifications => 'Failed to update notifications';

  @override
  String get editServerTitle => 'Edit server';

  @override
  String get serverNameHint => 'Server name';

  @override
  String get failedSave => 'Failed to save. Try again.';

  @override
  String get serverRenamed => 'Server renamed';

  @override
  String get customizeLabel => 'Customize';

  @override
  String get customizeSubtitle => 'Navigation bar and colors';

  @override
  String get resetLabel => 'Reset';

  @override
  String get navigationSection => 'NAVIGATION';

  @override
  String get navFixed => 'Connector and Profile are always fixed';

  @override
  String get leftSlot => 'Slot 2';

  @override
  String get outerSlot => 'Slot 1';

  @override
  String get rightSlot => 'Slot 3';

  @override
  String get farSlot => 'Slot 4';

  @override
  String get colorPickerApply => 'Apply';

  @override
  String get colorPickerHex => 'Hex';

  @override
  String get textColorSection => 'TEXT COLOR';

  @override
  String get textColorPickerTitle => 'Text Color';

  @override
  String get textColorHint => 'Tap the circle to pick a custom text colour';

  @override
  String get textColorPreviewPrimary => 'Primary';

  @override
  String get textColorPreviewSecondary => 'Secondary';

  @override
  String get textColorPreviewMuted => 'Muted';

  @override
  String get colorSwatchCustom => 'Custom';

  @override
  String get accentColorSection => 'ACCENT COLOR';

  @override
  String get opacityLabel => 'Opacity';

  @override
  String get backgroundSection => 'BACKGROUND';

  @override
  String get cardsSection => 'CARDS';

  @override
  String get editLabel => 'Edit';

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
  String get reportUser => 'Report user';

  @override
  String reportUserWithName(Object name) {
    return 'Report $name';
  }

  @override
  String get reportDisclaimer =>
      'Reports are reviewed by our team. False reports may result in action against your account.';

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
  String get playerLookupSubtitle =>
      'Search for a Java or Bedrock player by username';

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
  String get addFriend => 'Add Friend';

  @override
  String get send => 'Send';

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
  String get deleteAccountBody =>
      'This will permanently delete your account and all data. This action cannot be undone.';

  @override
  String get deletePermanently => 'Delete Permanently';

  @override
  String get couldNotDeleteAccount =>
      'Could not delete account. Please try again.';

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
  String get emailDifferentMethod =>
      'This email is linked to a different sign-in method';

  @override
  String get googleSignInFailed => 'Google sign-in failed. Please try again.';

  @override
  String get appleSignInFailed => 'Apple sign-in failed. Please try again.';

  @override
  String get resetPasswordTitle => 'Reset Password';

  @override
  String get resetPasswordBody =>
      'Enter your email address and we will send you a link to reset your password.';

  @override
  String get emailAddressHint => 'Email address';

  @override
  String get sendLink => 'Send link';

  @override
  String resetLinkSent(Object email) {
    return 'If an account exists for $email, a reset link is on its way';
  }

  @override
  String get invalidEmailError => 'The email address is not valid';

  @override
  String get couldNotSendResetEmail =>
      'Could not send reset email. Please try again.';

  @override
  String get enterEmailAndPassword => 'Please enter your email and password';

  @override
  String get incorrectEmailOrPassword => 'Incorrect email or password';

  @override
  String get emailAlreadyInUse => 'This email address is already in use';

  @override
  String get weakPassword =>
      'Password is too weak. Please choose a stronger one.';

  @override
  String get createAccount => 'Create Account';

  @override
  String get signInSubtitle =>
      'Sign in to access your profile, friends, and chats.';

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
  String get chooseUsernameSubtitle =>
      'Pick a username so other players can find you.';

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
  String get linkAccountsHint =>
      'Link your Minecraft accounts to show your skins and stats.';

  @override
  String get linkXbox => 'Link Xbox';

  @override
  String get linkJava => 'Link Java';

  @override
  String get profileUpdated => 'Profile updated';

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
  String get skinsMustBe64 => 'Skin must be 64×64 pixels';

  @override
  String get skinsInvalidFile => 'Invalid image file';

  @override
  String get skinsUpload => 'Upload';

  @override
  String get skinsCreate => 'Create';

  @override
  String get skinsDownload => 'Download';

  @override
  String get chooseUniqueUsername => 'Choose a unique username to get started.';

  @override
  String get usernameFieldLabel => 'Username';

  @override
  String get usernameExampleHint => 'e.g. CoolPlayer123';

  @override
  String get usernameFormatHint =>
      '3–20 characters · letters, numbers and underscores only';

  @override
  String get displayNameOptional => 'Display Name (optional)';

  @override
  String get displayNameExampleHint => 'e.g. Cool Player';

  @override
  String get usernameRequired => 'Username is required';

  @override
  String get usernameFormatError =>
      'Username must be 3–20 characters and contain only letters, numbers and underscores';

  @override
  String get usernameTaken => 'This username is already taken';

  @override
  String get noConnectionError =>
      'No connection. Check your internet and try again.';

  @override
  String get info => 'Info';

  @override
  String get navProfile => 'Profile';

  @override
  String serverRemoved(Object name) {
    return '$name removed';
  }

  @override
  String serverAdded(Object name) {
    return '$name added';
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
  String get paywallSubtitle =>
      'Track more servers and get notified\nwhen they go online or offline.';

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
  String get serversSection => 'Servers';

  @override
  String get selectBedrockAccount => 'Select Bedrock account';

  @override
  String get infoAndLegal => 'Info & Legal';

  @override
  String get legalSection => 'Legal';

  @override
  String get privacyPolicy => 'privacy policy';

  @override
  String get privacyPolicySubtitle => 'How we collect and protect your data';

  @override
  String get termsOfService => 'terms of service';

  @override
  String get termsOfServiceSubtitle => 'Rules and conditions of use';

  @override
  String get dataSourcesSection => 'Data Sources & Credits';

  @override
  String get creditMojangTitle => 'Mojang / Microsoft';

  @override
  String get creditMojangSubtitle =>
      'Java player skins, UUIDs, and profile data via the official Mojang API.';

  @override
  String get creditGeyserTitle => 'GeyserMC';

  @override
  String get creditGeyserSubtitle =>
      'Bedrock skin rendering. Skins for Bedrock players are fetched via the GeyserMC skin server.';

  @override
  String get creditXboxTitle => 'Xbox / Microsoft';

  @override
  String get creditXboxSubtitle =>
      'Bedrock account linking via Xbox Live. Gamertags and XUIDs are retrieved through the Microsoft authentication flow.';

  @override
  String get aboutMCCompanionSection => 'About MCCompanion';

  @override
  String get aboutMCCompanionDisclaimer =>
      'MCCompanion is an independent application and is not affiliated with, endorsed by, or sponsored by Mojang Studios or Microsoft Corporation.';

  @override
  String get minecraftTrademark =>
      '\"Minecraft\" is a trademark of Microsoft Corporation.';

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
  String get xboxLinkTitle => 'Link Xbox Account';

  @override
  String get xboxStartingLogin => 'Starting Xbox login…';

  @override
  String get xboxSignInWithMicrosoft => 'Sign in with Microsoft';

  @override
  String get xboxGoToLink =>
      'Go to the link below and enter the code to connect your Xbox account.';

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
  String get xboxCouldNotStart =>
      'Could not start Xbox login. Please try again.';

  @override
  String get xboxCodeExpired => 'The code expired. Please try again.';

  @override
  String get xboxSomethingWrong => 'Something went wrong. Please try again.';

  @override
  String get tryAgain => 'Try again';

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
  String get trackerLimitReached => 'Server limit reached';

  @override
  String get upgradeButton => 'Upgrade';

  @override
  String get javaLinkTitle => 'Link Java Edition';

  @override
  String get javaStartingLogin => 'Starting Microsoft login…';

  @override
  String get javaSignInWithMicrosoft => 'Sign in with Microsoft';

  @override
  String get javaGoToLink =>
      'Go to the link below and enter the code to connect your Minecraft Java Edition account.';

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
  String get javaNoJavaBody =>
      'The Microsoft account you signed in with does not own Minecraft Java Edition.';

  @override
  String get javaTryDifferentAccount => 'Try a different account';

  @override
  String get javaCouldNotStart =>
      'Could not start Microsoft login. Please try again.';

  @override
  String get javaCodeExpired => 'The code expired. Please try again.';

  @override
  String get javaSomethingWrong => 'Something went wrong. Please try again.';

  @override
  String get javaCodeCopied => 'Code copied to clipboard';

  @override
  String get featureLabelConnector => 'Connector';

  @override
  String get featureLabelSkins => 'Skins';

  @override
  String get featureLabelPartners => 'Server list';

  @override
  String get featureLabelLookup => 'Lookup';

  @override
  String get featureLabelTracker => 'Server Tracker';

  @override
  String get userSearchHint => 'Username, gamertag or Java name…';

  @override
  String get userSearchSub => 'Search by username, Xbox gamertag or Java name';

  @override
  String get upgradeWindowsHint => 'Upgrade available via the Microsoft Store';

  @override
  String get skinSaved => 'Skin saved';

  @override
  String skinSavedAs(String name) {
    return 'Saved as \"$name\"';
  }

  @override
  String get skinExportFailed => 'Export failed';

  @override
  String get skinExported => 'Skin exported successfully';

  @override
  String get accountActions => 'Account';

  @override
  String get feedbackBugReport => 'Bug Report';

  @override
  String get feedbackFeatureRequest => 'Feature Request';

  @override
  String get feedbackTitleLabel => 'Title';

  @override
  String get feedbackTitleHintBug =>
      'e.g. App crashes when opening skin editor';

  @override
  String get feedbackTitleHintFeature =>
      'e.g. Show player ping in the server list';

  @override
  String get feedbackWhatHappened => 'What happened?';

  @override
  String get feedbackDescribeIdea => 'Describe your idea';

  @override
  String get feedbackDescHintBug =>
      'Describe the bug: what did you do, what did you expect, and what happened instead?';

  @override
  String get feedbackDescHintFeature =>
      'Explain what you\'d like and why it would be useful.';

  @override
  String get feedbackSubmitBug => 'Submit Bug Report';

  @override
  String get feedbackSubmitFeature => 'Submit Feature Request';

  @override
  String get feedbackDisclaimer =>
      'Goes to our team · Don\'t include passwords';

  @override
  String get feedbackSuccessTitle => 'Thanks for the feedback!';

  @override
  String get feedbackSuccessBody =>
      'Thanks! Your report is in. We reply in the app, so check back here for an answer.';

  @override
  String get feedbackSubmitAnother => 'Submit another';

  @override
  String get feedbackBackToApp => 'Back to app';

  @override
  String get feedbackTitleTooShort => 'Title must be at least 5 characters.';

  @override
  String get feedbackDescTooShort =>
      'Description must be at least 10 characters.';

  @override
  String get feedbackSubmitFailed => 'Failed to submit. Please try again.';

  @override
  String get feedbackTileTitle => 'Feedback';

  @override
  String get feedbackTileSubtitle => 'Help us improve MCCompanion';

  @override
  String get friendsHowToStep1 => 'Open the Xbox app on your phone or console.';

  @override
  String get friendsHowToStep2 =>
      'Add one of the bots below as a friend on Xbox.';

  @override
  String get friendsHowToStep3 => 'Open Minecraft and go to the Friends tab.';

  @override
  String get friendsHowToStep4 =>
      'Look for your server under LAN Worlds and join.';

  @override
  String get friendsHowToNote =>
      '⚠️ Every time you want to play, you need to start Friends mode in the MCCompanion app first. You can close the app after starting.';

  @override
  String get friendsBotLoadError =>
      '⚠️ Could not load bot list. Try again later.';

  @override
  String get regionEurope => 'Europe';

  @override
  String get regionUnitedStates => 'United States';

  @override
  String get yourRegion => 'YOUR REGION';

  @override
  String get botStatusOffline => 'Offline';

  @override
  String get botStatusFull => 'Full';

  @override
  String botFriendCount(Object current, Object max) {
    return '$current / $max friends';
  }

  @override
  String botCopied(Object gamertag) {
    return 'Copied $gamertag';
  }

  @override
  String get copyLabel => 'Copy';

  @override
  String get skinSavedToDocuments => 'Skin saved to Documents';

  @override
  String get skinMenuExport => 'Export';

  @override
  String get skinMenuDelete => 'Delete';

  @override
  String get rpScreenTitle => 'Resource Pack';

  @override
  String get rpWhatWorks => 'Supported formats';

  @override
  String get rpSupportedBedrockOnly => 'Bedrock Edition only (.mcpack or .zip)';

  @override
  String get rpSupportedBedrockOnlyHint =>
      'Java packs don\'t work on consoles.';

  @override
  String get rpSupportedTexture => 'Resource packs & texture packs';

  @override
  String get rpSupportedTextureHint =>
      'These are officially supported and work reliably.';

  @override
  String get rpUnsupportedShaders => 'Shaders, behavior packs, skin packs';

  @override
  String get rpUnsupportedShadersHint =>
      'These won\'t load on consoles via MCCompanion.';

  @override
  String get rpUnsupportedAddons => 'Add-ons & UI mods';

  @override
  String get rpUnsupportedAddonsHint =>
      'May sometimes work, but not officially supported. Use at your own risk.';

  @override
  String get rpNoDiscord => 'Discord links';

  @override
  String get rpNoDrive => 'Google Drive / Dropbox share links';

  @override
  String get rpNoEncrypted => 'Encrypted or password-protected packs';

  @override
  String get rpConsolePerformanceTitle => 'Console performance';

  @override
  String get rpConsolePerformanceBody =>
      'High-resolution texture packs can cause lag or crashes on consoles. If you experience issues, switch to a lower-resolution pack or select a lighter subpack if the pack supports it.';

  @override
  String get rpWarnDiscord =>
      'Discord links expire and will stop working. Use a permanent host instead.';

  @override
  String get rpWarnHttps => 'URL must start with https://';

  @override
  String get rpWarnExtension => 'URL must end in .mcpack or .zip';

  @override
  String get rpToastSaved => 'Resource pack settings saved.';

  @override
  String get rpInvalidPackFormat =>
      'This is a Java Edition pack and is not supported. Please use a Bedrock Edition resource pack.';

  @override
  String get rpBehaviorContentWarning =>
      'This pack contains behavior pack data, which won\'t work on servers. The textures will still work.';

  @override
  String get rpClearMinecraftTitle => 'First time with this pack?';

  @override
  String get rpClearStep1 =>
      'Open Minecraft on your console and go to Settings → Storage';

  @override
  String get rpClearStep2 =>
      'Tap ‘Clear’ or ‘Reset’ next to Resource Packs. This removes all locally cached packs.';

  @override
  String get rpClearStep3 =>
      'Reconnect through MCCompanion. The merged pack will download automatically.';

  @override
  String get rpRelayTitle => 'Pack looks wrong?';

  @override
  String get rpRelayBody =>
      'The relay caches the merged pack for 1 hour using your overlay URL as the cache key. To force a fresh merge, change your pack URL slightly (e.g. add ?v=2 at the end) and save. After that, also clear Minecraft\'s pack cache. The merged pack still uses the server\'s UUID, so Minecraft will otherwise serve the old cached version.';

  @override
  String get rpNoDiscordHint =>
      'Links expire after a few hours and can\'t be used as a permanent pack URL.';

  @override
  String get rpNoDriveHint =>
      'Not a direct download, sends you to a preview page instead.';

  @override
  String get rpNoEncryptedHint =>
      'MCCompanion cannot read or merge encrypted pack content.';

  @override
  String get rpClearWhy =>
      'Minecraft caches resource packs by their UUID. The merged pack keeps the server\'s original UUID, so if Minecraft already has the server\'s pack cached from a previous session, it won\'t re-download the new merged version. Clear the cache so Minecraft picks up the fresh merged pack.';

  @override
  String get rpUploadTab => 'Upload';

  @override
  String get rpUploadButton => 'Tap to select your pack';

  @override
  String get rpUploadHint => '.mcpack or .zip • max 100 MB';

  @override
  String get rpUploading => 'Uploading...';

  @override
  String get rpMergerTitle => 'RP Merger';

  @override
  String get rpMergerPriorityHint =>
      'Top pack has highest priority: its files win conflicts.';

  @override
  String get rpMergerTopBadge => 'TOP';

  @override
  String get rpMergerAddPacks => 'Add resource packs';

  @override
  String rpMergerAddAnother(int current) {
    return 'Add another pack ($current/4)';
  }

  @override
  String get rpMergerFileTypes => '.zip or .mcpack';

  @override
  String get rpMergerMerging => 'Merging…';

  @override
  String rpMergerButton(int count) {
    return 'Merge $count packs';
  }

  @override
  String get rpMergerSetActiveToast => 'Set as active resource pack';

  @override
  String get rpDisabled => 'Disabled';

  @override
  String get rpNoPackSelected => 'No resource pack selected';

  @override
  String get rpActiveOnConnect => 'Active: applied on connect';

  @override
  String get rpBrowseSubtitle => 'Curated packs, ready to use';

  @override
  String get rpBrowseEmpty => 'No packs available yet';

  @override
  String get rpBrowseEmptyHint => 'Check back later for curated packs.';

  @override
  String get rpReplaceFile => 'Replace with another file';

  @override
  String get rpDropToUpload => 'Drop to upload';

  @override
  String get rpTabBrowseInfo =>
      'Browse curated packs selected by MCCompanion. Tap Use to activate a pack instantly, no upload or link needed.';

  @override
  String get rpTabUploadInfo =>
      'Upload your own .mcpack or .zip file. MCCompanion stores it securely in the cloud and sends it to your console every time you connect.';

  @override
  String get rpTabMergeInfo =>
      'Combine 2 to 4 packs into one. The merged pack is uploaded to MCCompanion Cloud and activated automatically.';

  @override
  String get shareLabel => 'Share';

  @override
  String get sectionMinecraftAccounts => 'Minecraft Accounts';

  @override
  String get sectionSettings => 'Settings';

  @override
  String get avatarUpdated => 'Avatar updated';

  @override
  String get uploadFailed => 'Upload failed';

  @override
  String get profileLinkCopied => 'Profile link copied!';

  @override
  String get shareProfileTooltip => 'Share profile';

  @override
  String get profileFallbackTitle => 'Profile';

  @override
  String get noUsersFound => 'No users found';

  @override
  String get skinLabel => 'SKIN';

  @override
  String get skinsLabel => 'SKINS';

  @override
  String get javaEditionBadge => 'Java';

  @override
  String get bedrockEditionBadge => 'Bedrock';

  @override
  String get downloadLabel => 'Download';

  @override
  String get justNow => 'Just now';

  @override
  String minutesAgo(int count) {
    return '${count}m ago';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h ago';
  }

  @override
  String daysAgo(int count) {
    return '${count}d ago';
  }

  @override
  String get rpPackInfo => 'Info';

  @override
  String get rpUseThisPack => 'Use this pack';

  @override
  String get rpViewOnWebsite => 'View on website →';

  @override
  String rpDownloads(int count) {
    return '$count downloads';
  }

  @override
  String get skinsSavedToMySkins => 'Saved to My Skins';

  @override
  String get skinsDownloadFailed => 'Download failed';

  @override
  String get skinsDeletedFromCloud => 'Deleted from cloud';

  @override
  String get skinsDeleteFailed => 'Delete failed';

  @override
  String get skinsLoginToUpload => 'Log in to upload skins';

  @override
  String get skinsUploading => 'Uploading…';

  @override
  String get skinUploaded => 'Skin uploaded!';

  @override
  String skinUploadFailed(String error) {
    return 'Upload failed: $error';
  }

  @override
  String get skinsEmptyLocalSkins =>
      'No skins yet. Create or upload a skin to get started.';

  @override
  String get skinUploadToWebsite => 'Upload to website';

  @override
  String get skinReuploadToWebsite => 'Re-upload to website';

  @override
  String get skinCloudEdit => 'Edit';

  @override
  String get skinCloudSaveToDevice => 'Save to device';

  @override
  String get skinCloudDelete => 'Delete from cloud';

  @override
  String get skinsTabGallery => 'Gallery';

  @override
  String get skinsTopLabel => 'Top 30';

  @override
  String get skinsAllLabel => 'All Skins';

  @override
  String get skinUploadToCloud => 'Upload to Cloud';

  @override
  String get skinSaveDialog => 'Save Skin';

  @override
  String get skinNameHint => 'Skin name';

  @override
  String get skinDefaultName => 'My Skin';

  @override
  String get skinUpdatedInCloud => 'Skin updated in cloud';

  @override
  String skinByCreator(String name) {
    return 'by $name';
  }

  @override
  String skinLikesCount(int count) {
    return '$count likes';
  }

  @override
  String get sectionRecentActivity => 'Recent Activity';

  @override
  String get activityNoEvents => 'No recent activity yet.';

  @override
  String get activitySkinUploaded => 'Uploaded skin';

  @override
  String get activitySkinLiked => 'Liked a skin';

  @override
  String get activityPackSubmitted => 'Submitted pack';

  @override
  String get activityPackApproved => 'Pack approved';

  @override
  String get activityPackRejected => 'Pack not approved';

  @override
  String get timeJustNow => 'just now';

  @override
  String timeMinutesAgo(int count) {
    return '${count}m ago';
  }

  @override
  String timeHoursAgo(int count) {
    return '${count}h ago';
  }

  @override
  String timeDaysAgo(int count) {
    return '${count}d ago';
  }

  @override
  String timeMonthsAgo(int count) {
    return '${count}mo ago';
  }

  @override
  String get sectionNotifications => 'Notifications';

  @override
  String get sectionNotificationTypes => 'Notification Types';

  @override
  String get notifMarkAllRead => 'Mark all read';

  @override
  String get notifEmpty =>
      'No notifications yet. Likes, comments, and friend activity will appear here.';

  @override
  String get notifSomeone => 'Someone';

  @override
  String notifSkinLiked(String actor) {
    return '$actor liked your skin';
  }

  @override
  String notifCommentReceived(String actor) {
    return '$actor commented on your skin';
  }

  @override
  String get notifPackApproved => 'Pack approved';

  @override
  String get notifPackRejected => 'Pack not approved';

  @override
  String notifFriendRequest(String actor) {
    return '$actor sent you a friend request';
  }

  @override
  String notifFriendAccepted(String actor) {
    return '$actor accepted your request';
  }

  @override
  String notifMessageReceived(String actor) {
    return 'New message from $actor';
  }

  @override
  String get notifPrefSkinLiked => 'Skin liked';

  @override
  String get notifPrefCommentReceived => 'Comment received';

  @override
  String get notifPrefPackApproved => 'Pack approved';

  @override
  String get notifPrefPackRejected => 'Pack rejected';

  @override
  String get notifPrefFriendRequest => 'Friend request';

  @override
  String get notifPrefFriendAccepted => 'Friend accepted';

  @override
  String get notifPrefMessageReceived => 'New message';

  @override
  String get commentsTitle => 'Comments';

  @override
  String get commentsEmpty => 'No comments yet. Be the first!';

  @override
  String get commentsPlaceholder => 'Write a comment…';

  @override
  String get loadMore => 'Load more';

  @override
  String get skinLayerInner => 'Inner';

  @override
  String get skinLayerOuter => 'Outer';

  @override
  String get feedbackLoginRequiredTitle => 'Log in to send feedback';

  @override
  String get feedbackLoginRequiredBody =>
      'Feedback is linked to your MCCompanion account so we can reply to you directly in the app.';

  @override
  String get feedbackLoginButton => 'Log in';

  @override
  String get supportInboxTitle => 'Support inbox';

  @override
  String get skinShareSubject => 'Minecraft Skin';

  @override
  String get skinEditorTitle => 'Skin Editor';

  @override
  String get skinToolUndo => 'Undo';

  @override
  String get skinSaveToMySkins => 'Save to My Skins';

  @override
  String get skinUpdateInCloud => 'Update in cloud';

  @override
  String get skinExportPng => 'Export PNG';

  @override
  String get skinToolDraw => 'Draw';

  @override
  String get skinToolFill => 'Fill';

  @override
  String get skinToolErase => 'Erase';

  @override
  String get customColour => 'Custom colour';

  @override
  String get featuredServerLabel => 'FEATURED SERVER';

  @override
  String get featuredServerTagline => 'Hop in and start playing.';

  @override
  String get featuredServerPlay => 'Play';

  @override
  String rpUploadFailedCode(int code) {
    return 'Upload failed ($code)';
  }

  @override
  String rpUploadFailed(String error) {
    return 'Upload failed: $error';
  }

  @override
  String get rpLoadFailed => 'Could not load packs';

  @override
  String get rpRetry => 'Retry';

  @override
  String get rpSearchHint => 'Search packs…';

  @override
  String rpMergeFailed(String error) {
    return 'Merge failed: $error';
  }

  @override
  String get rpMergerSize => 'Size';

  @override
  String get rpMergerCreated => 'Created';

  @override
  String get rpMergerSourcePacks => 'Source packs';

  @override
  String get rpMergerDropToAdd => 'Drop to add';

  @override
  String get rpMergerSavedMerges => 'Saved merges';

  @override
  String get rpMergerUse => 'Use';

  @override
  String get supportInboxShared => 'Shared with all admins';

  @override
  String get supportInboxEmpty => 'No support chats yet';

  @override
  String get supportReplyingAs => 'Replying as MCCompanion Support';

  @override
  String get relayBlocked =>
      'Your IP or account is blocked by MCCompanion. If you think this is a mistake, join our Discord.';

  @override
  String relayBlockedWithReason(String reason) {
    return 'Your IP or account is blocked by MCCompanion.\nReason: $reason\nIf you think this is a mistake, join our Discord.';
  }

  @override
  String relayConfigFailed(int code) {
    return 'Could not set up the relay (status $code). Try another relay, or join our Discord.';
  }

  @override
  String relayConfigFailedDetail(int code, String detail) {
    return 'Could not set up the relay (status $code): $detail. Try another relay, or join our Discord.';
  }

  @override
  String get relayTimeout => 'The relay did not respond in time.';

  @override
  String get relayUnreachable => 'Could not reach the relay.';

  @override
  String get lookupNotFound => 'Player not found.';

  @override
  String get lookupNetworkError => 'Network error. Please try again.';

  @override
  String get lookupBedrockUnavailable =>
      'Bedrock lookup is not available right now.';

  @override
  String get lookupFailed => 'Lookup failed.';

  @override
  String get myFeedbackTitle => 'My feedback';

  @override
  String get myFeedbackEmpty => 'You have not sent us anything yet.';

  @override
  String get myFeedbackOpenList => 'My feedback';

  @override
  String get fbStatusOpen => 'Open';

  @override
  String get fbStatusPlanned => 'Planned';

  @override
  String get fbStatusInProgress => 'In progress';

  @override
  String get fbStatusImplemented => 'Done';

  @override
  String get fbStatusNotPlanned => 'Not planned';

  @override
  String get fbStatusDuplicate => 'Duplicate';

  @override
  String get fbNoReplies => 'No replies yet. We will let you know here.';

  @override
  String get fbReplyHint => 'Add something to this report…';

  @override
  String get fbFromTeam => 'MCCompanion';

  @override
  String get fbFromYou => 'You';

  @override
  String get feedbackGoesToTeam => 'Goes straight to the team';

  @override
  String get notifFeedbackStatus => 'Update on your feedback';

  @override
  String get notifFeedbackReply => 'Reply on your feedback';

  @override
  String get adminTicketsHeader => 'Reports and requests';

  @override
  String get adminTicketReplyHint => 'Reply about this ticket…';

  @override
  String get chooseServerTitle => 'Choose a server';

  @override
  String get changeLabel => 'Change';

  @override
  String get howToAutoShow => 'Show this when I start';

  @override
  String get skinEditorLoadFailed =>
      'Could not load that skin. Starting from the default one.';

  @override
  String get skinToolRecolour => 'Recolour';

  @override
  String get skinToolPick => 'Pick';

  @override
  String get skinBases => 'Bases';

  @override
  String get skinBasesTitle => 'Start from a base';

  @override
  String get skinBasesSubtitle =>
      'This replaces what is on the canvas. Undo brings it back.';

  @override
  String get skinMirror => 'Mirror';

  @override
  String get skinSurprise => 'Surprise';

  @override
  String get skinToolFillHint => 'Fills the patch you tap';

  @override
  String get skinToolRecolourHint =>
      'Changes that colour everywhere on the skin';

  @override
  String get skinToolPickHint => 'Takes the colour you tap';

  @override
  String get skinModelClassic => 'Wide';

  @override
  String get skinModelSlim => 'Slim';

  @override
  String get shareServerLabel => 'Share your server';

  @override
  String get shareServerOn => 'Friends can see which server you are on';

  @override
  String get shareServerOff => 'Friends see you are playing, not where';

  @override
  String directHostNotFound(String host) {
    return 'Could not find $host. Check the address and try again.';
  }

  @override
  String get directPortBusy =>
      'Could not open the local port. Stop the current connection first.';

  @override
  String directAddressNotSupported(String host) {
    return '$host is an IPv6 address. Proxy/Direct Mode only supports IPv4. Use the IPv4 address or the hostname instead.';
  }

  @override
  String termsAgreement(String terms, String privacy) {
    return 'I agree to the $terms and the $privacy.';
  }

  @override
  String get verifyEmailTitle => 'Verify your email';

  @override
  String get verifyEmailBody =>
      'Needed before you can comment, upload skins or submit packs.';

  @override
  String get verifyEmailSent => 'Sent, check your inbox.';

  @override
  String get verifyEmailSending => 'Sending…';

  @override
  String get verifyEmailSend => 'Send link';

  @override
  String updateAvailableTitle(Object version) {
    return 'Version $version is available';
  }

  @override
  String updateAvailableBody(Object current) {
    return 'You are running $current. This build does not update itself.';
  }

  @override
  String get updateAvailableAction => 'Download';

  @override
  String get updateAvailableDismiss => 'Not now';

  @override
  String get serverListSearchHint => 'Search by name or address';

  @override
  String get serverListEditionAny => 'Java and Bedrock';

  @override
  String get serverListEditionJava => 'Java only';

  @override
  String get serverListEditionBedrock => 'Bedrock only';

  @override
  String get serverListSortVotes => 'Most votes';

  @override
  String get serverListSortPlayers => 'Most players';

  @override
  String get serverListSortPeak => 'Highest peak';

  @override
  String get serverListSortNewest => 'Newest';

  @override
  String get serverListSortName => 'Name';

  @override
  String get serverListAllCategories => 'All';

  @override
  String get serverListLoadFailed => 'Could not load the server list';

  @override
  String get serverListLoadFailedHint => 'Pull down to try again';

  @override
  String get serverListNoMatch => 'No servers match that';

  @override
  String get serverListNoMatchHint => 'Try a different search or category';

  @override
  String get serverCardPlay => 'Play';

  @override
  String get serverCardVote => 'Vote';

  @override
  String get serverCardViewServer => 'View server';

  @override
  String get serverCopyIp => 'Copy IP';

  @override
  String get serverCopied => 'Copied';

  @override
  String get serverStatPlayers => 'Players';

  @override
  String get serverStatPeak => 'Peak';

  @override
  String get serverStatUptime => 'Uptime';

  @override
  String get serverStatVotesMonth => 'Votes this month';

  @override
  String get serverBadgeFeatured => 'Featured';

  @override
  String get serverEditionJava => 'Java';

  @override
  String get serverEditionBedrock => 'Bedrock';

  @override
  String get serverEditionCrossplay => 'Crossplay';

  @override
  String get serverSectionMotd => 'Message of the day';

  @override
  String get serverLinkDiscord => 'Discord';

  @override
  String get serverLinkWebsite => 'Website';

  @override
  String get serverVotesThisMonth => 'This month';

  @override
  String get serverVotesAllTime => 'All time';

  @override
  String get serverVoteSignInRequired => 'Sign in to vote from the app.';

  @override
  String serverVoteSheetTitle(String name) {
    return 'Vote for $name';
  }

  @override
  String get serverVoteSheetSubtitle =>
      'Your Minecraft name, so the server knows who to reward.';

  @override
  String get serverVoteSheetHint => 'Steve';

  @override
  String get serverVoteSheetButton => 'Vote';

  @override
  String get serverVoteSheetLimit => 'One vote per server per day.';

  @override
  String get serverVoteDelivered => 'Voted. Your reward is on its way.';

  @override
  String get serverVoteNoRewards => 'Voted. This server has no rewards set up.';

  @override
  String get serverVoteFailed => 'That did not work, please try again.';

  @override
  String get serverVoteOffline =>
      'Could not reach the server. Check your connection.';

  @override
  String get feedbackViewYourReport => 'View your report';

  @override
  String get showMore => 'More';

  @override
  String get showLess => 'Less';
}
