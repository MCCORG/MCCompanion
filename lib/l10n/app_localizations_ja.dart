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
  String get clientDisconnected => 'クライアントが切断されました: ブロードキャストを停止しました';

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
  String get leftSlot => 'Slot 2';

  @override
  String get outerSlot => 'Slot 1';

  @override
  String get rightSlot => 'Slot 3';

  @override
  String get farSlot => 'Slot 4';

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
    return '$email のアカウントがあれば、リンクを送信しました';
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
  String get chooseUsernameSubtitle => '他のプレイヤーが見つけられるように、ユーザー名を決めましょう。';

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
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get privacyPolicySubtitle => 'How we collect and protect your data';

  @override
  String get termsOfService => '利用規約';

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
  String get trackerLimitReached => 'サーバー上限に達しました';

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
  String get rpWarnDiscord =>
      'DiscordリンクはExpireし、動作しなくなります。代わりに永続的なホストを使用してください。';

  @override
  String get rpWarnHttps => 'URLはhttps://で始まる必要があります';

  @override
  String get rpWarnExtension => 'URLは.mcpackまたは.zipで終わる必要があります';

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
  String get rpUploadTab => 'Upload';

  @override
  String get rpUploadButton => 'Tap to select your pack';

  @override
  String get rpUploadHint => '.mcpack or .zip • max 100 MB';

  @override
  String get rpUploading => 'Uploading...';

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
  String get skinShareSubject => 'Minecraft スキン';

  @override
  String get skinEditorTitle => 'スキンエディター';

  @override
  String get skinToolUndo => '元に戻す';

  @override
  String get skinSaveToMySkins => 'マイスキンに保存';

  @override
  String get skinUpdateInCloud => 'クラウドで更新';

  @override
  String get skinExportPng => 'PNG を書き出す';

  @override
  String get skinToolDraw => '描く';

  @override
  String get skinToolFill => '塗りつぶし';

  @override
  String get skinToolErase => '消す';

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
  String get skinEditorLoadFailed => 'そのスキンを読み込めませんでした。標準のスキンから始めます。';

  @override
  String get skinToolRecolour => '色を置換';

  @override
  String get skinToolPick => 'スポイト';

  @override
  String get skinBases => 'ベース';

  @override
  String get skinBasesTitle => 'ベースから始める';

  @override
  String get skinBasesSubtitle => '今の絵と置き換わります。元に戻すで復帰します。';

  @override
  String get skinMirror => '左右対称';

  @override
  String get skinSurprise => 'おまかせ';

  @override
  String get skinToolFillHint => 'タップした面を塗ります';

  @override
  String get skinToolRecolourHint => 'その色をスキン全体で置き換えます';

  @override
  String get skinToolPickHint => 'タップした色を取り込みます';

  @override
  String get skinModelClassic => '標準';

  @override
  String get skinModelSlim => '細身';

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
  String get serverCardViewServer => 'サーバーを見る';

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
}
