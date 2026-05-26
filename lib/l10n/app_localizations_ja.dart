// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'MCCompanion';

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
    return '$appCreator によって作成されました。\r\n\r\n使い方:\r\n1. Minecraft サーバーのアドレスとポートを入力します（デフォルト: 19132）\r\n   — またはドロップダウンから以前保存したサーバーを選択します\r\n2. （任意）現在地に最も近い Relay Server（EU または US）を選択します\r\n3. \"ブロードキャスト開始\" をクリックして開始します\r\n4. コンソール/デバイスで: Minecraft > Play > Friends\r\n5. \"MCCompanion\" という名前の LAN サーバーが表示されます\r\n6. それをクリックすると、MCCompanion 経由で外部サーバーに参加できます\r\n\r\nNintendo Switch（DNS モード）:\r\n1. 接続パネルで \"Nintendo Switch\" を有効にします\r\n2. Relay Server（EU または US）を選択します\r\n3. \"Send DNS Config\" をクリックすると、設定が relay に送信されます\r\n   （これは LAN サーバーをブロードキャストしません）\r\n4. Switch で MCCompanion の DNS 設定を適用し、\r\n   MCCompanion 用に使っているサーバー項目から参加します\r\n\r\nメモ:\r\n- LAN ブロードキャストでは、MCCompanion とコンソールが同じローカルネットワーク上にある必要があります。\r\n- ヒント: 最良のパフォーマンスを得るには、最も近い relay サーバーを選択してください。';
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
  String get howToJavaSubtitle => 'MCCompanion経由でJava Editionサーバーに接続';

  @override
  String get aternosSubtext => '自分だけの無料Minecraftサーバーを作成しましょう';

  @override
  String get howToJavaBody => 'Javaモード — クイック手順:\n1. アプリでJavaモードを選択します。\n2. Java Editionサーバーのアドレスとポートを入力します（既定: 25565）。\n3. 「Javaモードを開始」を押します — MCCompanionが接続を橋渡しします。\n4. Minecraft Bedrockを開いて、フレンドタブに移動します。\n5. Javaサーバーに参加するには、「MCCompanion」という名前のLANサーバーを選択します。\n\n⚠️ 重要な警告:\n- 有効なJava Editionアカウント（Microsoft）が必要です。\n- 一部のサーバーではアンチチートシステムが使用されており、アカウントが検出されてBANされる可能性があります。\n- Bedrockクライアントを明確に禁止しているサーバーもあります — 必ずサーバールールを確認してください。\n- この機能の使用によって発生するアカウントBAN、利用停止、その他のアカウント関連の問題について、MCCompanionは責任を負いません。\n- 自己責任で使用してください。';

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
  String get howToUseTitle => 'MCCompanion の使い方';

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
  String get vpnActive => 'VPN が有効になっていることを検出しました。\n\nMCCompanion を使用する前に VPN を無効にしてください。そうしないと、LAN ブロードキャストがコンソールに届かない可能性があります。';

  @override
  String get mobileActive => '検出: モバイルデータ\n\nMCCompanion はコンソールと同じネットワーク上にある必要があります。続行する前に、自宅の Wi‑Fi またはホットスポットに接続してください。';

  @override
  String get continueAnyway => 'このまま続行';

  @override
  String get sameWifi => '同じ Wi‑Fi ネットワーク';

  @override
  String get needSameWifi => 'MCCompanion を実行している端末は、Minecraft をプレイするコンソールと同じ Wi‑Fi ネットワーク上にある必要があります。';

  @override
  String get subscription => 'オンライン加入が必要';

  @override
  String get needSubscription => '各コンソールには有効なオンライン加入サービス（Xbox Live、PS Plus、NSO）が必要です。ない場合、MCCompanion は表示されません。';

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
  String get friendModeText => 'MCCompanion のフレンド bot をフレンドとして追加します。Friends モードを開始して遊びましょう';

  @override
  String get selectedRelayCheck => '選択済み';

  @override
  String relayFallbackWarning(Object name) {
    return '警告: 元の relay が応答しませんでした。代替 relay を使用中です: $name';
  }

  @override
  String get relayUnableConnect => 'どの MCCompanion relay サーバーにも接続できません。後でもう一度試すか、インターネット接続を確認してください。';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / プロキシ)';

  @override
  String get howToXboxSubtitle => 'LAN ブロードキャストまたは proxy 経由でプレイ';

  @override
  String get howToXboxBody => '接続方法（Xbox / PS4 / PS5）:\r\n1. MCCompanion を実行しているデバイスとコンソールが同じローカルネットワーク上にあることを確認してください。\r\n2. アプリで Minecraft サーバーのアドレスとポートを入力し、\"ブロードキャスト開始\" を押します。\r\n3. コンソールで Minecraft → Play を開き、LAN Worlds または Friends タブを探してリストを更新します。\r\n4. \"MCCompanion\" という名前の LAN サーバーを選択して参加します。\r\nメモ:\r\n- サーバーが表示されない場合は、両方のデバイスが同じサブネット上にあり、アプリがまだブロードキャスト中であることを確認してください。\r\n- 一部のコンソールやルーターでは LAN 検出がブロックされる場合があります。必要に応じてアプリやルーターの設定を切り替えてみてください。';

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
  String get howToFriendsBody => 'フレンドモード — 簡単な手順:\r\n1. 必要に応じて、コンソールまたはプラットフォームで MCCompanion のフレンドアカウントを追加します。\r\n2. アプリでフレンドモードを有効にし、relay 設定を送信します（該当する場合）。\r\n3. コンソールで Minecraft → Friends を開き、LAN Worlds を探します。そこに LAN ワールドとして自分のサーバーが表示されるはずです。\r\n4. それを選択して、友達と一緒に自分のサーバーへ参加します。\r\nメモ:\r\n- 自分と友達の両方が、フレンド表示を許可する同じ NAT/設定になっていることを確認してください。\r\n- フレンドモードはプラットフォームのフレンド機能に依存し、フレンド申請の承認が必要な場合があります。';

  @override
  String get helpNetherlinkTitle => 'MCCompanion が表示されない';

  @override
  String get helpNetherlinkSubtitle => 'LAN 検出の問題をトラブルシューティング';

  @override
  String get helpNetherlinkBody => 'コンソールにサーバーが表示されない場合は、次の手順を試してください:\r\n\r\n✅ 基本チェック:\r\n1. 同じ WiFi ネットワーク - スマホ/タブレットとコンソールは必ず同じ WiFi 上にある必要があります\r\n2. 正しいサーバーアドレス - IP とポート（デフォルト: 19132）を再確認してください\r\n3. ブロードキャストが有効 - MCCompanion に \"ブロードキャスト中\" ステータスが表示されていることを確認してください\r\n\r\n🔄 すぐできる対処:\r\n• アプリを再起動: ブロードキャストを停止し、MCCompanion を完全に閉じてから再度開いて試してください\r\n• コンソールを再起動: LAN ゲームを検出するには、コンソールの更新が必要なことがあります\r\n• Friends/LAN タブを確認: サーバーはサーバー一覧ではなく、\"Friends\" または \"LAN Games\" の下に表示されます\r\n• ブロードキャスト開始後 10〜15 秒待つ\r\n• VPN を無効化: VPN はローカルブロードキャストを妨げることがあります\r\n\r\n⚠️ よくある問題:\r\n\"No route found for user\" → 両方のデバイスが同じ Wi‑Fi 上にあることを確認してください（ゲストネットワークは避けてください）\r\n\"Unable to connect to MCCompanion relay server\" → インターネット接続 / relay の状態を確認してください\r\n\r\n📱 まだ問題がありますか？ MCCompanion でデバッグモードを有効にしてログを確認するか、別のサーバーを試してください。';

  @override
  String get helpMultiplayerFailedTitle => 'マルチプレイヤー接続に失敗しました';

  @override
  String get helpMultiplayerFailedSubtitle => 'これが MCCompanion のエラーではない理由';

  @override
  String get helpMultiplayerFailedBody => '⚠️ これは MCCompanion の問題ではありません！\r\n\r\nMCCompanion は正常に要求されたサーバーへリダイレクトしました。\"Multiplayer Connection Failed\" というメッセージは、対象サーバーに現在到達できないことを示しています。考えられる理由:\r\n\r\n• 対象の Minecraft サーバーがオフライン、または過負荷状態である\r\n• サーバーが更新されたクライアントバージョン、または特定のエディションを要求している\r\n• relay と対象サーバーの間にネットワークの問題がある\r\n\r\n別のサーバーに接続するか、そのサーバーのサポートに連絡してください。複数のサーバーで問題が続く場合は、MCCompanion でデバッグモードを有効にしてログを確認してください。';

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
  String get reportUser => 'ユーザーを報告';
  @override
  String reportUserWithName(String username) => '@$username を報告';
  @override
  String get reportMessage => 'メッセージを報告';
  @override
  String get reportDisclaimer => 'チームがこの報告を確認します。コミュニティを安全に保つためにご協力ありがとうございます。';
  @override
  String get reportReasonSpam => 'スパム';
  @override
  String get reportReasonHarassment => 'ハラスメントまたはいじめ';
  @override
  String get reportReasonInappropriate => '不適切なコンテンツ';
  @override
  String get reportReasonOther => 'その他';
  @override
  String get reportAdditionalDetails => '追加の詳細（任意）';
  @override
  String get reportSubmit => '報告を送信';
  @override
  String get reportSuccess => '報告を送信しました。ありがとうございます。';
  @override
  String get reportFailed => '報告を送信できませんでした。もう一度お試しください。';
  @override
  String get messagePlaceholder => 'メッセージ...';
  @override
  String get noMessagesYet => 'まだメッセージはありません。\nこんにちはと言ってみましょう！';
  @override
  String get today => '今日';
  @override
  String get yesterday => '昨日';
  @override
  String get noConversationsYet => 'まだ会話がありません';
  @override
  String get startChatHint => 'フレンドリストからチャットを始めましょう。';
  @override
  String get youPrefix => 'あなた';
  @override
  String get tabProfile => 'プロフィール';
  @override
  String get tabFriends => 'フレンド';
  @override
  String get tabRequests => 'リクエスト';
  @override
  String get tabChats => 'チャット';
  @override
  String get addFriend => 'フレンドを追加';
  @override
  String get usernameHint => 'ユーザー名';
  @override
  String get send => '送信';
  @override
  String friendRequestSentTo(String username) => '@$username にフレンドリクエストを送信しました';
  @override
  String alreadyFriendsWith(String username) => '@$username とすでにフレンドです。';
  @override
  String requestAlreadyPending(String username) => '@$username との保留中のリクエストがすでにあります。';
  @override
  String userNotFoundMsg(String username) => 'ユーザー @$username が見つかりません。';
  @override
  String cannotSendRequest(String username) => '@$username にリクエストを送信できません。';
  @override
  String get somethingWentWrong => '問題が発生しました。もう一度お試しください。';
  @override
  String friendRequestAccepted(String username) => '@$username からのフレンドリクエストを承認しました';
  @override
  String requestDeclined(String username) => '@$username からのリクエストを拒否しました';
  @override
  String get deleteAccountTitle => 'アカウントを削除';
  @override
  String get deleteAccountBody => 'アカウント、メッセージ、フレンド、および関連するすべてのデータが完全に削除されます。この操作は元に戻せません。';
  @override
  String get deletePermanently => '完全に削除';
  @override
  String get couldNotDeleteAccount => 'アカウントを削除できませんでした。もう一度お試しください。';
  @override
  String get removeFriendTitle => 'フレンドを削除';
  @override
  String removeFriendConfirm(String username) => '@$username をフレンドから削除しますか？';
  @override
  String get remove => '削除';
  @override
  String friendRemoved(String username) => '@$username をフレンドから削除しました';
  @override
  String get noFriendsYet => 'まだフレンドがいません';
  @override
  String get noFriendsSub => '右上のボタンを使って誰かを追加してください。';
  @override
  String get noPendingRequests => '保留中のリクエストはありません';
  @override
  String get requestsAppearHere => 'フレンドリクエストがここに表示されます。';
  @override
  String onlineFriendsLabel(int count) => 'オンライン — $count';
  @override
  String offlineFriendsLabel(int count) => 'オフライン — $count';
  @override
  String get couldNotUpdateVisibility => '表示設定を更新できませんでした。もう一度お試しください。';
  @override
  String get aboutMe => '自己紹介';
  @override
  String get linkedAccountsTitle => '連携アカウント';
  @override
  String get linkAccountsHint => 'Minecraftアカウントを連携してプロフィールに表示しましょう。';
  @override
  String get unlinkXboxTitle => 'Xboxアカウントの連携を解除';
  @override
  String removeLabelConfirm(String label) => '$label を連携アカウントから削除しますか？';
  @override
  String get unlinkJavaTitle => 'Java Editionの連携を解除';
  @override
  String removeJavaConfirm(String username) => '$username を連携アカウントから削除しますか？';
  @override
  String get unlink => '連携解除';
  @override
  String get linkXbox => 'Xboxを連携';
  @override
  String get linkJava => 'Javaを連携';
  @override
  String get appearOfflineLabel => 'オフラインとして表示';
  @override
  String get appearOfflineOn => 'フレンドにはオフラインと表示されます';
  @override
  String get appearOfflineOff => 'フレンドはあなたがオンラインかどうか確認できます';
  @override
  String get signOut => 'サインアウト';
  @override
  String get profileCardTitle => 'プロフィール';
  @override
  String get edit => '編集';
  @override
  String get displayNameLabel => '表示名';
  @override
  String get bioLabel => '自己紹介';
  @override
  String get yourNameHint => 'あなたの名前';
  @override
  String get bioHint => '自分について何か書いてください';
  @override
  String get avatarUrlLabel => 'アバターURL';
  @override
  String get usernameDisplayLabel => 'ユーザー名';
  @override
  String get profileUpdated => 'プロフィールを更新しました';
  @override
  String get findUser => 'ユーザーを検索';
  @override
  String get signIn => 'サインイン';
  @override
  String get createAccount => 'アカウントを作成';
  @override
  String get signInSubtitle => 'サインインしてフレンドを追加しセッションを共有しましょう。';
  @override
  String get emailAddressHint => 'メールアドレス';
  @override
  String get passwordHint => 'パスワード';
  @override
  String get forgotPassword => 'パスワードをお忘れですか？';
  @override
  String get continueWithGoogle => 'Googleで続ける';
  @override
  String get alreadyHaveAccount => 'すでにアカウントをお持ちですか？ サインイン';
  @override
  String get noAccountYet => 'アカウントをお持ちでないですか？ 登録';
  @override
  String get orDivider => 'または';
  @override
  String get resetPasswordTitle => 'パスワードをリセット';
  @override
  String get resetPasswordBody => 'メールアドレスを入力してください。パスワードリセット用のリンクをお送りします。';
  @override
  String get sendLink => 'リンクを送信';
  @override
  String resetLinkSent(String email) => 'リセットリンクを $email に送信しました';
  @override
  String get noAccountForEmail => 'このメールアドレスのアカウントが見つかりません。';
  @override
  String get invalidEmailError => '無効なメールアドレスです。';
  @override
  String get couldNotSendResetEmail => 'リセットメールを送信できませんでした。もう一度お試しください。';
  @override
  String get incorrectEmailOrPassword => 'メールアドレスまたはパスワードが正しくありません。';
  @override
  String get emailAlreadyInUse => 'このメールアドレスはすでに使用されています。';
  @override
  String get weakPassword => 'パスワードは6文字以上である必要があります。';
  @override
  String get googleSignInFailed => 'Googleサインインに失敗しました。もう一度お試しください。';
  @override
  String get appleSignInFailed => 'Appleサインインに失敗しました。もう一度お試しください。';
  @override
  String get emailDifferentMethod => 'このメールアドレスは別のサインイン方法で登録済みです。';
  @override
  String get enterEmailAndPassword => 'メールアドレスとパスワードを入力してください。';
  @override
  String get profileNotSetUp => 'プロフィールがまだ設定されていません';
  @override
  String get chooseUsernameSubtitle => 'フレンドを追加してセッションを共有するためにユーザー名を選択してください。';
  @override
  String get createProfile => 'プロフィールを作成';
  @override
  String get chooseUniqueUsername => 'フレンドを追加するためにユニークなユーザー名を選択してください。';
  @override
  String get usernameFieldLabel => 'ユーザー名 *';
  @override
  String get usernameFormatHint => '3〜20文字 · a-z、0-9、_ のみ';
  @override
  String get displayNameOptional => '表示名（任意）';
  @override
  String get usernameRequired => 'ユーザー名を入力してください。';
  @override
  String get usernameFormatError => '3〜20文字、英小文字・数字・_ のみ';
  @override
  String get usernameTaken => 'このユーザー名はすでに使用されています。';
  @override
  String get noConnectionError => '接続がありません。もう一度お試しください。';
  @override
  String get usernameExampleHint => '例：jens_mc';
  @override
  String get displayNameExampleHint => '例：Jens';
  @override
  String get home => 'ホーム';
  @override
  String get info => '情報';
  @override
  String get consoleConnect => 'Console Connect';
  @override
  String get consoleConnectSubtitle => 'Minecraftサーバーに接続';
  @override
  String get minecraftSkins => 'Minecraftスキン';
  @override
  String get minecraftSkinsSubtitle => 'JavaとBedrockのスキンを表示・編集';
  @override
  String get minecraftWiki => 'Minecraft Wiki';
  @override
  String get minecraftWikiSubtitle => 'モブ、ブロック、レシピなど';
  @override
  String get partnerServersLabel => 'パートナーサーバー';
  @override
  String get partnerServersSubtitle => 'おすすめのMinecraftサーバー';
  @override
  String get userLookup => 'Minecraftユーザー検索';
  @override
  String get userLookupSubtitle => 'JavaとBedrockのプロフィールを検索';

  @override
  String get navSkins => 'スキン';
  @override
  String get navWiki => 'Wiki';
  @override
  String get navProfile => 'プロフィール';

  @override
  String get skinsUpload => 'アップロード';
  @override
  String get skinsCreate => '作成';
  @override
  String get skinsSubtitle => 'Minecraftのスキンを表示・ダウンロード。';
  @override
  String get skinsSectionRecent => '最近のスキン';
  @override
  String get skinsSectionMy => 'マイスキン';
  @override
  String get skinsSectionYours => 'あなたのスキン';
  @override
  String get skinsEmptyMySkins => 'スキンが保存されていません。スキンを作成またはアップロードしてください。';
  @override
  String get skinsCouldNotLoad => 'スキンを読み込めませんでした';
  @override
  String skinsPageOf(int page, int total) => '$page / $total ページ';
  @override
  String get skinsMustBe64 => 'スキンは64×64ピクセルでなければなりません';
  @override
  String get skinsInvalidFile => '無効な画像ファイルです';
  @override
  String get skinsDownload => 'ダウンロード';
  @override
  String get skinsEdit => '編集';
  @override
  String get skinsNoAccountsTitle => 'アカウントが連携されていません';
  @override
  String get skinsNoAccountsSubtitle => 'スキンを表示するにはプロフィールでJavaまたはBedrockを連携してください。';
  @override
  String get skinsSignInTitle => 'スキンを表示するにはサインイン';
  @override
  String get skinsSignInSubtitle => 'アカウントを作成し、プロフィールでJavaまたはBedrockを連携してください。';
}
