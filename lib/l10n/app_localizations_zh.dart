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
  String get nldServerLabel => 'NETHERLINK 服务器';

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
  String get helpNetherlinkTitle => 'MCCompanion 未显示';

  @override
  String get helpNetherlinkSubtitle => '局域网发现问题排查';

  @override
  String get helpNetherlinkBody => '如果服务器没有出现在你的主机上，请尝试以下步骤：\r\n\r\n✅ 基本检查：\r\n1. 相同的 WiFi 网络 - 你的手机/平板和主机必须连接到同一个 WiFi\r\n2. 正确的服务器地址 - 再次检查 IP 和端口（默认：19132）\r\n3. 广播已激活 - 确认 MCCompanion 显示 \\\"正在广播\\\" 状态\r\n\r\n🔄 快速修复：\r\n• 重启应用：停止广播，完全关闭 MCCompanion，重新打开后再试一次\r\n• 重启主机：有时主机需要刷新才能检测到局域网游戏\r\n• 检查好友/LAN 标签页：服务器会显示在 \\\"好友\\\" 或 \\\"局域网游戏\\\" 下，而不是服务器列表中\r\n• 开始广播后等待 10-15 秒\r\n• 禁用 VPN：VPN 可能会阻止本地广播\r\n\r\n⚠️ 常见问题：\r\n\\\"No route found for user\\\" → 确保两台设备位于同一个 Wi‑Fi（避免使用访客网络）\r\n\\\"Unable to connect to MCCompanion relay server\\\" → 检查你的网络 / 中继服务器状态\r\n\r\n📱 仍然有问题？请在 MCCompanion 中启用调试模式并检查日志，或尝试其他服务器。';

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
  String get reportUser => '举报用户';
  @override
  String reportUserWithName(String username) => '举报 @$username';
  @override
  String get reportMessage => '举报消息';
  @override
  String get reportDisclaimer => '我们的团队将审核此举报。感谢您维护社区安全。';
  @override
  String get reportReasonSpam => '垃圾信息';
  @override
  String get reportReasonHarassment => '骚扰或欺凌';
  @override
  String get reportReasonInappropriate => '不当内容';
  @override
  String get reportReasonOther => '其他';
  @override
  String get reportAdditionalDetails => '附加详情（可选）';
  @override
  String get reportSubmit => '提交举报';
  @override
  String get reportSuccess => '举报已提交。谢谢。';
  @override
  String get reportFailed => '无法提交举报。请重试。';
  @override
  String get messagePlaceholder => '消息...';
  @override
  String get noMessagesYet => '暂无消息。\n打个招呼吧！';
  @override
  String get today => '今天';
  @override
  String get yesterday => '昨天';
  @override
  String get noConversationsYet => '暂无对话';
  @override
  String get startChatHint => '从好友列表开始聊天。';
  @override
  String get youPrefix => '你';
  @override
  String get tabProfile => '个人资料';
  @override
  String get tabFriends => '好友';
  @override
  String get tabRequests => '请求';
  @override
  String get tabChats => '聊天';
  @override
  String get addFriend => '添加好友';
  @override
  String get usernameHint => '用户名';
  @override
  String get send => '发送';
  @override
  String friendRequestSentTo(String username) => '已向 @$username 发送好友请求';
  @override
  String alreadyFriendsWith(String username) => '您已经是 @$username 的好友。';
  @override
  String requestAlreadyPending(String username) => '与 @$username 已有待处理的请求。';
  @override
  String userNotFoundMsg(String username) => '找不到用户 @$username。';
  @override
  String cannotSendRequest(String username) => '您无法向 @$username 发送请求。';
  @override
  String get somethingWentWrong => '出了些问题。请重试。';
  @override
  String friendRequestAccepted(String username) => '已接受 @$username 的好友请求';
  @override
  String requestDeclined(String username) => '已拒绝 @$username 的请求';
  @override
  String get deleteAccountTitle => '删除账户';
  @override
  String get deleteAccountBody => '这将永久删除您的账户、消息、好友和所有相关数据。此操作无法撤销。';
  @override
  String get deletePermanently => '永久删除';
  @override
  String get couldNotDeleteAccount => '无法删除账户。请重试。';
  @override
  String get removeFriendTitle => '删除好友';
  @override
  String removeFriendConfirm(String username) => '要将 @$username 从好友中删除吗？';
  @override
  String get remove => '删除';
  @override
  String friendRemoved(String username) => '@$username 已从您的好友中删除';
  @override
  String get noFriendsYet => '暂无好友';
  @override
  String get noFriendsSub => '使用右上角的按钮添加好友。';
  @override
  String get noPendingRequests => '没有待处理的请求';
  @override
  String get requestsAppearHere => '好友请求将显示在此处。';
  @override
  String onlineFriendsLabel(int count) => '在线 — $count';
  @override
  String offlineFriendsLabel(int count) => '离线 — $count';
  @override
  String get couldNotUpdateVisibility => '无法更新可见性。请重试。';
  @override
  String get aboutMe => '关于我';
  @override
  String get linkedAccountsTitle => '关联账户';
  @override
  String get linkAccountsHint => '关联您的 Minecraft 账户以在个人资料中显示。';
  @override
  String get unlinkXboxTitle => '取消关联 Xbox 账户';
  @override
  String removeLabelConfirm(String label) => '从关联账户中移除 $label？';
  @override
  String get unlinkJavaTitle => '取消关联 Java Edition';
  @override
  String removeJavaConfirm(String username) => '从关联账户中移除 $username？';
  @override
  String get unlink => '取消关联';
  @override
  String get linkXbox => '关联 Xbox';
  @override
  String get linkJava => '关联 Java';
  @override
  String get appearOfflineLabel => '显示为离线';
  @override
  String get appearOfflineOn => '好友看到您为离线状态';
  @override
  String get appearOfflineOff => '好友可以看到您何时在线';
  @override
  String get signOut => '退出登录';
  @override
  String get profileCardTitle => '个人资料';
  @override
  String get edit => '编辑';
  @override
  String get displayNameLabel => '显示名称';
  @override
  String get bioLabel => '个人简介';
  @override
  String get yourNameHint => '您的姓名';
  @override
  String get bioHint => '介绍一下自己';
  @override
  String get avatarUrlLabel => '头像 URL';
  @override
  String get usernameDisplayLabel => '用户名';
  @override
  String get profileUpdated => '个人资料已更新';
  @override
  String get findUser => '查找用户';
  @override
  String get signIn => '登录';
  @override
  String get createAccount => '创建账户';
  @override
  String get signInSubtitle => '登录以添加好友并分享您的会话。';
  @override
  String get emailAddressHint => '电子邮件地址';
  @override
  String get passwordHint => '密码';
  @override
  String get forgotPassword => '忘记密码？';
  @override
  String get continueWithGoogle => '使用 Google 继续';
  @override
  String get alreadyHaveAccount => '已有账户？登录';
  @override
  String get noAccountYet => '还没有账户？注册';
  @override
  String get orDivider => '或';
  @override
  String get resetPasswordTitle => '重置密码';
  @override
  String get resetPasswordBody => '输入您的电子邮件地址，我们将向您发送重置密码的链接。';
  @override
  String get sendLink => '发送链接';
  @override
  String resetLinkSent(String email) => '重置链接已发送至 $email';
  @override
  String get noAccountForEmail => '未找到此电子邮件地址对应的账户。';
  @override
  String get invalidEmailError => '无效的电子邮件地址。';
  @override
  String get couldNotSendResetEmail => '无法发送重置邮件。请重试。';
  @override
  String get incorrectEmailOrPassword => '电子邮件或密码不正确。';
  @override
  String get emailAlreadyInUse => '此电子邮件地址已被使用。';
  @override
  String get weakPassword => '密码必须至少包含 6 个字符。';
  @override
  String get googleSignInFailed => 'Google 登录失败。请重试。';
  @override
  String get appleSignInFailed => 'Apple 登录失败。请重试。';
  @override
  String get emailDifferentMethod => '此电子邮件已通过其他登录方式注册了账户。';
  @override
  String get enterEmailAndPassword => '请输入您的电子邮件和密码。';
  @override
  String get profileNotSetUp => '个人资料尚未设置';
  @override
  String get chooseUsernameSubtitle => '选择用户名以添加好友并分享您的会话。';
  @override
  String get createProfile => '创建个人资料';
  @override
  String get chooseUniqueUsername => '选择唯一的用户名以添加好友。';
  @override
  String get usernameFieldLabel => '用户名 *';
  @override
  String get usernameFormatHint => '3–20 个字符 · 仅限 a-z、0-9 和 _';
  @override
  String get displayNameOptional => '显示名称（可选）';
  @override
  String get usernameRequired => '请输入用户名。';
  @override
  String get usernameFormatError => '3–20 个字符，仅限小写字母、数字和 _';
  @override
  String get usernameTaken => '此用户名已被使用。';
  @override
  String get noConnectionError => '没有连接。请重试。';
  @override
  String get usernameExampleHint => '例如 jens_mc';
  @override
  String get displayNameExampleHint => '例如 Jens';
  @override
  String get home => '首页';
  @override
  String get info => '信息';
  @override
  String get consoleConnect => 'Console Connect';
  @override
  String get consoleConnectSubtitle => '连接到 Minecraft 服务器';
  @override
  String get minecraftSkins => 'Minecraft 皮肤';
  @override
  String get minecraftSkinsSubtitle => '查看和编辑 Java 与 Bedrock 皮肤';
  @override
  String get minecraftWiki => 'Minecraft Wiki';
  @override
  String get minecraftWikiSubtitle => '生物、方块、合成配方等';
  @override
  String get partnerServersLabel => '合作服务器';
  @override
  String get partnerServersSubtitle => '精选 Minecraft 服务器';
  @override
  String get userLookup => 'Minecraft 用户查找';
  @override
  String get userLookupSubtitle => '查找 Java 和 Bedrock 个人资料';

  @override
  String get navSkins => '皮肤';
  @override
  String get navWiki => '百科';
  @override
  String get navProfile => '我的';

  @override
  String get skinsUpload => '上传';
  @override
  String get skinsCreate => '创建';
  @override
  String get skinsSubtitle => '查看和下载 Minecraft 皮肤。';
  @override
  String get skinsSectionRecent => '最近皮肤';
  @override
  String get skinsSectionMy => '我的皮肤';
  @override
  String get skinsSectionYours => '你的皮肤';
  @override
  String get skinsEmptyMySkins => '暂无已保存的皮肤，创建或上传一个皮肤来开始吧。';
  @override
  String get skinsCouldNotLoad => '无法加载皮肤';
  @override
  String skinsPageOf(int page, int total) => '第 $page / $total 页';
  @override
  String get skinsMustBe64 => '皮肤必须为 64×64 像素';
  @override
  String get skinsInvalidFile => '无效的图片文件';
  @override
  String get skinsDownload => '下载';
  @override
  String get skinsEdit => '编辑';
  @override
  String get skinsNoAccountsTitle => '未关联账号';
  @override
  String get skinsNoAccountsSubtitle => '在个人资料中关联 Java 或 Bedrock 以查看你的皮肤。';
  @override
  String get skinsSignInTitle => '登录以查看你的皮肤';
  @override
  String get skinsSignInSubtitle => '创建账号并在个人资料中关联 Java 或 Bedrock。';
}
