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
  String get nldServerLabel => 'NETHERLINK SERVER';

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
  String get helpNetherlinkTitle => 'MCCompanion does not appear';

  @override
  String get helpNetherlinkSubtitle => 'Troubleshooting LAN discovery issues';

  @override
  String get helpNetherlinkBody => 'If the server isn\'t appearing on your console, try these steps:\n\n✅ Basic Checks:\n1. Same WiFi Network - Your phone/tablet and console MUST be on the same WiFi\n2. Correct Server Address - Double-check the IP and port (default: 19132)\n3. Broadcasting Active - Verify MCCompanion shows \"Broadcasting\" status\n\n🔄 Quick Fixes:\n• Restart the app: Stop broadcasting, close MCCompanion completely, reopen and try again\n• Restart your console: Sometimes the console needs a refresh to detect LAN games\n• Check Friends/LAN tab: The server appears under \"Friends\" or \"LAN Games\", NOT in server list\n• Wait 10-15 seconds after starting broadcasting\n• Disable VPNs: VPNs can block local broadcasts\n\n⚠️ Common Issues:\n\"No route found for user\" → Ensure both devices are on the same Wi‑Fi (avoid Guest networks)\n\"Unable to connect to MCCompanion relay server\" → Check your internet / relay status\n\n📱 Still having issues? Enable Debug Mode in MCCompanion and check logs, or try a different server.';

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
  String get reportUser => 'Report user';
  @override
  String reportUserWithName(String username) => 'Report @$username';
  @override
  String get reportMessage => 'Report message';
  @override
  String get reportDisclaimer => 'Our team will review this report. Thank you for keeping the community safe.';
  @override
  String get reportReasonSpam => 'Spam';
  @override
  String get reportReasonHarassment => 'Harassment or bullying';
  @override
  String get reportReasonInappropriate => 'Inappropriate content';
  @override
  String get reportReasonOther => 'Other';
  @override
  String get reportAdditionalDetails => 'Additional details (optional)';
  @override
  String get reportSubmit => 'Submit report';
  @override
  String get reportSuccess => 'Report submitted. Thank you.';
  @override
  String get reportFailed => 'Could not submit report. Please try again.';
  @override
  String get messagePlaceholder => 'Message...';
  @override
  String get noMessagesYet => 'No messages yet.\nSay hello!';
  @override
  String get today => 'Today';
  @override
  String get yesterday => 'Yesterday';
  @override
  String get noConversationsYet => 'No conversations yet';
  @override
  String get startChatHint => 'Start a chat from your friends list.';
  @override
  String get youPrefix => 'You';
  @override
  String get tabProfile => 'PROFILE';
  @override
  String get tabFriends => 'FRIENDS';
  @override
  String get tabRequests => 'REQUESTS';
  @override
  String get tabChats => 'CHATS';
  @override
  String get addFriend => 'Add friend';
  @override
  String get usernameHint => 'username';
  @override
  String get send => 'Send';
  @override
  String friendRequestSentTo(String username) => 'Friend request sent to @$username';
  @override
  String alreadyFriendsWith(String username) => 'You are already friends with @$username.';
  @override
  String requestAlreadyPending(String username) => 'There is already a pending request with @$username.';
  @override
  String userNotFoundMsg(String username) => 'User @$username not found.';
  @override
  String cannotSendRequest(String username) => 'You cannot send a request to @$username.';
  @override
  String get somethingWentWrong => 'Something went wrong. Please try again.';
  @override
  String friendRequestAccepted(String username) => 'Friend request from @$username accepted';
  @override
  String requestDeclined(String username) => 'Request from @$username declined';
  @override
  String get deleteAccountTitle => 'Delete account';
  @override
  String get deleteAccountBody => 'This will permanently delete your account, messages, friends and all associated data. This action cannot be undone.';
  @override
  String get deletePermanently => 'Delete permanently';
  @override
  String get couldNotDeleteAccount => 'Could not delete account. Please try again.';
  @override
  String get removeFriendTitle => 'Remove friend';
  @override
  String removeFriendConfirm(String username) => 'Do you want to remove @$username as a friend?';
  @override
  String get remove => 'Remove';
  @override
  String friendRemoved(String username) => '@$username removed from your friends';
  @override
  String get noFriendsYet => 'No friends yet';
  @override
  String get noFriendsSub => 'Add someone using the button in the top right.';
  @override
  String get noPendingRequests => 'No pending requests';
  @override
  String get requestsAppearHere => 'Friend requests will appear here.';
  @override
  String onlineFriendsLabel(int count) => 'ONLINE — $count';
  @override
  String offlineFriendsLabel(int count) => 'OFFLINE — $count';
  @override
  String get couldNotUpdateVisibility => 'Could not update visibility. Try again.';
  @override
  String get aboutMe => 'About me';
  @override
  String get linkedAccountsTitle => 'Linked Accounts';
  @override
  String get linkAccountsHint => 'Link your Minecraft accounts to show them on your profile.';
  @override
  String get unlinkXboxTitle => 'Unlink Xbox account';
  @override
  String removeLabelConfirm(String label) => 'Remove $label from your linked accounts?';
  @override
  String get unlinkJavaTitle => 'Unlink Java Edition';
  @override
  String removeJavaConfirm(String username) => 'Remove $username from your linked accounts?';
  @override
  String get unlink => 'Unlink';
  @override
  String get linkXbox => 'Link Xbox';
  @override
  String get linkJava => 'Link Java';
  @override
  String get appearOfflineLabel => 'Appear offline';
  @override
  String get appearOfflineOn => 'Friends see you as offline';
  @override
  String get appearOfflineOff => 'Friends can see when you\'re online';
  @override
  String get signOut => 'Sign out';
  @override
  String get profileCardTitle => 'Profile';
  @override
  String get edit => 'Edit';
  @override
  String get displayNameLabel => 'Display name';
  @override
  String get bioLabel => 'Bio';
  @override
  String get yourNameHint => 'Your name';
  @override
  String get bioHint => 'Tell something about yourself';
  @override
  String get avatarUrlLabel => 'Avatar URL';
  @override
  String get usernameDisplayLabel => 'Username';
  @override
  String get profileUpdated => 'Profile updated';
  @override
  String get findUser => 'Find user';
  @override
  String get signIn => 'Sign in';
  @override
  String get createAccount => 'Create account';
  @override
  String get signInSubtitle => 'Sign in to add friends and share your sessions.';
  @override
  String get emailAddressHint => 'Email address';
  @override
  String get passwordHint => 'Password';
  @override
  String get forgotPassword => 'Forgot password?';
  @override
  String get continueWithGoogle => 'Continue with Google';
  @override
  String get alreadyHaveAccount => 'Already have an account? Sign in';
  @override
  String get noAccountYet => 'No account yet? Register';
  @override
  String get orDivider => 'or';
  @override
  String get resetPasswordTitle => 'Reset password';
  @override
  String get resetPasswordBody => 'Enter your email address and we\'ll send you a link to reset your password.';
  @override
  String get sendLink => 'Send link';
  @override
  String resetLinkSent(String email) => 'Reset link sent to $email';
  @override
  String get noAccountForEmail => 'No account found for this email address.';
  @override
  String get invalidEmailError => 'Invalid email address.';
  @override
  String get couldNotSendResetEmail => 'Could not send reset email. Please try again.';
  @override
  String get incorrectEmailOrPassword => 'Incorrect email or password.';
  @override
  String get emailAlreadyInUse => 'This email address is already in use.';
  @override
  String get weakPassword => 'Password must be at least 6 characters.';
  @override
  String get googleSignInFailed => 'Google sign-in failed. Please try again.';
  @override
  String get appleSignInFailed => 'Apple sign-in failed. Please try again.';
  @override
  String get emailDifferentMethod => 'An account already exists with this email using a different sign-in method.';
  @override
  String get enterEmailAndPassword => 'Please enter your email and password.';
  @override
  String get profileNotSetUp => 'Profile not set up yet';
  @override
  String get chooseUsernameSubtitle => 'Choose a username to add friends and share your sessions.';
  @override
  String get createProfile => 'Create profile';
  @override
  String get chooseUniqueUsername => 'Choose a unique username to add friends.';
  @override
  String get usernameFieldLabel => 'Username *';
  @override
  String get usernameFormatHint => '3–20 characters · only a-z, 0-9 and _';
  @override
  String get displayNameOptional => 'Display name (optional)';
  @override
  String get usernameRequired => 'Please enter a username.';
  @override
  String get usernameFormatError => '3–20 characters, only lowercase letters, numbers and _';
  @override
  String get usernameTaken => 'This username is already taken.';
  @override
  String get noConnectionError => 'No connection. Please try again.';
  @override
  String get usernameExampleHint => 'e.g. jens_mc';
  @override
  String get displayNameExampleHint => 'e.g. Jens';
  @override
  String get home => 'Home';
  @override
  String get info => 'Info';
  @override
  String get consoleConnect => 'Console Connect';
  @override
  String get consoleConnectSubtitle => 'Connect to Minecraft servers';
  @override
  String get minecraftSkins => 'Minecraft Skins';
  @override
  String get minecraftSkinsSubtitle => 'View & edit Java & Bedrock skins';
  @override
  String get minecraftWiki => 'Minecraft Wiki';
  @override
  String get minecraftWikiSubtitle => 'Mobs, blocks, recipes & more';
  @override
  String get partnerServersLabel => 'Partner Servers';
  @override
  String get partnerServersSubtitle => 'Featured Minecraft servers';
  @override
  String get userLookup => 'Minecraft User Lookup';
  @override
  String get userLookupSubtitle => 'Look up Java & Bedrock profiles';

  @override
  String get navSkins => 'Skins';
  @override
  String get navWiki => 'Wiki';
  @override
  String get navProfile => 'Profile';

  @override
  String get skinsUpload => 'Upload';
  @override
  String get skinsCreate => 'Create';
  @override
  String get skinsSubtitle => 'View and download Minecraft skins.';
  @override
  String get skinsSectionRecent => 'RECENT SKINS';
  @override
  String get skinsSectionMy => 'MY SKINS';
  @override
  String get skinsSectionYours => 'YOUR SKINS';
  @override
  String get skinsEmptyMySkins => 'No saved skins yet. Create or upload a skin to get started.';
  @override
  String get skinsCouldNotLoad => 'Could not load skins';
  @override
  String skinsPageOf(int page, int total) => 'Page $page / $total';
  @override
  String get skinsMustBe64 => 'Skin must be 64×64 pixels';
  @override
  String get skinsInvalidFile => 'Invalid image file';
  @override
  String get skinsDownload => 'Download';
  @override
  String get skinsEdit => 'Edit';
  @override
  String get skinsNoAccountsTitle => 'No accounts linked';
  @override
  String get skinsNoAccountsSubtitle => 'Link Java or Bedrock in Profile to see your skin.';
  @override
  String get skinsSignInTitle => 'Sign in to see your skin';
  @override
  String get skinsSignInSubtitle => 'Create an account and link Java or Bedrock in Profile.';

  // ── Player Lookup ────────────────────────────────────────────────────────
  @override
  String get playerLookupTitle => 'Player Lookup';
  @override
  String get playerLookupSubtitle => 'Search by Java username, UUID, Bedrock gamertag or XUID.';
  @override
  String get playerLookupHint => 'Username, gamertag, UUID or XUID…';
  @override
  String get playerLookupLinked => 'Accounts linked via GeyserMC';
  @override
  String get playerLookupLabelUsername => 'Username';
  @override
  String get playerLookupLabelTier => 'Tier';
  @override
  String playerLookupCopied(String label) => '$label copied';
  // ── Wiki ──────────────────────────────────────────────────────────────────
  @override
  String get wikiTitle => 'Wiki';
  @override
  String get wikiSearchHint => 'Search mobs, items, blocks…';
  @override
  String get wikiMinecraftWiki => 'minecraft.wiki';
  @override
  String wikiCategories(int count) => '$count categories';
  @override
  String wikiNoResults(String query) => 'No results for "$query"';
  @override
  String get wikiNoPagesFound => 'No pages found in this category.';
  @override
  String get wikiCouldNotLoadPages => 'Could not load pages.';
  @override
  String get wikiCouldNotReach => 'Could not reach the Minecraft Wiki.';
  @override
  String get wikiCouldNotLoadContent => 'Could not load page content.';
  @override
  String get wikiOpenInBrowser => 'Open in browser';
  @override
  String get wikiReadFullArticle => 'Read full article on minecraft.wiki';
  @override
  String get wikiCrafting => 'Crafting';
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
}
