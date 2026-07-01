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
  String get back => '戻る';

  @override
  String get next => '次へ';

  @override
  String get done => '完了';

  @override
  String get none => 'なし';

  @override
  String get onboardingThemeTitle => 'テーマを選択';

  @override
  String get onboardingThemeSubtitle => '後で設定から各色を細かく調整できます。';

  @override
  String get onboardingNavTitle => 'クイックアクセス';

  @override
  String get onboardingNavSubtitle => 'ナビゲーションバーに2つの機能を選択してください。';

  @override
  String get onboardingNavLeftLabel => '左ボタン';

  @override
  String get onboardingNavRightLabel => '右ボタン';

  @override
  String get onboardingNavPreviewHome => 'ホーム';

  @override
  String get onboardingNavPreviewConnector => '接続';

  @override
  String get onboardingNavPreviewProfile => 'プロフィール';

  @override
  String get onboardingNavPreviewEmpty => '空';

  @override
  String get onboardingStartTitle => 'スタートページ';

  @override
  String get onboardingStartSubtitle => '起動するたびにここが開きます。';

  @override
  String get onboardingCustomizeDetail => '詳しくカスタマイズ →';

  @override
  String get startPageHome => 'ホーム';

  @override
  String get startPageHomeSubtitle => 'タイル付きのホーム画面を表示';

  @override
  String get startPageFeature => '機能';

  @override
  String get startPageFeatureSubtitle => '特定のページを直接開く';

  @override
  String get startPageSectionLabel => 'スタートページ';

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
  String get nldServerLabel => 'MCCompanion サーバー';

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
  String get helpMCCompanionTitle => 'MCCompanion が表示されない';

  @override
  String get helpMCCompanionSubtitle => 'LAN 検出の問題をトラブルシューティング';

  @override
  String get helpMCCompanionBody => 'コンソールにサーバーが表示されない場合は、次の手順を試してください:\r\n\r\n✅ 基本チェック:\r\n1. 同じ WiFi ネットワーク - スマホ/タブレットとコンソールは必ず同じ WiFi 上にある必要があります\r\n2. 正しいサーバーアドレス - IP とポート（デフォルト: 19132）を再確認してください\r\n3. ブロードキャストが有効 - MCCompanion に \"ブロードキャスト中\" ステータスが表示されていることを確認してください\r\n\r\n🔄 すぐできる対処:\r\n• アプリを再起動: ブロードキャストを停止し、MCCompanion を完全に閉じてから再度開いて試してください\r\n• コンソールを再起動: LAN ゲームを検出するには、コンソールの更新が必要なことがあります\r\n• Friends/LAN タブを確認: サーバーはサーバー一覧ではなく、\"Friends\" または \"LAN Games\" の下に表示されます\r\n• ブロードキャスト開始後 10〜15 秒待つ\r\n• VPN を無効化: VPN はローカルブロードキャストを妨げることがあります\r\n\r\n⚠️ よくある問題:\r\n\"No route found for user\" → 両方のデバイスが同じ Wi‑Fi 上にあることを確認してください（ゲストネットワークは避けてください）\r\n\"Unable to connect to MCCompanion relay server\" → インターネット接続 / relay の状態を確認してください\r\n\r\n📱 まだ問題がありますか？ MCCompanion でデバッグモードを有効にしてログを確認するか、別のサーバーを試してください。';

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
  String get tileWideTooltipRemove => 'ワイドレイアウトを解除';

  @override
  String get tileWideTooltipAdd => 'ワイドタイルにする';

  @override
  String get tileVisibilityShow => 'タイルを表示';

  @override
  String get tileVisibilityHide => 'タイルを非表示';

  @override
  String get tileVisibilityMin => '非表示にできません（最後のタイル）';

  @override
  String get colorPickerApply => '適用';

  @override
  String get colorPickerHex => 'Hex';

  @override
  String get textColorSection => 'テキストカラー';

  @override
  String get textColorPickerTitle => 'テキストカラー';

  @override
  String get textColorHint => '円をタップしてカスタムテキストカラーを選択';

  @override
  String get textColorPreviewPrimary => 'メイン';

  @override
  String get textColorPreviewSecondary => 'サブ';

  @override
  String get textColorPreviewMuted => 'ミュート';

  @override
  String get colorSwatchCustom => 'カスタム';

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
  String get featureLabelConnector => 'コネクター';

  @override
  String get featureLabelSkins => 'スキン';

  @override
  String get featureLabelWiki => 'ウィキ';

  @override
  String get featureLabelPartners => 'パートナー';

  @override
  String get featureLabelLookup => '検索';

  @override
  String get featureLabelTracker => 'サーバートラッカー';

  @override
  String get featureSubtitleConnector => 'コンソールをMinecraftに接続';

  @override
  String get featureSubtitleSkins => 'Minecraftスキンの閲覧と管理';

  @override
  String get featureSubtitleWiki => 'Minecraft百科事典';

  @override
  String get featureSubtitlePartners => '注目サーバー';

  @override
  String get featureSubtitleLookup => 'JavaとBedrockプロフィールを検索';

  @override
  String get featureSubtitleTracker => 'サーバー状態を監視して通知を受け取る';

  @override
  String get userSearchHint => 'ユーザー名、ゲーマータグまたはJava名…';

  @override
  String get userSearchSub => 'ユーザー名、Xboxゲーマータグ、Java名で検索';

  @override
  String get onlineStatus => 'オンライン';

  @override
  String get upgradeWindowsHint => 'Microsoft Storeでアップグレードできます';

  @override
  String get chatEmptyHint => '最初にメッセージを送りましょう！';

  @override
  String get skinSaved => 'スキンを保存しました';

  @override
  String skinSavedAs(String name) {
    return '\"$name\" として保存しました';
  }

  @override
  String get skinExportFailed => 'エクスポート失敗';

  @override
  String get skinExported => 'スキンを正常にエクスポートしました';

  @override
  String get accountActions => 'アカウント';

  @override
  String get feedbackBugReport => 'バグ報告';

  @override
  String get feedbackFeatureRequest => '機能リクエスト';

  @override
  String get feedbackGoesToGithub => 'GitHubに直接送信されます';

  @override
  String get feedbackTitleLabel => 'タイトル';

  @override
  String get feedbackTitleHintBug => '例: スキンエディターを開くとアプリがクラッシュする';

  @override
  String get feedbackTitleHintFeature => '例: サーバーリストにプレイヤーのpingを表示する';

  @override
  String get feedbackWhatHappened => '何が起きましたか？';

  @override
  String get feedbackDescribeIdea => 'アイデアを説明してください';

  @override
  String get feedbackDescHintBug => 'バグの詳細を説明してください — 何をしたか、何を期待したか、実際に何が起きたか';

  @override
  String get feedbackDescHintFeature => '何を望んでいるか、なぜ役立つかを説明してください。';

  @override
  String get feedbackEmailLabel => 'メールアドレス';

  @override
  String get feedbackEmailHint => 'ご連絡できるよう';

  @override
  String get feedbackEmailNote => 'メールアドレスが公開されることはありません。';

  @override
  String get feedbackSubmitBug => 'バグ報告を送信';

  @override
  String get feedbackSubmitFeature => '機能リクエストを送信';

  @override
  String get feedbackDisclaimer => 'GitHubに公開イシューを作成します · パスワードを含めないでください';

  @override
  String get feedbackSuccessTitle => 'フィードバックをありがとう！';

  @override
  String get feedbackSuccessBody => 'レポートが送信され、GitHubにイシューが作成されました。できるだけ早く確認します。';

  @override
  String get feedbackViewOnGithub => 'GitHubで見る';

  @override
  String get feedbackSubmitAnother => '別のものを送信';

  @override
  String get feedbackBackToApp => 'アプリに戻る';

  @override
  String get feedbackTitleTooShort => 'タイトルは5文字以上必要です。';

  @override
  String get feedbackDescTooShort => '説明は10文字以上必要です。';

  @override
  String get feedbackEmailInvalid => '有効なメールアドレスを入力してください。';

  @override
  String get feedbackSubmitFailed => '送信に失敗しました。もう一度お試しください。';

  @override
  String get feedbackTileTitle => 'バグを報告したり機能を提案したりする';

  @override
  String get reportBug => 'Feedback';

  @override
  String get feedbackTileSubtitle => 'MCCompanionの改善にご協力ください';

  @override
  String get friendsHowToStep1 => 'スマートフォンまたはコンソールでXboxアプリを開く。';

  @override
  String get friendsHowToStep2 => '下記のボットをXboxで友達に追加する。';

  @override
  String get friendsHowToStep3 => 'Minecraftを開いてフレンドタブに移動する。';

  @override
  String get friendsHowToStep4 => 'LANワールドでサーバーを探して参加する。';

  @override
  String get friendsHowToNote => '⚠️ プレイするたびに、まずMCCompanionアプリでフレンドモードを起動してください。起動後はアプリを閉じても大丈夫です。';

  @override
  String get friendsBotLoadError => '⚠️ ボットリストを読み込めませんでした。後でもう一度お試しください。';

  @override
  String get regionEurope => 'ヨーロッパ';

  @override
  String get regionUnitedStates => 'アメリカ';

  @override
  String get yourRegion => 'あなたの地域';

  @override
  String get botStatusOffline => 'オフライン';

  @override
  String get botStatusFull => '満員';

  @override
  String botFriendCount(Object current, Object max) {
    return '$current / $max フレンド';
  }

  @override
  String botCopied(Object gamertag) {
    return '$gamertag をコピーしました';
  }

  @override
  String get copyLabel => 'コピー';

  @override
  String get skinSavedToDocuments => 'スキンを書類に保存しました';

  @override
  String get skinMenuExport => 'エクスポート';

  @override
  String get skinMenuDelete => '削除';

  @override
  String get rpScreenTitle => 'リソースパック';

  @override
  String get rpWhatIsThis => 'これは何ですか？';

  @override
  String get rpExplanation => 'リソースパックはコンソール上のMinecraftの見た目を変えます — 新しいブロック、色、サウンド。下に.mcpackファイルのリンクを貼り付け、有効にして保存してください。MCCompanionは接続のたびに自動的に読み込みます。';

  @override
  String get rpPackUrlLabel => 'パックURL';

  @override
  String get rpPackUrlHint => 'https://example.com/pack.mcpack';

  @override
  String get rpEnableToggle => 'リソースパックを有効にする';

  @override
  String get rpWhatWorks => '動作するもの';

  @override
  String get rpSupportedBedrockOnly => '統合版のみ（.mcpack または .zip）';

  @override
  String get rpSupportedBedrockOnlyHint => 'Java版パックはコンソールでは動作しません。';

  @override
  String get rpSupportedTexture => 'リソースパック＆テクスチャパック';

  @override
  String get rpSupportedTextureHint => 'これらは公式にサポートされており、確実に動作します。';

  @override
  String get rpUnsupportedShaders => 'シェーダー、ビヘイビアパック、スキンパック';

  @override
  String get rpUnsupportedShadersHint => 'これらはMCCompanion経由でコンソールに読み込まれません。';

  @override
  String get rpUnsupportedAddons => 'アドオン＆UIモッド';

  @override
  String get rpUnsupportedAddonsHint => '動作することもありますが、公式にはサポートされていません。自己責任でご使用ください。';

  @override
  String get rpNoDiscord => 'Discordリンク — .mcpack 拡張子がなく、数時間で期限切れになります';

  @override
  String get rpNoDrive => 'Google Drive / Dropbox 共有リンク — 直接ダウンロードではありません';

  @override
  String get rpNoEncrypted => '暗号化またはパスワード保護されたパックのサーバー';

  @override
  String get rpConsolePerformanceTitle => 'コンソールのパフォーマンス';

  @override
  String get rpConsolePerformanceBody => '高解像度テクスチャパックはコンソールでのラグやクラッシュを引き起こす可能性があります。問題が発生した場合は、低解像度のパックに切り替えるか、パックがサポートしている場合は軽量なサブパックを選択してください。';

  @override
  String get rpWarnDiscord => 'DiscordリンクはExpireし、動作しなくなります。代わりに永続的なホストを使用してください。';

  @override
  String get rpWarnHttps => 'URLはhttps://で始まる必要があります';

  @override
  String get rpWarnExtension => 'URLは.mcpackまたは.zipで終わる必要があります';

  @override
  String get rpToastEnterUrl => 'リソースパックを有効にする前にURLを入力してください。';

  @override
  String get rpToastSaved => 'リソースパックの設定を保存しました。';

  @override
  String get rpInvalidPackFormat => 'This is a Java Edition pack and is not supported. Please use a Bedrock Edition resource pack.';

  @override
  String get rpClearMinecraftTitle => 'このパックを初めて使う？';

  @override
  String get rpClearMinecraftBody => 'Minecraftはリソースパックをローカルにキャッシュします。MCCompanionのリソースパックを有効にする前にこのサーバーに接続したことがある場合、Minecraftはシュートダウンをキャッシュしており、マージ後のバージョンを再ダウンロードしません。';

  @override
  String get rpClearStep1 => 'コンソールでMinecraftを開き、設定 → ストレージに移動する';

  @override
  String get rpClearStep2 => 'リソースパックの横の「クリア」または「リセット」をタップ — ローカルにキャッシュされたパックがすべて削除されます';

  @override
  String get rpClearStep3 => 'MCCompanion経由で再接続する — 結合されたパックが自動的にダウンロードされます';

  @override
  String get rpRelayTitle => 'パックがおかしく見える？';

  @override
  String get rpRelayBody => 'リレーはオーバーレイURLをキーとして結合されたパックを1時間キャッシュします。新しい結合を強制するには：パックURLを少し変更（例：末尾に?v=2を追加）して保存してください。その後、MinecraftのパックキャッシュもクリアしてくださいQ — 結合されたパックは引き続きサーバーのUUIDを使用するため、そのままではMinecraftが古いキャッシュ版を表示します。';

  @override
  String get rpWorksGithubHint => '直接ダウンロードリンク — 常にアクセス可能';

  @override
  String get rpWorksCloudflareHint => 'パブリッククラウドストレージ — 高速かつ信頼性が高い';

  @override
  String get rpWorksDirectHint => '公開されたHTTPS .mcpackまたは.zip URL';

  @override
  String get rpNoDiscordHint => 'Discord CDNのリンクは短時間で期限切れになります';

  @override
  String get rpNoDriveHint => '直接ダウンロードなし — プレビューページにリダイレクトされます';

  @override
  String get rpNoEncryptedHint => 'MCCompanionは暗号化されたパックを結合できません';

  @override
  String get rpClearWhy => 'MinecraftはリソースパックをUUIDでキャッシュします。結合されたパックはサーバーの元のUUIDを保持します — MCCompanionを有効にする前のセッションでMinecraftがサーバーのパックをキャッシュしていた場合、新しい結合バージョンをダウンロードしません。キャッシュをクリアして、Minecraftが新しい結合パックを読み込むようにしてください。';

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
  String get rpMergerTitle => 'RPマージャー';

  @override
  String get rpMergerSubtitle => '最大4つのリソースパックを統合';

  @override
  String get rpMergerPriorityHint => '最上位のパックが最高優先度 — そのファイルが競合に勝ちます。';

  @override
  String get rpMergerTopBadge => 'TOP';

  @override
  String get rpMergerAddPacks => 'リソースパックを追加';

  @override
  String rpMergerAddAnother(int current) {
    return '別のパックを追加 ($current/4)';
  }

  @override
  String get rpMergerFileTypes => '.zip または .mcpack';

  @override
  String get rpMergerMerging => 'マージ中…';

  @override
  String rpMergerButton(int count) {
    return '$count個のパックをマージ';
  }

  @override
  String get rpMergerComplete => 'マージ完了！';

  @override
  String rpMergerConflicts(int count) {
    return '$count件の競合が解決 — 最上位パックが勝ちました。';
  }

  @override
  String get rpMergerSetActive => 'アクティブなリソースパックに設定';

  @override
  String get rpMergerSetActiveToast => 'アクティブなリソースパックに設定しました';

  @override
  String get rpMergerOpenButton => 'リソースパックをマージ';

  @override
  String get rpMergerOpenSubtitle => '2〜4個のパックを1つに統合';

  @override
  String get rpDisabled => '無効';

  @override
  String get rpNoPackSelected => 'リソースパックが選択されていません';

  @override
  String get rpActiveOnConnect => '有効 — 接続時に適用されます';

  @override
  String get rpBrowseSubtitle => '厳選パック、すぐに使えます';

  @override
  String get rpBrowseEmpty => 'まだパックはありません';

  @override
  String get rpBrowseEmptyHint => '後ほど厳選パックをご確認ください。';

  @override
  String get rpReplaceFile => '別のファイルに置き換える';

  @override
  String get rpDropToUpload => 'ドロップしてアップロード';

  @override
  String get rpTabBrowseInfo => 'MCCompanionが厳選したパックを閲覧できます。「使用」をタップすると即座にパックを有効化できます — アップロードやリンク不要。';

  @override
  String get rpTabUploadInfo => '独自の.mcpackまたは.zipファイルをアップロードします。MCCompanionがクラウドに安全に保存し、接続のたびにコンソールに送信します。';

  @override
  String get rpTabUrlInfo => '.mcpackまたは.zipファイルへの直接ダウンロードリンクを貼り付けます。URLは公開アクセス可能である必要があります — DiscordやGoogleドライブのリンクは使用不可。';

  @override
  String get rpTabMergeInfo => '2〜4つのパックを1つに統合します。統合されたパックはMCCompanion Cloudにアップロードされ、自動的に有効化されます。';

  @override
  String get shareLabel => 'シェア';

  @override
  String get sectionMinecraftAccounts => 'Minecraftアカウント';

  @override
  String get sectionSettings => '設定';

  @override
  String get avatarUpdated => 'アバターを更新しました';

  @override
  String get uploadFailed => 'アップロード失敗';

  @override
  String get profileLinkCopied => 'プロフィールリンクをコピーしました！';

  @override
  String get shareProfileTooltip => 'プロフィールをシェア';

  @override
  String get profileFallbackTitle => 'プロフィール';

  @override
  String get noUsersFound => 'ユーザーが見つかりません';

  @override
  String get skinLabel => 'スキン';

  @override
  String get skinsLabel => 'スキン';

  @override
  String get javaEditionBadge => 'Java';

  @override
  String get bedrockEditionBadge => 'Bedrock';

  @override
  String get downloadLabel => 'ダウンロード';

  @override
  String get justNow => 'たった今';

  @override
  String minutesAgo(int count) {
    return '$count分前';
  }

  @override
  String hoursAgo(int count) {
    return '$count時間前';
  }

  @override
  String daysAgo(int count) {
    return '$count日前';
  }

  @override
  String get rpPackInfo => '詳細';

  @override
  String get rpUseThisPack => 'このパックを使う';

  @override
  String get rpViewOnWebsite => 'ウェブサイトで見る →';

  @override
  String rpDownloads(int count) {
    return '$count ダウンロード';
  }

  @override
  String get rpPackDetailTitle => 'パックの詳細';

  @override
  String get skinsSavedToMySkins => 'マイスキンに保存しました';

  @override
  String get skinsDownloadFailed => 'ダウンロードに失敗しました';

  @override
  String get skinsDeletedFromCloud => 'クラウドから削除しました';

  @override
  String get skinsDeleteFailed => '削除に失敗しました';

  @override
  String get skinsLoginToUpload => 'スキンをアップロードするにはログインしてください';

  @override
  String get skinsUploading => 'アップロード中…';

  @override
  String get skinUploaded => 'スキンをアップロードしました！';

  @override
  String skinUploadFailed(String error) {
    return 'アップロードに失敗しました: $error';
  }

  @override
  String get skinsTabSkins => 'スキン';

  @override
  String get skinsTabRecent => '最近';

  @override
  String get skinsEmptyCloudSkins => 'クラウドスキンはまだありません。スキンをアップロードするとここに表示されます。';

  @override
  String get skinsEmptyLocalSkins => 'スキンはまだありません。スキンを作成またはアップロードして始めましょう。';

  @override
  String get skinUploadToWebsite => 'ウェブサイトにアップロード';

  @override
  String get skinReuploadToWebsite => 'ウェブサイトに再アップロード';

  @override
  String get skinCloudEdit => '編集';

  @override
  String get skinCloudSaveToDevice => 'デバイスに保存';

  @override
  String get skinCloudDelete => 'クラウドから削除';

  @override
  String get skinsTabGallery => 'ギャラリー';

  @override
  String get skinsGalleryEmpty => 'まだコミュニティスキンはありません。';

  @override
  String get skinsTopLabel => 'トップ30';

  @override
  String get skinsAllLabel => 'すべてのスキン';

  @override
  String get skinUploadToCloud => 'クラウドにアップロード';

  @override
  String get skinSaveDialog => 'スキンを保存';

  @override
  String get skinNameHint => 'スキン名';

  @override
  String get skinDefaultName => 'マイスキン';

  @override
  String get skinUpdatedInCloud => 'クラウドのスキンが更新されました';

  @override
  String skinByCreator(String name) {
    return '$name 作';
  }

  @override
  String skinLikesCount(int count) {
    return '$count いいね';
  }

  @override
  String get sectionRecentActivity => '最近のアクティビティ';

  @override
  String get activityNoEvents => 'まだアクティビティはありません。';

  @override
  String get activitySkinUploaded => 'スキンをアップロード';

  @override
  String get activitySkinLiked => 'スキンにいいね';

  @override
  String get activityPackSubmitted => 'パックを送信';

  @override
  String get activityPackApproved => 'パックが承認されました';

  @override
  String get activityPackRejected => 'パックが承認されませんでした';

  @override
  String get timeJustNow => '今';

  @override
  String timeMinutesAgo(int count) {
    return '$count分前';
  }

  @override
  String timeHoursAgo(int count) {
    return '$count時間前';
  }

  @override
  String timeDaysAgo(int count) {
    return '$count日前';
  }

  @override
  String timeMonthsAgo(int count) {
    return '$countか月前';
  }

  @override
  String get sectionNotifications => '通知';

  @override
  String get sectionNotificationTypes => '通知の種類';

  @override
  String get notifMarkAllRead => 'すべて既読にする';

  @override
  String get notifEmpty => 'まだ通知はありません。いいね、コメント、フレンドのアクティビティがここに表示されます。';

  @override
  String get notifSomeone => '誰か';

  @override
  String notifSkinLiked(String actor) {
    return '$actorがあなたのスキンにいいねしました';
  }

  @override
  String notifCommentReceived(String actor) {
    return '$actorがあなたのスキンにコメントしました';
  }

  @override
  String get notifPackApproved => 'パックが承認されました';

  @override
  String get notifPackRejected => 'パックが承認されませんでした';

  @override
  String notifFriendRequest(String actor) {
    return '$actorからフレンド申請が届きました';
  }

  @override
  String notifFriendAccepted(String actor) {
    return '$actorがあなたの申請を承認しました';
  }

  @override
  String notifMessageReceived(String actor) {
    return '$actorからの新しいメッセージ';
  }

  @override
  String get notifPrefSkinLiked => 'スキンへのいいね';

  @override
  String get notifPrefCommentReceived => 'コメント受信';

  @override
  String get notifPrefPackApproved => 'パック承認';

  @override
  String get notifPrefPackRejected => 'パック拒否';

  @override
  String get notifPrefFriendRequest => 'フレンド申請';

  @override
  String get notifPrefFriendAccepted => 'フレンド追加';

  @override
  String get notifPrefMessageReceived => '新しいメッセージ';

  @override
  String get commentsTitle => 'コメント';

  @override
  String get commentsEmpty => 'まだコメントはありません。最初のコメントを残しましょう！';

  @override
  String get commentsPlaceholder => 'コメントを書く…';

  @override
  String get loadMore => 'もっと読み込む';

  @override
  String get skinLayerInner => '内側';

  @override
  String get skinLayerOuter => '外側';
}
