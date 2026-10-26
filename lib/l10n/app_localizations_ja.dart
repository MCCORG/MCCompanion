// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get console => 'コンソール';

  @override
  String get modeLabel => 'モード';

  @override
  String get statusLabel => 'ステータス';

  @override
  String get seeAll => 'すべて表示';

  @override
  String get sectionHelp => 'ヘルプ';

  @override
  String get sectionAdvanced => '詳細設定';

  @override
  String get versionLabel => 'バージョン';

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
  String get onboardingNavPreviewConnector => '接続';

  @override
  String get onboardingNavPreviewProfile => 'プロフィール';

  @override
  String get onboardingNavPreviewEmpty => '空';

  @override
  String get onboardingCustomizeDetail => '詳しくカスタマイズ →';

  @override
  String get website => 'ウェブサイト';

  @override
  String get howToUseMenu => '使い方';

  @override
  String get support => 'サポート';

  @override
  String get start => '開始';

  @override
  String get stop => '停止';

  @override
  String get labelJava => 'Java';

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
  String get pleaseEnterServer => '⚠️ サーバーアドレスを入力してください';

  @override
  String get invalidPort => '⚠️ 無効なポート番号です（1-65535）';

  @override
  String get dataSentToServers => 'データをMCCompanionのサーバーに送信しました';

  @override
  String selectedServer(Object name) {
    return '📋 選択中: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return '選択中: $name';
  }

  @override
  String copiedLogs(Object count) {
    return '$count 件のログをクリップボードにコピーしました';
  }

  @override
  String get debugEnabled => 'デバッグログを有効にしました';

  @override
  String get iUnderstand => '理解しました';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return '選択中: $relayName\r\n\r\n接続方法:\r\n1. Switch の設定を開き、DNS を次に変更します: $relayIp\r\n2. Minecraft を開き、リストからサーバーを選択します（Cubecraft や Hive など）。\r\n3. これで自動的に自分のサーバーへ送られます。';
  }

  @override
  String get noSavedServers => '保存されたサーバーはありません';

  @override
  String get savedServers => '保存されたサーバー';

  @override
  String get manageServers => 'サーバーを管理';

  @override
  String get active => 'アクティブ';

  @override
  String get vpnDetected => 'VPN が検出されました';

  @override
  String get noWifi => 'Wi‑Fi に接続されていません';

  @override
  String get vpnActive =>
      'VPN が有効になっていることを検出しました。\n\nMCCompanion を使用する前に VPN を無効にしてください。そうしないと、LAN ブロードキャストがコンソールに届かない可能性があります。';

  @override
  String get mobileActive =>
      '検出: モバイルデータ\n\nMCCompanion はコンソールと同じネットワーク上にある必要があります。続行する前に、自宅の Wi‑Fi またはホットスポットに接続してください。';

  @override
  String get continueAnyway => 'このまま続行';

  @override
  String get updateAvailable => 'アップデートがあります';

  @override
  String get stopBroadcasting => 'ブロードキャスト停止';

  @override
  String get startNintendoMode => 'Nintendo モード開始';

  @override
  String get startFriendsMode => 'Friends モード開始';

  @override
  String get startBroadcasting => 'ブロードキャスト開始';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => '友達';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / プロキシ)';

  @override
  String get howToXboxSubtitle => 'LANで接続';

  @override
  String get howToXboxBody =>
      '接続方法（Xbox / PS4 / PS5）:\r\n1. MCCompanion を実行しているデバイスとコンソールが同じローカルネットワーク上にあることを確認してください。\r\n2. アプリで Minecraft サーバーのアドレスとポートを入力し、\"ブロードキャスト開始\" を押します。\r\n3. コンソールで Minecraft → Play を開き、LAN Worlds または Friends タブを探してリストを更新します。\r\n4. \"MCCompanion\" という名前の LAN サーバーを選択して参加します。\r\nメモ:\r\n- サーバーが表示されない場合は、両方のデバイスが同じサブネット上にあり、アプリがまだブロードキャスト中であることを確認してください。\r\n- 一部のコンソールやルーターでは LAN 検出がブロックされる場合があります。必要に応じてアプリやルーターの設定を切り替えてみてください。';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (DNS モード)';

  @override
  String get howToNintendoSubtitle => 'DNSで接続';

  @override
  String get howToFriendsTitle => 'Friends モード';

  @override
  String get howToFriendsSubtitle => 'フレンドで接続';

  @override
  String get helpMCCompanionTitle => 'MCCompanion が表示されない';

  @override
  String get helpMCCompanionSubtitle => 'LAN 検出の問題をトラブルシューティング';

  @override
  String get helpMCCompanionBody =>
      'コンソールにサーバーが表示されない場合は、次の手順を試してください:\r\n\r\n✅ 基本チェック:\r\n1. 同じ WiFi ネットワーク - スマホ/タブレットとコンソールは必ず同じ WiFi 上にある必要があります\r\n2. 正しいサーバーアドレス - IP とポート（デフォルト: 19132）を再確認してください\r\n3. ブロードキャストが有効 - MCCompanion に \"ブロードキャスト中\" ステータスが表示されていることを確認してください\r\n\r\n🔄 すぐできる対処:\r\n• アプリを再起動: ブロードキャストを停止し、MCCompanion を完全に閉じてから再度開いて試してください\r\n• コンソールを再起動: LAN ゲームを検出するには、コンソールの更新が必要なことがあります\r\n• Friends/LAN タブを確認: サーバーはサーバー一覧ではなく、\"Friends\" または \"LAN Games\" の下に表示されます\r\n• ブロードキャスト開始後 10〜15 秒待つ\r\n• VPN を無効化: VPN はローカルブロードキャストを妨げることがあります\r\n\r\n⚠️ よくある問題:\r\n\"No route found for user\" → 両方のデバイスが同じ Wi‑Fi 上にあることを確認してください（ゲストネットワークは避けてください）\r\n\"Unable to connect to MCCompanion relay server\" → インターネット接続 / relay の状態を確認してください\r\n\r\n📱 まだ問題がありますか？ MCCompanion でデバッグモードを有効にしてログを確認するか、別のサーバーを試してください。';

  @override
  String get helpMultiplayerFailedTitle => 'マルチプレイヤー接続に失敗しました';

  @override
  String get helpMultiplayerFailedSubtitle => 'これが MCCompanion のエラーではない理由';

  @override
  String get helpMultiplayerFailedBody =>
      '⚠️ これは MCCompanion の問題ではありません！\r\n\r\nMCCompanion は正常に要求されたサーバーへリダイレクトしました。\"Multiplayer Connection Failed\" というメッセージは、対象サーバーに現在到達できないことを示しています。考えられる理由:\r\n\r\n• 対象の Minecraft サーバーがオフライン、または過負荷状態である\r\n• サーバーが更新されたクライアントバージョン、または特定のエディションを要求している\r\n• relay と対象サーバーの間にネットワークの問題がある\r\n\r\n別のサーバーに接続するか、そのサーバーのサポートに連絡してください。複数のサーバーで問題が続く場合は、MCCompanion でデバッグモードを有効にしてログを確認してください。';

  @override
  String get helpNintendoDnsTitle => 'Nintendo DNS が動作しない';

  @override
  String get helpNintendoDnsSubtitle => 'よくある DNS / relay の問題';

  @override
  String get helpNintendoDnsBody =>
      'Nintendo DNS モードが動作しない場合は、次を確認してください:\r\n\r\n1. アプリから DNS 設定を送信したことを確認します（Send DNS Config）。\r\n2. Switch に relay IP をプライマリ DNS として適用したことを確認します。\r\n3. 選択した relay サーバー（EU/US）がオンラインで、過負荷でないことを確認します。\r\n4. 一部のネットワーク（例: captive portal）はカスタム DNS を妨げます。別のネットワークで試してください。\r\n\r\n問題が続く場合は、デバッグモードを有効にしてログを確認するか、フレンドモードの代替手段を試してください。';

  @override
  String get helpFriendsModeTitle => 'Friends モードが動作しない';

  @override
  String get helpFriendsModeSubtitle => 'よくあるフレンド関連の問題';

  @override
  String get helpFriendsModeBody =>
      'フレンドモードのトラブルシューティング:\r\n\r\n1. relay フレンドアカウントがコンソールで追加/承認されていることを確認してください（必要な場合）。\r\n2. フレンドモードを有効にしたあと、ゲームを再起動して Friends/LAN タブを更新してみてください。\r\n\r\nそれでもサーバーが友達に表示されない場合は、デバッグモードを有効にしてログを確認し、エラーを特定してください。';

  @override
  String get changeLanguageTitle => '言語を変更';

  @override
  String get changeLanguage => '言語';

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
  String get customizeSubtitle => 'ナビゲーションバーと色';

  @override
  String get resetLabel => 'リセット';

  @override
  String get navigationSection => 'ナビゲーション';

  @override
  String get navFixed => 'Connector とプロフィールは常に固定です';

  @override
  String get leftSlot => 'スロット 2';

  @override
  String get outerSlot => 'スロット 1';

  @override
  String get rightSlot => 'スロット 3';

  @override
  String get farSlot => 'スロット 4';

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
  String get reportUser => 'ユーザーを報告';

  @override
  String reportUserWithName(Object name) {
    return '$name を報告';
  }

  @override
  String get reportDisclaimer =>
      '報告は運営チームが確認します。虚偽の報告を行うと、アカウントに対して措置が取られる場合があります。';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonHarassment => '嫌がらせ';

  @override
  String get reportReasonInappropriate => '不適切なコンテンツ';

  @override
  String get reportReasonOther => 'その他';

  @override
  String get reportAdditionalDetails => '詳細(任意)…';

  @override
  String get reportSuccess => '報告を送信しました。ありがとうございます。';

  @override
  String get reportFailed => '報告を送信できませんでした。もう一度お試しください。';

  @override
  String get reportSubmit => '報告を送信';

  @override
  String get playerLookupSubtitle => 'ユーザー名で Java 版または統合版のプレイヤーを検索';

  @override
  String get playerLookupHint => 'ユーザー名を入力…';

  @override
  String get playerLookupLinked => '連携済みのアカウントが見つかりました';

  @override
  String get playerLookupLabelUsername => 'ユーザー名';

  @override
  String get playerLookupLabelTier => 'Tier';

  @override
  String playerLookupCopied(Object value) {
    return '$value をコピーしました';
  }

  @override
  String get addFriend => 'フレンドを追加';

  @override
  String get send => 'Send';

  @override
  String get somethingWentWrong => '問題が発生しました。もう一度お試しください。';

  @override
  String friendRequestAccepted(Object name) {
    return '$name さんとフレンドになりました';
  }

  @override
  String requestDeclined(Object name) {
    return '$name さんからのリクエストを拒否しました';
  }

  @override
  String get deleteAccountTitle => 'アカウントを削除';

  @override
  String get deleteAccountBody => 'アカウントとすべてのデータが完全に削除されます。この操作は元に戻せません。';

  @override
  String get deletePermanently => '完全に削除';

  @override
  String get couldNotDeleteAccount => 'アカウントを削除できませんでした。もう一度お試しください。';

  @override
  String get removeFriendTitle => 'フレンドを削除';

  @override
  String removeFriendConfirm(Object name) {
    return '$name さんをフレンドから削除しますか?';
  }

  @override
  String get remove => '削除';

  @override
  String friendRemoved(Object name) {
    return '$name さんをフレンドから削除しました';
  }

  @override
  String get emailDifferentMethod => 'このメールアドレスは別のサインイン方法に紐づいています';

  @override
  String get googleSignInFailed => 'Google でのサインインに失敗しました。もう一度お試しください。';

  @override
  String get appleSignInFailed => 'Apple でのサインインに失敗しました。もう一度お試しください。';

  @override
  String get resetPasswordTitle => 'パスワードをリセット';

  @override
  String get resetPasswordBody => 'メールアドレスを入力すると、パスワードをリセットするためのリンクをお送りします。';

  @override
  String get emailAddressHint => 'メールアドレス';

  @override
  String get sendLink => 'リンクを送信';

  @override
  String resetLinkSent(Object email) {
    return '$email のアカウントがあれば、リンクを送信しました';
  }

  @override
  String get invalidEmailError => 'メールアドレスが正しくありません';

  @override
  String get couldNotSendResetEmail => 'リセットメールを送信できませんでした。もう一度お試しください。';

  @override
  String get enterEmailAndPassword => 'メールアドレスとパスワードを入力してください';

  @override
  String get incorrectEmailOrPassword => 'メールアドレスまたはパスワードが正しくありません';

  @override
  String get emailAlreadyInUse => 'このメールアドレスはすでに使用されています';

  @override
  String get weakPassword => 'パスワードが弱すぎます。より強力なパスワードを選んでください。';

  @override
  String get createAccount => 'アカウントを作成';

  @override
  String get signInSubtitle => 'サインインして、プロフィール、フレンド、チャットを利用しましょう。';

  @override
  String get passwordHint => 'パスワード';

  @override
  String get forgotPassword => 'パスワードをお忘れですか?';

  @override
  String get orDivider => 'or';

  @override
  String get continueWithGoogle => 'Google で続行';

  @override
  String get alreadyHaveAccount => 'アカウントをお持ちですか?サインイン';

  @override
  String get noAccountYet => 'アカウントをお持ちでないですか?作成する';

  @override
  String get profileNotSetUp => 'プロフィールが未設定です';

  @override
  String get chooseUsernameSubtitle => '他のプレイヤーが見つけられるように、ユーザー名を決めましょう。';

  @override
  String get createProfile => 'プロフィールを作成';

  @override
  String get findUser => 'ユーザーを検索';

  @override
  String get couldNotUpdateVisibility => '公開設定を更新できませんでした';

  @override
  String get signOut => 'サインアウト';

  @override
  String get appearOfflineLabel => 'オフライン表示';

  @override
  String get appearOfflineOn => 'ほかのプレイヤーにはオフラインと表示されます';

  @override
  String get appearOfflineOff => 'ほかのプレイヤーにはオンラインと表示されます';

  @override
  String get unlinkXboxTitle => 'Xbox アカウントの連携を解除';

  @override
  String removeLabelConfirm(Object name) {
    return '$name を連携済みアカウントから削除しますか?';
  }

  @override
  String get unlink => '連携を解除';

  @override
  String get unlinkJavaTitle => 'Java アカウントの連携を解除';

  @override
  String removeJavaConfirm(Object name) {
    return '$name を連携済みアカウントから削除しますか?';
  }

  @override
  String get linkAccountsHint => 'Minecraft アカウントを連携して、スキンや統計を表示しましょう。';

  @override
  String get linkXbox => 'Xbox を連携';

  @override
  String get linkJava => 'Java を連携';

  @override
  String get profileUpdated => 'プロフィールを更新しました';

  @override
  String get edit => 'Edit';

  @override
  String get displayNameLabel => '表示名';

  @override
  String get yourNameHint => 'あなたの名前';

  @override
  String get bioLabel => 'Bio';

  @override
  String get bioHint => '自己紹介を書きましょう…';

  @override
  String get noFriendsYet => 'まだフレンドがいません';

  @override
  String get noFriendsSub => 'フレンドを追加すると、ここに表示されます。';

  @override
  String onlineFriendsLabel(Object count) {
    return 'オンライン $count 人';
  }

  @override
  String offlineFriendsLabel(Object count) {
    return 'オフライン $count 人';
  }

  @override
  String get noPendingRequests => '保留中のリクエストはありません';

  @override
  String get requestsAppearHere => '新しいフレンドリクエストはここに表示されます。';

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
  String get paywallRestore => '復元';

  @override
  String get paywallMonthly => '月額';

  @override
  String get paywallYearly => '年額';

  @override
  String get paywallSavePercent => '約 17% お得';

  @override
  String get paywallSubtitle => 'より多くのサーバーを追跡し、\nオンライン・オフラインの変化を通知で受け取れます。';

  @override
  String paywallSlotLabel(Object slots) {
    return 'サーバースロット $slots 個';
  }

  @override
  String get paywallPopular => '人気';

  @override
  String get paywallContinue => '続ける';

  @override
  String get paywallNoPkgs => '利用可能なプランがありません。';

  @override
  String get paywallManaged => 'Apple/Google が管理します。いつでもキャンセルできます。';

  @override
  String get paywallPurchaseSuccess => '購入が完了しました!';

  @override
  String get paywallPurchaseFailed => '購入に失敗しました。もう一度お試しください。';

  @override
  String get paywallPurchasesRestored => '購入を復元しました!';

  @override
  String get paywallNoActivePurchases => '有効な購入が見つかりませんでした。';

  @override
  String get paywallRestoreFailed => '復元に失敗しました。もう一度お試しください。';

  @override
  String get relay => 'Relay';

  @override
  String get serversSection => 'サーバー';

  @override
  String get selectBedrockAccount => '統合版アカウントを選択';

  @override
  String get infoAndLegal => '情報と法的事項';

  @override
  String get legalSection => '法的事項';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get privacyPolicySubtitle => 'データの収集と保護について';

  @override
  String get termsOfService => '利用規約';

  @override
  String get termsOfServiceSubtitle => 'ご利用のルールと条件';

  @override
  String get dataSourcesSection => 'データソースとクレジット';

  @override
  String get creditMojangTitle => 'Mojang / Microsoft';

  @override
  String get creditMojangSubtitle =>
      'Java 版プレイヤーのスキン、UUID、プロフィールデータは Mojang 公式 API から取得しています。';

  @override
  String get creditGeyserTitle => 'GeyserMC';

  @override
  String get creditGeyserSubtitle =>
      '統合版スキンの描画。統合版プレイヤーのスキンは GeyserMC のスキンサーバーから取得しています。';

  @override
  String get creditXboxTitle => 'Xbox / Microsoft';

  @override
  String get creditXboxSubtitle =>
      'Xbox Live による統合版アカウントの連携。ゲーマータグと XUID は Microsoft の認証フローで取得します。';

  @override
  String get aboutMCCompanionSection => 'MCCompanion について';

  @override
  String get aboutMCCompanionDisclaimer =>
      'MCCompanion は独立したアプリであり、Mojang Studios や Microsoft Corporation とは提携しておらず、承認・後援も受けていません。';

  @override
  String get minecraftTrademark => '「Minecraft」は Microsoft Corporation の商標です。';

  @override
  String get nldServerLabelShort => 'MCCompanion Server';

  @override
  String get editServer => 'サーバーを編集';

  @override
  String get serverNameExampleHint => 'すてきなサーバー';

  @override
  String get serverAddressExampleHint => 'play.example.com';

  @override
  String get serverDescriptionExampleHint => 'フレンドと遊ぶサバイバルサーバー';

  @override
  String get editionLabel => 'エディション';

  @override
  String get nameLabel => 'Name';

  @override
  String get ipAddressFieldLabel => 'IP アドレス';

  @override
  String get portFieldLabel => 'Port';

  @override
  String get platformFieldLabel => 'プラットフォーム';

  @override
  String get nameValidationError => '名前は 1〜50 文字にしてください';

  @override
  String get ipRequiredError => 'IP アドレスは必須です';

  @override
  String get portRangeError => 'ポートは 1〜65535 の範囲で指定してください';

  @override
  String get xboxLinkTitle => 'Xbox アカウントを連携';

  @override
  String get xboxStartingLogin => 'Xbox ログインを開始しています…';

  @override
  String get xboxSignInWithMicrosoft => 'Microsoft でサインイン';

  @override
  String get xboxGoToLink => '下のリンクにアクセスしてコードを入力し、Xbox アカウントを連携してください。';

  @override
  String get xboxYourCode => 'あなたのコード';

  @override
  String get xboxTapToCopy => 'コードをタップしてコピー';

  @override
  String get xboxOpenLink => 'microsoft.com/link を開く';

  @override
  String get xboxWaitingForLogin => 'ログインを待っています…';

  @override
  String get xboxAccountLinked => 'Xbox アカウントを連携しました!';

  @override
  String get xboxCodeCopied => 'コードをクリップボードにコピーしました';

  @override
  String get xboxCouldNotStart => 'Xbox ログインを開始できませんでした。もう一度お試しください。';

  @override
  String get xboxCodeExpired => 'コードの有効期限が切れました。もう一度お試しください。';

  @override
  String get xboxSomethingWrong => '問題が発生しました。もう一度お試しください。';

  @override
  String get tryAgain => '再試行';

  @override
  String get userNotFound => 'ユーザーが見つかりません';

  @override
  String get profileSectionLabel => 'プロフィール';

  @override
  String get displayNameRowLabel => '表示名';

  @override
  String get usernameRowLabel => 'ユーザー名';

  @override
  String get lastSeenLabel => '最終ログイン';

  @override
  String get aboutSectionLabel => '自己紹介';

  @override
  String get xboxBedrockLabel => 'Xbox / Bedrock';

  @override
  String get friendRequestSent => 'フレンドリクエストを送信しました';

  @override
  String get alreadyFriendsMsg => 'すでにフレンドです。';

  @override
  String get requestAlreadyPendingMsg => 'すでに保留中のリクエストがあります。';

  @override
  String get userNotFoundMsg2 => 'ユーザーが見つかりません。';

  @override
  String get cannotSendRequestMsg => 'このユーザーにはリクエストを送信できません。';

  @override
  String nowFriendsWith(Object username) {
    return '@$username さんとフレンドになりました';
  }

  @override
  String get removeFriendButton => 'フレンドを削除';

  @override
  String get requestSentButton => 'リクエスト送信済み';

  @override
  String get acceptRequestButton => 'リクエストを承認';

  @override
  String get addFriendButton => 'フレンドを追加';

  @override
  String get removeFriendDialogTitle => 'フレンドを削除';

  @override
  String removeFriendDialogBody(Object username) {
    return '@$username さんをフレンドから削除しますか?';
  }

  @override
  String get trackerLimitReached => 'サーバー上限に達しました';

  @override
  String get upgradeButton => 'アップグレード';

  @override
  String get javaLinkTitle => 'Java 版を連携';

  @override
  String get javaStartingLogin => 'Microsoft ログインを開始しています…';

  @override
  String get javaSignInWithMicrosoft => 'Microsoft でサインイン';

  @override
  String get javaGoToLink =>
      '下のリンクにアクセスしてコードを入力し、Minecraft Java 版のアカウントを連携してください。';

  @override
  String get javaYourCode => 'あなたのコード';

  @override
  String get javaTapToCopy => 'コードをタップしてコピー';

  @override
  String get javaOpenLink => 'microsoft.com/link を開く';

  @override
  String get javaWaitingForLogin => 'ログインを待っています…';

  @override
  String get javaAccountLinked => 'Java 版を連携しました!';

  @override
  String get javaNoJavaTitle => 'Java 版が見つかりません';

  @override
  String get javaNoJavaBody =>
      'サインインした Microsoft アカウントは Minecraft Java 版を所有していません。';

  @override
  String get javaTryDifferentAccount => '別のアカウントを試す';

  @override
  String get javaCouldNotStart => 'Microsoft ログインを開始できませんでした。もう一度お試しください。';

  @override
  String get javaCodeExpired => 'コードの有効期限が切れました。もう一度お試しください。';

  @override
  String get javaSomethingWrong => '問題が発生しました。もう一度お試しください。';

  @override
  String get javaCodeCopied => 'コードをクリップボードにコピーしました';

  @override
  String get featureLabelConnector => 'コネクター';

  @override
  String get featureLabelSkins => 'スキン';

  @override
  String get featureLabelPartners => 'サーバー一覧';

  @override
  String get featureLabelLookup => '検索';

  @override
  String get featureLabelTracker => 'サーバートラッカー';

  @override
  String get userSearchHint => 'ユーザー名、ゲーマータグまたはJava名…';

  @override
  String get userSearchSub => 'ユーザー名、Xboxゲーマータグ、Java名で検索';

  @override
  String get upgradeWindowsHint => 'Microsoft Storeでアップグレードできます';

  @override
  String get accountActions => 'アカウント';

  @override
  String get feedbackBugReport => 'バグ報告';

  @override
  String get feedbackFeatureRequest => '機能リクエスト';

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
  String get feedbackDescHintBug => 'バグの詳細を説明してください: 何をしたか、何を期待したか、実際に何が起きたか';

  @override
  String get feedbackDescHintFeature => '何を望んでいるか、なぜ役立つかを説明してください。';

  @override
  String get feedbackSubmitBug => 'バグ報告を送信';

  @override
  String get feedbackSubmitFeature => '機能リクエストを送信';

  @override
  String get feedbackDisclaimer => 'チームに届きます · パスワードは書かないでください';

  @override
  String get feedbackSuccessTitle => 'フィードバックをありがとう！';

  @override
  String get feedbackSuccessBody =>
      'ありがとうございます。内容を受け付けました。返信はアプリ内で行いますので、こちらをご確認ください。';

  @override
  String get feedbackSubmitAnother => '別のものを送信';

  @override
  String get feedbackBackToApp => 'アプリに戻る';

  @override
  String get feedbackTitleTooShort => 'タイトルは5文字以上必要です。';

  @override
  String get feedbackDescTooShort => '説明は10文字以上必要です。';

  @override
  String get feedbackSubmitFailed => '送信に失敗しました。もう一度お試しください。';

  @override
  String get feedbackTileTitle => 'フィードバック';

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
  String get friendsHowToNote =>
      '⚠️ プレイするたびに、まずMCCompanionアプリでフレンドモードを起動してください。起動後はアプリを閉じても大丈夫です。';

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
  String get rpUnsupportedAddonsHint =>
      '動作することもありますが、公式にはサポートされていません。自己責任でご使用ください。';

  @override
  String get rpNoDiscord => 'Discordリンク: .mcpack 拡張子がなく、数時間で期限切れになります';

  @override
  String get rpNoDrive => 'Google Drive / Dropbox 共有リンク: 直接ダウンロードではありません';

  @override
  String get rpNoEncrypted => '暗号化またはパスワード保護されたパックのサーバー';

  @override
  String get rpConsolePerformanceTitle => 'コンソールのパフォーマンス';

  @override
  String get rpConsolePerformanceBody =>
      '高解像度テクスチャパックはコンソールでのラグやクラッシュを引き起こす可能性があります。問題が発生した場合は、低解像度のパックに切り替えるか、パックがサポートしている場合は軽量なサブパックを選択してください。';

  @override
  String get rpToastSaved => 'リソースパックの設定を保存しました。';

  @override
  String get rpInvalidPackFormat =>
      'これはJava Editionのパックのため対応していません。Bedrock Editionのリソースパックを使用してください。';

  @override
  String get rpBehaviorContentWarning =>
      'このパックにはビヘイビアーパックのデータが含まれており、サーバーでは動作しません。テクスチャは引き続き使えます。';

  @override
  String get rpClearMinecraftTitle => 'このパックを初めて使う？';

  @override
  String get rpClearStep1 => 'コンソールでMinecraftを開き、設定 → ストレージに移動する';

  @override
  String get rpClearStep2 =>
      'リソースパックの横の「クリア」または「リセット」をタップ: ローカルにキャッシュされたパックがすべて削除されます';

  @override
  String get rpClearStep3 => 'MCCompanion経由で再接続する: 結合されたパックが自動的にダウンロードされます';

  @override
  String get rpRelayTitle => 'パックがおかしく見える？';

  @override
  String get rpRelayBody =>
      'リレーはオーバーレイURLをキーとして結合されたパックを1時間キャッシュします。新しい結合を強制するには：パックURLを少し変更（例：末尾に?v=2を追加）して保存してください。その後、MinecraftのパックキャッシュもクリアしてくださいQ, 結合されたパックは引き続きサーバーのUUIDを使用するため、そのままではMinecraftが古いキャッシュ版を表示します。';

  @override
  String get rpNoDiscordHint => 'Discord CDNのリンクは短時間で期限切れになります';

  @override
  String get rpNoDriveHint => '直接ダウンロードなし: プレビューページにリダイレクトされます';

  @override
  String get rpNoEncryptedHint => 'MCCompanionは暗号化されたパックを結合できません';

  @override
  String get rpClearWhy =>
      'MinecraftはリソースパックをUUIDでキャッシュします。結合されたパックはサーバーの元のUUIDを保持します, MCCompanionを有効にする前のセッションでMinecraftがサーバーのパックをキャッシュしていた場合、新しい結合バージョンをダウンロードしません。キャッシュをクリアして、Minecraftが新しい結合パックを読み込むようにしてください。';

  @override
  String get rpUploadTab => 'アップロード';

  @override
  String get rpBrowseTab => '探す';

  @override
  String get rpCategoryRealism => 'リアル';

  @override
  String get rpCategoryFaithful => 'Faithful';

  @override
  String get rpCategoryPvp => 'PvP';

  @override
  String get rpCategoryCartoon => 'カートゥーン';

  @override
  String get rpCategoryDark => 'ダーク';

  @override
  String get rpCategoryMedieval => '中世';

  @override
  String get rpCategoryNature => '自然';

  @override
  String get rpCategoryThemed => 'テーマ';

  @override
  String get rpCategoryOther => 'その他';

  @override
  String get rpUploadButton => 'タップしてパックを選択';

  @override
  String get rpUploadHint => '.mcpack または .zip • 最大 100 MB';

  @override
  String get rpUploading => 'アップロード中...';

  @override
  String get rpMergerTitle => 'RPマージャー';

  @override
  String get rpMergerPriorityHint => '最上位のパックが最高優先度: そのファイルが競合に勝ちます。';

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
  String get rpMergerSetActiveToast => 'アクティブなリソースパックに設定しました';

  @override
  String get rpDisabled => '無効';

  @override
  String get rpNoPackSelected => 'リソースパックが選択されていません';

  @override
  String get rpActiveOnConnect => '有効, 接続時に適用されます';

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
  String get rpTabBrowseInfo =>
      'MCCompanionが厳選したパックを閲覧できます。「使用」をタップすると即座にパックを有効化できます, アップロードやリンク不要。';

  @override
  String get rpTabUploadInfo =>
      '独自の.mcpackまたは.zipファイルをアップロードします。MCCompanionがクラウドに安全に保存し、接続のたびにコンソールに送信します。';

  @override
  String get rpTabMergeInfo =>
      '2〜4つのパックを1つに統合します。統合されたパックはMCCompanion Cloudにアップロードされ、自動的に有効化されます。';

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
  String get skinsSavedToMySkins => 'マイスキンに保存しました';

  @override
  String get skinsEmptyLocalSkins => '保存済みのスキンはまだありません。';

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
  String get feedbackLoginRequiredTitle => 'フィードバックを送信するにはログインしてください';

  @override
  String get feedbackLoginRequiredBody =>
      'フィードバックはMCCompanionアカウントに紐づけられ、アプリ内で直接返信できます。';

  @override
  String get feedbackLoginButton => 'ログイン';

  @override
  String get supportInboxTitle => 'サポート受信箱';

  @override
  String get customColour => 'カスタムカラー';

  @override
  String get featuredServerLabel => '注目のサーバー';

  @override
  String get featuredServerTagline => '参加してすぐに遊べます。';

  @override
  String get featuredServerPlay => 'プレイ';

  @override
  String rpUploadFailedCode(int code) {
    return 'アップロードに失敗しました（$code）';
  }

  @override
  String rpUploadFailed(String error) {
    return 'アップロードに失敗しました: $error';
  }

  @override
  String get rpLoadFailed => 'パックを読み込めませんでした';

  @override
  String get rpRetry => '再試行';

  @override
  String get rpSearchHint => 'パックを検索…';

  @override
  String rpMergeFailed(String error) {
    return '結合に失敗しました: $error';
  }

  @override
  String get rpMergerSize => 'サイズ';

  @override
  String get rpMergerCreated => '作成日';

  @override
  String get rpMergerSourcePacks => '元のパック';

  @override
  String get rpMergerDropToAdd => 'ドロップして追加';

  @override
  String get rpMergerSavedMerges => '保存した結合';

  @override
  String get rpMergerUse => '使う';

  @override
  String get supportInboxShared => '管理者全員で共有';

  @override
  String get supportInboxEmpty => 'サポートのやり取りはまだありません';

  @override
  String get supportReplyingAs => 'MCCompanion Support として返信中';

  @override
  String get relayBlocked =>
      'あなたの IP またはアカウントは MCCompanion によりブロックされています。心当たりがなければ Discord までお越しください。';

  @override
  String relayBlockedWithReason(String reason) {
    return 'あなたの IP またはアカウントは MCCompanion によりブロックされています。\n理由: $reason\n心当たりがなければ Discord までお越しください。';
  }

  @override
  String relayConfigFailed(int code) {
    return 'リレーを設定できませんでした（ステータス $code）。別のリレーを試すか、Discord までお越しください。';
  }

  @override
  String relayConfigFailedDetail(int code, String detail) {
    return 'リレーを設定できませんでした（ステータス $code）: $detail。別のリレーを試すか、Discord までお越しください。';
  }

  @override
  String get relayTimeout => 'リレーが時間内に応答しませんでした。';

  @override
  String get relayUnreachable => 'リレーに接続できませんでした。';

  @override
  String get lookupNotFound => 'プレイヤーが見つかりません。';

  @override
  String get lookupNetworkError => 'ネットワークエラーです。もう一度お試しください。';

  @override
  String get lookupBedrockUnavailable => 'Bedrock の検索は現在利用できません。';

  @override
  String get lookupFailed => '検索に失敗しました。';

  @override
  String get myFeedbackTitle => 'マイフィードバック';

  @override
  String get myFeedbackEmpty => 'まだ何も送信されていません。';

  @override
  String get myFeedbackOpenList => 'マイフィードバック';

  @override
  String get fbStatusOpen => '未対応';

  @override
  String get fbStatusPlanned => '予定あり';

  @override
  String get fbStatusInProgress => '対応中';

  @override
  String get fbStatusImplemented => '完了';

  @override
  String get fbStatusNotPlanned => '予定なし';

  @override
  String get fbStatusDuplicate => '重複';

  @override
  String get fbNoReplies => 'まだ返信はありません。ここでお知らせします。';

  @override
  String get fbReplyHint => 'この報告に追記する…';

  @override
  String get fbFromTeam => 'MCCompanion';

  @override
  String get fbFromYou => 'あなた';

  @override
  String get feedbackGoesToTeam => 'チームに直接届きます';

  @override
  String get notifFeedbackStatus => 'フィードバックの進捗';

  @override
  String get notifFeedbackReply => 'フィードバックへの返信';

  @override
  String get adminTicketsHeader => '報告とリクエスト';

  @override
  String get adminTicketReplyHint => 'このチケットについて返信…';

  @override
  String get chooseServerTitle => 'サーバーを選ぶ';

  @override
  String get changeLabel => '変更';

  @override
  String get howToAutoShow => '開始時にこれを表示';

  @override
  String get shareServerLabel => 'サーバーを共有';

  @override
  String get shareServerOn => 'フレンドにいるサーバーが見えます';

  @override
  String get shareServerOff => 'フレンドにはプレイ中とだけ表示されます';

  @override
  String directHostNotFound(String host) {
    return '$host が見つかりません。アドレスを確認してもう一度お試しください。';
  }

  @override
  String get directPortBusy => 'ローカルポートを開けませんでした。先に現在の接続を停止してください。';

  @override
  String get waitingForConsole => 'コンソールを待っています…';

  @override
  String get consoleFound => 'コンソールが見つかりました';

  @override
  String get consoleLanHint => 'コンソールでMinecraftを開き、友達からLANゲームを探してください。';

  @override
  String get localNetworkBlocked =>
      'MCCompanionがローカルネットワークにアクセスできません。端末の設定でMCCompanionのローカルネットワークをオンにし、Wi-Fiに接続していることを確認してください。';

  @override
  String directAddressNotSupported(String host) {
    return '$host は IPv6 アドレスです。プロキシ/ダイレクトモードは IPv4 のみ対応しています。IPv4 アドレスかホスト名をご利用ください。';
  }

  @override
  String termsAgreement(String terms, String privacy) {
    return '$termsと$privacyに同意します。';
  }

  @override
  String get verifyEmailTitle => 'メールアドレスを確認';

  @override
  String get verifyEmailBody => 'コメント、スキンのアップロード、パックの投稿にはメール確認が必要です。';

  @override
  String get verifyEmailSent => '送信しました。受信トレイをご確認ください。';

  @override
  String get verifyEmailSending => '送信中…';

  @override
  String get verifyEmailSend => 'リンクを送信';

  @override
  String updateAvailableTitle(Object version) {
    return 'バージョン $version が公開されました';
  }

  @override
  String updateAvailableBody(Object current) {
    return '現在は $current です。このビルドは自動更新されません。';
  }

  @override
  String get updateAvailableAction => 'ダウンロード';

  @override
  String get updateAvailableDismiss => '後で';

  @override
  String get serverListSearchHint => '名前またはアドレスで検索';

  @override
  String get serverListEditionAny => 'JavaとBedrock';

  @override
  String get serverListEditionJava => 'Javaのみ';

  @override
  String get serverListEditionBedrock => 'Bedrockのみ';

  @override
  String get serverListSortVotes => '投票数順';

  @override
  String get serverListSortPlayers => 'プレイヤー数順';

  @override
  String get serverListSortPeak => '最高記録順';

  @override
  String get serverListSortNewest => '新着順';

  @override
  String get serverListSortName => '名前順';

  @override
  String get serverListAllCategories => 'すべて';

  @override
  String get serverListPlayersAny => 'サイズを問わない';

  @override
  String get serverListPlayersHint => '平均オンライン人数';

  @override
  String get serverListLoadFailed => 'サーバーリストを読み込めませんでした';

  @override
  String get serverListLoadFailedHint => '下に引いて再試行';

  @override
  String get serverListNoMatch => '該当するサーバーがありません';

  @override
  String get serverListNoMatchHint => '別のキーワードかカテゴリーをお試しください';

  @override
  String get serverCardPlay => 'プレイ';

  @override
  String get serverCardVote => '投票';

  @override
  String get serverCopyIp => 'IPをコピー';

  @override
  String get serverCopied => 'コピーしました';

  @override
  String get serverStatPlayers => 'プレイヤー';

  @override
  String get serverStatPeak => '最高記録';

  @override
  String get serverStatUptime => '稼働率';

  @override
  String get serverStatVotesMonth => '今月の投票';

  @override
  String get serverBadgeFeatured => '注目';

  @override
  String get serverEditionJava => 'Java';

  @override
  String get serverEditionBedrock => 'Bedrock';

  @override
  String get serverEditionCrossplay => 'クロスプレイ';

  @override
  String get serverSectionMotd => '今日のメッセージ';

  @override
  String get serverLinkDiscord => 'Discord';

  @override
  String get serverLinkWebsite => 'ウェブサイト';

  @override
  String get serverVotesThisMonth => '今月';

  @override
  String get serverVotesAllTime => '累計';

  @override
  String get serverVoteSignInRequired => 'アプリから投票するにはログインしてください。';

  @override
  String serverVoteSheetTitle(String name) {
    return '$nameに投票';
  }

  @override
  String get serverVoteSheetSubtitle => '報酬を受け取るために、Minecraftの名前を入力してください。';

  @override
  String get serverVoteSheetHint => 'Steve';

  @override
  String get serverVoteSheetButton => '投票';

  @override
  String get serverVoteSheetLimit => '投票は1サーバーにつき1日1回です。';

  @override
  String get serverVoteDelivered => '投票しました。報酬はまもなく届きます。';

  @override
  String get serverVoteNoRewards => '投票しました。このサーバーには報酬が設定されていません。';

  @override
  String get serverVoteFailed => 'うまくいきませんでした。もう一度お試しください。';

  @override
  String get serverVoteOffline => 'サーバーに接続できませんでした。通信環境をご確認ください。';

  @override
  String get feedbackViewYourReport => '送信した内容を見る';

  @override
  String get showMore => 'もっと見る';

  @override
  String get showLess => '閉じる';

  @override
  String get lookupRecent => '最近';
}
