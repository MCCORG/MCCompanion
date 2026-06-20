// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'MCCompanion';

  @override
  String get console => 'Console';

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
  String get joinUs => 'Join Us';

  @override
  String get more => 'More';

  @override
  String get website => 'Website';

  @override
  String get howToUseMenu => 'How to use';

  @override
  String get support => 'Support';

  @override
  String helpText(Object appCreator) {
    return 'Created by $appCreator.\n\nHow to use:\n1. Enter your Minecraft server address and port (default: 19132)\n   — or select a previously saved server from the dropdown\n2. (Optional) Choose a Relay Server (EU or US) closest to your location\n3. Click \"Start Broadcasting\" to begin\n4. On your console/device: Minecraft > Play > Friends\n5. You should see a LAN server called \"MCCompanion\"\n6. Click it to join your external server via MCCompanion\n\nNintendo Switch (DNS mode):\n1. Enable \"Nintendo Switch\" in the connection panel\n2. Select a Relay Server (EU or US)\n3. Click \"Send DNS Config\" — this sends your config to the relay\n   (it does NOT broadcast a LAN server)\n4. On your Switch, apply your MCCompanion DNS setup and join\n   using the server entry you use for MCCompanion\n\nNotes:\n- For LAN broadcasting, MCCompanion and console must be on the same local network.\n- Tip: Choose the relay server closest to you for the best performance.';
  }

  @override
  String get serverDetailsLabel => 'Server Details';

  @override
  String get start => 'Start';

  @override
  String get stop => 'Stop';

  @override
  String get labelJava => 'Java';

  @override
  String get startJavaMode => 'Start Java Mode';

  @override
  String get javaInfoTitle => 'Java Mode';

  @override
  String get javaInfoText => 'Connect to Java Edition servers';

  @override
  String get howToJavaTitle => 'Java Mode';

  @override
  String get howToJavaSubtitle => 'Connect to Java Edition servers via MCCompanion';

  @override
  String get aternosSubtext => 'Create your own free Minecraft server';

  @override
  String get howToJavaBody => 'Java Mode — quick steps:\n1. In the app, select Java mode.\n2. Enter your Java Edition server address and port (default: 25565).\n3. Press \"Start Java Mode\" — MCCompanion bridges the connection.\n4. Open Minecraft Bedrock and go to the Friends tab.\n5. Select the LAN server named \"MCCompanion\" to join the Java server.\n\n⚠️ Important warnings:\n- A valid Java Edition account (Microsoft) is required.\n- Some servers use anti-cheat systems that may detect and ban your account.\n- Certain servers explicitly prohibit Bedrock clients — always check the server rules.\n- MCCompanion is not responsible for any account bans, suspensions, or other account-related issues that may result from using this feature.\n- Use at your own risk.';

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
  String get myServers => 'My Servers';

  @override
  String get quickAccessServers => 'Quick access servers';

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
  String get initializing => 'Initializing...';

  @override
  String get createdBy => 'Created by NetherDev';

  @override
  String get bedrockBridge => 'Bedrock Bridge';

  @override
  String get clientDisconnected => 'Client disconnected — Broadcast stopped';

  @override
  String get pleaseEnterServer => '⚠️ Please enter a server address';

  @override
  String get invalidPort => '⚠️ Invalid port number (1-65535)';

  @override
  String get dnsConfigSent => '✅ DNS config sent to relay';

  @override
  String get broadcastingStarted => 'Broadcasting started';

  @override
  String get broadcastStopped => 'Broadcast stopped';

  @override
  String selectedServer(Object name) {
    return '📋 Selected: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'Selected: $name';
  }

  @override
  String get noLogsToCopy => 'No logs to copy';

  @override
  String copiedLogs(Object count) {
    return 'Copied $count log entries to clipboard';
  }

  @override
  String get debugEnabled => 'Debug logs enabled';

  @override
  String get debugDisabled => 'Debug logs disabled';

  @override
  String get howToUseTitle => 'How to use MCCompanion';

  @override
  String get iUnderstand => 'I understand';

  @override
  String get playOnSwitchTitle => 'Play on Nintendo Switch';

  @override
  String get playWithFriendsTitle => 'Play with Friends';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'Selected: $relayName\n\nHow to connect:\n1. Go to your Switch Settings and change the DNS to: $relayIp\n2. Open Minecraft and select a server from the list (like Cubecraft or Hive).\n3. You will now be sent to your own server automatically.';
  }

  @override
  String playInstructionsFriends(Object friend) {
    return 'How to connect:\n1. On your console, add $friend as a friend.\n2. Open Minecraft and go to the Friends tab.\n3. Look for your server under LAN Worlds and select it to join.';
  }

  @override
  String get nldServerLabel => 'MCCompanion SERVER';

  @override
  String selectRelayLabel(Object name) {
    return 'Select relay $name';
  }

  @override
  String get noSavedServers => 'No saved servers';

  @override
  String get savedServers => 'Saved servers';

  @override
  String get serverAddressHint => 'Server Address';

  @override
  String get portHint => 'Port';

  @override
  String get manageServers => 'Manage servers';

  @override
  String get manageServersTooltip => 'Manage servers';

  @override
  String get noServerYet => 'No saved servers yet.\nTap Manage to add one.';

  @override
  String get serverNotSelected => 'No server selected';

  @override
  String get ready => 'Ready';

  @override
  String get active => 'Active';

  @override
  String get vpnDetected => 'VPN Detected';

  @override
  String get noWifi => 'Not on Wi-Fi';

  @override
  String get vpnActive => 'We detected that your VPN is active.\n\nPlease disable your VPN before using MCCompanion, otherwise the LAN broadcast may not reach your console.';

  @override
  String get mobileActive => 'Detected: Mobile Data\n\nMCCompanion needs to be on the same network as your console. Please connect to your home Wi-Fi or hotspot before continuing.';

  @override
  String get continueAnyway => 'Continue Anyway';

  @override
  String get sameWifi => 'Same Wi-Fi Network';

  @override
  String get needSameWifi => 'The device running MCCompanion MUST be on the same Wi-Fi network as the console you play Minecraft on.';

  @override
  String get subscription => 'Online Subscription Required';

  @override
  String get needSubscription => 'Each console needs its own active online subscription (Xbox Live, PS Plus, NSO). Without it, MCCompanion won\'t appear.';

  @override
  String get updateAvailable => 'Update Available';

  @override
  String get newVersion => 'A new version of the app is available.\nUpdate now for the latest features and fixes.';

  @override
  String get later => 'Later';

  @override
  String get updateNow => 'Update Now';

  @override
  String get beforeYouStart => 'BEFORE YOU START';

  @override
  String get stopBroadcasting => 'Stop Broadcasting';

  @override
  String get startNintendoMode => 'Start Nintendo Mode';

  @override
  String get startFriendsMode => 'Start Friends Mode';

  @override
  String get startBroadcasting => 'Start Broadcasting';

  @override
  String get modeLabel => 'Mode';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'Friends';

  @override
  String get nintendoInfoTitle => 'Nintendo Switch DNS mode';

  @override
  String get nintendoInfoText => 'Start in Nintendo mode, set your DNS and join a featured server.';

  @override
  String get friendModeTitle => 'Friend mode';

  @override
  String get friendModeText => 'Add MCCompanion\'s friends bots as a friend. Start Friends mode and play';

  @override
  String get selectedRelayCheck => 'Selected';

  @override
  String relayFallbackWarning(Object name) {
    return 'Warning: original relay did not respond. Fallback relay in use: $name';
  }

  @override
  String get relayUnableConnect => 'Unable to connect to ANY MCCompanion relay server. Try again later or check your internet.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / Proxy)';

  @override
  String get howToXboxSubtitle => 'Play via LAN broadcast or proxy';

  @override
  String get howToXboxBody => 'How to connect (Xbox / PS4 / PS5):\n1. Ensure your device running MCCompanion and your console are on the same local network.\n2. In the app, enter your Minecraft server address and port and press \"Start Broadcasting\".\n3. On the console open Minecraft → Play → look for LAN Worlds or the Friends tab and refresh the list.\n4. Select the LAN server named \"MCCompanion\" to join.\nNotes:\n- If the server does not appear, confirm both devices are on the same subnet and that the app is still broadcasting.\n- Some console models or routers may block LAN discovery; try toggling the app or router settings if needed.';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (DNS mode)';

  @override
  String get howToNintendoSubtitle => 'DNS relay instructions for Switch';

  @override
  String get howToNintendoBody => 'Nintendo Switch — DNS mode (step-by-step):\n1. In the app enable \"Nintendo\" mode and select a Relay Server (EU or US).\n2. Tap \"Send DNS Config\" to push the DNS IP to the relay.\n3. On your Nintendo Switch go to System Settings → Internet → Internet Settings → (your network) → Change Settings → DNS and set the Primary DNS to the relay IP.\n4. Open Minecraft and join a public server; you will be redirected to your server using the relay DNS.\nNotes:\n- DNS mode does not broadcast a LAN server; it routes game traffic through the relay.\n- Revert your DNS after you are done if you need normal network behavior.';

  @override
  String get howToFriendsTitle => 'Friends mode';

  @override
  String get howToFriendsSubtitle => 'Invite friends and join via LAN';

  @override
  String get howToFriendsBody => 'Friends mode — quick steps:\n1. Add the MCCompanion friend account (relay friend) on your console or platform if required.\n2. In the app enable Friends mode and send the relay configuration (if applicable).\n3. On your console open Minecraft → Friends and search for LAN Worlds — your server should appear there as a LAN world.\n4. Select it to join your server with friends.\nNotes:\n- Make sure both you and your friends have the same NAT/settings that allow friend presence.\n- Friend-mode relies on platform friend features and may require accepting friend requests.';

  @override
  String get helpMCCompanionTitle => 'MCCompanion does not appear';

  @override
  String get helpMCCompanionSubtitle => 'Troubleshooting LAN discovery issues';

  @override
  String get helpMCCompanionBody => 'If the server isn\'t appearing on your console, try these steps:\n\n✅ Basic Checks:\n1. Same WiFi Network - Your phone/tablet and console MUST be on the same WiFi\n2. Correct Server Address - Double-check the IP and port (default: 19132)\n3. Broadcasting Active - Verify MCCompanion shows \"Broadcasting\" status\n\n🔄 Quick Fixes:\n• Restart the app: Stop broadcasting, close MCCompanion completely, reopen and try again\n• Restart your console: Sometimes the console needs a refresh to detect LAN games\n• Check Friends/LAN tab: The server appears under \"Friends\" or \"LAN Games\", NOT in server list\n• Wait 10-15 seconds after starting broadcasting\n• Disable VPNs: VPNs can block local broadcasts\n\n⚠️ Common Issues:\n\"No route found for user\" → Ensure both devices are on the same Wi‑Fi (avoid Guest networks)\n\"Unable to connect to MCCompanion relay server\" → Check your internet / relay status\n\n📱 Still having issues? Enable Debug Mode in MCCompanion and check logs, or try a different server.';

  @override
  String get helpMultiplayerFailedTitle => 'Multiplayer Connection Failed';

  @override
  String get helpMultiplayerFailedSubtitle => 'Explanation why this is not a MCCompanion error';

  @override
  String get helpMultiplayerFailedBody => '⚠️ This is not an issue with MCCompanion!\n\nMCCompanion successfully redirected you to the requested server. The message \"Multiplayer Connection Failed\" indicates that the target server is currently unreachable. Possible reasons:\n\n• The target Minecraft server is offline or overloaded\n• The server requires an updated client version or specific edition\n• Network issues between the relay and the target server\n\nTry connecting to a different server or contact the server\'s support. If the problem persists for multiple servers, enable Debug Mode in MCCompanion and check logs.';

  @override
  String get helpNintendoDnsTitle => 'Nintendo DNS does not work';

  @override
  String get helpNintendoDnsSubtitle => 'Common DNS / relay issues';

  @override
  String get helpNintendoDnsBody => 'If Nintendo DNS mode isn\'t working, check the following:\n\n1. Confirm you pushed DNS config from the app (Send DNS Config).\n2. Verify you applied the relay IP as Primary DNS on the Switch.\n3. Ensure the relay server selected (EU/US) is online and not overloaded.\n4. Some networks (e.g., captive portals) prevent custom DNS — test on a different network.\n\nIf issues persist, enable Debug Mode and check logs or try the Friends-mode alternative.';

  @override
  String get helpFriendsModeTitle => 'Friends mode does not work';

  @override
  String get helpFriendsModeSubtitle => 'Common friend issues';

  @override
  String get helpFriendsModeBody => 'Friends mode troubleshooting tips:\n\n1. Make sure the relay friend account is added/accepted on the console (if required).\n2. Try restarting the game and refreshing the Friends/LAN tab after enabling Friends mode.\n\nIf the server still doesn\'t appear to friends, enable Debug Mode and check logs to identify errors.';

  @override
  String get changeLanguageTitle => 'Change language';

  @override
  String get changeLanguage => 'Language';

  @override
  String get useSystemLanguage => 'Use system language';

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
  String get trackerSignInSubtitle => 'Sign in to track servers and receive offline notifications.';

  @override
  String get signIn => 'Sign in';

  @override
  String get noServersTracked => 'No servers tracked';

  @override
  String get trackerEmptySubtitle => 'Add a Minecraft server to monitor its status and receive notifications.';

  @override
  String get fillAllFields => 'Please fill in all fields correctly';

  @override
  String get slotUsedUpgrade => 'Your free slot is used. Upgrade for more servers.';

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
  String get notificationsOn => 'Notifications on';

  @override
  String get notificationsOff => 'Notifications off';

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
  String get customizeSubtitle => 'Reorder tiles and customize navigation';

  @override
  String get resetLabel => 'Reset';

  @override
  String get tilesSection => 'TILES';

  @override
  String get dragToReorder => 'Drag to reorder';

  @override
  String get navigationSection => 'NAVIGATION';

  @override
  String get navFixed => 'Home, Connector and Profile are always fixed';

  @override
  String get leftSlot => 'Left slot (next to Home)';

  @override
  String get rightSlot => 'Right slot (next to Profile)';

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
  String get chooseUniqueUsername => 'Choose a unique username to get started.';

  @override
  String get usernameFieldLabel => 'Username';

  @override
  String get usernameExampleHint => 'e.g. CoolPlayer123';

  @override
  String get usernameFormatHint => '3–20 characters · letters, numbers and underscores only';

  @override
  String get displayNameOptional => 'Display Name (optional)';

  @override
  String get displayNameExampleHint => 'e.g. Cool Player';

  @override
  String get usernameRequired => 'Username is required';

  @override
  String get usernameFormatError => 'Username must be 3–20 characters and contain only letters, numbers and underscores';

  @override
  String get usernameTaken => 'This username is already taken';

  @override
  String get noConnectionError => 'No connection. Check your internet and try again.';

  @override
  String get home => 'Home';

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
  String get paywallSubtitle => 'Track more servers and get notified\nwhen they go online or offline.';

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
  String get selectModeSection => 'SELECT MODE';

  @override
  String get serversSection => 'SERVERS';

  @override
  String get noServerSelected => 'No server selected';

  @override
  String get selectBedrockAccount => 'Select Bedrock account';

  @override
  String playersCount(Object players, Object max) {
    return '$players / $max players';
  }

  @override
  String get infoAndLegal => 'Info & Legal';

  @override
  String get legalSection => 'Legal';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get privacyPolicySubtitle => 'How we collect and protect your data';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get termsOfServiceSubtitle => 'Rules and conditions of use';

  @override
  String get dataSourcesSection => 'Data Sources & Credits';

  @override
  String get creditMinecraftWikiSubtitle => 'Used as data source for the Wiki feature. Content is provided by the community under Creative Commons.';

  @override
  String get creditMojangTitle => 'Mojang / Microsoft';

  @override
  String get creditMojangSubtitle => 'Java player skins, UUIDs, and profile data via the official Mojang API.';

  @override
  String get creditGeyserTitle => 'GeyserMC';

  @override
  String get creditGeyserSubtitle => 'Bedrock skin rendering. Skins for Bedrock players are fetched via the GeyserMC skin server.';

  @override
  String get creditXboxTitle => 'Xbox / Microsoft';

  @override
  String get creditXboxSubtitle => 'Bedrock account linking via Xbox Live. Gamertags and XUIDs are retrieved through the Microsoft authentication flow.';

  @override
  String get aboutMCCompanionSection => 'About MCCompanion';

  @override
  String get aboutMCCompanionDisclaimer => 'MCCompanion is an independent application and is not affiliated with, endorsed by, or sponsored by Mojang Studios or Microsoft Corporation.';

  @override
  String get minecraftTrademark => '\"Minecraft\" is a trademark of Microsoft Corporation.';

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
  String get partnerServersTitle => 'Partner Servers';

  @override
  String get noPartnerServers => 'No partner servers available yet.';

  @override
  String get checkBackLater => 'Check back later.';

  @override
  String get xboxLinkTitle => 'Link Xbox Account';

  @override
  String get xboxStartingLogin => 'Starting Xbox login…';

  @override
  String get xboxSignInWithMicrosoft => 'Sign in with Microsoft';

  @override
  String get xboxGoToLink => 'Go to the link below and enter the code to connect your Xbox account.';

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
  String get xboxCouldNotStart => 'Could not start Xbox login. Please try again.';

  @override
  String get xboxCodeExpired => 'The code expired. Please try again.';

  @override
  String get xboxSomethingWrong => 'Something went wrong. Please try again.';

  @override
  String get tryAgain => 'Try again';

  @override
  String get publicProfileTitle => 'Profile';

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
  String get trackerLimitReached => 'You\'ve reached your server limit. Upgrade to track more servers.';

  @override
  String get upgradeButton => 'Upgrade';

  @override
  String get javaLinkTitle => 'Link Java Edition';

  @override
  String get javaStartingLogin => 'Starting Microsoft login…';

  @override
  String get javaSignInWithMicrosoft => 'Sign in with Microsoft';

  @override
  String get javaGoToLink => 'Go to the link below and enter the code to connect your Minecraft Java Edition account.';

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
  String get javaNoJavaBody => 'The Microsoft account you signed in with does not own Minecraft Java Edition.';

  @override
  String get javaTryDifferentAccount => 'Try a different account';

  @override
  String get javaCouldNotStart => 'Could not start Microsoft login. Please try again.';

  @override
  String get javaCodeExpired => 'The code expired. Please try again.';

  @override
  String get javaSomethingWrong => 'Something went wrong. Please try again.';

  @override
  String get javaCodeCopied => 'Code copied to clipboard';

  @override
  String get splashFeatureConnect => 'Connect';

  @override
  String get splashFeatureFriends => 'Friends';

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
  String get featureLabelLookup => 'Lookup';

  @override
  String get featureLabelTracker => 'Server Tracker';

  @override
  String get featureSubtitleConnector => 'Connect consoles to Minecraft';

  @override
  String get featureSubtitleSkins => 'Browse & manage Minecraft skins';

  @override
  String get featureSubtitleWiki => 'Minecraft encyclopedia';

  @override
  String get featureSubtitlePartners => 'Featured servers';

  @override
  String get featureSubtitleLookup => 'Look up Java & Bedrock profiles';

  @override
  String get featureSubtitleTracker => 'Monitor server status & get notified';

  @override
  String get userSearchHint => 'Username, gamertag or Java name…';

  @override
  String get userSearchSub => 'Search by username, Xbox gamertag or Java name';

  @override
  String get onlineStatus => 'Online';

  @override
  String get upgradeWindowsHint => 'Upgrade available via the Microsoft Store';

  @override
  String get chatEmptyHint => 'Be the first to say something!';

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
  String get accountActions => 'ACCOUNT';

  @override
  String get feedbackBugReport => 'Bug Report';

  @override
  String get feedbackFeatureRequest => 'Feature Request';

  @override
  String get feedbackGoesToGithub => 'Goes straight to GitHub';

  @override
  String get feedbackTitleLabel => 'Title';

  @override
  String get feedbackTitleHintBug => 'e.g. App crashes when opening skin editor';

  @override
  String get feedbackTitleHintFeature => 'e.g. Show player ping in the server list';

  @override
  String get feedbackWhatHappened => 'What happened?';

  @override
  String get feedbackDescribeIdea => 'Describe your idea';

  @override
  String get feedbackDescHintBug => 'Describe the bug — what did you do, what did you expect, and what happened instead?';

  @override
  String get feedbackDescHintFeature => 'Explain what you\'d like and why it would be useful.';

  @override
  String get feedbackEmailLabel => 'Email (optional)';

  @override
  String get feedbackEmailHint => 'So we can follow up with you';

  @override
  String get feedbackEmailNote => 'Your email is never shared publicly.';

  @override
  String get feedbackSubmitBug => 'Submit Bug Report';

  @override
  String get feedbackSubmitFeature => 'Submit Feature Request';

  @override
  String get feedbackDisclaimer => 'Creates a public issue on GitHub · Don\'t include passwords';

  @override
  String get feedbackSuccessTitle => 'Thanks for the feedback!';

  @override
  String get feedbackSuccessBody => 'Your report has been submitted and a GitHub issue has been created. We\'ll look into it as soon as possible.';

  @override
  String get feedbackViewOnGithub => 'View on GitHub';

  @override
  String get feedbackSubmitAnother => 'Submit another';

  @override
  String get feedbackBackToApp => 'Back to app';

  @override
  String get feedbackTitleTooShort => 'Title must be at least 5 characters.';

  @override
  String get feedbackDescTooShort => 'Description must be at least 10 characters.';

  @override
  String get feedbackSubmitFailed => 'Failed to submit. Please try again.';

  @override
  String get feedbackTileTitle => 'Report a bug or suggest a feature';

  @override
  String get feedbackTileSubtitle => 'Help us improve MCCompanion';

  @override
  String get friendsHowToStep1 => 'Open the Xbox app on your phone or console.';

  @override
  String get friendsHowToStep2 => 'Add one of the bots below as a friend on Xbox.';

  @override
  String get friendsHowToStep3 => 'Open Minecraft and go to the Friends tab.';

  @override
  String get friendsHowToStep4 => 'Look for your server under LAN Worlds and join.';

  @override
  String get friendsHowToNote => '⚠️ Every time you want to play, you need to start Friends mode in the MCCompanion app first. You can close the app after starting.';

  @override
  String get friendsBotLoadError => '⚠️ Could not load bot list. Try again later.';

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
  String get rpWhatIsThis => 'What is this?';

  @override
  String get rpExplanation => 'Customize how Minecraft looks on your console with a resource pack. Upload a file or paste a direct link. MCCompanion sends it to your console automatically every time you connect.';

  @override
  String get rpPackUrlLabel => 'Pack URL';

  @override
  String get rpPackUrlHint => 'https://example.com/pack.mcpack';

  @override
  String get rpEnableToggle => 'Enable resource pack';

  @override
  String get rpWhatWorks => 'Supported formats';

  @override
  String get rpSupportedBedrockOnly => 'Bedrock Edition only (.mcpack or .zip)';

  @override
  String get rpSupportedBedrockOnlyHint => 'Java packs don\'t work on consoles.';

  @override
  String get rpSupportedTexture => 'Resource packs & texture packs';

  @override
  String get rpSupportedTextureHint => 'These are officially supported and work reliably.';

  @override
  String get rpUnsupportedShaders => 'Shaders, behavior packs, skin packs';

  @override
  String get rpUnsupportedShadersHint => 'These won\'t load on consoles via MCCompanion.';

  @override
  String get rpUnsupportedAddons => 'Add-ons & UI mods';

  @override
  String get rpUnsupportedAddonsHint => 'May sometimes work, but not officially supported. Use at your own risk.';

  @override
  String get rpNoDiscord => 'Discord links';

  @override
  String get rpNoDrive => 'Google Drive / Dropbox share links';

  @override
  String get rpNoEncrypted => 'Encrypted or password-protected packs';

  @override
  String get rpConsolePerformanceTitle => 'Console performance';

  @override
  String get rpConsolePerformanceBody => 'High-resolution texture packs can cause lag or crashes on consoles. If you experience issues, switch to a lower-resolution pack or select a lighter subpack if the pack supports it.';

  @override
  String get rpWarnDiscord => 'Discord links expire and will stop working. Use a permanent host instead.';

  @override
  String get rpWarnHttps => 'URL must start with https://';

  @override
  String get rpWarnExtension => 'URL must end in .mcpack or .zip';

  @override
  String get rpToastEnterUrl => 'Enter a URL before enabling the resource pack.';

  @override
  String get rpToastSaved => 'Resource pack settings saved.';

  @override
  String get rpInvalidPackFormat => 'This is a Java Edition pack and is not supported. Please use a Bedrock Edition resource pack.';

  @override
  String get rpClearMinecraftTitle => 'First time with this pack?';

  @override
  String get rpClearMinecraftBody => 'Minecraft caches resource packs locally. If you connected to this server before enabling MCCompanion\'s resource pack, Minecraft already has the original pack cached and won\'t re-download the merged version.';

  @override
  String get rpClearStep1 => 'Open Minecraft on your console and go to Settings → Storage';

  @override
  String get rpClearStep2 => 'Tap ‘Clear’ or ‘Reset’ next to Resource Packs. This removes all locally cached packs.';

  @override
  String get rpClearStep3 => 'Reconnect through MCCompanion. The merged pack will download automatically.';

  @override
  String get rpRelayTitle => 'Pack looks wrong?';

  @override
  String get rpRelayBody => 'The relay caches the merged pack for 1 hour using your overlay URL as the cache key. To force a fresh merge, change your pack URL slightly (e.g. add ?v=2 at the end) and save. After that, also clear Minecraft\'s pack cache. The merged pack still uses the server\'s UUID, so Minecraft will otherwise serve the old cached version.';

  @override
  String get rpWorksGithubHint => 'Direct download link, always accessible.';

  @override
  String get rpWorksCloudflareHint => 'Public cloud storage, fast and reliable.';

  @override
  String get rpWorksDirectHint => 'Any public HTTPS .mcpack or .zip URL';

  @override
  String get rpNoDiscordHint => 'Links expire after a few hours and can\'t be used as a permanent pack URL.';

  @override
  String get rpNoDriveHint => 'Not a direct download, sends you to a preview page instead.';

  @override
  String get rpNoEncryptedHint => 'MCCompanion cannot read or merge encrypted pack content.';

  @override
  String get rpClearWhy => 'Minecraft caches resource packs by their UUID. The merged pack keeps the server\'s original UUID, so if Minecraft already has the server\'s pack cached from a previous session, it won\'t re-download the new merged version. Clear the cache so Minecraft picks up the fresh merged pack.';

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
  String get rpMergerSubtitle => 'Combine up to 4 resource packs';

  @override
  String get rpMergerPriorityHint => 'Top pack has highest priority — its files win conflicts.';

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
  String get rpMergerComplete => 'Merge complete!';

  @override
  String rpMergerConflicts(int count) {
    return '$count conflict(s) resolved — top pack won.';
  }

  @override
  String get rpMergerSetActive => 'Set as active resource pack';

  @override
  String get rpMergerSetActiveToast => 'Set as active resource pack';

  @override
  String get rpMergerOpenButton => 'Merge resource packs';

  @override
  String get rpMergerOpenSubtitle => 'Combine 2–4 packs into one';
}
