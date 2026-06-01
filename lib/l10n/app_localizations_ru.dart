// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'NetherLink';

  @override
  String get console => 'Консоль';

  @override
  String get consoleOutput => 'Вывод консоли';

  @override
  String get noLogsYet => 'Пока нет журналов';

  @override
  String get startBroadcastingToSeeOutput => 'Начните трансляцию, чтобы увидеть вывод';

  @override
  String get close => 'Закрыть';

  @override
  String get ok => 'OK';

  @override
  String get joinUs => 'Присоединяйтесь';

  @override
  String get more => 'Ещё';

  @override
  String get website => 'Сайт';

  @override
  String get howToUseMenu => 'Как использовать';

  @override
  String get support => 'Поддержка';

  @override
  String helpText(Object appCreator) {
    return 'Создано $appCreator.\r\n\r\nКак использовать:\r\n1. Введите адрес и порт вашего сервера Minecraft (по умолчанию: 19132)\r\n   — или выберите ранее сохраненный сервер из выпадающего списка\r\n2. (Необязательно) Выберите relay-сервер (EU или US), ближайший к вашему местоположению\r\n3. Нажмите \\\"Начать трансляцию\\\", чтобы начать\r\n4. На вашей консоли/устройстве: Minecraft > Играть > Друзья\r\n5. Вы должны увидеть LAN-сервер с названием \\\"NetherLink\\\"\r\n6. Нажмите на него, чтобы подключиться к вашему внешнему серверу через NetherLink\r\n\r\nNintendo Switch (режим DNS):\r\n1. Включите \\\"Nintendo Switch\\\" в панели подключения\r\n2. Выберите relay-сервер (EU или US)\r\n3. Нажмите \\\"Отправить конфигурацию DNS\\\" — это отправит вашу конфигурацию на relay\r\n   (это НЕ транслирует LAN-сервер)\r\n4. На вашей Switch примените настройки DNS NetherLink и подключитесь\r\n   используя запись сервера, которую вы используете для NetherLink\r\n\r\nПримечания:\r\n- Для LAN-трансляции NetherLink и консоль должны находиться в одной локальной сети.\r\n- Совет: выберите relay-сервер, который ближе всего к вам, для лучшей производительности.';
  }

  @override
  String get serverDetailsLabel => 'Детали сервера';

  @override
  String get start => 'Запустить';

  @override
  String get stop => 'Остановить';

  @override
  String get labelJava => 'Java';

  @override
  String get startJavaMode => 'Запустить режим Java';

  @override
  String get javaInfoTitle => 'Режим Java';

  @override
  String get javaInfoText => 'Подключайтесь к серверам Java Edition';

  @override
  String get howToJavaTitle => 'Режим Java';

  @override
  String get howToJavaSubtitle => 'Подключайтесь к серверам Java Edition через NetherLink';

  @override
  String get aternosSubtext => 'Создайте свой собственный бесплатный сервер Minecraft';

  @override
  String get howToJavaBody => 'Режим Java — быстрые шаги:\n1. В приложении выберите режим Java.\n2. Введите адрес и порт вашего сервера Java Edition (по умолчанию: 25565).\n3. Нажмите \"Запустить режим Java\" — NetherLink свяжет соединение.\n4. Откройте Minecraft Bedrock и перейдите на вкладку Друзья.\n5. Выберите LAN-сервер с названием \"NetherLink\", чтобы подключиться к серверу Java.\n\n⚠️ Важные предупреждения:\n- Требуется действующая учётная запись Java Edition (Microsoft).\n- Некоторые серверы используют античит-системы, которые могут обнаружить и заблокировать вашу учётную запись.\n- Некоторые серверы прямо запрещают клиентов Bedrock — всегда проверяйте правила сервера.\n- NetherLink не несёт ответственности за блокировки, ограничения или другие проблемы, связанные с учётной записью, которые могут возникнуть при использовании этой функции.\n- Используйте на свой страх и риск.';

  @override
  String get language => 'Русский';

  @override
  String get discord => 'Discord';

  @override
  String get toggleDebug => 'Переключить отладку';

  @override
  String get copyLogs => 'Копировать журналы';

  @override
  String get clear => 'Очистить';

  @override
  String get cancel => 'Отмена';

  @override
  String get deleteServer => 'Удалить сервер';

  @override
  String get delete => 'Удалить';

  @override
  String get myServers => 'Мои серверы';

  @override
  String get quickAccessServers => 'Серверы быстрого доступа';

  @override
  String get addServer => 'Добавить сервер';

  @override
  String get addServersHint => 'Добавьте серверы для быстрого подключения позже';

  @override
  String get serverNameLabel => 'Имя сервера *';

  @override
  String get addressLabel => 'Адрес *';

  @override
  String get portLabel => 'Порт *';

  @override
  String get descriptionLabel => 'Описание (необязательно)';

  @override
  String get save => 'Сохранить';

  @override
  String get initializing => 'Инициализация...';

  @override
  String get createdBy => 'Создано NetherDev';

  @override
  String get bedrockBridge => 'Мост Bedrock';

  @override
  String get clientDisconnected => 'Клиент отключен — трансляция остановлена';

  @override
  String get pleaseEnterServer => '⚠️ Пожалуйста, введите адрес сервера';

  @override
  String get invalidPort => '⚠️ Неверный номер порта (1-65535)';

  @override
  String get dnsConfigSent => '✅ Конфигурация DNS отправлена на relay-сервер';

  @override
  String get broadcastingStarted => 'Трансляция началась';

  @override
  String get broadcastStopped => 'Трансляция остановлена';

  @override
  String selectedServer(Object name) {
    return '📋 Выбрано: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'Выбрано: $name';
  }

  @override
  String get noLogsToCopy => 'Нет журналов для копирования';

  @override
  String copiedLogs(Object count) {
    return 'Скопировано $count записей журнала в буфер обмена';
  }

  @override
  String get debugEnabled => 'Журналы отладки включены';

  @override
  String get debugDisabled => 'Журналы отладки отключены';

  @override
  String get howToUseTitle => 'Как использовать NetherLink';

  @override
  String get iUnderstand => 'Я понимаю';

  @override
  String get playOnSwitchTitle => 'Играть на Nintendo Switch';

  @override
  String get playWithFriendsTitle => 'Играть с друзьями';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'Выбрано: $relayName\r\n\r\nКак подключиться:\r\n1. Перейдите в настройки вашей Switch и измените DNS на: $relayIp\r\n2. Откройте Minecraft и выберите сервер из списка (например, Cubecraft или Hive).\r\n3. Теперь вы будете автоматически отправлены на свой собственный сервер.';
  }

  @override
  String playInstructionsFriends(Object friend) {
    return 'Как подключиться:\r\n1. На вашей консоли добавьте $friend в друзья.\r\n2. Откройте Minecraft и перейдите на вкладку Friends.\r\n3. Найдите ваш сервер в разделе LAN Worlds и выберите его для подключения.';
  }

  @override
  String get nldServerLabel => 'СЕРВЕР NETHERLINK';

  @override
  String selectRelayLabel(Object name) {
    return 'Выбрать relay-сервер $name';
  }

  @override
  String get noSavedServers => 'Нет сохраненных серверов';

  @override
  String get savedServers => 'Сохраненные серверы';

  @override
  String get serverAddressHint => 'Адрес сервера';

  @override
  String get portHint => 'Порт';

  @override
  String get manageServers => 'Управление серверами';

  @override
  String get manageServersTooltip => 'Управление серверами';

  @override
  String get noServerYet => 'Сохранённых серверов пока нет.\nНажмите «Управление», чтобы добавить сервер.';

  @override
  String get serverNotSelected => 'Сервер не выбран';

  @override
  String get ready => 'Готово';

  @override
  String get active => 'Активно';

  @override
  String get vpnDetected => 'Обнаружен VPN';

  @override
  String get noWifi => 'Нет подключения к Wi‑Fi';

  @override
  String get vpnActive => 'Мы обнаружили, что у вас активен VPN.\n\nПожалуйста, отключите VPN перед использованием NetherLink, иначе LAN-трансляция может не дойти до вашей консоли.';

  @override
  String get mobileActive => 'Обнаружено: мобильные данные\n\nNetherLink должен быть в той же сети, что и ваша консоль. Перед продолжением подключитесь к домашнему Wi‑Fi или точке доступа.';

  @override
  String get continueAnyway => 'Продолжить в любом случае';

  @override
  String get sameWifi => 'Одна и та же сеть Wi‑Fi';

  @override
  String get needSameWifi => 'Устройство с NetherLink ДОЛЖНО быть в той же сети Wi‑Fi, что и консоль, на которой вы играете в Minecraft.';

  @override
  String get subscription => 'Требуется онлайн-подписка';

  @override
  String get needSubscription => 'Для каждой консоли нужна отдельная активная онлайн-подписка (Xbox Live, PS Plus, NSO). Без неё NetherLink не появится.';

  @override
  String get updateAvailable => 'Доступно обновление';

  @override
  String get newVersion => 'Доступна новая версия приложения.\nОбновите сейчас, чтобы получить последние функции и исправления.';

  @override
  String get later => 'Позже';

  @override
  String get updateNow => 'Обновить сейчас';

  @override
  String get beforeYouStart => 'ПЕРЕД НАЧАЛОМ';

  @override
  String get stopBroadcasting => 'Остановить трансляцию';

  @override
  String get startNintendoMode => 'Запустить режим Nintendo';

  @override
  String get startFriendsMode => 'Запустить режим друзей';

  @override
  String get startBroadcasting => 'Начать трансляцию';

  @override
  String get modeLabel => 'Режим';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'Друзья';

  @override
  String get nintendoInfoTitle => 'Режим DNS Nintendo Switch';

  @override
  String get nintendoInfoText => 'Запуститесь в режиме Nintendo, настройте DNS и присоединитесь к избранному серверу.';

  @override
  String get friendModeTitle => 'Режим друзей';

  @override
  String get friendModeText => 'Добавьте friend bots NetherLink в друзья. Запустите режим друзей и играйте';

  @override
  String get selectedRelayCheck => 'Выбрано';

  @override
  String relayFallbackWarning(Object name) {
    return 'Предупреждение: исходный relay не ответил. Используется резервный relay: $name';
  }

  @override
  String get relayUnableConnect => 'Не удалось подключиться ни к одному relay-серверу NetherLink. Попробуйте позже или проверьте интернет.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / прокси)';

  @override
  String get howToXboxSubtitle => 'Играйте через LAN-трансляцию или прокси';

  @override
  String get howToXboxBody => 'Как подключиться (Xbox / PS4 / PS5):\r\n1. Убедитесь, что устройство с NetherLink и ваша консоль находятся в одной локальной сети.\r\n2. В приложении введите адрес и порт вашего сервера Minecraft и нажмите \\\"Начать трансляцию\\\".\r\n3. На консоли откройте Minecraft → Play → найдите LAN Worlds или вкладку Friends и обновите список.\r\n4. Выберите LAN-сервер с именем \\\"NetherLink\\\", чтобы подключиться.\r\nПримечания:\r\n- Если сервер не появляется, убедитесь, что оба устройства находятся в одной подсети и приложение все еще ведет трансляцию.\r\n- Некоторые модели консолей или роутеров могут блокировать обнаружение LAN; при необходимости попробуйте изменить настройки приложения или роутера.';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (режим DNS)';

  @override
  String get howToNintendoSubtitle => 'Инструкции по DNS relay для Switch';

  @override
  String get howToNintendoBody => 'Nintendo Switch — режим DNS (пошагово):\r\n1. В приложении включите режим \\\"Nintendo\\\" и выберите relay-сервер (EU или US).\r\n2. Нажмите \\\"Отправить конфигурацию DNS\\\", чтобы отправить DNS IP на relay.\r\n3. На вашей Nintendo Switch перейдите в настройки системы → интернет → настройки интернета → (ваша сеть) → изменить настройки → DNS и установите основной DNS на relay IP.\r\n4. Откройте Minecraft и присоединитесь к публичному серверу; вы будете перенаправлены на свой сервер с помощью relay DNS.\r\nПримечания:\r\n- Режим DNS не транслирует LAN-сервер; он направляет игровой трафик через relay.\r\n- Верните DNS обратно после завершения, если вам нужно обычное поведение сети.';

  @override
  String get howToFriendsTitle => 'Режим друзей';

  @override
  String get howToFriendsSubtitle => 'Приглашайте друзей и подключайтесь через LAN';

  @override
  String get howToFriendsBody => 'Режим друзей — быстрые шаги:\r\n1. При необходимости добавьте учетную запись друга NetherLink (relay friend) на вашей консоли или платформе.\r\n2. В приложении включите режим друзей и отправьте конфигурацию relay (если применимо).\r\n3. На вашей консоли откройте Minecraft → Friends и найдите LAN Worlds — ваш сервер должен появиться там как LAN-мир.\r\n4. Выберите его, чтобы присоединиться к вашему серверу вместе с друзьями.\r\nПримечания:\r\n- Убедитесь, что у вас и ваших друзей одинаковые NAT/settings, которые позволяют видеть друзей.\r\n- Режим друзей зависит от функций друзей платформы и может потребовать принятия запросов в друзья.';

  @override
  String get helpNetherlinkTitle => 'NetherLink не появляется';

  @override
  String get helpNetherlinkSubtitle => 'Устранение проблем с обнаружением LAN';

  @override
  String get helpNetherlinkBody => 'Если сервер не появляется на вашей консоли, попробуйте следующие шаги:\r\n\r\n✅ Базовые проверки:\r\n1. Одна и та же WiFi-сеть - Ваш телефон/планшет и консоль ДОЛЖНЫ быть в одной WiFi-сети\r\n2. Правильный адрес сервера - Еще раз проверьте IP и порт (по умолчанию: 19132)\r\n3. Трансляция активна - Убедитесь, что NetherLink показывает статус \\\"Broadcasting\\\"\r\n\r\n🔄 Быстрые исправления:\r\n• Перезапустите приложение: остановите трансляцию, полностью закройте NetherLink, снова откройте его и попробуйте еще раз\r\n• Перезапустите консоль: иногда консоли требуется обновление, чтобы обнаружить LAN-игры\r\n• Проверьте вкладку Friends/LAN: сервер появляется в разделе \\\"Friends\\\" или \\\"LAN Games\\\", а НЕ в списке серверов\r\n• Подождите 10-15 секунд после начала трансляции\r\n• Отключите VPN: VPN может блокировать локальные трансляции\r\n\r\n⚠️ Частые проблемы:\r\n\\\"No route found for user\\\" → Убедитесь, что оба устройства находятся в одной Wi‑Fi сети (избегайте гостевых сетей)\r\n\\\"Unable to connect to NetherLink relay server\\\" → Проверьте ваш интернет / статус relay\r\n\r\n📱 Все еще есть проблемы? Включите Debug Mode в NetherLink и проверьте журналы или попробуйте другой сервер.';

  @override
  String get helpMultiplayerFailedTitle => 'Сбой многопользовательского подключения';

  @override
  String get helpMultiplayerFailedSubtitle => 'Объяснение, почему это не ошибка NetherLink';

  @override
  String get helpMultiplayerFailedBody => '⚠️ Это не проблема NetherLink!\r\n\r\nNetherLink успешно перенаправил вас на запрошенный сервер. Сообщение \\\"Сбой многопользовательского подключения\\\" означает, что целевой сервер в данный момент недоступен. Возможные причины:\r\n\r\n• Целевой сервер Minecraft отключен или перегружен\r\n• Сервер требует обновленную версию клиента или определенное издание\r\n• Проблемы сети между relay и целевым сервером\r\n\r\nПопробуйте подключиться к другому серверу или обратитесь в поддержку сервера. Если проблема сохраняется на нескольких серверах, включите Debug Mode в NetherLink и проверьте журналы.';

  @override
  String get helpNintendoDnsTitle => 'Nintendo DNS не работает';

  @override
  String get helpNintendoDnsSubtitle => 'Частые проблемы DNS / relay';

  @override
  String get helpNintendoDnsBody => 'Если режим Nintendo DNS не работает, проверьте следующее:\r\n\r\n1. Убедитесь, что вы отправили DNS config из приложения (Send DNS Config).\r\n2. Убедитесь, что вы применили relay IP как Primary DNS на Switch.\r\n3. Убедитесь, что выбранный relay server (EU/US) находится в сети и не перегружен.\r\n4. Некоторые сети (например, captive portals) не позволяют использовать пользовательский DNS — протестируйте в другой сети.\r\n\r\nЕсли проблемы сохраняются, включите Debug Mode и проверьте журналы или попробуйте альтернативу Friends-mode.';

  @override
  String get helpFriendsModeTitle => 'Режим друзей не работает';

  @override
  String get helpFriendsModeSubtitle => 'Частые проблемы с друзьями';

  @override
  String get helpFriendsModeBody => 'Советы по устранению неполадок режима друзей:\r\n\r\n1. Убедитесь, что учетная запись relay friend добавлена/принята на консоли (если требуется).\r\n2. Попробуйте перезапустить игру и обновить вкладку Friends/LAN после включения режима друзей.\r\n\r\nЕсли сервер по-прежнему не виден друзьям, включите Debug Mode и проверьте журналы, чтобы выявить ошибки.';

  @override
  String get changeLanguageTitle => 'Изменить язык';

  @override
  String get changeLanguage => 'Язык';

  @override
  String get useSystemLanguage => 'Использовать язык системы';

  @override
  String get couldNotOpenUrl => 'Не удалось открыть URL';

  @override
  String get serverTrackerTitle => 'Трекер серверов';

  @override
  String get removeServerTitle => 'Удалить сервер';

  @override
  String removeServerConfirm(Object name) {
    return 'Удалить \"$name\" из вашего трекера?';
  }

  @override
  String get removeServerFailed => 'Не удалось удалить сервер';

  @override
  String get refreshStatus => 'Обновить статус';

  @override
  String get trackerSignInRequired => 'Требуется вход';

  @override
  String get trackerSignInSubtitle => 'Войдите, чтобы отслеживать серверы и получать уведомления в офлайне.';

  @override
  String get signIn => 'Войти';

  @override
  String get noServersTracked => 'Серверы не отслеживаются';

  @override
  String get trackerEmptySubtitle => 'Добавьте сервер Minecraft, чтобы отслеживать его статус и получать уведомления.';

  @override
  String get fillAllFields => 'Пожалуйста, заполните все поля правильно';

  @override
  String get slotUsedUpgrade => 'Ваш бесплатный слот занят. Обновитесь для большего количества серверов.';

  @override
  String get addServerFailed => 'Не удалось добавить сервер. Проверьте свои данные.';

  @override
  String get ipAddressLabel => 'IP-адрес';

  @override
  String get platformLabel => 'Платформа';

  @override
  String get bedrockLabel => 'Bedrock';

  @override
  String get addLabel => 'Добавить';

  @override
  String get statusOnline => 'Онлайн';

  @override
  String get statusOffline => 'Офлайн';

  @override
  String get statusChecking => 'Проверяется...';

  @override
  String get notificationsOn => 'Уведомления включены';

  @override
  String get notificationsOff => 'Уведомления выключены';

  @override
  String get failedUpdateNotifications => 'Не удалось обновить уведомления';

  @override
  String get editServerTitle => 'Редактировать сервер';

  @override
  String get serverNameHint => 'Имя сервера';

  @override
  String get failedSave => 'Не удалось сохранить. Попробуйте снова.';

  @override
  String get serverRenamed => 'Сервер переименован';

  @override
  String get customizeLabel => 'Настроить';

  @override
  String get customizeSubtitle => 'Изменить порядок плиток и настроить навигацию';

  @override
  String get resetLabel => 'Сброс';

  @override
  String get tilesSection => 'ПЛИТКИ';

  @override
  String get dragToReorder => 'Перетащите для изменения порядка';

  @override
  String get navigationSection => 'НАВИГАЦИЯ';

  @override
  String get navFixed => 'Главная, Коннектор и Профиль всегда зафиксированы';

  @override
  String get leftSlot => 'Левый слот (рядом с Главной)';

  @override
  String get rightSlot => 'Правый слот (рядом с Профилем)';

  @override
  String get accentColorSection => 'АКЦЕНТНЫЙ ЦВЕТ';

  @override
  String get opacityLabel => 'Прозрачность';

  @override
  String get backgroundSection => 'ФОН';

  @override
  String get cardsSection => 'КАРТОЧКИ';

  @override
  String get editLabel => 'Редактировать';

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
  String get chooseUniqueUsername => 'Выберите уникальное имя пользователя для начала.';

  @override
  String get usernameFieldLabel => 'Имя пользователя';

  @override
  String get usernameExampleHint => 'напр. CoolPlayer123';

  @override
  String get usernameFormatHint => '3–20 символов · буквы, цифры и подчёркивания';

  @override
  String get displayNameOptional => 'Отображаемое имя (необязательно)';

  @override
  String get displayNameExampleHint => 'напр. Крутой Игрок';

  @override
  String get usernameRequired => 'Имя пользователя обязательно';

  @override
  String get usernameFormatError => 'Имя пользователя должно содержать 3–20 символов: только буквы, цифры и знаки подчёркивания';

  @override
  String get usernameTaken => 'Это имя пользователя уже занято';

  @override
  String get noConnectionError => 'Нет соединения. Проверьте интернет и попробуйте снова.';

  @override
  String get home => 'Главная';

  @override
  String get info => 'Инфо';

  @override
  String get navProfile => 'Профиль';

  @override
  String serverRemoved(Object name) {
    return '$name удалён';
  }

  @override
  String serverAdded(Object name) {
    return '$name добавлен';
  }
}
