// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appName => 'MCCompanion';

  @override
  String get console => 'Консоль';

  @override
  String get consoleOutput => 'Вывод консоли';

  @override
  String get noLogsYet => 'Пока нет журналов';

  @override
  String get startBroadcastingToSeeOutput =>
      'Начните трансляцию, чтобы увидеть вывод';

  @override
  String get close => 'Закрыть';

  @override
  String get ok => 'OK';

  @override
  String get back => 'Назад';

  @override
  String get next => 'Далее';

  @override
  String get done => 'Готово';

  @override
  String get none => 'Нет';

  @override
  String get onboardingThemeTitle => 'Выберите тему';

  @override
  String get onboardingThemeSubtitle =>
      'Вы можете изменить каждый цвет в настройках позже.';

  @override
  String get onboardingNavTitle => 'Быстрый доступ';

  @override
  String get onboardingNavSubtitle =>
      'Выберите две функции для панели навигации.';

  @override
  String get onboardingNavLeftLabel => 'ЛЕВАЯ КНОПКА';

  @override
  String get onboardingNavRightLabel => 'ПРАВАЯ КНОПКА';

  @override
  String get onboardingNavPreviewHome => 'Главная';

  @override
  String get onboardingNavPreviewConnector => 'Коннектор';

  @override
  String get onboardingNavPreviewProfile => 'Профиль';

  @override
  String get onboardingNavPreviewEmpty => 'Пусто';

  @override
  String get onboardingStartTitle => 'Стартовая страница';

  @override
  String get onboardingStartSubtitle =>
      'Приложение открывается здесь при каждом запуске.';

  @override
  String get onboardingCustomizeDetail => 'Настроить подробнее →';

  @override
  String get startPageHome => 'Главная';

  @override
  String get startPageHomeSubtitle => 'Показать главный экран с плитками';

  @override
  String get startPageFeature => 'Функция';

  @override
  String get startPageFeatureSubtitle =>
      'Открывать сразу на определённой странице';

  @override
  String get startPageSectionLabel => 'СТАРТОВАЯ СТРАНИЦА';

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
    return 'Создано $appCreator.\r\n\r\nКак использовать:\r\n1. Введите адрес и порт вашего сервера Minecraft (по умолчанию: 19132)\r\n  , или выберите ранее сохраненный сервер из выпадающего списка\r\n2. (Необязательно) Выберите relay-сервер (EU или US), ближайший к вашему местоположению\r\n3. Нажмите \\\"Начать трансляцию\\\", чтобы начать\r\n4. На вашей консоли/устройстве: Minecraft > Играть > Друзья\r\n5. Вы должны увидеть LAN-сервер с названием \\\"MCCompanion\\\"\r\n6. Нажмите на него, чтобы подключиться к вашему внешнему серверу через MCCompanion\r\n\r\nNintendo Switch (режим DNS):\r\n1. Включите \\\"Nintendo Switch\\\" в панели подключения\r\n2. Выберите relay-сервер (EU или US)\r\n3. Нажмите \\\"Отправить конфигурацию DNS\\\", это отправит вашу конфигурацию на relay\r\n   (это НЕ транслирует LAN-сервер)\r\n4. На вашей Switch примените настройки DNS MCCompanion и подключитесь\r\n   используя запись сервера, которую вы используете для MCCompanion\r\n\r\nПримечания:\r\n- Для LAN-трансляции MCCompanion и консоль должны находиться в одной локальной сети.\r\n- Совет: выберите relay-сервер, который ближе всего к вам, для лучшей производительности.';
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
  String get howToJavaSubtitle =>
      'Подключайтесь к серверам Java Edition через MCCompanion';

  @override
  String get aternosSubtext =>
      'Создайте свой собственный бесплатный сервер Minecraft';

  @override
  String get howToJavaBody =>
      'Режим Java: быстрые шаги:\n1. В приложении выберите режим Java.\n2. Введите адрес и порт вашего сервера Java Edition (по умолчанию: 25565).\n3. Нажмите \"Запустить режим Java\": MCCompanion свяжет соединение.\n4. Откройте Minecraft Bedrock и перейдите на вкладку Друзья.\n5. Выберите LAN-сервер с названием \"MCCompanion\", чтобы подключиться к серверу Java.\n\n⚠️ Важные предупреждения:\n- Требуется действующая учётная запись Java Edition (Microsoft).\n- Некоторые серверы используют античит-системы, которые могут обнаружить и заблокировать вашу учётную запись.\n- Некоторые серверы прямо запрещают клиентов Bedrock, всегда проверяйте правила сервера.\n- MCCompanion не несёт ответственности за блокировки, ограничения или другие проблемы, связанные с учётной записью, которые могут возникнуть при использовании этой функции.\n- Используйте на свой страх и риск.';

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
  String get addServersHint =>
      'Добавьте серверы для быстрого подключения позже';

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
  String get clientDisconnected => 'Клиент отключен: трансляция остановлена';

  @override
  String get pleaseEnterServer => '⚠️ Пожалуйста, введите адрес сервера';

  @override
  String get invalidPort => '⚠️ Неверный номер порта (1-65535)';

  @override
  String get dataSentToServers => 'Данные отправлены на серверы MCCompanion';

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
  String get howToUseTitle => 'Как использовать MCCompanion';

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
  String get nldServerLabel => 'СЕРВЕР MCCompanion';

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
  String get noServerYet =>
      'Сохранённых серверов пока нет.\nНажмите «Управление», чтобы добавить сервер.';

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
  String get vpnActive =>
      'Мы обнаружили, что у вас активен VPN.\n\nПожалуйста, отключите VPN перед использованием MCCompanion, иначе LAN-трансляция может не дойти до вашей консоли.';

  @override
  String get mobileActive =>
      'Обнаружено: мобильные данные\n\nMCCompanion должен быть в той же сети, что и ваша консоль. Перед продолжением подключитесь к домашнему Wi‑Fi или точке доступа.';

  @override
  String get continueAnyway => 'Продолжить в любом случае';

  @override
  String get sameWifi => 'Одна и та же сеть Wi‑Fi';

  @override
  String get needSameWifi =>
      'Устройство с MCCompanion ДОЛЖНО быть в той же сети Wi‑Fi, что и консоль, на которой вы играете в Minecraft.';

  @override
  String get subscription => 'Требуется онлайн-подписка';

  @override
  String get needSubscription =>
      'Для каждой консоли нужна отдельная активная онлайн-подписка (Xbox Live, PS Plus, NSO). Без неё MCCompanion не появится.';

  @override
  String get updateAvailable => 'Доступно обновление';

  @override
  String get newVersion =>
      'Доступна новая версия приложения.\nОбновите сейчас, чтобы получить последние функции и исправления.';

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
  String get nintendoInfoText =>
      'Запуститесь в режиме Nintendo, настройте DNS и присоединитесь к избранному серверу.';

  @override
  String get friendModeTitle => 'Режим друзей';

  @override
  String get friendModeText =>
      'Добавьте friend bots MCCompanion в друзья. Запустите режим друзей и играйте';

  @override
  String get selectedRelayCheck => 'Выбрано';

  @override
  String relayFallbackWarning(Object name) {
    return 'Предупреждение: исходный relay не ответил. Используется резервный relay: $name';
  }

  @override
  String get relayUnableConnect =>
      'Не удалось подключиться ни к одному relay-серверу MCCompanion. Попробуйте позже или проверьте интернет.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / прокси)';

  @override
  String get howToXboxSubtitle => 'Играйте через LAN-трансляцию или прокси';

  @override
  String get howToXboxBody =>
      'Как подключиться (Xbox / PS4 / PS5):\r\n1. Убедитесь, что устройство с MCCompanion и ваша консоль находятся в одной локальной сети.\r\n2. В приложении введите адрес и порт вашего сервера Minecraft и нажмите \\\"Начать трансляцию\\\".\r\n3. На консоли откройте Minecraft → Play → найдите LAN Worlds или вкладку Friends и обновите список.\r\n4. Выберите LAN-сервер с именем \\\"MCCompanion\\\", чтобы подключиться.\r\nПримечания:\r\n- Если сервер не появляется, убедитесь, что оба устройства находятся в одной подсети и приложение все еще ведет трансляцию.\r\n- Некоторые модели консолей или роутеров могут блокировать обнаружение LAN; при необходимости попробуйте изменить настройки приложения или роутера.';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (режим DNS)';

  @override
  String get howToNintendoSubtitle => 'Инструкции по DNS relay для Switch';

  @override
  String get howToNintendoBody =>
      'Nintendo Switch: режим DNS (пошагово):\r\n1. В приложении включите режим \\\"Nintendo\\\" и выберите relay-сервер (EU или US).\r\n2. Нажмите \\\"Отправить конфигурацию DNS\\\", чтобы отправить DNS IP на relay.\r\n3. На вашей Nintendo Switch перейдите в настройки системы → интернет → настройки интернета → (ваша сеть) → изменить настройки → DNS и установите основной DNS на relay IP.\r\n4. Откройте Minecraft и присоединитесь к публичному серверу; вы будете перенаправлены на свой сервер с помощью relay DNS.\r\nПримечания:\r\n- Режим DNS не транслирует LAN-сервер; он направляет игровой трафик через relay.\r\n- Верните DNS обратно после завершения, если вам нужно обычное поведение сети.';

  @override
  String get howToFriendsTitle => 'Режим друзей';

  @override
  String get howToFriendsSubtitle =>
      'Приглашайте друзей и подключайтесь через LAN';

  @override
  String get howToFriendsBody =>
      'Режим друзей: быстрые шаги:\r\n1. При необходимости добавьте учетную запись друга MCCompanion (relay friend) на вашей консоли или платформе.\r\n2. В приложении включите режим друзей и отправьте конфигурацию relay (если применимо).\r\n3. На вашей консоли откройте Minecraft → Friends и найдите LAN Worlds, ваш сервер должен появиться там как LAN-мир.\r\n4. Выберите его, чтобы присоединиться к вашему серверу вместе с друзьями.\r\nПримечания:\r\n- Убедитесь, что у вас и ваших друзей одинаковые NAT/settings, которые позволяют видеть друзей.\r\n- Режим друзей зависит от функций друзей платформы и может потребовать принятия запросов в друзья.';

  @override
  String get helpMCCompanionTitle => 'MCCompanion не появляется';

  @override
  String get helpMCCompanionSubtitle => 'Устранение проблем с обнаружением LAN';

  @override
  String get helpMCCompanionBody =>
      'Если сервер не появляется на вашей консоли, попробуйте следующие шаги:\r\n\r\n✅ Базовые проверки:\r\n1. Одна и та же WiFi-сеть - Ваш телефон/планшет и консоль ДОЛЖНЫ быть в одной WiFi-сети\r\n2. Правильный адрес сервера - Еще раз проверьте IP и порт (по умолчанию: 19132)\r\n3. Трансляция активна - Убедитесь, что MCCompanion показывает статус \\\"Broadcasting\\\"\r\n\r\n🔄 Быстрые исправления:\r\n• Перезапустите приложение: остановите трансляцию, полностью закройте MCCompanion, снова откройте его и попробуйте еще раз\r\n• Перезапустите консоль: иногда консоли требуется обновление, чтобы обнаружить LAN-игры\r\n• Проверьте вкладку Friends/LAN: сервер появляется в разделе \\\"Friends\\\" или \\\"LAN Games\\\", а НЕ в списке серверов\r\n• Подождите 10-15 секунд после начала трансляции\r\n• Отключите VPN: VPN может блокировать локальные трансляции\r\n\r\n⚠️ Частые проблемы:\r\n\\\"No route found for user\\\" → Убедитесь, что оба устройства находятся в одной Wi‑Fi сети (избегайте гостевых сетей)\r\n\\\"Unable to connect to MCCompanion relay server\\\" → Проверьте ваш интернет / статус relay\r\n\r\n📱 Все еще есть проблемы? Включите Debug Mode в MCCompanion и проверьте журналы или попробуйте другой сервер.';

  @override
  String get helpMultiplayerFailedTitle =>
      'Сбой многопользовательского подключения';

  @override
  String get helpMultiplayerFailedSubtitle =>
      'Объяснение, почему это не ошибка MCCompanion';

  @override
  String get helpMultiplayerFailedBody =>
      '⚠️ Это не проблема MCCompanion!\r\n\r\nMCCompanion успешно перенаправил вас на запрошенный сервер. Сообщение \\\"Сбой многопользовательского подключения\\\" означает, что целевой сервер в данный момент недоступен. Возможные причины:\r\n\r\n• Целевой сервер Minecraft отключен или перегружен\r\n• Сервер требует обновленную версию клиента или определенное издание\r\n• Проблемы сети между relay и целевым сервером\r\n\r\nПопробуйте подключиться к другому серверу или обратитесь в поддержку сервера. Если проблема сохраняется на нескольких серверах, включите Debug Mode в MCCompanion и проверьте журналы.';

  @override
  String get helpNintendoDnsTitle => 'Nintendo DNS не работает';

  @override
  String get helpNintendoDnsSubtitle => 'Частые проблемы DNS / relay';

  @override
  String get helpNintendoDnsBody =>
      'Если режим Nintendo DNS не работает, проверьте следующее:\r\n\r\n1. Убедитесь, что вы отправили DNS config из приложения (Send DNS Config).\r\n2. Убедитесь, что вы применили relay IP как Primary DNS на Switch.\r\n3. Убедитесь, что выбранный relay server (EU/US) находится в сети и не перегружен.\r\n4. Некоторые сети (например, captive portals) не позволяют использовать пользовательский DNS, протестируйте в другой сети.\r\n\r\nЕсли проблемы сохраняются, включите Debug Mode и проверьте журналы или попробуйте альтернативу Friends-mode.';

  @override
  String get helpFriendsModeTitle => 'Режим друзей не работает';

  @override
  String get helpFriendsModeSubtitle => 'Частые проблемы с друзьями';

  @override
  String get helpFriendsModeBody =>
      'Советы по устранению неполадок режима друзей:\r\n\r\n1. Убедитесь, что учетная запись relay friend добавлена/принята на консоли (если требуется).\r\n2. Попробуйте перезапустить игру и обновить вкладку Friends/LAN после включения режима друзей.\r\n\r\nЕсли сервер по-прежнему не виден друзьям, включите Debug Mode и проверьте журналы, чтобы выявить ошибки.';

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
  String get trackerSignInSubtitle =>
      'Войдите, чтобы отслеживать серверы и получать уведомления в офлайне.';

  @override
  String get signIn => 'Войти';

  @override
  String get noServersTracked => 'Серверы не отслеживаются';

  @override
  String get trackerEmptySubtitle =>
      'Добавьте сервер Minecraft, чтобы отслеживать его статус и получать уведомления.';

  @override
  String get fillAllFields => 'Пожалуйста, заполните все поля правильно';

  @override
  String get slotUsedUpgrade =>
      'Ваш бесплатный слот занят. Обновитесь для большего количества серверов.';

  @override
  String get addServerFailed =>
      'Не удалось добавить сервер. Проверьте свои данные.';

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
  String get customizeSubtitle =>
      'Изменить порядок плиток и настроить навигацию';

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
  String get tileWideTooltipRemove => 'Убрать широкий макет';

  @override
  String get tileWideTooltipAdd => 'Сделать плитку широкой';

  @override
  String get tileVisibilityShow => 'Показать плитку';

  @override
  String get tileVisibilityHide => 'Скрыть плитку';

  @override
  String get tileVisibilityMin => 'Нельзя скрыть (последняя плитка)';

  @override
  String get colorPickerApply => 'Применить';

  @override
  String get colorPickerHex => 'Hex';

  @override
  String get textColorSection => 'ЦВЕТ ТЕКСТА';

  @override
  String get textColorPickerTitle => 'Цвет текста';

  @override
  String get textColorHint =>
      'Нажмите на круг, чтобы выбрать пользовательский цвет текста';

  @override
  String get textColorPreviewPrimary => 'Основной';

  @override
  String get textColorPreviewSecondary => 'Дополнительный';

  @override
  String get textColorPreviewMuted => 'Приглушённый';

  @override
  String get colorSwatchCustom => 'Пользовательский';

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
  String get reportUser => 'Пожаловаться на пользователя';

  @override
  String reportUserWithName(Object name) {
    return 'Пожаловаться на $name';
  }

  @override
  String get reportDisclaimer => 'Жалобы проверяются нашей командой.';

  @override
  String get reportReasonSpam => 'Спам';

  @override
  String get reportReasonHarassment => 'Преследование';

  @override
  String get reportReasonInappropriate => 'Неприемлемый контент';

  @override
  String get reportReasonOther => 'Другое';

  @override
  String get reportAdditionalDetails =>
      'Дополнительные сведения (необязательно)…';

  @override
  String get reportSuccess => 'Жалоба отправлена. Спасибо.';

  @override
  String get reportFailed => 'Не удалось отправить жалобу.';

  @override
  String get reportSubmit => 'Отправить жалобу';

  @override
  String get today => 'Сегодня';

  @override
  String get yesterday => 'Вчера';

  @override
  String get youPrefix => 'Вы';

  @override
  String get playerLookupTitle => 'Поиск игрока';

  @override
  String get playerLookupSubtitle => 'Найдите игрока Java или Bedrock';

  @override
  String get playerLookupHint => 'Введите имя пользователя…';

  @override
  String get playerLookupLinked => 'Найдены связанные аккаунты';

  @override
  String get playerLookupLabelUsername => 'Имя пользователя';

  @override
  String get playerLookupLabelTier => 'Уровень';

  @override
  String playerLookupCopied(Object value) {
    return '$value скопировано';
  }

  @override
  String get tabProfile => 'Профиль';

  @override
  String get tabFriends => 'Друзья';

  @override
  String get tabRequests => 'Заявки';

  @override
  String get addFriend => 'Добавить друга';

  @override
  String get usernameHint => 'Имя пользователя';

  @override
  String get send => 'Отправить';

  @override
  String friendRequestSentTo(Object name) {
    return 'Запрос в друзья отправлен $name';
  }

  @override
  String alreadyFriendsWith(Object name) {
    return 'Вы уже друзья с $name';
  }

  @override
  String requestAlreadyPending(Object name) {
    return 'Запрос к $name уже ожидает рассмотрения';
  }

  @override
  String userNotFoundMsg(Object name) {
    return 'Пользователь $name не найден';
  }

  @override
  String cannotSendRequest(Object name) {
    return 'Нельзя отправить запрос пользователю $name';
  }

  @override
  String get somethingWentWrong => 'Что-то пошло не так. Попробуйте снова.';

  @override
  String friendRequestAccepted(Object name) {
    return 'Вы теперь друзья с $name';
  }

  @override
  String requestDeclined(Object name) {
    return 'Запрос от $name отклонён';
  }

  @override
  String get deleteAccountTitle => 'Удалить аккаунт';

  @override
  String get deleteAccountBody =>
      'Это навсегда удалит ваш аккаунт и все данные.';

  @override
  String get deletePermanently => 'Удалить навсегда';

  @override
  String get couldNotDeleteAccount => 'Не удалось удалить аккаунт.';

  @override
  String get removeFriendTitle => 'Удалить друга';

  @override
  String removeFriendConfirm(Object name) {
    return 'Удалить $name из друзей?';
  }

  @override
  String get remove => 'Удалить';

  @override
  String friendRemoved(Object name) {
    return '$name удалён из друзей';
  }

  @override
  String get emailDifferentMethod => 'Этот email связан с другим методом входа';

  @override
  String get googleSignInFailed => 'Ошибка входа через Google.';

  @override
  String get appleSignInFailed => 'Ошибка входа через Apple. Попробуйте снова.';

  @override
  String get resetPasswordTitle => 'Сброс пароля';

  @override
  String get resetPasswordBody =>
      'Введите email для получения ссылки сброса пароля.';

  @override
  String get emailAddressHint => 'Адрес электронной почты';

  @override
  String get sendLink => 'Отправить ссылку';

  @override
  String resetLinkSent(Object email) {
    return 'Если для $email есть аккаунт, ссылка уже в пути';
  }

  @override
  String get noAccountForEmail => 'Аккаунт с этим email не найден';

  @override
  String get invalidEmailError => 'Адрес электронной почты недействителен';

  @override
  String get couldNotSendResetEmail => 'Не удалось отправить письмо.';

  @override
  String get enterEmailAndPassword => 'Введите email и пароль';

  @override
  String get incorrectEmailOrPassword => 'Неверный email или пароль';

  @override
  String get emailAlreadyInUse => 'Этот email уже используется';

  @override
  String get weakPassword => 'Пароль слишком слабый.';

  @override
  String get createAccount => 'Создать аккаунт';

  @override
  String get signInSubtitle => 'Войдите для доступа к профилю.';

  @override
  String get passwordHint => 'Пароль';

  @override
  String get forgotPassword => 'Забыли пароль?';

  @override
  String get orDivider => 'или';

  @override
  String get continueWithGoogle => 'Продолжить с Google';

  @override
  String get alreadyHaveAccount => 'Уже есть аккаунт? Войти';

  @override
  String get noAccountYet => 'Нет аккаунта? Создайте';

  @override
  String get profileNotSetUp => 'Профиль не настроен';

  @override
  String get chooseUsernameSubtitle =>
      'Выберите имя пользователя, чтобы другие игроки могли вас найти.';

  @override
  String get createProfile => 'Создать профиль';

  @override
  String get findUser => 'Найти пользователя';

  @override
  String get couldNotUpdateVisibility =>
      'Не удалось обновить настройки видимости';

  @override
  String get signOut => 'Выйти';

  @override
  String get appearOfflineLabel => 'Появляться не в сети';

  @override
  String get appearOfflineOn => 'Вы отображаетесь офлайн';

  @override
  String get appearOfflineOff => 'Вы отображаетесь онлайн';

  @override
  String get unlinkXboxTitle => 'Отвязать аккаунт Xbox';

  @override
  String removeLabelConfirm(Object name) {
    return 'Удалить $name из связанных аккаунтов?';
  }

  @override
  String get unlink => 'Отвязать';

  @override
  String get unlinkJavaTitle => 'Отвязать аккаунт Java';

  @override
  String removeJavaConfirm(Object name) {
    return 'Удалить $name из связанных аккаунтов?';
  }

  @override
  String get linkedAccountsTitle => 'Связанные аккаунты';

  @override
  String get linkAccountsHint => 'Привяжите аккаунты Minecraft.';

  @override
  String get linkXbox => 'Привязать Xbox';

  @override
  String get linkJava => 'Привязать Java';

  @override
  String get profileUpdated => 'Профиль обновлён';

  @override
  String get profileCardTitle => 'Профиль';

  @override
  String get edit => 'Редактировать';

  @override
  String get displayNameLabel => 'Отображаемое имя';

  @override
  String get yourNameHint => 'Ваше имя';

  @override
  String get bioLabel => 'Биография';

  @override
  String get bioHint => 'Расскажите о себе…';

  @override
  String get avatarUrlLabel => 'URL аватара';

  @override
  String get usernameDisplayLabel => 'Имя пользователя';

  @override
  String get aboutMe => 'Обо мне';

  @override
  String get noFriendsYet => 'Пока нет друзей';

  @override
  String get noFriendsSub => 'Добавьте друзей, чтобы видеть их здесь.';

  @override
  String onlineFriendsLabel(Object count) {
    return '$count в сети';
  }

  @override
  String offlineFriendsLabel(Object count) {
    return '$count не в сети';
  }

  @override
  String get noPendingRequests => 'Нет ожидающих запросов';

  @override
  String get requestsAppearHere => 'Здесь появятся новые запросы в друзья.';

  @override
  String get skinsEdit => 'Редактировать';

  @override
  String get skinsNoAccountsTitle => 'Аккаунты Minecraft не привязаны';

  @override
  String get skinsNoAccountsSubtitle =>
      'Привяжите аккаунт для просмотра скинов.';

  @override
  String get skinsSignInTitle => 'Войдите для просмотра скинов';

  @override
  String get skinsSignInSubtitle => 'Войдите для просмотра скинов.';

  @override
  String get skinsMustBe64 => 'Скин должен быть 64×64 пикселя';

  @override
  String get skinsInvalidFile => 'Неверный файл изображения';

  @override
  String get skinsUpload => 'Загрузить';

  @override
  String get skinsCreate => 'Создать';

  @override
  String get skinsSectionRecent => 'НЕДАВНИЕ СКИНЫ';

  @override
  String get skinsSectionMy => 'МОИ СКИНЫ';

  @override
  String get skinsEmptyMySkins => 'Скинов пока нет. Загрузите один!';

  @override
  String get skinsSectionYours => 'ВАШИ СКИНЫ';

  @override
  String get skinsCouldNotLoad => 'Не удалось загрузить скины';

  @override
  String skinsPageOf(Object page, Object total) {
    return 'Страница $page из $total';
  }

  @override
  String get skinsDownload => 'Скачать';

  @override
  String get wikiTitle => 'Вики';

  @override
  String get wikiMinecraftWiki => 'Вики Minecraft';

  @override
  String get wikiSearchHint => 'Поиск в вики…';

  @override
  String get wikiCouldNotLoadPages => 'Не удалось загрузить страницы.';

  @override
  String get wikiCouldNotReach => 'Не удалось получить доступ к вики.';

  @override
  String wikiNoResults(Object query) {
    return 'Результатов для \"$query\" не найдено';
  }

  @override
  String get wikiNoPagesFound => 'Страницы не найдены';

  @override
  String wikiCategories(Object count) {
    return '$count категории';
  }

  @override
  String get wikiCouldNotLoadContent => 'Не удалось загрузить содержимое.';

  @override
  String get wikiOpenInBrowser => 'Открыть в браузере';

  @override
  String get wikiCrafting => 'Крафт';

  @override
  String get wikiReadFullArticle => 'Читать полную статью';

  @override
  String get wikiRecent => 'Недавно просмотренные';

  @override
  String get wikiFavourites => 'Избранное';

  @override
  String get wikiMobs => 'Мобы';

  @override
  String get wikiBlocks => 'Блоки';

  @override
  String get wikiItems => 'Предметы';

  @override
  String get wikiBiomes => 'Биомы';

  @override
  String get wikiStructures => 'Структуры';

  @override
  String get wikiEnchantments => 'Зачарования';

  @override
  String get wikiPotions => 'Зелья';

  @override
  String get wikiPassive => 'Пассивные';

  @override
  String get wikiNeutral => 'Нейтральные';

  @override
  String get wikiHostile => 'Враждебные';

  @override
  String get wikiBoss => 'Босс';

  @override
  String get wikiUtility => 'Полезные';

  @override
  String get wikiNatural => 'Природные';

  @override
  String get wikiOres => 'Руды';

  @override
  String get wikiWood => 'Дерево';

  @override
  String get wikiStone => 'Камень';

  @override
  String get wikiRedstone => 'Красный камень';

  @override
  String get wikiPlants => 'Растения';

  @override
  String get wikiDecoration => 'Декорации';

  @override
  String get wikiTools => 'Инструменты';

  @override
  String get wikiSwords => 'Мечи';

  @override
  String get wikiRanged => 'Дальний бой';

  @override
  String get wikiArmor => 'Броня';

  @override
  String get wikiFood => 'Еда';

  @override
  String get wikiBrewing => 'Зельеварение';

  @override
  String get wikiMaterials => 'Материалы';

  @override
  String get wikiOverworld => 'Верхний мир';

  @override
  String get wikiNether => 'Незер';

  @override
  String get wikiTheEnd => 'Край';

  @override
  String get wikiSword => 'Меч';

  @override
  String get wikiTool => 'Инструмент';

  @override
  String get wikiBow => 'Лук';

  @override
  String get wikiFishing => 'Рыбалка';

  @override
  String get wikiStatusEffects => 'Эффекты состояния';

  @override
  String get chooseUniqueUsername =>
      'Выберите уникальное имя пользователя для начала.';

  @override
  String get usernameFieldLabel => 'Имя пользователя';

  @override
  String get usernameExampleHint => 'напр. CoolPlayer123';

  @override
  String get usernameFormatHint =>
      '3–20 символов · буквы, цифры и подчёркивания';

  @override
  String get displayNameOptional => 'Отображаемое имя (необязательно)';

  @override
  String get displayNameExampleHint => 'напр. Крутой Игрок';

  @override
  String get usernameRequired => 'Имя пользователя обязательно';

  @override
  String get usernameFormatError =>
      'Имя пользователя должно содержать 3–20 символов: только буквы, цифры и знаки подчёркивания';

  @override
  String get usernameTaken => 'Это имя пользователя уже занято';

  @override
  String get noConnectionError =>
      'Нет соединения. Проверьте интернет и попробуйте снова.';

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

  @override
  String get paywallRestore => 'Восстановить';

  @override
  String get paywallMonthly => 'Ежемесячно';

  @override
  String get paywallYearly => 'Ежегодно';

  @override
  String get paywallSavePercent => 'Экономия ~17%';

  @override
  String get paywallSubtitle =>
      'Отслеживайте больше серверов и получайте уведомления.';

  @override
  String paywallSlotLabel(Object slots) {
    return '$slots слотов сервера';
  }

  @override
  String get paywallPopular => 'Популярное';

  @override
  String get paywallContinue => 'Продолжить';

  @override
  String get paywallNoPkgs => 'Пакеты недоступны.';

  @override
  String get paywallManaged =>
      'Управляется Apple/Google. Отмените в любое время.';

  @override
  String get paywallPurchaseSuccess => 'Покупка успешна!';

  @override
  String get paywallPurchaseFailed => 'Ошибка покупки.';

  @override
  String get paywallPurchasesRestored => 'Покупки восстановлены!';

  @override
  String get paywallNoActivePurchases => 'Активные покупки не найдены.';

  @override
  String get paywallRestoreFailed => 'Ошибка восстановления.';

  @override
  String get relay => 'Relay';

  @override
  String get selectModeSection => 'ВЫБОР РЕЖИМА';

  @override
  String get serversSection => 'СЕРВЕРЫ';

  @override
  String get noServerSelected => 'Сервер не выбран';

  @override
  String get selectBedrockAccount => 'Выбрать аккаунт Bedrock';

  @override
  String playersCount(Object players, Object max) {
    return '$players / $max игроков';
  }

  @override
  String get infoAndLegal => 'Информация и правовые аспекты';

  @override
  String get legalSection => 'Правовые аспекты';

  @override
  String get privacyPolicy => 'политику конфиденциальности';

  @override
  String get privacyPolicySubtitle => 'Как мы обрабатываем ваши данные';

  @override
  String get termsOfService => 'условия использования';

  @override
  String get termsOfServiceSubtitle => 'Правила и условия';

  @override
  String get dataSourcesSection => 'Источники данных и благодарности';

  @override
  String get creditMinecraftWikiSubtitle =>
      'Источник данных для вики. Контент под лицензией Creative Commons.';

  @override
  String get creditMojangTitle => 'Mojang / Microsoft';

  @override
  String get creditMojangSubtitle => 'Скины и профили Java через API Mojang.';

  @override
  String get creditGeyserTitle => 'GeyserMC';

  @override
  String get creditGeyserSubtitle => 'Рендеринг скинов Bedrock через GeyserMC.';

  @override
  String get creditXboxTitle => 'Xbox / Microsoft';

  @override
  String get creditXboxSubtitle =>
      'Привязка аккаунтов Bedrock через Xbox Live.';

  @override
  String get aboutMCCompanionSection => 'О MCCompanion';

  @override
  String get aboutMCCompanionDisclaimer =>
      'MCCompanion: независимое приложение, не связанное с Mojang или Microsoft.';

  @override
  String get minecraftTrademark =>
      '\"Minecraft\" является торговой маркой корпорации Microsoft.';

  @override
  String get nldServerLabelShort => 'Сервер MCCompanion';

  @override
  String get editServer => 'Редактировать сервер';

  @override
  String get serverNameExampleHint => 'Мой крутой сервер';

  @override
  String get serverAddressExampleHint => 'play.example.com';

  @override
  String get serverDescriptionExampleHint => 'Выживание с друзьями';

  @override
  String get editionLabel => 'Издание';

  @override
  String get nameLabel => 'Имя';

  @override
  String get ipAddressFieldLabel => 'IP-адрес';

  @override
  String get portFieldLabel => 'Порт';

  @override
  String get platformFieldLabel => 'Платформа';

  @override
  String get nameValidationError => 'Имя должно содержать 1–50 символов';

  @override
  String get ipRequiredError => 'IP-адрес обязателен';

  @override
  String get portRangeError => 'Порт должен быть от 1 до 65535';

  @override
  String get partnerServersTitle => 'Серверы-партнёры';

  @override
  String get noPartnerServers => 'Серверов-партнёров пока нет.';

  @override
  String get checkBackLater => 'Проверьте позже.';

  @override
  String get xboxLinkTitle => 'Привязать аккаунт Xbox';

  @override
  String get xboxStartingLogin => 'Запуск входа Xbox…';

  @override
  String get xboxSignInWithMicrosoft => 'Войти через Microsoft';

  @override
  String get xboxGoToLink => 'Перейдите по ссылке ниже и введите код.';

  @override
  String get xboxYourCode => 'Ваш код';

  @override
  String get xboxTapToCopy => 'Нажмите на код для копирования';

  @override
  String get xboxOpenLink => 'Открыть microsoft.com/link';

  @override
  String get xboxWaitingForLogin => 'Ожидание входа…';

  @override
  String get xboxAccountLinked => 'Аккаунт Xbox привязан!';

  @override
  String get xboxCodeCopied => 'Код скопирован в буфер обмена';

  @override
  String get xboxCouldNotStart => 'Не удалось запустить вход Xbox.';

  @override
  String get xboxCodeExpired => 'Код истёк. Попробуйте снова.';

  @override
  String get xboxSomethingWrong => 'Что-то пошло не так.';

  @override
  String get tryAgain => 'Попробовать снова';

  @override
  String get publicProfileTitle => 'Профиль';

  @override
  String get userNotFound => 'Пользователь не найден';

  @override
  String get profileSectionLabel => 'Профиль';

  @override
  String get displayNameRowLabel => 'Отображаемое имя';

  @override
  String get usernameRowLabel => 'Имя пользователя';

  @override
  String get lastSeenLabel => 'Последний раз в сети';

  @override
  String get aboutSectionLabel => 'О приложении';

  @override
  String get xboxBedrockLabel => 'Xbox / Bedrock';

  @override
  String get friendRequestSent => 'Запрос в друзья отправлен';

  @override
  String get alreadyFriendsMsg => 'Вы уже друзья.';

  @override
  String get requestAlreadyPendingMsg => 'Запрос уже ожидает рассмотрения.';

  @override
  String get userNotFoundMsg2 => 'Пользователь не найден.';

  @override
  String get cannotSendRequestMsg => 'Нельзя отправить запрос.';

  @override
  String nowFriendsWith(Object username) {
    return 'Теперь друзья с @$username';
  }

  @override
  String get removeFriendButton => 'Удалить из друзей';

  @override
  String get requestSentButton => 'Запрос отправлен';

  @override
  String get acceptRequestButton => 'Принять запрос';

  @override
  String get addFriendButton => 'Добавить в друзья';

  @override
  String get removeFriendDialogTitle => 'Удалить из друзей';

  @override
  String removeFriendDialogBody(Object username) {
    return 'Удалить @$username из друзей?';
  }

  @override
  String get trackerLimitReached =>
      'Достигнут лимит серверов. Обновитесь для большего.';

  @override
  String get upgradeButton => 'Обновить';

  @override
  String get javaLinkTitle => 'Привязать Java Edition';

  @override
  String get javaStartingLogin => 'Запуск входа Microsoft…';

  @override
  String get javaSignInWithMicrosoft => 'Войти через Microsoft';

  @override
  String get javaGoToLink =>
      'Перейдите по ссылке и введите код для привязки аккаунта Minecraft Java Edition.';

  @override
  String get javaYourCode => 'Ваш код';

  @override
  String get javaTapToCopy => 'Нажмите на код для копирования';

  @override
  String get javaOpenLink => 'Открыть microsoft.com/link';

  @override
  String get javaWaitingForLogin => 'Ожидание входа…';

  @override
  String get javaAccountLinked => 'Java Edition привязан!';

  @override
  String get javaNoJavaTitle => 'Java Edition не найден';

  @override
  String get javaNoJavaBody =>
      'Аккаунт Microsoft, с которым вы вошли, не владеет Minecraft Java Edition.';

  @override
  String get javaTryDifferentAccount => 'Попробовать другой аккаунт';

  @override
  String get javaCouldNotStart =>
      'Не удалось запустить вход Microsoft. Попробуйте снова.';

  @override
  String get javaCodeExpired => 'Код истёк. Попробуйте снова.';

  @override
  String get javaSomethingWrong => 'Что-то пошло не так. Попробуйте снова.';

  @override
  String get javaCodeCopied => 'Код скопирован в буфер обмена';

  @override
  String get splashFeatureConnect => 'Подключить';

  @override
  String get splashFeatureFriends => 'Друзья';

  @override
  String get splashFeatureChat => 'Чат';

  @override
  String get splashFeatureSkins => 'Скины';

  @override
  String get featureLabelConnector => 'Коннектор';

  @override
  String get featureLabelSkins => 'Скины';

  @override
  String get featureLabelWiki => 'Вики';

  @override
  String get featureLabelPartners => 'Партнёры';

  @override
  String get featureLabelLookup => 'Поиск';

  @override
  String get featureLabelTracker => 'Трекер серверов';

  @override
  String get featureSubtitleConnector => 'Подключение консолей к Minecraft';

  @override
  String get featureSubtitleSkins => 'Просмотр и управление скинами Minecraft';

  @override
  String get featureSubtitleWiki => 'Энциклопедия Minecraft';

  @override
  String get featureSubtitlePartners => 'Рекомендуемые серверы';

  @override
  String get featureSubtitleLookup => 'Поиск профилей Java и Bedrock';

  @override
  String get featureSubtitleTracker =>
      'Мониторинг статуса сервера и уведомления';

  @override
  String get userSearchHint => 'Имя пользователя, геймертег или Java-имя…';

  @override
  String get userSearchSub =>
      'Поиск по имени пользователя, Xbox-геймертегу или Java-имени';

  @override
  String get onlineStatus => 'Онлайн';

  @override
  String get upgradeWindowsHint => 'Обновление доступно в Microsoft Store';

  @override
  String get skinSaved => 'Скин сохранён';

  @override
  String skinSavedAs(String name) {
    return 'Сохранено как \"$name\"';
  }

  @override
  String get skinExportFailed => 'Ошибка экспорта';

  @override
  String get skinExported => 'Скин успешно экспортирован';

  @override
  String get accountActions => 'АККАУНТ';

  @override
  String get feedbackBugReport => 'Сообщение об ошибке';

  @override
  String get feedbackFeatureRequest => 'Запрос функции';

  @override
  String get feedbackTitleLabel => 'Заголовок';

  @override
  String get feedbackTitleHintBug =>
      'напр. Приложение вылетает при открытии редактора скинов';

  @override
  String get feedbackTitleHintFeature =>
      'напр. Показывать пинг игрока в списке серверов';

  @override
  String get feedbackWhatHappened => 'Что произошло?';

  @override
  String get feedbackDescribeIdea => 'Опишите свою идею';

  @override
  String get feedbackDescHintBug =>
      'Опишите ошибку: что вы сделали, что ожидали и что произошло вместо этого?';

  @override
  String get feedbackDescHintFeature =>
      'Объясните, что вы хотите и почему это было бы полезно.';

  @override
  String get feedbackEmailLabel => 'Электронная почта';

  @override
  String get feedbackEmailHint => 'Чтобы мы могли связаться с вами';

  @override
  String get feedbackEmailNote =>
      'Ваш адрес электронной почты никогда не публикуется.';

  @override
  String get feedbackSubmitBug => 'Отправить сообщение об ошибке';

  @override
  String get feedbackSubmitFeature => 'Отправить запрос функции';

  @override
  String get feedbackDisclaimer =>
      'Попадёт к нашей команде · Не указывайте пароли';

  @override
  String get feedbackSuccessTitle => 'Спасибо за отзыв!';

  @override
  String get feedbackSuccessBody =>
      'Спасибо! Сообщение получено. Мы отвечаем в приложении, загляните сюда за ответом.';

  @override
  String get feedbackSubmitAnother => 'Отправить ещё';

  @override
  String get feedbackBackToApp => 'Вернуться в приложение';

  @override
  String get feedbackTitleTooShort =>
      'Заголовок должен содержать не менее 5 символов.';

  @override
  String get feedbackDescTooShort =>
      'Описание должно содержать не менее 10 символов.';

  @override
  String get feedbackEmailInvalid =>
      'Пожалуйста, введите действительный адрес электронной почты.';

  @override
  String get feedbackSubmitFailed =>
      'Не удалось отправить. Попробуйте ещё раз.';

  @override
  String get feedbackTileTitle => 'Сообщить об ошибке или предложить функцию';

  @override
  String get reportBug => 'Обратная связь';

  @override
  String get feedbackTileSubtitle => 'Помогите нам улучшить MCCompanion';

  @override
  String get friendsHowToStep1 =>
      'Откройте приложение Xbox на телефоне или консоли.';

  @override
  String get friendsHowToStep2 =>
      'Добавьте одного из ботов ниже в друзья на Xbox.';

  @override
  String get friendsHowToStep3 =>
      'Откройте Minecraft и перейдите на вкладку «Друзья».';

  @override
  String get friendsHowToStep4 =>
      'Найдите свой сервер в разделе «Локальные миры» и подключитесь.';

  @override
  String get friendsHowToNote =>
      '⚠️ Каждый раз, когда хотите играть, сначала запустите режим Друзья в приложении MCCompanion. После запуска приложение можно закрыть.';

  @override
  String get friendsBotLoadError =>
      '⚠️ Не удалось загрузить список ботов. Попробуйте позже.';

  @override
  String get regionEurope => 'Европа';

  @override
  String get regionUnitedStates => 'США';

  @override
  String get yourRegion => 'ВАШ РЕГИОН';

  @override
  String get botStatusOffline => 'Офлайн';

  @override
  String get botStatusFull => 'Полный';

  @override
  String botFriendCount(Object current, Object max) {
    return '$current / $max друзей';
  }

  @override
  String botCopied(Object gamertag) {
    return '$gamertag скопирован';
  }

  @override
  String get copyLabel => 'Копировать';

  @override
  String get skinSavedToDocuments => 'Скин сохранён в Документы';

  @override
  String get skinMenuExport => 'Экспорт';

  @override
  String get skinMenuDelete => 'Удалить';

  @override
  String get rpScreenTitle => 'Пакет ресурсов';

  @override
  String get rpWhatIsThis => 'Что это?';

  @override
  String get rpExplanation =>
      'Пакет ресурсов меняет внешний вид Minecraft на твоей консоли, новые блоки, цвета или звуки. Вставь ссылку на файл .mcpack ниже, включи его и сохрани. MCCompanion загружает его автоматически при каждом подключении.';

  @override
  String get rpPackUrlLabel => 'URL пакета';

  @override
  String get rpPackUrlHint => 'https://example.com/pack.mcpack';

  @override
  String get rpEnableToggle => 'Включить пакет ресурсов';

  @override
  String get rpWhatWorks => 'Что работает';

  @override
  String get rpSupportedBedrockOnly =>
      'Только Bedrock Edition (.mcpack или .zip)';

  @override
  String get rpSupportedBedrockOnlyHint =>
      'Пакеты Java не работают на консолях.';

  @override
  String get rpSupportedTexture => 'Пакеты ресурсов и текстур';

  @override
  String get rpSupportedTextureHint =>
      'Официально поддерживаются и работают надёжно.';

  @override
  String get rpUnsupportedShaders => 'Шейдеры, пакеты поведения, пакеты скинов';

  @override
  String get rpUnsupportedShadersHint =>
      'Они не будут загружаться на консолях через MCCompanion.';

  @override
  String get rpUnsupportedAddons => 'Дополнения и моды интерфейса';

  @override
  String get rpUnsupportedAddonsHint =>
      'Иногда могут работать, но официально не поддерживаются. Используйте на свой риск.';

  @override
  String get rpNoDiscord =>
      'Ссылки Discord: нет расширения .mcpack и истекают через несколько часов';

  @override
  String get rpNoDrive => 'Ссылки Google Drive / Dropbox: не прямые загрузки';

  @override
  String get rpNoEncrypted =>
      'Серверы с зашифрованными или защищёнными паролем пакетами';

  @override
  String get rpConsolePerformanceTitle => 'Производительность консоли';

  @override
  String get rpConsolePerformanceBody =>
      'Пакеты текстур высокого разрешения могут вызывать лаги или сбои на консолях. Если у вас возникают проблемы, переключитесь на пакет с более низким разрешением или выберите более лёгкий субпакет, если пакет поддерживает это.';

  @override
  String get rpWarnDiscord =>
      'Ссылки Discord истекают и перестают работать. Используйте постоянный хостинг.';

  @override
  String get rpWarnHttps => 'URL должен начинаться с https://';

  @override
  String get rpWarnExtension => 'URL должен заканчиваться на .mcpack или .zip';

  @override
  String get rpToastEnterUrl => 'Введите URL перед включением пакета ресурсов.';

  @override
  String get rpToastSaved => 'Настройки пакета ресурсов сохранены.';

  @override
  String get rpInvalidPackFormat =>
      'Это пак для Java Edition, он не поддерживается. Используйте ресурс-пак для Bedrock Edition.';

  @override
  String get rpBehaviorContentWarning =>
      'Этот пак содержит данные пакета поведения, которые не работают на серверах. Текстуры при этом будут работать.';

  @override
  String get rpClearMinecraftTitle => 'Первый раз с этим пакетом?';

  @override
  String get rpClearMinecraftBody =>
      'Minecraft кэширует пакеты ресурсов локально. Если вы подключались к этому серверу до включения пакета MCCompanion, Minecraft уже кэшировал оригинальный пакет и не будет повторно загружать объединённую версию.';

  @override
  String get rpClearStep1 =>
      'Открой Minecraft на консоли и перейди в Настройки → Хранилище';

  @override
  String get rpClearStep2 =>
      'Нажми «Очистить» рядом с Пакеты ресурсов: это удалит все кэшированные паки';

  @override
  String get rpClearStep3 =>
      'Подключись через MCCompanion: объединённый пак скачается автоматически';

  @override
  String get rpRelayTitle => 'Пакет выглядит неправильно?';

  @override
  String get rpRelayBody =>
      'Relay кэширует объединённый пак на 1 час, используя URL overlay как ключ. Чтобы принудительно обновить: немного измени URL пака (например, добавь ?v=2) и сохрани. После этого также очисти кэш паков в Minecraft, объединённый пак по-прежнему использует UUID сервера, поэтому Minecraft иначе покажет старую кэшированную версию.';

  @override
  String get rpWorksGithubHint => 'Прямая ссылка: всегда доступна';

  @override
  String get rpWorksCloudflareHint => 'Публичное облако: быстро и надёжно';

  @override
  String get rpWorksDirectHint =>
      'Любой публичный HTTPS-адрес .mcpack или .zip';

  @override
  String get rpNoDiscordHint =>
      'Ссылки Discord CDN истекают через короткое время';

  @override
  String get rpNoDriveHint =>
      'Нет прямой загрузки: перенаправляет на страницу предпросмотра';

  @override
  String get rpNoEncryptedHint =>
      'MCCompanion не может объединить зашифрованный пак';

  @override
  String get rpClearWhy =>
      'Minecraft кэширует пакеты ресурсов по их UUID. Объединённый пак сохраняет оригинальный UUID сервера, если Minecraft уже закэшировал серверный пак из предыдущей сессии (до включения MCCompanion), он не скачает новую версию. Очисти кэш, чтобы Minecraft загрузил свежий пак.';

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
  String get rpMergerTitle => 'Слияние RP';

  @override
  String get rpMergerSubtitle => 'Объединить до 4 ресурс-паков';

  @override
  String get rpMergerPriorityHint =>
      'Верхний пак имеет наивысший приоритет: его файлы побеждают в конфликтах.';

  @override
  String get rpMergerTopBadge => 'ТОП';

  @override
  String get rpMergerAddPacks => 'Добавить ресурс-паки';

  @override
  String rpMergerAddAnother(int current) {
    return 'Добавить ещё пак ($current/4)';
  }

  @override
  String get rpMergerFileTypes => '.zip или .mcpack';

  @override
  String get rpMergerMerging => 'Слияние…';

  @override
  String rpMergerButton(int count) {
    return 'Объединить $count пака';
  }

  @override
  String get rpMergerComplete => 'Слияние завершено!';

  @override
  String rpMergerConflicts(int count) {
    return 'Разрешено конфликтов: $count: победил верхний пак.';
  }

  @override
  String get rpMergerSetActive => 'Сделать активным ресурс-паком';

  @override
  String get rpMergerSetActiveToast => 'Установлен как активный ресурс-пак';

  @override
  String get rpMergerOpenButton => 'Объединить ресурс-паки';

  @override
  String get rpMergerOpenSubtitle => 'Объедините 2–4 пака в один';

  @override
  String get rpDisabled => 'Отключено';

  @override
  String get rpNoPackSelected => 'Пакет ресурсов не выбран';

  @override
  String get rpActiveOnConnect => 'Активен: применяется при подключении';

  @override
  String get rpBrowseSubtitle => 'Подборка паков, готовых к использованию';

  @override
  String get rpBrowseEmpty => 'Пока нет доступных паков';

  @override
  String get rpBrowseEmptyHint => 'Загляните позже для подобранных паков.';

  @override
  String get rpReplaceFile => 'Заменить другим файлом';

  @override
  String get rpDropToUpload => 'Бросьте для загрузки';

  @override
  String get rpTabBrowseInfo =>
      'Просматривайте паки, подобранные MCCompanion. Нажмите Использовать, чтобы мгновенно активировать пак, без загрузки и ссылок.';

  @override
  String get rpTabUploadInfo =>
      'Загрузите собственный файл .mcpack или .zip. MCCompanion безопасно хранит его в облаке и отправляет на консоль при каждом подключении.';

  @override
  String get rpTabUrlInfo =>
      'Вставьте прямую ссылку на скачивание файла .mcpack или .zip. URL должен быть общедоступным, без ссылок Discord или Google Drive.';

  @override
  String get rpTabMergeInfo =>
      'Объедините от 2 до 4 паков в один. Объединённый пак загружается в MCCompanion Cloud и активируется автоматически.';

  @override
  String get shareLabel => 'Поделиться';

  @override
  String get sectionMinecraftAccounts => 'Аккаунты Minecraft';

  @override
  String get sectionSettings => 'Настройки';

  @override
  String get avatarUpdated => 'Аватар обновлён';

  @override
  String get uploadFailed => 'Ошибка загрузки';

  @override
  String get profileLinkCopied => 'Ссылка на профиль скопирована!';

  @override
  String get shareProfileTooltip => 'Поделиться профилем';

  @override
  String get profileFallbackTitle => 'Профиль';

  @override
  String get noUsersFound => 'Пользователи не найдены';

  @override
  String get skinLabel => 'СКИН';

  @override
  String get skinsLabel => 'СКИНЫ';

  @override
  String get javaEditionBadge => 'Java';

  @override
  String get bedrockEditionBadge => 'Bedrock';

  @override
  String get downloadLabel => 'Скачать';

  @override
  String get justNow => 'Только что';

  @override
  String minutesAgo(int count) {
    return '$countм назад';
  }

  @override
  String hoursAgo(int count) {
    return '$countч назад';
  }

  @override
  String daysAgo(int count) {
    return '$countд назад';
  }

  @override
  String get rpPackInfo => 'Инфо';

  @override
  String get rpUseThisPack => 'Использовать пак';

  @override
  String get rpViewOnWebsite => 'Открыть на сайте →';

  @override
  String rpDownloads(int count) {
    return '$count загрузок';
  }

  @override
  String get rpPackDetailTitle => 'Детали пака';

  @override
  String get skinsSavedToMySkins => 'Сохранено в Мои скины';

  @override
  String get skinsDownloadFailed => 'Ошибка загрузки';

  @override
  String get skinsDeletedFromCloud => 'Удалено из облака';

  @override
  String get skinsDeleteFailed => 'Ошибка удаления';

  @override
  String get skinsLoginToUpload => 'Войдите, чтобы загружать скины';

  @override
  String get skinsUploading => 'Загрузка…';

  @override
  String get skinUploaded => 'Скин загружен!';

  @override
  String skinUploadFailed(String error) {
    return 'Ошибка загрузки: $error';
  }

  @override
  String get skinsTabSkins => 'Скины';

  @override
  String get skinsTabRecent => 'Недавние';

  @override
  String get skinsEmptyCloudSkins =>
      'Облачных скинов пока нет. Загрузите скин, чтобы увидеть его здесь.';

  @override
  String get skinsEmptyLocalSkins =>
      'Скинов пока нет. Создайте или загрузите скин, чтобы начать.';

  @override
  String get skinUploadToWebsite => 'Загрузить на сайт';

  @override
  String get skinReuploadToWebsite => 'Перезагрузить на сайт';

  @override
  String get skinCloudEdit => 'Редактировать';

  @override
  String get skinCloudSaveToDevice => 'Сохранить на устройство';

  @override
  String get skinCloudDelete => 'Удалить из облака';

  @override
  String get skinsTabGallery => 'Галерея';

  @override
  String get skinsGalleryEmpty => 'Скинов сообщества пока нет.';

  @override
  String get skinsTopLabel => 'Топ 30';

  @override
  String get skinsAllLabel => 'Все скины';

  @override
  String get skinUploadToCloud => 'Загрузить в облако';

  @override
  String get skinSaveDialog => 'Сохранить скин';

  @override
  String get skinNameHint => 'Название скина';

  @override
  String get skinDefaultName => 'Мой скин';

  @override
  String get skinUpdatedInCloud => 'Скин обновлён в облаке';

  @override
  String skinByCreator(String name) {
    return 'от $name';
  }

  @override
  String skinLikesCount(int count) {
    return '$count лайков';
  }

  @override
  String get sectionRecentActivity => 'Последняя активность';

  @override
  String get activityNoEvents => 'Нет последней активности.';

  @override
  String get activitySkinUploaded => 'Скин загружен';

  @override
  String get activitySkinLiked => 'Скин понравился';

  @override
  String get activityPackSubmitted => 'Пак отправлен';

  @override
  String get activityPackApproved => 'Пак одобрен';

  @override
  String get activityPackRejected => 'Пак не одобрен';

  @override
  String get timeJustNow => 'только что';

  @override
  String timeMinutesAgo(int count) {
    return '$count мин. назад';
  }

  @override
  String timeHoursAgo(int count) {
    return '$count ч. назад';
  }

  @override
  String timeDaysAgo(int count) {
    return '$count дн. назад';
  }

  @override
  String timeMonthsAgo(int count) {
    return '$count мес. назад';
  }

  @override
  String get sectionNotifications => 'Уведомления';

  @override
  String get sectionNotificationTypes => 'Типы уведомлений';

  @override
  String get notifMarkAllRead => 'Отметить всё как прочитанное';

  @override
  String get notifEmpty =>
      'Нет уведомлений. Лайки, комментарии и активность друзей появятся здесь.';

  @override
  String get notifSomeone => 'Кто-то';

  @override
  String notifSkinLiked(String actor) {
    return '$actor понравился ваш скин';
  }

  @override
  String notifCommentReceived(String actor) {
    return '$actor прокомментировал ваш скин';
  }

  @override
  String get notifPackApproved => 'Пак одобрен';

  @override
  String get notifPackRejected => 'Пак не одобрен';

  @override
  String notifFriendRequest(String actor) {
    return '$actor отправил вам запрос в друзья';
  }

  @override
  String notifFriendAccepted(String actor) {
    return '$actor принял ваш запрос';
  }

  @override
  String notifMessageReceived(String actor) {
    return 'Новое сообщение от $actor';
  }

  @override
  String get notifPrefSkinLiked => 'Скин понравился';

  @override
  String get notifPrefCommentReceived => 'Получен комментарий';

  @override
  String get notifPrefPackApproved => 'Пак одобрен';

  @override
  String get notifPrefPackRejected => 'Пак отклонён';

  @override
  String get notifPrefFriendRequest => 'Запрос в друзья';

  @override
  String get notifPrefFriendAccepted => 'Друг добавлен';

  @override
  String get notifPrefMessageReceived => 'Новое сообщение';

  @override
  String get commentsTitle => 'Комментарии';

  @override
  String get commentsEmpty => 'Комментариев пока нет. Будьте первым!';

  @override
  String get commentsPlaceholder => 'Написать комментарий…';

  @override
  String get loadMore => 'Загрузить ещё';

  @override
  String get skinLayerInner => 'Внутренний';

  @override
  String get skinLayerOuter => 'Внешний';

  @override
  String get feedbackLoginRequiredTitle => 'Войдите, чтобы отправить отзыв';

  @override
  String get feedbackLoginRequiredBody =>
      'Отзывы привязаны к вашему аккаунту MCCompanion, чтобы мы могли ответить вам прямо в приложении.';

  @override
  String get feedbackLoginButton => 'Войти';

  @override
  String get supportInboxTitle => 'Входящие поддержки';

  @override
  String get supportInboxSubtitle =>
      'Все обращения в поддержку, доступны всем админам';

  @override
  String get adminBadge => 'Админ';

  @override
  String get skinShareSubject => 'Скин Minecraft';

  @override
  String get skinEditorTitle => 'Редактор скинов';

  @override
  String get skinToolUndo => 'Отменить';

  @override
  String get skinSaveToMySkins => 'Сохранить в мои скины';

  @override
  String get skinUpdateInCloud => 'Обновить в облаке';

  @override
  String get skinExportPng => 'Экспорт PNG';

  @override
  String get skinToolDraw => 'Рисовать';

  @override
  String get skinToolFill => 'Заливка';

  @override
  String get skinToolErase => 'Стереть';

  @override
  String get customColour => 'Свой цвет';

  @override
  String get featuredServerLabel => 'ИЗБРАННЫЙ СЕРВЕР';

  @override
  String get featuredServerTagline => 'Заходи и играй.';

  @override
  String get featuredServerPlay => 'Играть';

  @override
  String rpUploadFailedCode(int code) {
    return 'Не удалось загрузить ($code)';
  }

  @override
  String rpUploadFailed(String error) {
    return 'Не удалось загрузить: $error';
  }

  @override
  String get rpLoadFailed => 'Не удалось загрузить паки';

  @override
  String get rpRetry => 'Повторить';

  @override
  String get rpSearchHint => 'Поиск паков…';

  @override
  String rpMergeFailed(String error) {
    return 'Не удалось объединить: $error';
  }

  @override
  String get rpMergerSize => 'Размер';

  @override
  String get rpMergerCreated => 'Создано';

  @override
  String get rpMergerSourcePacks => 'Исходные паки';

  @override
  String get rpMergerDropToAdd => 'Отпустите, чтобы добавить';

  @override
  String get rpMergerSavedMerges => 'Сохранённые объединения';

  @override
  String get rpMergerUse => 'Использовать';

  @override
  String get supportInboxShared => 'Доступно всем админам';

  @override
  String get supportInboxEmpty => 'Обращений в поддержку пока нет';

  @override
  String get supportReplyingAs => 'Вы отвечаете как MCCompanion Support';

  @override
  String get supportReplyHint => 'Ответить от имени поддержки…';

  @override
  String get relayBlocked =>
      'Ваш IP или аккаунт заблокирован MCCompanion. Если это ошибка, загляните в наш Discord.';

  @override
  String relayBlockedWithReason(String reason) {
    return 'Ваш IP или аккаунт заблокирован MCCompanion.\nПричина: $reason\nЕсли это ошибка, загляните в наш Discord.';
  }

  @override
  String relayConfigFailed(int code) {
    return 'Не удалось настроить релей (статус $code). Попробуйте другой релей или загляните в наш Discord.';
  }

  @override
  String relayConfigFailedDetail(int code, String detail) {
    return 'Не удалось настроить релей (статус $code): $detail. Попробуйте другой релей или загляните в наш Discord.';
  }

  @override
  String get relayTimeout => 'Релей не ответил вовремя.';

  @override
  String get relayUnreachable => 'Не удалось связаться с релеем.';

  @override
  String get lookupNotFound => 'Игрок не найден.';

  @override
  String get lookupNetworkError => 'Ошибка сети. Попробуйте ещё раз.';

  @override
  String get lookupBedrockUnavailable => 'Поиск Bedrock сейчас недоступен.';

  @override
  String get lookupFailed => 'Не удалось выполнить поиск.';

  @override
  String get myFeedbackTitle => 'Мои отзывы';

  @override
  String get myFeedbackEmpty => 'Вы пока ничего нам не отправляли.';

  @override
  String get myFeedbackOpenList => 'Мои отзывы';

  @override
  String get fbStatusOpen => 'Открыт';

  @override
  String get fbStatusPlanned => 'Запланировано';

  @override
  String get fbStatusInProgress => 'В работе';

  @override
  String get fbStatusImplemented => 'Готово';

  @override
  String get fbStatusNotPlanned => 'Не планируется';

  @override
  String get fbStatusDuplicate => 'Дубликат';

  @override
  String get fbNoReplies => 'Ответа пока нет. Мы напишем здесь.';

  @override
  String get fbReplyHint => 'Добавить что-то к этому сообщению…';

  @override
  String get fbFromTeam => 'MCCompanion';

  @override
  String get fbFromYou => 'Вы';

  @override
  String get feedbackGoesToTeam => 'Отправляется прямо команде';

  @override
  String get notifFeedbackStatus => 'Обновление по вашему отзыву';

  @override
  String get notifFeedbackReply => 'Ответ на ваш отзыв';

  @override
  String get adminTicketsHeader => 'Сообщения и запросы';

  @override
  String get adminTicketReplyHint => 'Ответить по этому обращению…';

  @override
  String get adminNoTicketsForUser => 'У этого пользователя нет обращений';

  @override
  String get undo => 'Отменить';

  @override
  String get chooseServerTitle => 'Выберите сервер';

  @override
  String get changeLabel => 'Изменить';

  @override
  String get howToAutoShow => 'Показывать это при запуске';

  @override
  String get skinEditorLoadFailed =>
      'Не удалось загрузить этот скин. Начнём со стандартного.';

  @override
  String get skinToolRecolour => 'Перекрасить';

  @override
  String get skinToolPick => 'Пипетка';

  @override
  String get skinBases => 'Основы';

  @override
  String get skinBasesTitle => 'Начать с основы';

  @override
  String get skinBasesSubtitle =>
      'Это заменит текущий рисунок. Отмена вернёт его.';

  @override
  String get skinMirror => 'Зеркало';

  @override
  String get skinSurprise => 'Сюрприз';

  @override
  String get skinToolFillHint => 'Заливает область, по которой вы нажали';

  @override
  String get skinToolRecolourHint => 'Меняет этот цвет по всему скину';

  @override
  String get skinToolPickHint => 'Берёт цвет, по которому вы нажали';

  @override
  String get skinModelClassic => 'Широкие';

  @override
  String get skinModelSlim => 'Тонкие';

  @override
  String get shareServerLabel => 'Показывать сервер';

  @override
  String get shareServerOn => 'Друзья видят, на каком вы сервере';

  @override
  String get shareServerOff => 'Друзья видят, что вы играете, но не где';

  @override
  String get makeDefaultServer => 'Сделать сервером по умолчанию';

  @override
  String get isDefaultServer => 'Открывается по умолчанию';

  @override
  String defaultServerSet(String name) {
    return '$name будет открываться по умолчанию';
  }

  @override
  String get labelDirect => 'Прокси/прямое подключение';

  @override
  String get startDirectMode => 'Запустить режим прокси/прямого подключения';

  @override
  String get howToDirectTitle => 'Режим прокси/прямого подключения';

  @override
  String get howToDirectSubtitle => 'Игра без обращения к нашим серверам';

  @override
  String get howToDirectBody =>
      'Режим прокси/прямого подключения: соединением служит само устройство.\n1. Убедитесь, что устройство с MCCompanion и консоль находятся в одной локальной сети.\n2. Введите адрес и порт сервера Bedrock и нажмите \"Запустить режим прокси/прямого подключения\".\n3. На консоли откройте Minecraft → Играть → вкладка Друзья и обновите список.\n4. Выберите сервер локальной сети с именем \"MCCompanion\", чтобы подключиться.\n\nЗачем нужен этот режим:\n- Ничего не проходит через серверы MCCompanion. Устройство передаёт трафик самостоятельно, поэтому режим работает даже тогда, когда наши ретрансляторы недоступны.\n- Вход в аккаунт не требуется.\n\nУчтите:\n- Приложение должно оставаться открытым на экране в течение всей сессии. Если закрыть его или перейти в другое приложение, соединение прервётся.\n- Только серверы Bedrock. Для серверов Java используйте режим Java: перевод протокола выполняется на нашей стороне.\n- Расход батареи выше, чем в остальных режимах.\n- Наборы ресурсов не применяются. Они проходят через наш релей, который этот режим пропускает.';

  @override
  String directHostNotFound(String host) {
    return 'Не удалось найти $host. Проверьте адрес и попробуйте снова.';
  }

  @override
  String get directPortBusy =>
      'Не удалось открыть локальный порт. Сначала остановите текущее подключение.';

  @override
  String get directServerOfflineTitle => 'Сервер не отвечает';

  @override
  String directServerOfflineBody(String target) {
    return '$target не ответил. Возможно, он offline или просто не отвечает на пинги. Вы всё равно можете запустить туннель.';
  }

  @override
  String get directStartAnyway => 'Всё равно запустить';

  @override
  String get directNoResourcePack =>
      'Наборы ресурсов не работают в режиме прокси/прямого подключения.';

  @override
  String directAddressNotSupported(String host) {
    return '$host — это адрес IPv6. Режим прокси/прямого подключения поддерживает только IPv4. Используйте адрес IPv4 или имя хоста.';
  }

  @override
  String termsAgreement(String terms, String privacy) {
    return 'Я принимаю $terms и $privacy.';
  }

  @override
  String get verifyEmailTitle => 'Подтвердите почту';

  @override
  String get verifyEmailBody =>
      'Нужно, чтобы комментировать, загружать скины и отправлять паки.';

  @override
  String get verifyEmailSent => 'Отправлено, проверьте почту.';

  @override
  String get verifyEmailSending => 'Отправка…';

  @override
  String get verifyEmailSend => 'Отправить ссылку';

  @override
  String updateAvailableTitle(Object version) {
    return 'Доступна версия $version';
  }

  @override
  String updateAvailableBody(Object current) {
    return 'У вас $current. Эта сборка не обновляется сама.';
  }

  @override
  String get updateAvailableAction => 'Скачать';

  @override
  String get updateAvailableDismiss => 'Не сейчас';

  @override
  String get serverListSearchHint => 'Поиск по названию или адресу';

  @override
  String get serverListEditionAny => 'Java и Bedrock';

  @override
  String get serverListEditionJava => 'Только Java';

  @override
  String get serverListEditionBedrock => 'Только Bedrock';

  @override
  String get serverListSortVotes => 'Больше всего голосов';

  @override
  String get serverListSortPlayers => 'Больше всего игроков';

  @override
  String get serverListSortPeak => 'Наибольший пик';

  @override
  String get serverListSortNewest => 'Новые';

  @override
  String get serverListSortName => 'Название';

  @override
  String get serverListAllCategories => 'Все';

  @override
  String get serverListLoadFailed => 'Не удалось загрузить список серверов';

  @override
  String get serverListLoadFailedHint => 'Потяните вниз, чтобы повторить';

  @override
  String get serverListNoMatch => 'Подходящих серверов нет';

  @override
  String get serverListNoMatchHint => 'Попробуйте другой запрос или категорию';

  @override
  String get serverCardPlay => 'Играть';

  @override
  String get serverCardVote => 'Голосовать';

  @override
  String get serverCardViewServer => 'Открыть сервер';

  @override
  String get serverCopyIp => 'Копировать IP';

  @override
  String get serverCopied => 'Скопировано';

  @override
  String get serverStatPlayers => 'Игроки';

  @override
  String get serverStatPeak => 'Пик';

  @override
  String get serverStatUptime => 'Аптайм';

  @override
  String get serverStatVotesMonth => 'Голоса за месяц';

  @override
  String get serverStatVotesAllTime => 'Голоса за всё время';

  @override
  String get serverBadgeFeatured => 'Рекомендуемый';

  @override
  String get serverEditionJava => 'Java';

  @override
  String get serverEditionBedrock => 'Bedrock';

  @override
  String get serverEditionCrossplay => 'Кроссплей';

  @override
  String get serverSectionMotd => 'Сообщение дня';

  @override
  String get serverSectionAbout => 'Описание';

  @override
  String get serverSectionCategories => 'Категории';

  @override
  String get serverSectionVotes => 'Голоса';

  @override
  String get serverLinkDiscord => 'Discord';

  @override
  String get serverLinkWebsite => 'Сайт';

  @override
  String get serverVotesThisMonth => 'За этот месяц';

  @override
  String get serverVotesAllTime => 'За всё время';

  @override
  String get serverVoteAction => 'Голосовать за этот сервер';

  @override
  String get serverPlayAction => 'Играть на этом сервере';

  @override
  String get serverVoteSignInRequired =>
      'Войдите, чтобы голосовать из приложения.';

  @override
  String serverVoteSheetTitle(String name) {
    return 'Голосовать за $name';
  }

  @override
  String get serverVoteSheetSubtitle =>
      'Ваш ник в Minecraft, чтобы сервер знал, кого наградить.';

  @override
  String get serverVoteSheetHint => 'Steve';

  @override
  String get serverVoteSheetButton => 'Голосовать';

  @override
  String get serverVoteSheetLimit => 'Один голос за сервер в день.';

  @override
  String get serverVoteDelivered => 'Голос учтён. Награда уже в пути.';

  @override
  String get serverVoteNoRewards =>
      'Голос учтён. На этом сервере не настроены награды.';

  @override
  String get serverVoteFailed => 'Не получилось, попробуйте ещё раз.';

  @override
  String get serverVoteOffline =>
      'Не удалось связаться с сервером. Проверьте подключение.';

  @override
  String get feedbackViewYourReport => 'Открыть ваше сообщение';
}
