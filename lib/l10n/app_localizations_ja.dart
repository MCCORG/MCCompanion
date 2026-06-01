// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'NetherLink';

  @override
  String get console => 'コンソール';

  @override
  String get consoleOutput => 'コンソール出力';

  @override
  String get noLogsYet => 'まだログはありません';

  @override
  String get startBroadcastingToSeeOutput => '出力を見るにはブロードキャストを開始してください';

  @override
  String get close => '閉じる';

  @override
  String get ok => 'OK';

  @override
  String get joinUs => '参加する';

  @override
  String get more => 'その他';

  @override
  String get website => 'ウェブサイト';

  @override
  String get howToUseMenu => '使い方';

  @override
  String get support => 'サポート';

  @override
  String helpText(Object appCreator) {
    return '$appCreator によって作成されました。\r\n\r\n使い方:\r\n1. Minecraft サーバーのアドレスとポートを入力します（デフォルト: 19132）\r\n   — またはドロップダウンから以前保存したサーバーを選択します\r\n2. （任意）現在地に最も近い Relay Server（EU または US）を選択します\r\n3. \"ブロードキャスト開始\" をクリックして開始します\r\n4. コンソール/デバイスで: Minecraft > Play > Friends\r\n5. \"NetherLink\" という名前の LAN サーバーが表示されます\r\n6. それをクリックすると、NetherLink 経由で外部サーバーに参加できます\r\n\r\nNintendo Switch（DNS モード）:\r\n1. 接続パネルで \"Nintendo Switch\" を有効にします\r\n2. Relay Server（EU または US）を選択します\r\n3. \"Send DNS Config\" をクリックすると、設定が relay に送信されます\r\n   （これは LAN サーバーをブロードキャストしません）\r\n4. Switch で NetherLink の DNS 設定を適用し、\r\n   NetherLink 用に使っているサーバー項目から参加します\r\n\r\nメモ:\r\n- LAN ブロードキャストでは、NetherLink とコンソールが同じローカルネットワーク上にある必要があります。\r\n- ヒント: 最良のパフォーマンスを得るには、最も近い relay サーバーを選択してください。';
  }

  @override
  String get serverDetailsLabel => 'サーバー詳細';

  @override
  String get start => '開始';

  @override
  String get stop => '停止';

  @override
  String get labelJava => 'Java';

  @override
  String get startJavaMode => 'Javaモードを開始';

  @override
  String get javaInfoTitle => 'Javaモード';

  @override
  String get javaInfoText => 'Java Editionサーバーに接続';

  @override
  String get howToJavaTitle => 'Javaモード';

  @override
  String get howToJavaSubtitle => 'NetherLink経由でJava Editionサーバーに接続';

  @override
  String get aternosSubtext => '自分だけの無料Minecraftサーバーを作成しましょう';

  @override
  String get howToJavaBody => 'Javaモード — クイック手順:\n1. アプリでJavaモードを選択します。\n2. Java Editionサーバーのアドレスとポートを入力します（既定: 25565）。\n3. 「Javaモードを開始」を押します — NetherLinkが接続を橋渡しします。\n4. Minecraft Bedrockを開いて、フレンドタブに移動します。\n5. Javaサーバーに参加するには、「NetherLink」という名前のLANサーバーを選択します。\n\n⚠️ 重要な警告:\n- 有効なJava Editionアカウント（Microsoft）が必要です。\n- 一部のサーバーではアンチチートシステムが使用されており、アカウントが検出されてBANされる可能性があります。\n- Bedrockクライアントを明確に禁止しているサーバーもあります — 必ずサーバールールを確認してください。\n- この機能の使用によって発生するアカウントBAN、利用停止、その他のアカウント関連の問題について、NetherLinkは責任を負いません。\n- 自己責任で使用してください。';

  @override
  String get language => '日本語';

  @override
  String get discord => 'Discord';

  @override
  String get toggleDebug => 'デバッグを切り替える';

  @override
  String get copyLogs => 'ログをコピー';

  @override
  String get clear => 'クリア';

  @override
  String get cancel => 'キャンセル';

  @override
  String get deleteServer => 'サーバーを削除';

  @override
  String get delete => '削除';

  @override
  String get myServers => 'マイサーバー';

  @override
  String get quickAccessServers => 'クイックアクセスサーバー';

  @override
  String get addServer => 'サーバーを追加';

  @override
  String get addServersHint => '後ですばやく接続できるようにサーバーを追加します';

  @override
  String get serverNameLabel => 'サーバー名 *';

  @override
  String get addressLabel => 'アドレス *';

  @override
  String get portLabel => 'ポート *';

  @override
  String get descriptionLabel => '説明（任意）';

  @override
  String get save => '保存';

  @override
  String get initializing => '初期化中...';

  @override
  String get createdBy => 'NetherDev によって作成';

  @override
  String get bedrockBridge => 'Bedrockブリッジ';

  @override
  String get clientDisconnected => 'クライアントが切断されました — ブロードキャストを停止しました';

  @override
  String get pleaseEnterServer => '⚠️ サーバーアドレスを入力してください';

  @override
  String get invalidPort => '⚠️ 無効なポート番号です（1-65535）';

  @override
  String get dnsConfigSent => '✅ DNS 設定を relay に送信しました';

  @override
  String get broadcastingStarted => 'ブロードキャストを開始しました';

  @override
  String get broadcastStopped => 'ブロードキャストを停止しました';

  @override
  String selectedServer(Object name) {
    return '📋 選択中: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return '選択中: $name';
  }

  @override
  String get noLogsToCopy => 'コピーするログがありません';

  @override
  String copiedLogs(Object count) {
    return '$count 件のログをクリップボードにコピーしました';
  }

  @override
  String get debugEnabled => 'デバッグログを有効にしました';

  @override
  String get debugDisabled => 'デバッグログを無効にしました';

  @override
  String get howToUseTitle => 'NetherLink の使い方';

  @override
  String get iUnderstand => '理解しました';

  @override
  String get playOnSwitchTitle => 'Nintendo Switch で遊ぶ';

  @override
  String get playWithFriendsTitle => '友達と遊ぶ';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return '選択中: $relayName\r\n\r\n接続方法:\r\n1. Switch の設定を開き、DNS を次に変更します: $relayIp\r\n2. Minecraft を開き、リストからサーバーを選択します（Cubecraft や Hive など）。\r\n3. これで自動的に自分のサーバーへ送られます。';
  }

  @override
  String playInstructionsFriends(Object friend) {
    return '接続方法:\r\n1. コンソールで $friend をフレンドとして追加します。\r\n2. Minecraft を開き、Friends タブに移動します。\r\n3. LAN Worlds の下にある自分のサーバーを探し、選択して参加します。';
  }

  @override
  String get nldServerLabel => 'NETHERLINK サーバー';

  @override
  String selectRelayLabel(Object name) {
    return 'relay を選択 $name';
  }

  @override
  String get noSavedServers => '保存されたサーバーはありません';

  @override
  String get savedServers => '保存されたサーバー';

  @override
  String get serverAddressHint => 'サーバーアドレス';

  @override
  String get portHint => 'ポート';

  @override
  String get manageServers => 'サーバーを管理';

  @override
  String get manageServersTooltip => 'サーバーを管理';

  @override
  String get noServerYet => '保存されたサーバーはまだありません。\n追加するには「管理」をタップしてください。';

  @override
  String get serverNotSelected => 'サーバーが選択されていません';

  @override
  String get ready => '準備完了';

  @override
  String get active => 'アクティブ';

  @override
  String get vpnDetected => 'VPN が検出されました';

  @override
  String get noWifi => 'Wi‑Fi に接続されていません';

  @override
  String get vpnActive => 'VPN が有効になっていることを検出しました。\n\nNetherLink を使用する前に VPN を無効にしてください。そうしないと、LAN ブロードキャストがコンソールに届かない可能性があります。';

  @override
  String get mobileActive => '検出: モバイルデータ\n\nNetherLink はコンソールと同じネットワーク上にある必要があります。続行する前に、自宅の Wi‑Fi またはホットスポットに接続してください。';

  @override
  String get continueAnyway => 'このまま続行';

  @override
  String get sameWifi => '同じ Wi‑Fi ネットワーク';

  @override
  String get needSameWifi => 'NetherLink を実行している端末は、Minecraft をプレイするコンソールと同じ Wi‑Fi ネットワーク上にある必要があります。';

  @override
  String get subscription => 'オンライン加入が必要';

  @override
  String get needSubscription => '各コンソールには有効なオンライン加入サービス（Xbox Live、PS Plus、NSO）が必要です。ない場合、NetherLink は表示されません。';

  @override
  String get updateAvailable => 'アップデートがあります';

  @override
  String get newVersion => 'アプリの新しいバージョンが利用できます。\n最新の機能と修正のため、今すぐ更新してください。';

  @override
  String get later => '後で';

  @override
  String get updateNow => '今すぐ更新';

  @override
  String get beforeYouStart => '始める前に';

  @override
  String get stopBroadcasting => 'ブロードキャスト停止';

  @override
  String get startNintendoMode => 'Nintendo モード開始';

  @override
  String get startFriendsMode => 'Friends モード開始';

  @override
  String get startBroadcasting => 'ブロードキャスト開始';

  @override
  String get modeLabel => 'モード';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => '友達';

  @override
  String get nintendoInfoTitle => 'Nintendo Switch DNS モード';

  @override
  String get nintendoInfoText => 'Nintendo モードで開始し、DNS を設定して注目サーバーに参加します。';

  @override
  String get friendModeTitle => 'フレンドモード';

  @override
  String get friendModeText => 'NetherLink のフレンド bot をフレンドとして追加します。Friends モードを開始して遊びましょう';

  @override
  String get selectedRelayCheck => '選択済み';

  @override
  String relayFallbackWarning(Object name) {
    return '警告: 元の relay が応答しませんでした。代替 relay を使用中です: $name';
  }

  @override
  String get relayUnableConnect => 'どの NetherLink relay サーバーにも接続できません。後でもう一度試すか、インターネット接続を確認してください。';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / プロキシ)';

  @override
  String get howToXboxSubtitle => 'LAN ブロードキャストまたは proxy 経由でプレイ';

  @override
  String get howToXboxBody => '接続方法（Xbox / PS4 / PS5）:\r\n1. NetherLink を実行しているデバイスとコンソールが同じローカルネットワーク上にあることを確認してください。\r\n2. アプリで Minecraft サーバーのアドレスとポートを入力し、\"ブロードキャスト開始\" を押します。\r\n3. コンソールで Minecraft → Play を開き、LAN Worlds または Friends タブを探してリストを更新します。\r\n4. \"NetherLink\" という名前の LAN サーバーを選択して参加します。\r\nメモ:\r\n- サーバーが表示されない場合は、両方のデバイスが同じサブネット上にあり、アプリがまだブロードキャスト中であることを確認してください。\r\n- 一部のコンソールやルーターでは LAN 検出がブロックされる場合があります。必要に応じてアプリやルーターの設定を切り替えてみてください。';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (DNS モード)';

  @override
  String get howToNintendoSubtitle => 'Switch 用 DNS relay 手順';

  @override
  String get howToNintendoBody => 'Nintendo Switch — DNS モード（手順）:\r\n1. アプリで \"Nintendo\" モードを有効にし、Relay Server（EU または US）を選択します。\r\n2. \"Send DNS Config\" をタップして DNS IP を relay に送信します。\r\n3. Nintendo Switch で System Settings → Internet → Internet Settings → （使用中のネットワーク）→ Change Settings → DNS に進み、Primary DNS を relay IP に設定します。\r\n4. Minecraft を開いて公開サーバーに参加すると、relay DNS を使って自分のサーバーへリダイレクトされます。\r\nメモ:\r\n- DNS モードは LAN サーバーをブロードキャストせず、ゲーム通信を relay 経由でルーティングします。\r\n- 通常のネットワーク動作が必要な場合は、完了後に DNS を元に戻してください。';

  @override
  String get howToFriendsTitle => 'Friends モード';

  @override
  String get howToFriendsSubtitle => '友達を招待して LAN 経由で参加';

  @override
  String get howToFriendsBody => 'フレンドモード — 簡単な手順:\r\n1. 必要に応じて、コンソールまたはプラットフォームで NetherLink のフレンドアカウントを追加します。\r\n2. アプリでフレンドモードを有効にし、relay 設定を送信します（該当する場合）。\r\n3. コンソールで Minecraft → Friends を開き、LAN Worlds を探します。そこに LAN ワールドとして自分のサーバーが表示されるはずです。\r\n4. それを選択して、友達と一緒に自分のサーバーへ参加します。\r\nメモ:\r\n- 自分と友達の両方が、フレンド表示を許可する同じ NAT/設定になっていることを確認してください。\r\n- フレンドモードはプラットフォームのフレンド機能に依存し、フレンド申請の承認が必要な場合があります。';

  @override
  String get helpNetherlinkTitle => 'NetherLink が表示されない';

  @override
  String get helpNetherlinkSubtitle => 'LAN 検出の問題をトラブルシューティング';

  @override
  String get helpNetherlinkBody => 'コンソールにサーバーが表示されない場合は、次の手順を試してください:\r\n\r\n✅ 基本チェック:\r\n1. 同じ WiFi ネットワーク - スマホ/タブレットとコンソールは必ず同じ WiFi 上にある必要があります\r\n2. 正しいサーバーアドレス - IP とポート（デフォルト: 19132）を再確認してください\r\n3. ブロードキャストが有効 - NetherLink に \"ブロードキャスト中\" ステータスが表示されていることを確認してください\r\n\r\n🔄 すぐできる対処:\r\n• アプリを再起動: ブロードキャストを停止し、NetherLink を完全に閉じてから再度開いて試してください\r\n• コンソールを再起動: LAN ゲームを検出するには、コンソールの更新が必要なことがあります\r\n• Friends/LAN タブを確認: サーバーはサーバー一覧ではなく、\"Friends\" または \"LAN Games\" の下に表示されます\r\n• ブロードキャスト開始後 10〜15 秒待つ\r\n• VPN を無効化: VPN はローカルブロードキャストを妨げることがあります\r\n\r\n⚠️ よくある問題:\r\n\"No route found for user\" → 両方のデバイスが同じ Wi‑Fi 上にあることを確認してください（ゲストネットワークは避けてください）\r\n\"Unable to connect to NetherLink relay server\" → インターネット接続 / relay の状態を確認してください\r\n\r\n📱 まだ問題がありますか？ NetherLink でデバッグモードを有効にしてログを確認するか、別のサーバーを試してください。';

  @override
  String get helpMultiplayerFailedTitle => 'マルチプレイヤー接続に失敗しました';

  @override
  String get helpMultiplayerFailedSubtitle => 'これが NetherLink のエラーではない理由';

  @override
  String get helpMultiplayerFailedBody => '⚠️ これは NetherLink の問題ではありません！\r\n\r\nNetherLink は正常に要求されたサーバーへリダイレクトしました。\"Multiplayer Connection Failed\" というメッセージは、対象サーバーに現在到達できないことを示しています。考えられる理由:\r\n\r\n• 対象の Minecraft サーバーがオフライン、または過負荷状態である\r\n• サーバーが更新されたクライアントバージョン、または特定のエディションを要求している\r\n• relay と対象サーバーの間にネットワークの問題がある\r\n\r\n別のサーバーに接続するか、そのサーバーのサポートに連絡してください。複数のサーバーで問題が続く場合は、NetherLink でデバッグモードを有効にしてログを確認してください。';

  @override
  String get helpNintendoDnsTitle => 'Nintendo DNS が動作しない';

  @override
  String get helpNintendoDnsSubtitle => 'よくある DNS / relay の問題';

  @override
  String get helpNintendoDnsBody => 'Nintendo DNS モードが動作しない場合は、次を確認してください:\r\n\r\n1. アプリから DNS 設定を送信したことを確認します（Send DNS Config）。\r\n2. Switch に relay IP をプライマリ DNS として適用したことを確認します。\r\n3. 選択した relay サーバー（EU/US）がオンラインで、過負荷でないことを確認します。\r\n4. 一部のネットワーク（例: captive portal）はカスタム DNS を妨げます。別のネットワークで試してください。\r\n\r\n問題が続く場合は、デバッグモードを有効にしてログを確認するか、フレンドモードの代替手段を試してください。';

  @override
  String get helpFriendsModeTitle => 'Friends モードが動作しない';

  @override
  String get helpFriendsModeSubtitle => 'よくあるフレンド関連の問題';

  @override
  String get helpFriendsModeBody => 'フレンドモードのトラブルシューティング:\r\n\r\n1. relay フレンドアカウントがコンソールで追加/承認されていることを確認してください（必要な場合）。\r\n2. フレンドモードを有効にしたあと、ゲームを再起動して Friends/LAN タブを更新してみてください。\r\n\r\nそれでもサーバーが友達に表示されない場合は、デバッグモードを有効にしてログを確認し、エラーを特定してください。';

  @override
  String get changeLanguageTitle => '言語を変更';

  @override
  String get changeLanguage => '言語';

  @override
  String get useSystemLanguage => 'システム言語を使用';

  @override
  String get couldNotOpenUrl => 'URL を開けませんでした';

  @override
  String get serverTrackerTitle => 'サーバートラッカー';

  @override
  String get removeServerTitle => 'サーバーを削除';

  @override
  String removeServerConfirm(Object name) {
    return 'トラッカーから \"$name\" を削除しますか？';
  }

  @override
  String get removeServerFailed => 'サーバーの削除に失敗しました';

  @override
  String get refreshStatus => 'ステータスを更新';

  @override
  String get trackerSignInRequired => 'サインインが必要です';

  @override
  String get trackerSignInSubtitle => 'サーバーをトラッキングし、オフライン通知を受け取るにはサインインしてください。';

  @override
  String get signIn => 'サインイン';

  @override
  String get noServersTracked => '追跡中のサーバーなし';

  @override
  String get trackerEmptySubtitle => 'Minecraftサーバーを追加して、ステータスを監視し通知を受け取りましょう。';

  @override
  String get fillAllFields => 'すべてのフィールドを正しく入力してください';

  @override
  String get slotUsedUpgrade => '無料スロットが使用されています。より多くのサーバーのためにアップグレードしてください。';

  @override
  String get addServerFailed => 'サーバーの追加に失敗しました。詳細を確認してください。';

  @override
  String get ipAddressLabel => 'IPアドレス';

  @override
  String get platformLabel => 'プラットフォーム';

  @override
  String get bedrockLabel => 'Bedrock';

  @override
  String get addLabel => '追加';

  @override
  String get statusOnline => 'オンライン';

  @override
  String get statusOffline => 'オフライン';

  @override
  String get statusChecking => '確認中...';

  @override
  String get notificationsOn => '通知オン';

  @override
  String get notificationsOff => '通知オフ';

  @override
  String get failedUpdateNotifications => '通知の更新に失敗しました';

  @override
  String get editServerTitle => 'サーバーを編集';

  @override
  String get serverNameHint => 'サーバー名';

  @override
  String get failedSave => '保存に失敗しました。もう一度試してください。';

  @override
  String get serverRenamed => 'サーバー名を変更しました';

  @override
  String get customizeLabel => 'カスタマイズ';

  @override
  String get customizeSubtitle => 'タイルを並び替えてナビゲーションをカスタマイズ';

  @override
  String get resetLabel => 'リセット';

  @override
  String get tilesSection => 'タイル';

  @override
  String get dragToReorder => 'ドラッグして並び替え';

  @override
  String get navigationSection => 'ナビゲーション';

  @override
  String get navFixed => 'ホーム、コネクター、プロフィールは常に固定されています';

  @override
  String get leftSlot => '左スロット（ホームの隣）';

  @override
  String get rightSlot => '右スロット（プロフィールの隣）';

  @override
  String get accentColorSection => 'アクセントカラー';

  @override
  String get opacityLabel => '不透明度';

  @override
  String get backgroundSection => '背景';

  @override
  String get cardsSection => 'カード';

  @override
  String get editLabel => '編集';

  @override
  String get playerLookupJavaEdition => 'Java Edition';

  @override
  String get playerLookupBedrockEdition => 'Bedrock Edition';

  @override
  String get playerLookupLabelUuid => 'UUID';

  @override
  String get playerLookupLabelGamertag => 'ゲーマータグ';

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
  String get chooseUniqueUsername => 'ユニークなユーザー名を選んで始めましょう。';

  @override
  String get usernameFieldLabel => 'ユーザー名';

  @override
  String get usernameExampleHint => '例: CoolPlayer123';

  @override
  String get usernameFormatHint => '3〜20文字・英数字とアンダースコアのみ';

  @override
  String get displayNameOptional => '表示名（任意）';

  @override
  String get displayNameExampleHint => '例: クールプレイヤー';

  @override
  String get usernameRequired => 'ユーザー名は必須です';

  @override
  String get usernameFormatError => 'ユーザー名は3〜20文字で、英数字とアンダースコアのみ使用できます';

  @override
  String get usernameTaken => 'このユーザー名はすでに使用されています';

  @override
  String get noConnectionError => '接続がありません。インターネットを確認して再試行してください。';

  @override
  String get home => 'ホーム';

  @override
  String get info => '情報';

  @override
  String get navProfile => 'プロフィール';

  @override
  String serverRemoved(Object name) {
    return '$name を削除しました';
  }

  @override
  String serverAdded(Object name) {
    return '$name を追加しました';
  }
}
