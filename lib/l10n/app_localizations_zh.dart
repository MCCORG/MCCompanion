// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'MCCompanion';

  @override
  String get console => '控制台';

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
  String get joinUs => '加入我们';

  @override
  String get more => '更多';

  @override
  String get website => '网站';

  @override
  String get howToUseMenu => '使用方法';

  @override
  String get support => '支持';

  @override
  String helpText(Object appCreator) {
    return '由 $appCreator 创建。\r\n\r\n使用方法：\r\n1. 输入你的 Minecraft 服务器地址和端口（默认：19132）\r\n   — 或从下拉菜单中选择之前保存的服务器\r\n2. （可选）选择离你位置最近的中继服务器（EU 或 US）\r\n3. 点击 \\\"开始广播\\\" 以开始\r\n4. 在你的主机/设备上：Minecraft > 游玩 > 好友\r\n5. 你应该会看到一个名为 \\\"MCCompanion\\\" 的局域网服务器\r\n6. 点击它即可通过 MCCompanion 加入你的外部服务器\r\n\r\nNintendo Switch（DNS 模式）：\r\n1. 在连接面板中启用 \\\"Nintendo Switch\\\"\r\n2. 选择一个中继服务器（EU 或 US）\r\n3. 点击 \\\"发送 DNS 配置\\\" — 这会将你的配置发送到中继服务器\r\n   （它不会广播局域网服务器）\r\n4. 在你的 Switch 上应用 MCCompanion DNS 设置并加入\r\n   使用你为 MCCompanion 所使用的服务器条目\r\n\r\n注意：\r\n- 进行局域网广播时，MCCompanion 和主机必须位于同一局域网中。\r\n- 提示：选择离你最近的中继服务器以获得最佳性能。';
  }

  @override
  String get serverDetailsLabel => '服务器详情';

  @override
  String get start => '开始';

  @override
  String get stop => '停止';

  @override
  String get labelJava => 'Java';

  @override
  String get startJavaMode => '启动 Java 模式';

  @override
  String get javaInfoTitle => 'Java 模式';

  @override
  String get javaInfoText => '连接到 Java Edition 服务器';

  @override
  String get howToJavaTitle => 'Java 模式';

  @override
  String get howToJavaSubtitle => '通过 MCCompanion 连接到 Java Edition 服务器';

  @override
  String get aternosSubtext => '创建你自己的免费 Minecraft 服务器';

  @override
  String get howToJavaBody => 'Java 模式 — 快速步骤：\n1. 在应用中选择 Java 模式。\n2. 输入你的 Java Edition 服务器地址和端口（默认：25565）。\n3. 点击 \"启动 Java 模式\" —— MCCompanion 会桥接该连接。\n4. 打开 Minecraft Bedrock 并前往好友标签页。\n5. 选择名为 \"MCCompanion\" 的 LAN 服务器以加入 Java 服务器。\n\n⚠️ 重要警告：\n- 需要有效的 Java Edition 账户（Microsoft）。\n- 一些服务器使用反作弊系统，可能会检测并封禁你的账户。\n- 某些服务器明确禁止 Bedrock 客户端 —— 请务必查看服务器规则。\n- 对于因使用此功能而导致的账户封禁、停用或其他账户相关问题，MCCompanion 不承担责任。\n- 请自行承担使用风险。';

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
  String get myServers => '我的服务器';

  @override
  String get quickAccessServers => '快速访问服务器';

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
  String get initializing => '正在初始化...';

  @override
  String get createdBy => '由 NetherDev 创建';

  @override
  String get bedrockBridge => '基岩桥';

  @override
  String get clientDisconnected => '客户端已断开连接 — 广播已停止';

  @override
  String get pleaseEnterServer => '⚠️ 请输入服务器地址';

  @override
  String get invalidPort => '⚠️ 无效的端口号（1-65535）';

  @override
  String get dnsConfigSent => '✅ DNS 配置已发送到中继服务器';

  @override
  String get broadcastingStarted => '广播已开始';

  @override
  String get broadcastStopped => '广播已停止';

  @override
  String selectedServer(Object name) {
    return '📋 已选择：$name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return '已选择：$name';
  }

  @override
  String get noLogsToCopy => '没有可复制的日志';

  @override
  String copiedLogs(Object count) {
    return '$countটি লগ এন্ট্রি ক্লিপবোর্ডে কপি করা হয়েছে';
  }

  @override
  String get debugEnabled => '调试日志已启用';

  @override
  String get debugDisabled => '调试日志已禁用';

  @override
  String get howToUseTitle => '如何使用 MCCompanion';

  @override
  String get iUnderstand => '我明白了';

  @override
  String get playOnSwitchTitle => '在 Nintendo Switch 上游玩';

  @override
  String get playWithFriendsTitle => '与朋友一起游玩';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return '已选择：$relayName\r\n\r\n连接方法：\r\n1. 前往你的 Switch 设置，将 DNS 更改为：$relayIp\r\n2. 打开 Minecraft，并从列表中选择一个服务器（例如 Cubecraft 或 Hive）。\r\n3. 现在你将自动被发送到你自己的服务器。';
  }

  @override
  String playInstructionsFriends(Object friend) {
    return '连接方法：\r\n1. 在你的主机上，将 $friend 添加为好友。\r\n2. 打开 Minecraft 并前往 Friends 标签页。\r\n3. 在 LAN Worlds 下找到你的服务器并选择加入。';
  }

  @override
  String get nldServerLabel => 'MCCompanion 服务器';

  @override
  String selectRelayLabel(Object name) {
    return '选择中继服务器 $name';
  }

  @override
  String get noSavedServers => '没有已保存的服务器';

  @override
  String get savedServers => '已保存的服务器';

  @override
  String get serverAddressHint => '服务器地址';

  @override
  String get portHint => '端口';

  @override
  String get manageServers => '管理服务器';

  @override
  String get manageServersTooltip => '管理服务器';

  @override
  String get noServerYet => '还没有已保存的服务器。\n点击“管理”以添加一个。';

  @override
  String get serverNotSelected => '未选择服务器';

  @override
  String get ready => '就绪';

  @override
  String get active => '活动中';

  @override
  String get vpnDetected => '检测到 VPN';

  @override
  String get noWifi => '未连接到 Wi‑Fi';

  @override
  String get vpnActive => '我们检测到您的 VPN 已开启。\n\n请先关闭 VPN 再使用 MCCompanion，否则局域网广播可能无法到达您的主机。';

  @override
  String get mobileActive => '检测到：移动数据\n\nMCCompanion 必须与您的主机位于同一网络。请先连接家庭 Wi‑Fi 或热点后再继续。';

  @override
  String get continueAnyway => '仍然继续';

  @override
  String get sameWifi => '同一 Wi‑Fi 网络';

  @override
  String get needSameWifi => '运行 MCCompanion 的设备必须与您游玩 Minecraft 的主机连接到同一个 Wi‑Fi 网络。';

  @override
  String get subscription => '需要在线订阅';

  @override
  String get needSubscription => '每台主机都需要各自有效的在线订阅服务（Xbox Live、PS Plus、NSO）。否则 MCCompanion 不会显示。';

  @override
  String get updateAvailable => '有可用更新';

  @override
  String get newVersion => '有新版本应用可用。\n立即更新以获取最新功能和修复。';

  @override
  String get later => '稍后';

  @override
  String get updateNow => '立即更新';

  @override
  String get beforeYouStart => '开始之前';

  @override
  String get stopBroadcasting => '停止广播';

  @override
  String get startNintendoMode => '启动 Nintendo 模式';

  @override
  String get startFriendsMode => '启动好友模式';

  @override
  String get startBroadcasting => '开始广播';

  @override
  String get modeLabel => '模式';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => '好友';

  @override
  String get nintendoInfoTitle => 'Nintendo Switch DNS 模式';

  @override
  String get nintendoInfoText => '在 Nintendo 模式下开始，设置你的 DNS 并加入推荐服务器。';

  @override
  String get friendModeTitle => '好友模式';

  @override
  String get friendModeText => '将 MCCompanion 的好友机器人添加为好友。启动好友模式并开始游玩';

  @override
  String get selectedRelayCheck => '已选择';

  @override
  String relayFallbackWarning(Object name) {
    return '警告：原始 Relay 未响应。正在使用备用 Relay：$name';
  }

  @override
  String get relayUnableConnect => '无法连接到任何 MCCompanion Relay 服务器。请稍后再试或检查你的网络连接。';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5（LAN / 代理）';

  @override
  String get howToXboxSubtitle => '通过局域网广播或代理游玩';

  @override
  String get howToXboxBody => '连接方法（Xbox / PS4 / PS5）：\r\n1. 确保运行 MCCompanion 的设备和你的主机位于同一本地网络中。\r\n2. 在应用中输入你的 Minecraft 服务器地址和端口，然后按下 \\\"开始广播\\\"。\r\n3. 在主机上打开 Minecraft → Play → 查找 LAN Worlds 或 Friends 标签页，并刷新列表。\r\n4. 选择名为 \\\"MCCompanion\\\" 的局域网服务器以加入。\r\n注意：\r\n- 如果服务器没有出现，请确认两台设备位于同一子网，并且应用仍在广播。\r\n- 某些主机型号或路由器可能会阻止局域网发现；如有需要，请尝试切换应用或路由器设置。';

  @override
  String get howToNintendoTitle => 'Nintendo Switch（DNS 模式）';

  @override
  String get howToNintendoSubtitle => '适用于 Switch 的 DNS 中继说明';

  @override
  String get howToNintendoBody => 'Nintendo Switch — DNS 模式（分步说明）：\r\n1. 在应用中启用 \\\"Nintendo\\\" 模式，并选择一个中继服务器（EU 或 US）。\r\n2. 点击 \\\"发送 DNS 配置\\\"，将 DNS IP 发送到中继服务器。\r\n3. 在你的 Nintendo Switch 上前往系统设置 → 网络 → 互联网设置 → （你的网络）→ 更改设置 → DNS，并将主 DNS 设置为中继服务器 IP。\r\n4. 打开 Minecraft 并加入一个公共服务器；你将通过中继 DNS 被重定向到你的服务器。\r\n注意：\r\n- DNS 模式不会广播局域网服务器；它会通过中继服务器路由游戏流量。\r\n- 使用结束后，如果你需要恢复正常网络行为，请将 DNS 改回原设置。';

  @override
  String get howToFriendsTitle => '好友模式';

  @override
  String get howToFriendsSubtitle => '邀请好友并通过局域网加入';

  @override
  String get howToFriendsBody => '好友模式 — 快速步骤：\r\n1. 如有需要，请在你的主机或平台上添加 MCCompanion 好友账号（Relay 好友）。\r\n2. 在应用中启用好友模式并发送 Relay 配置（如果适用）。\r\n3. 在你的主机上打开 Minecraft → Friends，并搜索 LAN Worlds —— 你的服务器应当会显示为一个局域网世界。\r\n4. 选择它即可与你的好友一起加入服务器。\r\n注意：\r\n- 请确保你和你的好友拥有相同且允许好友在线显示的 NAT/设置。\r\n- 好友模式依赖平台的好友功能，可能需要接受好友请求。';

  @override
  String get helpMCCompanionTitle => 'MCCompanion 未显示';

  @override
  String get helpMCCompanionSubtitle => '局域网发现问题排查';

  @override
  String get helpMCCompanionBody => '如果服务器没有出现在你的主机上，请尝试以下步骤：\r\n\r\n✅ 基本检查：\r\n1. 相同的 WiFi 网络 - 你的手机/平板和主机必须连接到同一个 WiFi\r\n2. 正确的服务器地址 - 再次检查 IP 和端口（默认：19132）\r\n3. 广播已激活 - 确认 MCCompanion 显示 \\\"正在广播\\\" 状态\r\n\r\n🔄 快速修复：\r\n• 重启应用：停止广播，完全关闭 MCCompanion，重新打开后再试一次\r\n• 重启主机：有时主机需要刷新才能检测到局域网游戏\r\n• 检查好友/LAN 标签页：服务器会显示在 \\\"好友\\\" 或 \\\"局域网游戏\\\" 下，而不是服务器列表中\r\n• 开始广播后等待 10-15 秒\r\n• 禁用 VPN：VPN 可能会阻止本地广播\r\n\r\n⚠️ 常见问题：\r\n\\\"No route found for user\\\" → 确保两台设备位于同一个 Wi‑Fi（避免使用访客网络）\r\n\\\"Unable to connect to MCCompanion relay server\\\" → 检查你的网络 / 中继服务器状态\r\n\r\n📱 仍然有问题？请在 MCCompanion 中启用调试模式并检查日志，或尝试其他服务器。';

  @override
  String get helpMultiplayerFailedTitle => '多人连接失败';

  @override
  String get helpMultiplayerFailedSubtitle => '说明这为什么不是 MCCompanion 错误';

  @override
  String get helpMultiplayerFailedBody => '⚠️ 这不是 MCCompanion 的问题！\r\n\r\nMCCompanion 已成功将你重定向到请求的服务器。\\\"多人连接失败\\\" 这条消息表示目标服务器当前无法访问。可能原因包括：\r\n\r\n• 目标 Minecraft 服务器离线或负载过高\r\n• 服务器需要更新的客户端版本或特定版本\r\n• Relay 与目标服务器之间存在网络问题\r\n\r\n请尝试连接到其他服务器，或联系该服务器的支持团队。如果多个服务器都出现此问题，请在 MCCompanion 中启用调试模式并检查日志。';

  @override
  String get helpNintendoDnsTitle => 'Nintendo DNS 无法工作';

  @override
  String get helpNintendoDnsSubtitle => '常见 DNS / Relay 问题';

  @override
  String get helpNintendoDnsBody => '如果 Nintendo DNS 模式无法工作，请检查以下内容：\r\n\r\n1. 确认你已从应用中发送 DNS 配置（发送 DNS 配置）。\r\n2. 确认你已在 Switch 上将 Relay IP 设置为主 DNS。\r\n3. 确保所选的 Relay 服务器（EU/US）在线且未过载。\r\n4. 某些网络（例如强制门户网络）会阻止自定义 DNS —— 请在其他网络上测试。\r\n\r\n如果问题仍然存在，请启用调试模式并检查日志，或尝试好友模式这一替代方案。';

  @override
  String get helpFriendsModeTitle => '好友模式无法工作';

  @override
  String get helpFriendsModeSubtitle => '常见好友问题';

  @override
  String get helpFriendsModeBody => '好友模式故障排除提示：\r\n\r\n1. 确保 Relay 好友账号已在主机上添加/接受（如有需要）。\r\n2. 启用好友模式后，尝试重新启动游戏并刷新 Friends/LAN 标签页。\r\n\r\n如果服务器仍未显示给好友，请启用调试模式并检查日志以识别错误。';

  @override
  String get changeLanguageTitle => '更改语言';

  @override
  String get changeLanguage => '语言';

  @override
  String get useSystemLanguage => '使用系统语言';

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
  String get notificationsOn => '通知已开启';

  @override
  String get notificationsOff => '通知已关闭';

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
  String get customizeSubtitle => '重新排列磁贴并自定义导航';

  @override
  String get resetLabel => '重置';

  @override
  String get tilesSection => '磁贴';

  @override
  String get dragToReorder => '拖动以重新排序';

  @override
  String get navigationSection => '导航';

  @override
  String get navFixed => '主页、连接器和个人资料始终固定';

  @override
  String get leftSlot => '左槽（主页旁边）';

  @override
  String get rightSlot => '右槽（个人资料旁边）';

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
  String get home => '主页';

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
  String get featureLabelConnector => '连接器';

  @override
  String get featureLabelSkins => '皮肤';

  @override
  String get featureLabelWiki => '维基';

  @override
  String get featureLabelPartners => '合作伙伴';

  @override
  String get featureLabelLookup => '查找';

  @override
  String get featureLabelTracker => '服务器追踪器';

  @override
  String get featureSubtitleConnector => '将主机连接到Minecraft';

  @override
  String get featureSubtitleSkins => '浏览和管理Minecraft皮肤';

  @override
  String get featureSubtitleWiki => 'Minecraft百科全书';

  @override
  String get featureSubtitlePartners => '精选服务器';

  @override
  String get featureSubtitleLookup => '查找Java和Bedrock档案';

  @override
  String get featureSubtitleTracker => '监控服务器状态并获取通知';

  @override
  String get userSearchHint => '用户名、玩家代号或Java名…';

  @override
  String get userSearchSub => '按用户名、Xbox玩家代号或Java名搜索';

  @override
  String get onlineStatus => '在线';

  @override
  String get upgradeWindowsHint => '可在 Microsoft Store 升级';

  @override
  String get chatEmptyHint => '率先说点什么吧！';

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
  String get feedbackGoesToGithub => '直接发送到 GitHub';

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
  String get feedbackDescHintBug => '描述该错误——你做了什么、你期望什么，以及实际发生了什么？';

  @override
  String get feedbackDescHintFeature => '解释你想要什么以及为什么有用。';

  @override
  String get feedbackEmailLabel => '电子邮件（可选）';

  @override
  String get feedbackEmailHint => '以便我们与你联系';

  @override
  String get feedbackEmailNote => '你的电子邮件永远不会公开分享。';

  @override
  String get feedbackSubmitBug => '提交错误报告';

  @override
  String get feedbackSubmitFeature => '提交功能请求';

  @override
  String get feedbackDisclaimer => '在 GitHub 上创建公开 Issue · 请勿包含密码';

  @override
  String get feedbackSuccessTitle => '感谢你的反馈！';

  @override
  String get feedbackSuccessBody => '你的报告已提交，GitHub Issue 已创建。我们会尽快查看。';

  @override
  String get feedbackViewOnGithub => '在 GitHub 上查看';

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
  String get feedbackTileTitle => '报告错误或建议功能';

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
  String get friendsHowToNote => '⚠️ 每次想玩时，请先在 MCCompanion 应用中启动好友模式。启动后可以关闭应用。';

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
  String get rpWhatIsThis => '这是什么？';

  @override
  String get rpExplanation => '资源包可以改变你游戏机上Minecraft的外观——新的方块、颜色或音效。在下方粘贴.mcpack文件的链接，启用后保存。MCCompanion每次连接时会自动加载。';

  @override
  String get rpPackUrlLabel => '包 URL';

  @override
  String get rpPackUrlHint => 'https://example.com/pack.mcpack';

  @override
  String get rpEnableToggle => '启用资源包';

  @override
  String get rpWhatWorks => '有效的方式';

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
  String get rpNoDiscord => 'Discord 链接 — 没有 .mcpack 扩展名，且会在几小时后失效';

  @override
  String get rpNoDrive => 'Google Drive / Dropbox 分享链接 — 非直接下载';

  @override
  String get rpNoEncrypted => '带有加密或密码保护包的服务器';

  @override
  String get rpConsolePerformanceTitle => 'Console performance';

  @override
  String get rpConsolePerformanceBody => 'High-resolution texture packs can cause lag or crashes on consoles. If you experience issues, switch to a lower-resolution pack or select a lighter subpack if the pack supports it.';

  @override
  String get rpWarnDiscord => 'Discord 链接会过期并停止工作。请改用永久性托管服务。';

  @override
  String get rpWarnHttps => 'URL 必须以 https:// 开头';

  @override
  String get rpWarnExtension => 'URL 必须以 .mcpack 或 .zip 结尾';

  @override
  String get rpToastEnterUrl => '启用资源包前请先输入 URL。';

  @override
  String get rpToastSaved => '资源包设置已保存。';

  @override
  String get rpClearMinecraftTitle => '第一次使用此资源包？';

  @override
  String get rpClearMinecraftBody => 'Minecraft 会在本地缓存资源包。如果您在启用 MCCompanion 资源包之前已连接过此服务器，Minecraft 已缓存了原始资源包，不会重新下载合并后的版本。';

  @override
  String get rpClearStep1 => '在主机上打开 Minecraft，前往设置 → 存储';

  @override
  String get rpClearStep2 => '点击材质包旁边的“清除”或“重置”——这会删除所有本地缓存的材质包';

  @override
  String get rpClearStep3 => '通过 MCCompanion 重新连接——合并后的材质包将自动下载';

  @override
  String get rpRelayTitle => '资源包显示有问题？';

  @override
  String get rpRelayBody => '中继服务器以您的覆盖层 URL 为缓存键，将合并后的材质包缓存 1 小时。要强制重新合并：稍微修改材质包链接（例如在末尾添加 ?v=2）并保存。之后还需要清除 Minecraft 的材质包缓存——合并后的材质包仍使用服务器的 UUID，否则 Minecraft 会直接使用旧的缓存版本。';

  @override
  String get rpWorksGithubHint => '直接下载链接，始终可访问';

  @override
  String get rpWorksCloudflareHint => '公共云存储，快速可靠';

  @override
  String get rpWorksDirectHint => '任何公开的 HTTPS .mcpack 或 .zip 链接';

  @override
  String get rpNoDiscordHint => 'Discord CDN 链接会在短时间内失效';

  @override
  String get rpNoDriveHint => '无直接下载，会跳转到预览页面';

  @override
  String get rpNoEncryptedHint => 'MCCompanion 无法合并加密的材质包内容';

  @override
  String get rpClearWhy => 'Minecraft 通过 UUID 缓存材质包。合并后的材质包保留服务器原有的 UUID——如果 Minecraft 在之前的游戏中（启用 MCCompanion 之前）已经缓存了服务器的材质包，它就不会重新下载新的合并版本。清除缓存，让 Minecraft 加载最新的合并材质包。';

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
}
