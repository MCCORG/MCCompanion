// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get console => '控制台';

  @override
  String get modeLabel => '模式';

  @override
  String get statusLabel => '状态';

  @override
  String get seeAll => '查看全部';

  @override
  String get sectionHelp => '帮助';

  @override
  String get sectionAdvanced => '高级';

  @override
  String get versionLabel => '版本';

  @override
  String get consoleOutput => '控制台输出';

  @override
  String get noLogsYet => '暂无日志';

  @override
  String get startBroadcastingToSeeOutput => '开始广播以查看输出';

  @override
  String get close => '关闭';

  @override
  String get ok => 'OK';

  @override
  String get back => '返回';

  @override
  String get next => '下一步';

  @override
  String get done => '完成';

  @override
  String get none => '无';

  @override
  String get onboardingThemeTitle => '选择主题';

  @override
  String get onboardingThemeSubtitle => '您可以稍后在设置中微调每种颜色。';

  @override
  String get onboardingNavTitle => '快速访问';

  @override
  String get onboardingNavSubtitle => '为导航栏选择两个功能。';

  @override
  String get onboardingNavLeftLabel => '左侧按钮';

  @override
  String get onboardingNavRightLabel => '右侧按钮';

  @override
  String get onboardingNavPreviewConnector => '连接器';

  @override
  String get onboardingNavPreviewProfile => '个人资料';

  @override
  String get onboardingNavPreviewEmpty => '空';

  @override
  String get onboardingCustomizeDetail => '详细自定义 →';

  @override
  String get website => '网站';

  @override
  String get howToUseMenu => '使用方法';

  @override
  String get support => '支持';

  @override
  String get start => '开始';

  @override
  String get stop => '停止';

  @override
  String get labelJava => 'Java';

  @override
  String get language => '简体中文';

  @override
  String get discord => 'Discord';

  @override
  String get toggleDebug => '切换调试';

  @override
  String get copyLogs => '复制日志';

  @override
  String get clear => '清除';

  @override
  String get cancel => '取消';

  @override
  String get deleteServer => '删除服务器';

  @override
  String get delete => '删除';

  @override
  String get addServer => '添加服务器';

  @override
  String get addServersHint => '添加服务器以便稍后快速连接';

  @override
  String get serverNameLabel => '服务器名称 *';

  @override
  String get addressLabel => '地址 *';

  @override
  String get portLabel => '端口 *';

  @override
  String get descriptionLabel => '描述（可选）';

  @override
  String get save => '保存';

  @override
  String get clientDisconnected => '客户端已断开连接: 广播已停止';

  @override
  String get pleaseEnterServer => '⚠️ 请输入服务器地址';

  @override
  String get invalidPort => '⚠️ 无效的端口号（1-65535）';

  @override
  String get dataSentToServers => '数据已发送到 MCCompanion 服务器';

  @override
  String selectedServer(Object name) {
    return '📋 已选择：$name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return '已选择：$name';
  }

  @override
  String copiedLogs(Object count) {
    return '$countটি লগ এন্ট্রি ক্লিপবোর্ডে কপি করা হয়েছে';
  }

  @override
  String get debugEnabled => '调试日志已启用';

  @override
  String get iUnderstand => '我明白了';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return '已选择：$relayName\r\n\r\n连接方法：\r\n1. 前往你的 Switch 设置，将 DNS 更改为：$relayIp\r\n2. 打开 Minecraft，并从列表中选择一个服务器（例如 Cubecraft 或 Hive）。\r\n3. 现在你将自动被发送到你自己的服务器。';
  }

  @override
  String get noSavedServers => '没有已保存的服务器';

  @override
  String get savedServers => '已保存的服务器';

  @override
  String get manageServers => '管理服务器';

  @override
  String get active => '活动中';

  @override
  String get vpnDetected => '检测到 VPN';

  @override
  String get noWifi => '未连接到 Wi‑Fi';

  @override
  String get vpnActive =>
      '我们检测到您的 VPN 已开启。\n\n请先关闭 VPN 再使用 MCCompanion，否则局域网广播可能无法到达您的主机。';

  @override
  String get mobileActive =>
      '检测到：移动数据\n\nMCCompanion 必须与您的主机位于同一网络。请先连接家庭 Wi‑Fi 或热点后再继续。';

  @override
  String get continueAnyway => '仍然继续';

  @override
  String get updateAvailable => '有可用更新';

  @override
  String get stopBroadcasting => '停止广播';

  @override
  String get startNintendoMode => '启动 Nintendo 模式';

  @override
  String get startFriendsMode => '启动好友模式';

  @override
  String get startBroadcasting => '开始广播';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => '好友';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5（LAN / 代理）';

  @override
  String get howToXboxSubtitle => '通过局域网连接';

  @override
  String get howToXboxBody =>
      '连接方法（Xbox / PS4 / PS5）：\r\n1. 确保运行 MCCompanion 的设备和你的主机位于同一本地网络中。\r\n2. 在应用中输入你的 Minecraft 服务器地址和端口，然后按下 \\\"开始广播\\\"。\r\n3. 在主机上打开 Minecraft → Play → 查找 LAN Worlds 或 Friends 标签页，并刷新列表。\r\n4. 选择名为 \\\"MCCompanion\\\" 的局域网服务器以加入。\r\n注意：\r\n- 如果服务器没有出现，请确认两台设备位于同一子网，并且应用仍在广播。\r\n- 某些主机型号或路由器可能会阻止局域网发现；如有需要，请尝试切换应用或路由器设置。';

  @override
  String get howToNintendoTitle => 'Nintendo Switch（DNS 模式）';

  @override
  String get howToNintendoSubtitle => '通过 DNS 连接';

  @override
  String get howToFriendsTitle => '好友模式';

  @override
  String get howToFriendsSubtitle => '通过好友连接';

  @override
  String get helpMCCompanionTitle => 'MCCompanion 未显示';

  @override
  String get helpMCCompanionSubtitle => '局域网发现问题排查';

  @override
  String get helpMCCompanionBody =>
      '如果服务器没有出现在你的主机上，请尝试以下步骤：\r\n\r\n✅ 基本检查：\r\n1. 相同的 WiFi 网络 - 你的手机/平板和主机必须连接到同一个 WiFi\r\n2. 正确的服务器地址 - 再次检查 IP 和端口（默认：19132）\r\n3. 广播已激活 - 确认 MCCompanion 显示 \\\"正在广播\\\" 状态\r\n\r\n🔄 快速修复：\r\n• 重启应用：停止广播，完全关闭 MCCompanion，重新打开后再试一次\r\n• 重启主机：有时主机需要刷新才能检测到局域网游戏\r\n• 检查好友/LAN 标签页：服务器会显示在 \\\"好友\\\" 或 \\\"局域网游戏\\\" 下，而不是服务器列表中\r\n• 开始广播后等待 10-15 秒\r\n• 禁用 VPN：VPN 可能会阻止本地广播\r\n\r\n⚠️ 常见问题：\r\n\\\"No route found for user\\\" → 确保两台设备位于同一个 Wi‑Fi（避免使用访客网络）\r\n\\\"Unable to connect to MCCompanion relay server\\\" → 检查你的网络 / 中继服务器状态\r\n\r\n📱 仍然有问题？请在 MCCompanion 中启用调试模式并检查日志，或尝试其他服务器。';

  @override
  String get helpMultiplayerFailedTitle => '多人连接失败';

  @override
  String get helpMultiplayerFailedSubtitle => '说明这为什么不是 MCCompanion 错误';

  @override
  String get helpMultiplayerFailedBody =>
      '⚠️ 这不是 MCCompanion 的问题！\r\n\r\nMCCompanion 已成功将你重定向到请求的服务器。\\\"多人连接失败\\\" 这条消息表示目标服务器当前无法访问。可能原因包括：\r\n\r\n• 目标 Minecraft 服务器离线或负载过高\r\n• 服务器需要更新的客户端版本或特定版本\r\n• Relay 与目标服务器之间存在网络问题\r\n\r\n请尝试连接到其他服务器，或联系该服务器的支持团队。如果多个服务器都出现此问题，请在 MCCompanion 中启用调试模式并检查日志。';

  @override
  String get helpNintendoDnsTitle => 'Nintendo DNS 无法工作';

  @override
  String get helpNintendoDnsSubtitle => '常见 DNS / Relay 问题';

  @override
  String get helpNintendoDnsBody =>
      '如果 Nintendo DNS 模式无法工作，请检查以下内容：\r\n\r\n1. 确认你已从应用中发送 DNS 配置（发送 DNS 配置）。\r\n2. 确认你已在 Switch 上将 Relay IP 设置为主 DNS。\r\n3. 确保所选的 Relay 服务器（EU/US）在线且未过载。\r\n4. 某些网络（例如强制门户网络）会阻止自定义 DNS -- 请在其他网络上测试。\r\n\r\n如果问题仍然存在，请启用调试模式并检查日志，或尝试好友模式这一替代方案。';

  @override
  String get helpFriendsModeTitle => '好友模式无法工作';

  @override
  String get helpFriendsModeSubtitle => '常见好友问题';

  @override
  String get helpFriendsModeBody =>
      '好友模式故障排除提示：\r\n\r\n1. 确保 Relay 好友账号已在主机上添加/接受（如有需要）。\r\n2. 启用好友模式后，尝试重新启动游戏并刷新 Friends/LAN 标签页。\r\n\r\n如果服务器仍未显示给好友，请启用调试模式并检查日志以识别错误。';

  @override
  String get changeLanguageTitle => '更改语言';

  @override
  String get changeLanguage => '语言';

  @override
  String get couldNotOpenUrl => '无法打开 URL';

  @override
  String get serverTrackerTitle => '服务器追踪器';

  @override
  String get removeServerTitle => '移除服务器';

  @override
  String removeServerConfirm(Object name) {
    return '从您的追踪列表中移除 \"$name\"？';
  }

  @override
  String get removeServerFailed => '移除服务器失败';

  @override
  String get refreshStatus => '刷新状态';

  @override
  String get trackerSignInRequired => '需要登录';

  @override
  String get trackerSignInSubtitle => '登录以追踪服务器并接收离线通知。';

  @override
  String get signIn => '登录';

  @override
  String get noServersTracked => '未追踪任何服务器';

  @override
  String get trackerEmptySubtitle => '添加一个 Minecraft 服务器以监控其状态并接收通知。';

  @override
  String get fillAllFields => '请正确填写所有字段';

  @override
  String get slotUsedUpgrade => '您的免费槽位已用完。升级以获取更多服务器。';

  @override
  String get addServerFailed => '添加服务器失败。请检查您的信息。';

  @override
  String get ipAddressLabel => 'IP 地址';

  @override
  String get platformLabel => '平台';

  @override
  String get bedrockLabel => 'Bedrock';

  @override
  String get addLabel => '添加';

  @override
  String get statusOnline => '在线';

  @override
  String get statusOffline => '离线';

  @override
  String get statusChecking => '检查中...';

  @override
  String get failedUpdateNotifications => '更新通知失败';

  @override
  String get editServerTitle => '编辑服务器';

  @override
  String get serverNameHint => '服务器名称';

  @override
  String get failedSave => '保存失败。请重试。';

  @override
  String get serverRenamed => '服务器已重命名';

  @override
  String get customizeLabel => '自定义';

  @override
  String get customizeSubtitle => '导航栏与颜色';

  @override
  String get resetLabel => '重置';

  @override
  String get navigationSection => '导航';

  @override
  String get navFixed => 'Connector 和个人资料始终固定';

  @override
  String get leftSlot => 'Slot 2';

  @override
  String get outerSlot => 'Slot 1';

  @override
  String get rightSlot => 'Slot 3';

  @override
  String get farSlot => 'Slot 4';

  @override
  String get colorPickerApply => '应用';

  @override
  String get colorPickerHex => 'Hex';

  @override
  String get textColorSection => '文字颜色';

  @override
  String get textColorPickerTitle => '文字颜色';

  @override
  String get textColorHint => '点击圆圈以选择自定义文字颜色';

  @override
  String get textColorPreviewPrimary => '主要';

  @override
  String get textColorPreviewSecondary => '次要';

  @override
  String get textColorPreviewMuted => '柔和';

  @override
  String get colorSwatchCustom => '自定义';

  @override
  String get accentColorSection => '强调色';

  @override
  String get opacityLabel => '不透明度';

  @override
  String get backgroundSection => '背景';

  @override
  String get cardsSection => '卡片';

  @override
  String get editLabel => '编辑';

  @override
  String get playerLookupJavaEdition => 'Java版';

  @override
  String get playerLookupBedrockEdition => '基岩版';

  @override
  String get playerLookupLabelUuid => 'UUID';

  @override
  String get playerLookupLabelGamertag => '玩家标签';

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
    return 'Java版 · $uuid';
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
    return '如果 $email 有账号，重置链接已在发送中';
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
  String get chooseUsernameSubtitle => '取一个用户名，方便其他玩家找到你。';

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
  String get chooseUniqueUsername => '选择一个唯一的用户名开始。';

  @override
  String get usernameFieldLabel => '用户名';

  @override
  String get usernameExampleHint => '例如: CoolPlayer123';

  @override
  String get usernameFormatHint => '3–20个字符 · 仅限字母、数字和下划线';

  @override
  String get displayNameOptional => '显示名称（可选）';

  @override
  String get displayNameExampleHint => '例如: 酷玩家';

  @override
  String get usernameRequired => '用户名是必填项';

  @override
  String get usernameFormatError => '用户名必须为3–20个字符，只能包含字母、数字和下划线';

  @override
  String get usernameTaken => '该用户名已被使用';

  @override
  String get noConnectionError => '无连接。请检查您的网络并重试。';

  @override
  String get info => '信息';

  @override
  String get navProfile => '个人资料';

  @override
  String serverRemoved(Object name) {
    return '已删除 $name';
  }

  @override
  String serverAdded(Object name) {
    return '已添加 $name';
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
  String get privacyPolicy => '隐私政策';

  @override
  String get privacyPolicySubtitle => 'How we collect and protect your data';

  @override
  String get termsOfService => '服务条款';

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
  String get trackerLimitReached => '已达服务器上限';

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
  String get featureLabelConnector => '连接器';

  @override
  String get featureLabelSkins => '皮肤';

  @override
  String get featureLabelPartners => '服务器列表';

  @override
  String get featureLabelLookup => '查找';

  @override
  String get featureLabelTracker => '服务器追踪器';

  @override
  String get userSearchHint => '用户名、玩家代号或Java名…';

  @override
  String get userSearchSub => '按用户名、Xbox玩家代号或Java名搜索';

  @override
  String get upgradeWindowsHint => '可在 Microsoft Store 升级';

  @override
  String get skinSaved => '皮肤已保存';

  @override
  String skinSavedAs(String name) {
    return '已另存为 \"$name\"';
  }

  @override
  String get skinExportFailed => '导出失败';

  @override
  String get skinExported => '皮肤导出成功';

  @override
  String get accountActions => '账户';

  @override
  String get feedbackBugReport => '错误报告';

  @override
  String get feedbackFeatureRequest => '功能请求';

  @override
  String get feedbackTitleLabel => '标题';

  @override
  String get feedbackTitleHintBug => '例如：打开皮肤编辑器时应用崩溃';

  @override
  String get feedbackTitleHintFeature => '例如：在服务器列表中显示玩家延迟';

  @override
  String get feedbackWhatHappened => '发生了什么？';

  @override
  String get feedbackDescribeIdea => '描述你的想法';

  @override
  String get feedbackDescHintBug => '描述该错误--你做了什么、你期望什么，以及实际发生了什么？';

  @override
  String get feedbackDescHintFeature => '解释你想要什么以及为什么有用。';

  @override
  String get feedbackSubmitBug => '提交错误报告';

  @override
  String get feedbackSubmitFeature => '提交功能请求';

  @override
  String get feedbackDisclaimer => '直达我们的团队 · 请勿填写密码';

  @override
  String get feedbackSuccessTitle => '感谢你的反馈！';

  @override
  String get feedbackSuccessBody => '谢谢，你的反馈已收到。我们会在应用内回复，请回到这里查看。';

  @override
  String get feedbackSubmitAnother => '再提交一个';

  @override
  String get feedbackBackToApp => '返回应用';

  @override
  String get feedbackTitleTooShort => '标题至少需要 5 个字符。';

  @override
  String get feedbackDescTooShort => '描述至少需要 10 个字符。';

  @override
  String get feedbackSubmitFailed => '提交失败，请重试。';

  @override
  String get feedbackTileTitle => '反馈';

  @override
  String get feedbackTileSubtitle => '帮助我们改进 MCCompanion';

  @override
  String get friendsHowToStep1 => '在手机或主机上打开 Xbox 应用。';

  @override
  String get friendsHowToStep2 => '将下方的一个机器人添加为 Xbox 好友。';

  @override
  String get friendsHowToStep3 => '打开 Minecraft，前往好友选项卡。';

  @override
  String get friendsHowToStep4 => '在局域网世界中找到你的服务器并加入。';

  @override
  String get friendsHowToNote =>
      '⚠️ 每次想玩时，请先在 MCCompanion 应用中启动好友模式。启动后可以关闭应用。';

  @override
  String get friendsBotLoadError => '⚠️ 无法加载机器人列表，请稍后重试。';

  @override
  String get regionEurope => '欧洲';

  @override
  String get regionUnitedStates => '美国';

  @override
  String get yourRegion => '您的地区';

  @override
  String get botStatusOffline => '离线';

  @override
  String get botStatusFull => '已满';

  @override
  String botFriendCount(Object current, Object max) {
    return '$current / $max 好友';
  }

  @override
  String botCopied(Object gamertag) {
    return '已复制 $gamertag';
  }

  @override
  String get copyLabel => '复制';

  @override
  String get skinSavedToDocuments => '皮肤已保存到文稿';

  @override
  String get skinMenuExport => '导出';

  @override
  String get skinMenuDelete => '删除';

  @override
  String get rpScreenTitle => '资源包';

  @override
  String get rpWhatWorks => '有效的方式';

  @override
  String get rpSupportedBedrockOnly => '仅限基岩版（.mcpack 或 .zip）';

  @override
  String get rpSupportedBedrockOnlyHint => 'Java版材质包不适用于主机。';

  @override
  String get rpSupportedTexture => '资源包和材质包';

  @override
  String get rpSupportedTextureHint => '这些受到官方支持，可靠运行。';

  @override
  String get rpUnsupportedShaders => '光影、行为包、皮肤包';

  @override
  String get rpUnsupportedShadersHint => '这些无法通过MCCompanion在主机上加载。';

  @override
  String get rpUnsupportedAddons => '附加包和UI模组';

  @override
  String get rpUnsupportedAddonsHint => '有时可能有效，但未得到官方支持。使用风险自负。';

  @override
  String get rpNoDiscord => 'Discord 链接: 没有 .mcpack 扩展名，且会在几小时后失效';

  @override
  String get rpNoDrive => 'Google Drive / Dropbox 分享链接: 非直接下载';

  @override
  String get rpNoEncrypted => '带有加密或密码保护包的服务器';

  @override
  String get rpConsolePerformanceTitle => '主机性能';

  @override
  String get rpConsolePerformanceBody =>
      '高分辨率材质包可能导致主机卡顿或崩溃。如果遇到问题，请切换至低分辨率包，或选择较轻量的子包（如果该包支持）。';

  @override
  String get rpWarnDiscord => 'Discord 链接会过期并停止工作。请改用永久性托管服务。';

  @override
  String get rpWarnHttps => 'URL 必须以 https:// 开头';

  @override
  String get rpWarnExtension => 'URL 必须以 .mcpack 或 .zip 结尾';

  @override
  String get rpToastSaved => '资源包设置已保存。';

  @override
  String get rpInvalidPackFormat => '这是 Java 版材质包，不受支持。请使用基岩版资源包。';

  @override
  String get rpBehaviorContentWarning => '此材质包包含行为包数据，在服务器上无法生效。贴图仍然可以正常使用。';

  @override
  String get rpClearMinecraftTitle => '第一次使用此资源包？';

  @override
  String get rpClearStep1 => '在主机上打开 Minecraft，前往设置 → 存储';

  @override
  String get rpClearStep2 => '点击材质包旁边的“清除”或“重置”--这会删除所有本地缓存的材质包';

  @override
  String get rpClearStep3 => '通过 MCCompanion 重新连接--合并后的材质包将自动下载';

  @override
  String get rpRelayTitle => '资源包显示有问题？';

  @override
  String get rpRelayBody =>
      '中继服务器以您的覆盖层 URL 为缓存键，将合并后的材质包缓存 1 小时。要强制重新合并：稍微修改材质包链接（例如在末尾添加 ?v=2）并保存。之后还需要清除 Minecraft 的材质包缓存--合并后的材质包仍使用服务器的 UUID，否则 Minecraft 会直接使用旧的缓存版本。';

  @override
  String get rpNoDiscordHint => 'Discord CDN 链接会在短时间内失效';

  @override
  String get rpNoDriveHint => '无直接下载，会跳转到预览页面';

  @override
  String get rpNoEncryptedHint => 'MCCompanion 无法合并加密的材质包内容';

  @override
  String get rpClearWhy =>
      'Minecraft 通过 UUID 缓存材质包。合并后的材质包保留服务器原有的 UUID--如果 Minecraft 在之前的游戏中（启用 MCCompanion 之前）已经缓存了服务器的材质包，它就不会重新下载新的合并版本。清除缓存，让 Minecraft 加载最新的合并材质包。';

  @override
  String get rpUploadTab => 'Upload';

  @override
  String get rpUploadButton => 'Tap to select your pack';

  @override
  String get rpUploadHint => '.mcpack or .zip • max 100 MB';

  @override
  String get rpUploading => 'Uploading...';

  @override
  String get rpMergerTitle => 'RP 合并工具';

  @override
  String get rpMergerPriorityHint => '最顶部的包优先级最高: 冲突时其文件获胜。';

  @override
  String get rpMergerTopBadge => '顶部';

  @override
  String get rpMergerAddPacks => '添加资源包';

  @override
  String rpMergerAddAnother(int current) {
    return '再添加一个包 ($current/4)';
  }

  @override
  String get rpMergerFileTypes => '.zip 或 .mcpack';

  @override
  String get rpMergerMerging => '合并中…';

  @override
  String rpMergerButton(int count) {
    return '合并 $count 个包';
  }

  @override
  String get rpMergerSetActiveToast => '已设为活跃资源包';

  @override
  String get rpDisabled => '已禁用';

  @override
  String get rpNoPackSelected => '未选择资源包';

  @override
  String get rpActiveOnConnect => '已激活: 连接时自动应用';

  @override
  String get rpBrowseSubtitle => '精选资源包，即刻可用';

  @override
  String get rpBrowseEmpty => '暂无可用资源包';

  @override
  String get rpBrowseEmptyHint => '稍后再来查看精选资源包。';

  @override
  String get rpReplaceFile => '替换为其他文件';

  @override
  String get rpDropToUpload => '拖放以上传';

  @override
  String get rpTabBrowseInfo => '浏览 MCCompanion 精选的资源包。点击使用即可立即激活: 无需上传或链接。';

  @override
  String get rpTabUploadInfo =>
      '上传您自己的 .mcpack 或 .zip 文件。MCCompanion 将其安全存储在云端，每次连接时自动发送到您的主机。';

  @override
  String get rpTabMergeInfo =>
      '将 2 至 4 个资源包合并为一个。合并后的资源包将上传至 MCCompanion Cloud 并自动激活。';

  @override
  String get shareLabel => '分享';

  @override
  String get sectionMinecraftAccounts => 'Minecraft 账号';

  @override
  String get sectionSettings => '设置';

  @override
  String get avatarUpdated => '头像已更新';

  @override
  String get uploadFailed => '上传失败';

  @override
  String get profileLinkCopied => '个人资料链接已复制！';

  @override
  String get shareProfileTooltip => '分享主页';

  @override
  String get profileFallbackTitle => '主页';

  @override
  String get noUsersFound => '未找到用户';

  @override
  String get skinLabel => '皮肤';

  @override
  String get skinsLabel => '皮肤';

  @override
  String get javaEditionBadge => 'Java';

  @override
  String get bedrockEditionBadge => '基岩版';

  @override
  String get downloadLabel => '下载';

  @override
  String get justNow => '刚刚';

  @override
  String minutesAgo(int count) {
    return '$count分钟前';
  }

  @override
  String hoursAgo(int count) {
    return '$count小时前';
  }

  @override
  String daysAgo(int count) {
    return '$count天前';
  }

  @override
  String get rpPackInfo => '信息';

  @override
  String get rpUseThisPack => '使用此包';

  @override
  String get rpViewOnWebsite => '在网站上查看 →';

  @override
  String rpDownloads(int count) {
    return '$count 次下载';
  }

  @override
  String get skinsSavedToMySkins => '已保存到我的皮肤';

  @override
  String get skinsDownloadFailed => '下载失败';

  @override
  String get skinsDeletedFromCloud => '已从云端删除';

  @override
  String get skinsDeleteFailed => '删除失败';

  @override
  String get skinsLoginToUpload => '登录以上传皮肤';

  @override
  String get skinsUploading => '上传中…';

  @override
  String get skinUploaded => '皮肤已上传！';

  @override
  String skinUploadFailed(String error) {
    return '上传失败：$error';
  }

  @override
  String get skinsEmptyLocalSkins => '暂无皮肤。创建或上传皮肤以开始使用。';

  @override
  String get skinUploadToWebsite => '上传到网站';

  @override
  String get skinReuploadToWebsite => '重新上传到网站';

  @override
  String get skinCloudEdit => '编辑';

  @override
  String get skinCloudSaveToDevice => '保存到设备';

  @override
  String get skinCloudDelete => '从云端删除';

  @override
  String get skinsTabGallery => '社区画廊';

  @override
  String get skinsTopLabel => '前30名';

  @override
  String get skinsAllLabel => '所有皮肤';

  @override
  String get skinUploadToCloud => '上传到云端';

  @override
  String get skinSaveDialog => '保存皮肤';

  @override
  String get skinNameHint => '皮肤名称';

  @override
  String get skinDefaultName => '我的皮肤';

  @override
  String get skinUpdatedInCloud => '皮肤已在云端更新';

  @override
  String skinByCreator(String name) {
    return '由 $name';
  }

  @override
  String skinLikesCount(int count) {
    return '$count 个赞';
  }

  @override
  String get sectionRecentActivity => '最近动态';

  @override
  String get activityNoEvents => '暂无最近动态。';

  @override
  String get activitySkinUploaded => '上传了皮肤';

  @override
  String get activitySkinLiked => '点赞了皮肤';

  @override
  String get activityPackSubmitted => '提交了资源包';

  @override
  String get activityPackApproved => '资源包已通过';

  @override
  String get activityPackRejected => '资源包未通过';

  @override
  String get timeJustNow => '刚刚';

  @override
  String timeMinutesAgo(int count) {
    return '$count分钟前';
  }

  @override
  String timeHoursAgo(int count) {
    return '$count小时前';
  }

  @override
  String timeDaysAgo(int count) {
    return '$count天前';
  }

  @override
  String timeMonthsAgo(int count) {
    return '$count个月前';
  }

  @override
  String get sectionNotifications => '通知';

  @override
  String get sectionNotificationTypes => '通知类型';

  @override
  String get notifMarkAllRead => '全部标为已读';

  @override
  String get notifEmpty => '暂无通知。点赞、评论和好友动态将显示在此处。';

  @override
  String get notifSomeone => '某人';

  @override
  String notifSkinLiked(String actor) {
    return '$actor喜欢了你的皮肤';
  }

  @override
  String notifCommentReceived(String actor) {
    return '$actor评论了你的皮肤';
  }

  @override
  String get notifPackApproved => '资源包已通过';

  @override
  String get notifPackRejected => '资源包未通过';

  @override
  String notifFriendRequest(String actor) {
    return '$actor向你发送了好友请求';
  }

  @override
  String notifFriendAccepted(String actor) {
    return '$actor接受了你的请求';
  }

  @override
  String notifMessageReceived(String actor) {
    return '来自$actor的新消息';
  }

  @override
  String get notifPrefSkinLiked => '皮肤被点赞';

  @override
  String get notifPrefCommentReceived => '收到评论';

  @override
  String get notifPrefPackApproved => '资源包通过';

  @override
  String get notifPrefPackRejected => '资源包被拒';

  @override
  String get notifPrefFriendRequest => '好友请求';

  @override
  String get notifPrefFriendAccepted => '添加好友';

  @override
  String get notifPrefMessageReceived => '新消息';

  @override
  String get commentsTitle => '评论';

  @override
  String get commentsEmpty => '暂无评论。成为第一个！';

  @override
  String get commentsPlaceholder => '写评论…';

  @override
  String get loadMore => '加载更多';

  @override
  String get skinLayerInner => '内层';

  @override
  String get skinLayerOuter => '外层';

  @override
  String get feedbackLoginRequiredTitle => '登录以发送反馈';

  @override
  String get feedbackLoginRequiredBody =>
      '反馈会关联到你的 MCCompanion 账号，以便我们直接在应用内回复你。';

  @override
  String get feedbackLoginButton => '登录';

  @override
  String get supportInboxTitle => '支持收件箱';

  @override
  String get skinShareSubject => 'Minecraft 皮肤';

  @override
  String get skinEditorTitle => '皮肤编辑器';

  @override
  String get skinToolUndo => '撤销';

  @override
  String get skinSaveToMySkins => '保存到我的皮肤';

  @override
  String get skinUpdateInCloud => '更新到云端';

  @override
  String get skinExportPng => '导出 PNG';

  @override
  String get skinToolDraw => '绘制';

  @override
  String get skinToolFill => '填充';

  @override
  String get skinToolErase => '擦除';

  @override
  String get customColour => '自定义颜色';

  @override
  String get featuredServerLabel => '精选服务器';

  @override
  String get featuredServerTagline => '进来一起玩吧。';

  @override
  String get featuredServerPlay => '开始玩';

  @override
  String rpUploadFailedCode(int code) {
    return '上传失败（$code）';
  }

  @override
  String rpUploadFailed(String error) {
    return '上传失败：$error';
  }

  @override
  String get rpLoadFailed => '无法加载材质包';

  @override
  String get rpRetry => '重试';

  @override
  String get rpSearchHint => '搜索材质包…';

  @override
  String rpMergeFailed(String error) {
    return '合并失败：$error';
  }

  @override
  String get rpMergerSize => '大小';

  @override
  String get rpMergerCreated => '创建时间';

  @override
  String get rpMergerSourcePacks => '源材质包';

  @override
  String get rpMergerDropToAdd => '拖到此处添加';

  @override
  String get rpMergerSavedMerges => '已保存的合并';

  @override
  String get rpMergerUse => '使用';

  @override
  String get supportInboxShared => '全体管理员共享';

  @override
  String get supportInboxEmpty => '还没有支持对话';

  @override
  String get supportReplyingAs => '你正以 MCCompanion Support 身份回复';

  @override
  String get relayBlocked =>
      '你的 IP 或账号已被 MCCompanion 封禁。如果你认为这是误判，来我们的 Discord 找我们。';

  @override
  String relayBlockedWithReason(String reason) {
    return '你的 IP 或账号已被 MCCompanion 封禁。\n原因：$reason\n如果你认为这是误判，来我们的 Discord 找我们。';
  }

  @override
  String relayConfigFailed(int code) {
    return '无法配置中继（状态 $code）。换一个中继，或来我们的 Discord。';
  }

  @override
  String relayConfigFailedDetail(int code, String detail) {
    return '无法配置中继（状态 $code）：$detail。换一个中继，或来我们的 Discord。';
  }

  @override
  String get relayTimeout => '中继未在规定时间内响应。';

  @override
  String get relayUnreachable => '无法连接到中继。';

  @override
  String get lookupNotFound => '未找到玩家。';

  @override
  String get lookupNetworkError => '网络错误，请重试。';

  @override
  String get lookupBedrockUnavailable => 'Bedrock 查询暂时不可用。';

  @override
  String get lookupFailed => '查询失败。';

  @override
  String get myFeedbackTitle => '我的反馈';

  @override
  String get myFeedbackEmpty => '你还没有向我们发送任何内容。';

  @override
  String get myFeedbackOpenList => '我的反馈';

  @override
  String get fbStatusOpen => '待处理';

  @override
  String get fbStatusPlanned => '已计划';

  @override
  String get fbStatusInProgress => '进行中';

  @override
  String get fbStatusImplemented => '已完成';

  @override
  String get fbStatusNotPlanned => '不计划';

  @override
  String get fbStatusDuplicate => '重复';

  @override
  String get fbNoReplies => '还没有回复，我们会在这里通知你。';

  @override
  String get fbReplyHint => '补充一些内容…';

  @override
  String get fbFromTeam => 'MCCompanion';

  @override
  String get fbFromYou => '你';

  @override
  String get feedbackGoesToTeam => '直接发送给团队';

  @override
  String get notifFeedbackStatus => '你的反馈有更新';

  @override
  String get notifFeedbackReply => '你的反馈有回复';

  @override
  String get adminTicketsHeader => '报告与需求';

  @override
  String get adminTicketReplyHint => '回复此工单…';

  @override
  String get chooseServerTitle => '选择服务器';

  @override
  String get changeLabel => '更改';

  @override
  String get howToAutoShow => '启动时显示此说明';

  @override
  String get skinEditorLoadFailed => '无法加载该皮肤，将从默认皮肤开始。';

  @override
  String get skinToolRecolour => '替换颜色';

  @override
  String get skinToolPick => '取色';

  @override
  String get skinBases => '基础款';

  @override
  String get skinBasesTitle => '从基础款开始';

  @override
  String get skinBasesSubtitle => '这会替换当前画布内容，可用撤销恢复。';

  @override
  String get skinMirror => '镜像';

  @override
  String get skinSurprise => '随机生成';

  @override
  String get skinToolFillHint => '填充你点到的区域';

  @override
  String get skinToolRecolourHint => '替换整个皮肤上的该颜色';

  @override
  String get skinToolPickHint => '取用你点到的颜色';

  @override
  String get skinModelClassic => '标准';

  @override
  String get skinModelSlim => '纤细';

  @override
  String get shareServerLabel => '分享你的服务器';

  @override
  String get shareServerOn => '好友可以看到你所在的服务器';

  @override
  String get shareServerOff => '好友只知道你在游戏中，看不到位置';

  @override
  String directHostNotFound(String host) {
    return '找不到 $host。请检查地址后重试。';
  }

  @override
  String get directPortBusy => '无法打开本地端口。请先停止当前连接。';

  @override
  String directAddressNotSupported(String host) {
    return '$host 是 IPv6 地址。代理/直连模式仅支持 IPv4。请改用 IPv4 地址或主机名。';
  }

  @override
  String termsAgreement(String terms, String privacy) {
    return '我同意$terms和$privacy。';
  }

  @override
  String get verifyEmailTitle => '验证你的邮箱';

  @override
  String get verifyEmailBody => '评论、上传皮肤或提交材质包前需要先验证。';

  @override
  String get verifyEmailSent => '已发送，请查看收件箱。';

  @override
  String get verifyEmailSending => '发送中…';

  @override
  String get verifyEmailSend => '发送链接';

  @override
  String updateAvailableTitle(Object version) {
    return '版本 $version 已发布';
  }

  @override
  String updateAvailableBody(Object current) {
    return '你正在使用 $current，此版本不会自动更新。';
  }

  @override
  String get updateAvailableAction => '下载';

  @override
  String get updateAvailableDismiss => '以后再说';

  @override
  String get serverListSearchHint => '按名称或地址搜索';

  @override
  String get serverListEditionAny => 'Java 和 Bedrock';

  @override
  String get serverListEditionJava => '仅 Java';

  @override
  String get serverListEditionBedrock => '仅 Bedrock';

  @override
  String get serverListSortVotes => '投票最多';

  @override
  String get serverListSortPlayers => '玩家最多';

  @override
  String get serverListSortPeak => '峰值最高';

  @override
  String get serverListSortNewest => '最新';

  @override
  String get serverListSortName => '名称';

  @override
  String get serverListAllCategories => '全部';

  @override
  String get serverListLoadFailed => '无法加载服务器列表';

  @override
  String get serverListLoadFailedHint => '下拉重试';

  @override
  String get serverListNoMatch => '没有匹配的服务器';

  @override
  String get serverListNoMatchHint => '换个关键词或分类试试';

  @override
  String get serverCardPlay => '开始游戏';

  @override
  String get serverCardVote => '投票';

  @override
  String get serverCardViewServer => '查看服务器';

  @override
  String get serverCopyIp => '复制 IP';

  @override
  String get serverCopied => '已复制';

  @override
  String get serverStatPlayers => '玩家';

  @override
  String get serverStatPeak => '峰值';

  @override
  String get serverStatUptime => '在线率';

  @override
  String get serverStatVotesMonth => '本月投票';

  @override
  String get serverBadgeFeatured => '精选';

  @override
  String get serverEditionJava => 'Java';

  @override
  String get serverEditionBedrock => 'Bedrock';

  @override
  String get serverEditionCrossplay => '跨平台';

  @override
  String get serverSectionMotd => '每日消息';

  @override
  String get serverLinkDiscord => 'Discord';

  @override
  String get serverLinkWebsite => '官网';

  @override
  String get serverVotesThisMonth => '本月';

  @override
  String get serverVotesAllTime => '全部时间';

  @override
  String get serverVoteSignInRequired => '登录后即可在应用内投票。';

  @override
  String serverVoteSheetTitle(String name) {
    return '为 $name 投票';
  }

  @override
  String get serverVoteSheetSubtitle => '你的 Minecraft 名称，服务器凭此发放奖励。';

  @override
  String get serverVoteSheetHint => 'Steve';

  @override
  String get serverVoteSheetButton => '投票';

  @override
  String get serverVoteSheetLimit => '每个服务器每天可投一票。';

  @override
  String get serverVoteDelivered => '投票成功，奖励正在发放。';

  @override
  String get serverVoteNoRewards => '投票成功。该服务器尚未设置奖励。';

  @override
  String get serverVoteFailed => '操作未成功，请重试。';

  @override
  String get serverVoteOffline => '无法连接服务器，请检查网络。';

  @override
  String get feedbackViewYourReport => '查看你的反馈';

  @override
  String get showMore => '展开';

  @override
  String get showLess => '收起';
}
