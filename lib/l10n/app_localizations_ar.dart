// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'MCCompanion';

  @override
  String get console => 'وحدة التحكم';

  @override
  String get consoleOutput => 'مخرجات وحدة التحكم';

  @override
  String get noLogsYet => 'لا توجد سجلات بعد';

  @override
  String get startBroadcastingToSeeOutput => 'ابدأ البث لرؤية المخرجات';

  @override
  String get close => 'إغلاق';

  @override
  String get ok => 'OK';

  @override
  String get back => 'رجوع';

  @override
  String get next => 'التالي';

  @override
  String get done => 'تم';

  @override
  String get none => 'لا شيء';

  @override
  String get onboardingThemeTitle => 'اختر ثيمًا';

  @override
  String get onboardingThemeSubtitle => 'يمكنك ضبط كل لون في الإعدادات لاحقًا.';

  @override
  String get onboardingNavTitle => 'وصول سريع';

  @override
  String get onboardingNavSubtitle => 'اختر ميزتين لشريط التنقل.';

  @override
  String get onboardingNavLeftLabel => 'الزر الأيسر';

  @override
  String get onboardingNavRightLabel => 'الزر الأيمن';

  @override
  String get onboardingNavPreviewHome => 'الرئيسية';

  @override
  String get onboardingNavPreviewConnector => 'الاتصال';

  @override
  String get onboardingNavPreviewProfile => 'الملف الشخصي';

  @override
  String get onboardingNavPreviewEmpty => 'فارغ';

  @override
  String get onboardingStartTitle => 'صفحة البداية';

  @override
  String get onboardingStartSubtitle => 'يفتح التطبيق هنا في كل مرة.';

  @override
  String get onboardingCustomizeDetail => 'تخصيص بالتفصيل ←';

  @override
  String get startPageHome => 'الرئيسية';

  @override
  String get startPageHomeSubtitle => 'عرض الشاشة الرئيسية مع البلاطات';

  @override
  String get startPageFeature => 'ميزة';

  @override
  String get startPageFeatureSubtitle => 'الفتح مباشرة على صفحة محددة';

  @override
  String get startPageSectionLabel => 'صفحة البداية';

  @override
  String get joinUs => 'انضم إلينا';

  @override
  String get more => 'المزيد';

  @override
  String get website => 'الموقع الإلكتروني';

  @override
  String get howToUseMenu => 'طريقة الاستخدام';

  @override
  String get support => 'الدعم';

  @override
  String helpText(Object appCreator) {
    return 'تم الإنشاء بواسطة $appCreator.\r\n\r\nطريقة الاستخدام:\r\n1. أدخل عنوان خادم Minecraft والمنفذ الخاص بك (الافتراضي: 19132)\r\n   — أو اختر خادمًا محفوظًا مسبقًا من القائمة المنسدلة\r\n2. (اختياري) اختر خادم ترحيل (EU أو US) الأقرب إلى موقعك\r\n3. اضغط على \\\"بدء البث\\\" للبدء\r\n4. على جهازك/وحدة التحكم: Minecraft > لعب > الأصدقاء\r\n5. يجب أن ترى خادم شبكة محلية باسم \\\"MCCompanion\\\"\r\n6. اضغط عليه للانضمام إلى خادمك الخارجي عبر MCCompanion\r\n\r\nNintendo Switch (وضع DNS):\r\n1. فعّل \\\"Nintendo Switch\\\" في لوحة الاتصال\r\n2. اختر خادم ترحيل (EU أو US)\r\n3. اضغط على \\\"إرسال إعداد DNS\\\" — سيؤدي ذلك إلى إرسال إعداداتك إلى خادم الترحيل\r\n   (لن يقوم ببث خادم شبكة محلية)\r\n4. على جهاز Switch الخاص بك، طبّق إعدادات DNS الخاصة بـ MCCompanion وانضم\r\n   باستخدام إدخال الخادم الذي تستخدمه مع MCCompanion\r\n\r\nملاحظات:\r\n- لكي يعمل بث الشبكة المحلية، يجب أن يكون MCCompanion ووحدة التحكم على نفس الشبكة المحلية.\r\n- نصيحة: اختر خادم الترحيل الأقرب إليك للحصول على أفضل أداء.';
  }

  @override
  String get serverDetailsLabel => 'تفاصيل الخادم';

  @override
  String get start => 'ابدأ';

  @override
  String get stop => 'إيقاف';

  @override
  String get labelJava => 'Java';

  @override
  String get startJavaMode => 'ابدأ وضع Java';

  @override
  String get javaInfoTitle => 'وضع Java';

  @override
  String get javaInfoText => 'اتصل بخوادم Java Edition';

  @override
  String get howToJavaTitle => 'وضع Java';

  @override
  String get howToJavaSubtitle => 'اتصل بخوادم Java Edition عبر MCCompanion';

  @override
  String get aternosSubtext => 'أنشئ خادم ماينكرافت مجاني خاص بك';

  @override
  String get howToJavaBody => 'وضع Java — خطوات سريعة:\n1. في التطبيق، اختر وضع Java.\n2. أدخل عنوان خادم Java Edition والمنفذ (الافتراضي: 25565).\n3. اضغط على \"ابدأ وضع Java\" — سيقوم MCCompanion بربط الاتصال.\n4. افتح Minecraft Bedrock وانتقل إلى علامة تبويب الأصدقاء.\n5. اختر خادم LAN المسمى \"MCCompanion\" للانضمام إلى خادم Java.\n\n⚠️ تحذيرات مهمة:\n- يلزم وجود حساب Java Edition صالح (Microsoft).\n- تستخدم بعض الخوادم أنظمة مكافحة الغش وقد تكتشف حسابك وتحظره.\n- بعض الخوادم تحظر عملاء Bedrock صراحةً — تحقق دائمًا من قواعد الخادم.\n- MCCompanion غير مسؤول عن أي حظر أو تعليق أو أي مشكلات أخرى متعلقة بالحساب قد تنتج عن استخدام هذه الميزة.\n- استخدمها على مسؤوليتك الخاصة.';

  @override
  String get language => 'العربية';

  @override
  String get discord => 'Discord';

  @override
  String get toggleDebug => 'تبديل التصحيح';

  @override
  String get copyLogs => 'نسخ السجلات';

  @override
  String get clear => 'مسح';

  @override
  String get cancel => 'إلغاء';

  @override
  String get deleteServer => 'حذف الخادم';

  @override
  String get delete => 'حذف';

  @override
  String get myServers => 'خوادمي';

  @override
  String get quickAccessServers => 'خوادم الوصول السريع';

  @override
  String get addServer => 'إضافة خادم';

  @override
  String get addServersHint => 'أضف خوادم للاتصال السريع لاحقًا';

  @override
  String get serverNameLabel => 'اسم الخادم *';

  @override
  String get addressLabel => 'العنوان *';

  @override
  String get portLabel => 'المنفذ *';

  @override
  String get descriptionLabel => 'الوصف (اختياري)';

  @override
  String get save => 'حفظ';

  @override
  String get initializing => 'جارٍ التهيئة...';

  @override
  String get createdBy => 'تم الإنشاء بواسطة NetherDev';

  @override
  String get bedrockBridge => 'جسر Bedrock';

  @override
  String get clientDisconnected => 'تم فصل العميل — تم إيقاف البث';

  @override
  String get pleaseEnterServer => '⚠️ يرجى إدخال عنوان الخادم';

  @override
  String get invalidPort => '⚠️ رقم منفذ غير صالح (1-65535)';

  @override
  String get dnsConfigSent => '✅ تم إرسال إعداد DNS إلى خادم الترحيل';

  @override
  String get broadcastingStarted => 'تم بدء البث';

  @override
  String get broadcastStopped => 'تم إيقاف البث';

  @override
  String selectedServer(Object name) {
    return '📋 المحدد: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'المحدد: $name';
  }

  @override
  String get noLogsToCopy => 'لا توجد سجلات لنسخها';

  @override
  String copiedLogs(Object count) {
    return 'تم نسخ $count من إدخالات السجل إلى الحافظة';
  }

  @override
  String get debugEnabled => 'تم تفعيل سجلات التصحيح';

  @override
  String get debugDisabled => 'تم تعطيل سجلات التصحيح';

  @override
  String get howToUseTitle => 'كيفية استخدام MCCompanion';

  @override
  String get iUnderstand => 'أنا أفهم';

  @override
  String get playOnSwitchTitle => 'اللعب على Nintendo Switch';

  @override
  String get playWithFriendsTitle => 'اللعب مع الأصدقاء';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'المحدد: $relayName\r\n\r\nكيفية الاتصال:\r\n1. انتقل إلى إعدادات Switch الخاصة بك وغيّر DNS إلى: $relayIp\r\n2. افتح Minecraft واختر خادمًا من القائمة (مثل Cubecraft أو Hive).\r\n3. سيتم الآن توجيهك تلقائيًا إلى خادمك الخاص.';
  }

  @override
  String playInstructionsFriends(Object friend) {
    return 'كيفية الاتصال:\r\n1. على وحدة التحكم الخاصة بك، أضف $friend كصديق.\r\n2. افتح Minecraft وانتقل إلى تبويب Friends.\r\n3. ابحث عن خادمك ضمن LAN Worlds وحدده للانضمام.';
  }

  @override
  String get nldServerLabel => 'خادم MCCompanion';

  @override
  String selectRelayLabel(Object name) {
    return 'اختر خادم الترحيل $name';
  }

  @override
  String get noSavedServers => 'لا توجد خوادم محفوظة';

  @override
  String get savedServers => 'الخوادم المحفوظة';

  @override
  String get serverAddressHint => 'عنوان الخادم';

  @override
  String get portHint => 'المنفذ';

  @override
  String get manageServers => 'إدارة الخوادم';

  @override
  String get manageServersTooltip => 'إدارة الخوادم';

  @override
  String get noServerYet => 'لا توجد خوادم محفوظة بعد.\nاضغط على إدارة لإضافة خادم.';

  @override
  String get serverNotSelected => 'لم يتم تحديد خادم';

  @override
  String get ready => 'جاهز';

  @override
  String get active => 'نشط';

  @override
  String get vpnDetected => 'تم اكتشاف VPN';

  @override
  String get noWifi => 'لست متصلاً بشبكة Wi‑Fi';

  @override
  String get vpnActive => 'اكتشفنا أن الـ VPN لديك مفعّل.\n\nيرجى تعطيل الـ VPN قبل استخدام MCCompanion، وإلا فقد لا يصل بث LAN إلى جهازك.';

  @override
  String get mobileActive => 'تم الاكتشاف: بيانات الجوال\n\nيجب أن يكون MCCompanion على نفس الشبكة مثل جهازك. يرجى الاتصال بشبكة Wi‑Fi المنزلية أو نقطة الاتصال قبل المتابعة.';

  @override
  String get continueAnyway => 'المتابعة على أي حال';

  @override
  String get sameWifi => 'نفس شبكة Wi‑Fi';

  @override
  String get needSameWifi => 'يجب أن يكون الجهاز الذي يشغّل MCCompanion على نفس شبكة Wi‑Fi الخاصة بالجهاز الذي تلعب عليه Minecraft.';

  @override
  String get subscription => 'اشتراك عبر الإنترنت مطلوب';

  @override
  String get needSubscription => 'تحتاج كل منصة إلى اشتراكها النشط الخاص بها عبر الإنترنت (Xbox Live أو PS Plus أو NSO). بدون ذلك، لن يظهر MCCompanion.';

  @override
  String get updateAvailable => 'يتوفر تحديث';

  @override
  String get newVersion => 'يتوفر إصدار جديد من التطبيق.\nحدّث الآن للحصول على أحدث الميزات والإصلاحات.';

  @override
  String get later => 'لاحقًا';

  @override
  String get updateNow => 'حدّث الآن';

  @override
  String get beforeYouStart => 'قبل أن تبدأ';

  @override
  String get stopBroadcasting => 'إيقاف البث';

  @override
  String get startNintendoMode => 'بدء وضع Nintendo';

  @override
  String get startFriendsMode => 'بدء وضع الأصدقاء';

  @override
  String get startBroadcasting => 'بدء البث';

  @override
  String get modeLabel => 'الوضع';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'الأصدقاء';

  @override
  String get nintendoInfoTitle => 'وضع DNS على Nintendo Switch';

  @override
  String get nintendoInfoText => 'ابدأ في وضع Nintendo، واضبط DNS ثم انضم إلى خادم مميز.';

  @override
  String get friendModeTitle => 'وضع الأصدقاء';

  @override
  String get friendModeText => 'أضف روبوتات أصدقاء MCCompanion كأصدقاء. ابدأ وضع الأصدقاء وابدأ اللعب';

  @override
  String get selectedRelayCheck => 'المحدد';

  @override
  String relayFallbackWarning(Object name) {
    return 'تحذير: لم يستجب Relay الأصلي. يتم استخدام Relay احتياطي: $name';
  }

  @override
  String get relayUnableConnect => 'تعذر الاتصال بأي خادم Relay تابع لـ MCCompanion. حاول مرة أخرى لاحقًا أو تحقق من اتصالك بالإنترنت.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (شبكة محلية / وكيل)';

  @override
  String get howToXboxSubtitle => 'العب عبر بث الشبكة المحلية أو الوكيل';

  @override
  String get howToXboxBody => 'كيفية الاتصال (Xbox / PS4 / PS5):\r\n1. تأكد من أن الجهاز الذي يشغّل MCCompanion ووحدة التحكم الخاصة بك على نفس الشبكة المحلية.\r\n2. في التطبيق، أدخل عنوان خادم Minecraft والمنفذ ثم اضغط على \\\"بدء البث\\\".\r\n3. على وحدة التحكم افتح Minecraft → لعب → وابحث عن عوالم الشبكة المحلية أو تبويب الأصدقاء ثم حدّث القائمة.\r\n4. اختر خادم الشبكة المحلية المسمى \\\"MCCompanion\\\" للانضمام.\r\nملاحظات:\r\n- إذا لم يظهر الخادم، فتأكد من أن الجهازين على نفس الشبكة الفرعية وأن التطبيق ما يزال يبث.\r\n- قد تمنع بعض طرازات وحدات التحكم أو أجهزة التوجيه اكتشاف الشبكة المحلية؛ جرّب تغيير إعدادات التطبيق أو جهاز التوجيه عند الحاجة.';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (وضع DNS)';

  @override
  String get howToNintendoSubtitle => 'تعليمات DNS لخادم الترحيل على Switch';

  @override
  String get howToNintendoBody => 'Nintendo Switch — وضع DNS (خطوة بخطوة):\r\n1. في التطبيق، فعّل وضع \\\"Nintendo\\\" واختر خادم ترحيل (EU أو US).\r\n2. اضغط على \\\"إرسال إعداد DNS\\\" لإرسال عنوان DNS IP إلى خادم الترحيل.\r\n3. على جهاز Nintendo Switch، انتقل إلى إعدادات النظام → الإنترنت → إعدادات الإنترنت → (شبكتك) → تغيير الإعدادات → DNS واضبط DNS الأساسي على عنوان IP الخاص بخادم الترحيل.\r\n4. افتح Minecraft وانضم إلى خادم عام؛ سيتم توجيهك إلى خادمك باستخدام DNS الخاص بخادم الترحيل.\r\nملاحظات:\r\n- وضع DNS لا يقوم ببث خادم شبكة محلية؛ بل يوجّه حركة مرور اللعبة عبر خادم الترحيل.\r\n- أعد DNS إلى وضعه السابق بعد الانتهاء إذا كنت بحاجة إلى سلوك شبكة طبيعي.';

  @override
  String get howToFriendsTitle => 'وضع الأصدقاء';

  @override
  String get howToFriendsSubtitle => 'ادعُ الأصدقاء وانضم عبر الشبكة المحلية';

  @override
  String get howToFriendsBody => 'وضع الأصدقاء — خطوات سريعة:\r\n1. أضف حساب صديق MCCompanion (صديق الترحيل) على وحدة التحكم أو المنصة إذا لزم الأمر.\r\n2. في التطبيق، فعّل وضع الأصدقاء وأرسل إعداد خادم الترحيل (إذا كان ذلك مطلوبًا).\r\n3. على وحدة التحكم، افتح Minecraft → الأصدقاء وابحث عن عوالم الشبكة المحلية — يجب أن يظهر خادمك هناك كعالم شبكة محلية.\r\n4. اختره للانضمام إلى خادمك مع الأصدقاء.\r\nملاحظات:\r\n- تأكد من أن لديك أنت وأصدقاؤك نفس إعدادات NAT/الإعدادات التي تسمح بظهور الأصدقاء.\r\n- يعتمد وضع الأصدقاء على ميزات الأصدقاء الخاصة بالمنصة وقد يتطلب قبول طلبات الصداقة.';

  @override
  String get helpMCCompanionTitle => 'MCCompanion لا يظهر';

  @override
  String get helpMCCompanionSubtitle => 'استكشاف مشكلات اكتشاف الشبكة المحلية وإصلاحها';

  @override
  String get helpMCCompanionBody => 'إذا لم يظهر الخادم على وحدة التحكم الخاصة بك، فجرّب هذه الخطوات:\r\n\r\n✅ فحوصات أساسية:\r\n1. نفس شبكة WiFi - يجب أن يكون هاتفك/جهازك اللوحي ووحدة التحكم على نفس شبكة WiFi\r\n2. عنوان الخادم الصحيح - تحقق مرة أخرى من IP والمنفذ (الافتراضي: 19132)\r\n3. البث نشط - تأكد من أن MCCompanion يعرض حالة \\\"جاري البث\\\"\r\n\r\n🔄 إصلاحات سريعة:\r\n• أعد تشغيل التطبيق: أوقف البث، أغلق MCCompanion بالكامل، أعد فتحه ثم حاول مرة أخرى\r\n• أعد تشغيل وحدة التحكم: أحيانًا تحتاج وحدة التحكم إلى تحديث لاكتشاف ألعاب الشبكة المحلية\r\n• تحقق من تبويب الأصدقاء/الشبكة المحلية: يظهر الخادم ضمن \\\"الأصدقاء\\\" أو \\\"ألعاب الشبكة المحلية\\\" وليس في قائمة الخوادم\r\n• انتظر من 10 إلى 15 ثانية بعد بدء البث\r\n• عطّل VPN: يمكن أن تمنع شبكات VPN البث المحلي\r\n\r\n⚠️ مشكلات شائعة:\r\n\\\"No route found for user\\\" → تأكد من أن كلا الجهازين على نفس شبكة Wi‑Fi (وتجنب شبكات الضيوف)\r\n\\\"Unable to connect to MCCompanion relay server\\\" → تحقق من الإنترنت / حالة خادم الترحيل\r\n\r\n📱 ما زلت تواجه مشاكل؟ فعّل وضع التصحيح في MCCompanion وافحص السجلات، أو جرّب خادمًا مختلفًا.';

  @override
  String get helpMultiplayerFailedTitle => 'فشل اتصال اللعب الجماعي';

  @override
  String get helpMultiplayerFailedSubtitle => 'شرح لماذا لا يعد هذا خطأ في MCCompanion';

  @override
  String get helpMultiplayerFailedBody => '⚠️ هذه ليست مشكلة في MCCompanion!\r\n\r\nلقد قام MCCompanion بإعادتك بنجاح إلى الخادم المطلوب. تشير رسالة \\\"فشل اتصال اللعب الجماعي\\\" إلى أن الخادم الهدف غير متاح حاليًا. الأسباب المحتملة:\r\n\r\n• خادم Minecraft الهدف غير متصل أو مثقل بالتحميل\r\n• يتطلب الخادم إصدار عميل محدثًا أو إصدارًا معينًا\r\n• توجد مشكلات في الشبكة بين Relay والخادم الهدف\r\n\r\nحاول الاتصال بخادم مختلف أو تواصل مع دعم الخادم. إذا استمرت المشكلة على عدة خوادم، فعّل وضع التصحيح في MCCompanion وافحص السجلات.';

  @override
  String get helpNintendoDnsTitle => 'DNS الخاص بـ Nintendo لا يعمل';

  @override
  String get helpNintendoDnsSubtitle => 'مشكلات DNS / خادم الترحيل الشائعة';

  @override
  String get helpNintendoDnsBody => 'إذا لم يعمل وضع DNS الخاص بـ Nintendo، فتحقق مما يلي:\r\n\r\n1. تأكد من أنك أرسلت إعداد DNS من التطبيق (إرسال إعداد DNS).\r\n2. تحقق من أنك طبّقت عنوان IP الخاص بخادم الترحيل كـ DNS أساسي على Switch.\r\n3. تأكد من أن خادم الترحيل المحدد (EU/US) متصل وغير مثقل بالتحميل.\r\n4. بعض الشبكات (مثل البوابات المقيدة) تمنع DNS المخصص — جرّب على شبكة مختلفة.\r\n\r\nإذا استمرت المشكلات، فعّل وضع التصحيح وافحص السجلات أو جرّب البديل وهو وضع الأصدقاء.';

  @override
  String get helpFriendsModeTitle => 'وضع الأصدقاء لا يعمل';

  @override
  String get helpFriendsModeSubtitle => 'مشكلات الأصدقاء الشائعة';

  @override
  String get helpFriendsModeBody => 'نصائح استكشاف أخطاء وضع الأصدقاء وإصلاحها:\r\n\r\n1. تأكد من إضافة/قبول حساب صديق Relay على وحدة التحكم (إذا لزم الأمر).\r\n2. جرّب إعادة تشغيل اللعبة وتحديث تبويب Friends/LAN بعد تفعيل وضع الأصدقاء.\r\n\r\nإذا كان الخادم لا يزال لا يظهر للأصدقاء، ففعّل وضع التصحيح وافحص السجلات لتحديد الأخطاء.';

  @override
  String get changeLanguageTitle => 'تغيير اللغة';

  @override
  String get changeLanguage => 'اللغة';

  @override
  String get useSystemLanguage => 'استخدام لغة النظام';

  @override
  String get couldNotOpenUrl => 'تعذر فتح الرابط';

  @override
  String get serverTrackerTitle => 'متتبع الخوادم';

  @override
  String get removeServerTitle => 'إزالة الخادم';

  @override
  String removeServerConfirm(Object name) {
    return 'هل تريد إزالة \"$name\" من متتبعك؟';
  }

  @override
  String get removeServerFailed => 'فشل في إزالة الخادم';

  @override
  String get refreshStatus => 'تحديث الحالة';

  @override
  String get trackerSignInRequired => 'تسجيل الدخول مطلوب';

  @override
  String get trackerSignInSubtitle => 'سجّل دخولك لمتابعة الخوادم وتلقي إشعارات عند عدم الاتصال.';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get noServersTracked => 'لا توجد خوادم مُتتبَّعة';

  @override
  String get trackerEmptySubtitle => 'أضف خادم Minecraft لمراقبة حالته وتلقي الإشعارات.';

  @override
  String get fillAllFields => 'يرجى ملء جميع الحقول بشكل صحيح';

  @override
  String get slotUsedUpgrade => 'تم استخدام الفتحة المجانية. قم بالترقية للحصول على المزيد من الخوادم.';

  @override
  String get addServerFailed => 'فشل في إضافة الخادم. تحقق من تفاصيلك.';

  @override
  String get ipAddressLabel => 'عنوان IP';

  @override
  String get platformLabel => 'المنصة';

  @override
  String get bedrockLabel => 'Bedrock';

  @override
  String get addLabel => 'إضافة';

  @override
  String get statusOnline => 'متصل';

  @override
  String get statusOffline => 'غير متصل';

  @override
  String get statusChecking => 'جارٍ التحقق...';

  @override
  String get notificationsOn => 'الإشعارات مفعّلة';

  @override
  String get notificationsOff => 'الإشعارات معطّلة';

  @override
  String get failedUpdateNotifications => 'فشل في تحديث الإشعارات';

  @override
  String get editServerTitle => 'تعديل الخادم';

  @override
  String get serverNameHint => 'اسم الخادم';

  @override
  String get failedSave => 'فشل في الحفظ. حاول مرة أخرى.';

  @override
  String get serverRenamed => 'تمت إعادة تسمية الخادم';

  @override
  String get customizeLabel => 'تخصيص';

  @override
  String get customizeSubtitle => 'إعادة ترتيب البلاطات وتخصيص التنقل';

  @override
  String get resetLabel => 'إعادة تعيين';

  @override
  String get tilesSection => 'البلاطات';

  @override
  String get dragToReorder => 'اسحب لإعادة الترتيب';

  @override
  String get navigationSection => 'التنقل';

  @override
  String get navFixed => 'الصفحة الرئيسية والموصّل والملف الشخصي ثابتة دائماً';

  @override
  String get leftSlot => 'الفتحة اليسرى (بجانب الصفحة الرئيسية)';

  @override
  String get rightSlot => 'الفتحة اليمنى (بجانب الملف الشخصي)';

  @override
  String get tileWideTooltipRemove => 'إزالة التخطيط العريض';

  @override
  String get tileWideTooltipAdd => 'جعل البلاطة عريضة';

  @override
  String get tileVisibilityShow => 'إظهار البلاطة';

  @override
  String get tileVisibilityHide => 'إخفاء البلاطة';

  @override
  String get tileVisibilityMin => 'لا يمكن الإخفاء (آخر بلاطة)';

  @override
  String get colorPickerApply => 'تطبيق';

  @override
  String get colorPickerHex => 'Hex';

  @override
  String get textColorSection => 'لون النص';

  @override
  String get textColorPickerTitle => 'لون النص';

  @override
  String get textColorHint => 'اضغط على الدائرة لاختيار لون نص مخصص';

  @override
  String get textColorPreviewPrimary => 'رئيسي';

  @override
  String get textColorPreviewSecondary => 'ثانوي';

  @override
  String get textColorPreviewMuted => 'خافت';

  @override
  String get colorSwatchCustom => 'مخصص';

  @override
  String get accentColorSection => 'لون التمييز';

  @override
  String get opacityLabel => 'الشفافية';

  @override
  String get backgroundSection => 'الخلفية';

  @override
  String get cardsSection => 'البطاقات';

  @override
  String get editLabel => 'تعديل';

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
  String get chooseUniqueUsername => 'اختر اسم مستخدم فريداً للبدء.';

  @override
  String get usernameFieldLabel => 'اسم المستخدم';

  @override
  String get usernameExampleHint => 'مثال: CoolPlayer123';

  @override
  String get usernameFormatHint => '3–20 حرفاً · حروف وأرقام وشرطة سفلية فقط';

  @override
  String get displayNameOptional => 'الاسم المعروض (اختياري)';

  @override
  String get displayNameExampleHint => 'مثال: لاعب رائع';

  @override
  String get usernameRequired => 'اسم المستخدم مطلوب';

  @override
  String get usernameFormatError => 'يجب أن يكون اسم المستخدم 3–20 حرفاً ويحتوي على حروف وأرقام وشرطة سفلية فقط';

  @override
  String get usernameTaken => 'اسم المستخدم هذا مأخوذ بالفعل';

  @override
  String get noConnectionError => 'لا يوجد اتصال. تحقق من الإنترنت وحاول مرة أخرى.';

  @override
  String get home => 'الرئيسية';

  @override
  String get info => 'معلومات';

  @override
  String get navProfile => 'الملف الشخصي';

  @override
  String serverRemoved(Object name) {
    return 'تمت إزالة $name';
  }

  @override
  String serverAdded(Object name) {
    return 'تمت إضافة $name';
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
  String get featureLabelConnector => 'موصّل';

  @override
  String get featureLabelSkins => 'سكنز';

  @override
  String get featureLabelWiki => 'ويكي';

  @override
  String get featureLabelPartners => 'شركاء';

  @override
  String get featureLabelLookup => 'بحث';

  @override
  String get featureLabelTracker => 'متتبع الخادم';

  @override
  String get featureSubtitleConnector => 'ربط وحدات التحكم بـ Minecraft';

  @override
  String get featureSubtitleSkins => 'تصفح وإدارة سكنز Minecraft';

  @override
  String get featureSubtitleWiki => 'موسوعة Minecraft';

  @override
  String get featureSubtitlePartners => 'الخوادم المميزة';

  @override
  String get featureSubtitleLookup => 'البحث عن ملفات Java و Bedrock';

  @override
  String get featureSubtitleTracker => 'مراقبة حالة الخادم والإشعارات';

  @override
  String get userSearchHint => 'اسم المستخدم أو الغامرتاغ أو اسم Java…';

  @override
  String get userSearchSub => 'البحث باسم المستخدم أو غامرتاغ Xbox أو اسم Java';

  @override
  String get onlineStatus => 'متصل';

  @override
  String get upgradeWindowsHint => 'الترقية متاحة عبر متجر Microsoft';

  @override
  String get chatEmptyHint => 'كن أول من يقول شيئاً!';

  @override
  String get skinSaved => 'تم حفظ السكن';

  @override
  String skinSavedAs(String name) {
    return 'حفظ باسم \"$name\"';
  }

  @override
  String get skinExportFailed => 'فشل التصدير';

  @override
  String get skinExported => 'تم تصدير السكن بنجاح';

  @override
  String get accountActions => 'الحساب';

  @override
  String get feedbackBugReport => 'تقرير خطأ';

  @override
  String get feedbackFeatureRequest => 'طلب ميزة';

  @override
  String get feedbackGoesToGithub => 'يُرسل مباشرةً إلى GitHub';

  @override
  String get feedbackTitleLabel => 'العنوان';

  @override
  String get feedbackTitleHintBug => 'مثال: التطبيق يتعطل عند فتح محرر السكن';

  @override
  String get feedbackTitleHintFeature => 'مثال: عرض بينج اللاعب في قائمة الخوادم';

  @override
  String get feedbackWhatHappened => 'ماذا حدث؟';

  @override
  String get feedbackDescribeIdea => 'صف فكرتك';

  @override
  String get feedbackDescHintBug => 'صف الخطأ — ماذا فعلت، وماذا توقعت، وماذا حدث بدلاً من ذلك؟';

  @override
  String get feedbackDescHintFeature => 'اشرح ما تريده ولماذا سيكون مفيدًا.';

  @override
  String get feedbackEmailLabel => 'البريد الإلكتروني';

  @override
  String get feedbackEmailHint => 'حتى نتمكن من التواصل معك';

  @override
  String get feedbackEmailNote => 'لن يُشارك بريدك الإلكتروني علنًا أبدًا.';

  @override
  String get feedbackSubmitBug => 'إرسال تقرير الخطأ';

  @override
  String get feedbackSubmitFeature => 'إرسال طلب الميزة';

  @override
  String get feedbackDisclaimer => 'ينشئ تذكرة عامة على GitHub · لا تُدرج كلمات المرور';

  @override
  String get feedbackSuccessTitle => 'شكرًا على ملاحظاتك!';

  @override
  String get feedbackSuccessBody => 'تم إرسال تقريرك وإنشاء تذكرة على GitHub. سنراجعها في أقرب وقت ممكن.';

  @override
  String get feedbackViewOnGithub => 'عرض على GitHub';

  @override
  String get feedbackSubmitAnother => 'إرسال آخر';

  @override
  String get feedbackBackToApp => 'العودة إلى التطبيق';

  @override
  String get feedbackTitleTooShort => 'يجب أن يحتوي العنوان على 5 أحرف على الأقل.';

  @override
  String get feedbackDescTooShort => 'يجب أن يحتوي الوصف على 10 أحرف على الأقل.';

  @override
  String get feedbackEmailInvalid => 'يرجى إدخال عنوان بريد إلكتروني صالح.';

  @override
  String get feedbackSubmitFailed => 'فشل الإرسال. يرجى المحاولة مرة أخرى.';

  @override
  String get feedbackTileTitle => 'الإبلاغ عن خطأ أو اقتراح ميزة';

  @override
  String get reportBug => 'Feedback';

  @override
  String get feedbackTileSubtitle => 'ساعدنا في تحسين MCCompanion';

  @override
  String get friendsHowToStep1 => 'افتح تطبيق Xbox على هاتفك أو جهاز اللعب.';

  @override
  String get friendsHowToStep2 => 'أضف أحد الروبوتات أدناه كصديق على Xbox.';

  @override
  String get friendsHowToStep3 => 'افتح Minecraft وانتقل إلى تبويب الأصدقاء.';

  @override
  String get friendsHowToStep4 => 'ابحث عن خادمك ضمن عوالم الشبكة المحلية وانضم.';

  @override
  String get friendsHowToNote => '⚠️ في كل مرة تريد اللعب، يجب عليك أولاً تشغيل وضع الأصدقاء في تطبيق MCCompanion. يمكنك إغلاق التطبيق بعد التشغيل.';

  @override
  String get friendsBotLoadError => '⚠️ تعذّر تحميل قائمة الروبوتات. حاول مرة أخرى لاحقاً.';

  @override
  String get regionEurope => 'أوروبا';

  @override
  String get regionUnitedStates => 'الولايات المتحدة';

  @override
  String get yourRegion => 'منطقتك';

  @override
  String get botStatusOffline => 'غير متصل';

  @override
  String get botStatusFull => 'ممتلئ';

  @override
  String botFriendCount(Object current, Object max) {
    return '$current / $max أصدقاء';
  }

  @override
  String botCopied(Object gamertag) {
    return 'تم نسخ $gamertag';
  }

  @override
  String get copyLabel => 'نسخ';

  @override
  String get skinSavedToDocuments => 'تم حفظ السكن في المستندات';

  @override
  String get skinMenuExport => 'تصدير';

  @override
  String get skinMenuDelete => 'حذف';

  @override
  String get rpScreenTitle => 'حزمة الموارد';

  @override
  String get rpWhatIsThis => 'ما هذا؟';

  @override
  String get rpExplanation => 'حزمة الموارد تغيّر مظهر Minecraft على جهازك — كتل وألوان وأصوات جديدة. الصق رابط ملف .mcpack أدناه، فعّله واحفظ. يحمله MCCompanion تلقائيًا في كل مرة تتصل.';

  @override
  String get rpPackUrlLabel => 'رابط الحزمة';

  @override
  String get rpPackUrlHint => 'https://example.com/pack.mcpack';

  @override
  String get rpEnableToggle => 'تفعيل حزمة الموارد';

  @override
  String get rpWhatWorks => 'ما يعمل';

  @override
  String get rpSupportedBedrockOnly => 'Bedrock Edition فقط (.mcpack أو .zip)';

  @override
  String get rpSupportedBedrockOnlyHint => 'حزم Java لا تعمل على أجهزة الألعاب.';

  @override
  String get rpSupportedTexture => 'حزم الموارد وحزم القوام';

  @override
  String get rpSupportedTextureHint => 'هذه مدعومة رسميًا وتعمل بشكل موثوق.';

  @override
  String get rpUnsupportedShaders => 'المظللات وحزم السلوك وحزم الجلود';

  @override
  String get rpUnsupportedShadersHint => 'لن يتم تحميل هذه على أجهزة الألعاب عبر MCCompanion.';

  @override
  String get rpUnsupportedAddons => 'الإضافات وتعديلات الواجهة';

  @override
  String get rpUnsupportedAddonsHint => 'قد تعمل أحيانًا لكنها غير مدعومة رسميًا. استخدمها على مسؤوليتك الخاصة.';

  @override
  String get rpNoDiscord => 'روابط Discord — لا تحتوي على امتداد .mcpack وتنتهي صلاحيتها بعد ساعات قليلة';

  @override
  String get rpNoDrive => 'روابط مشاركة Google Drive / Dropbox — ليست تنزيلات مباشرة';

  @override
  String get rpNoEncrypted => 'الخوادم ذات الحزم المشفرة أو المحمية بكلمة مرور';

  @override
  String get rpConsolePerformanceTitle => 'أداء وحدة التحكم';

  @override
  String get rpConsolePerformanceBody => 'يمكن أن تتسبب حزم القوام عالية الدقة في تأخر أو تعطل وحدات التحكم. إذا واجهت مشاكل، انتقل إلى حزمة بدقة أقل أو اختر حزمة فرعية أخف إذا كانت الحزمة تدعم ذلك.';

  @override
  String get rpWarnDiscord => 'روابط Discord تنتهي صلاحيتها وستتوقف عن العمل. استخدم مضيفًا دائمًا بدلاً من ذلك.';

  @override
  String get rpWarnHttps => 'يجب أن يبدأ الرابط بـ https://';

  @override
  String get rpWarnExtension => 'يجب أن ينتهي الرابط بـ .mcpack أو .zip';

  @override
  String get rpToastEnterUrl => 'أدخل رابطًا قبل تفعيل حزمة الموارد.';

  @override
  String get rpToastSaved => 'تم حفظ إعدادات حزمة الموارد.';

  @override
  String get rpInvalidPackFormat => 'This is a Java Edition pack and is not supported. Please use a Bedrock Edition resource pack.';

  @override
  String get rpClearMinecraftTitle => 'أول مرة مع هذه الحزمة؟';

  @override
  String get rpClearMinecraftBody => 'يقوم Minecraft بتخزين حزم الموارد محليًا. إذا كنت قد اتصلت بهذا الخادم قبل تفعيل حزمة MCCompanion، فإن Minecraft يملك الحزمة الأصلية محفوظة ولن يعيد تنزيل النسخة المدمجة.';

  @override
  String get rpClearStep1 => 'افتح Minecraft على جهازك وانتقل إلى الإعدادات → التخزين';

  @override
  String get rpClearStep2 => 'انقر على ‘مسح’ أو ‘إعادة تعيين’ بجانب حزم الموارد — سيزيل جميع الحزم المخزّنة محليًا';

  @override
  String get rpClearStep3 => 'أعد الاتصال عبر MCCompanion — ستُنزّل الحزمة المدمجة تلقائيًا';

  @override
  String get rpRelayTitle => 'الحزمة تبدو خاطئة؟';

  @override
  String get rpRelayBody => 'يحتفظ الريلاي بالحزمة المدمجة في الذاكرة المؤقتة لمدة ساعة باستخدام رابط الـ overlay كمفتاح. لإجبار دمج جديد: عدّل الرابط قليلاً (مثلاً أضف ?v=2) واحفظ. بعد ذلك، امسح أيضاً ذاكرة حزم Minecraft — فالحزمة المدمجة لا تزال تستخدم UUID الخادم، وإلا سيعرض Minecraft النسخة القديمة من الذاكرة.';

  @override
  String get rpWorksGithubHint => 'رابط تنزيل مباشر — دائمًا متاح';

  @override
  String get rpWorksCloudflareHint => 'تخزين سحابي عام — سريع وموثوق';

  @override
  String get rpWorksDirectHint => 'أي رابط HTTPS عام .mcpack أو .zip';

  @override
  String get rpNoDiscordHint => 'روابط Discord CDN تنتهي صلاحيتها بعد وقت قصير';

  @override
  String get rpNoDriveHint => 'لا يوجد تنزيل مباشر — يعيد التوجيه إلى صفحة معاينة';

  @override
  String get rpNoEncryptedHint => 'لا يستطيع MCCompanion دمج محتوى الحزم المشفرة';

  @override
  String get rpClearWhy => 'يخزن Minecraft حزم الموارد بواسطة UUID الخاصة بها. تحتفظ الحزمة المدمجة بـ UUID الأصلي للخادم — إذا كان Minecraft قد خزّن حزمة الخادم بالفعل من جلسة سابقة (قبل تفعيل MCCompanion)، فلن يعيد تنزيل النسخة المدمجة الجديدة. امسح ذاكرة التخزين المؤقت حتى يحمّل Minecraft الحزمة المدمجة الجديدة.';

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
  String get rpMergerTitle => 'دمج حزم الموارد';

  @override
  String get rpMergerSubtitle => 'ادمج حتى 4 حزم موارد';

  @override
  String get rpMergerPriorityHint => 'الحزمة العلوية لها أعلى أولوية — ملفاتها تفوز في النزاعات.';

  @override
  String get rpMergerTopBadge => 'أعلى';

  @override
  String get rpMergerAddPacks => 'إضافة حزم موارد';

  @override
  String rpMergerAddAnother(int current) {
    return 'إضافة حزمة أخرى ($current/4)';
  }

  @override
  String get rpMergerFileTypes => '.zip أو .mcpack';

  @override
  String get rpMergerMerging => 'جارٍ الدمج…';

  @override
  String rpMergerButton(int count) {
    return 'دمج $count حزم';
  }

  @override
  String get rpMergerComplete => 'اكتمل الدمج!';

  @override
  String rpMergerConflicts(int count) {
    return 'تم حل $count تعارض — فازت الحزمة العلوية.';
  }

  @override
  String get rpMergerSetActive => 'تعيين كحزمة موارد نشطة';

  @override
  String get rpMergerSetActiveToast => 'تم تعيينها كحزمة موارد نشطة';

  @override
  String get rpMergerOpenButton => 'دمج حزم الموارد';

  @override
  String get rpMergerOpenSubtitle => 'ادمج 2-4 حزم في واحدة';

  @override
  String get rpDisabled => 'معطّل';

  @override
  String get rpNoPackSelected => 'لم يتم تحديد حزمة موارد';

  @override
  String get rpActiveOnConnect => 'نشط — يُطبَّق عند الاتصال';

  @override
  String get rpBrowseSubtitle => 'حزم منتقاة، جاهزة للاستخدام';

  @override
  String get rpBrowseEmpty => 'لا توجد حزم متاحة بعد';

  @override
  String get rpBrowseEmptyHint => 'تفقد لاحقًا للحصول على حزم منتقاة.';

  @override
  String get rpReplaceFile => 'استبدل بملف آخر';

  @override
  String get rpDropToUpload => 'أفلت للرفع';

  @override
  String get rpTabBrowseInfo => 'تصفح الحزم التي اختارها MCCompanion. اضغط استخدام لتفعيل حزمة فورًا — دون رفع أو رابط.';

  @override
  String get rpTabUploadInfo => 'ارفع ملف .mcpack أو .zip الخاص بك. يخزنه MCCompanion بأمان في السحابة ويرسله إلى وحدتك في كل مرة تتصل فيها.';

  @override
  String get rpTabUrlInfo => 'الصق رابط تنزيل مباشر لملف .mcpack أو .zip. يجب أن يكون الرابط متاحًا للعموم — لا روابط Discord أو Google Drive.';

  @override
  String get rpTabMergeInfo => 'ادمج من 2 إلى 4 حزم في حزمة واحدة. يتم رفع الحزمة المدمجة إلى MCCompanion Cloud وتفعيلها تلقائيًا.';

  @override
  String get shareLabel => 'مشاركة';

  @override
  String get sectionMinecraftAccounts => 'حسابات Minecraft';

  @override
  String get sectionSettings => 'الإعدادات';

  @override
  String get avatarUpdated => 'تم تحديث الصورة الرمزية';

  @override
  String get uploadFailed => 'فشل الرفع';

  @override
  String get profileLinkCopied => 'تم نسخ رابط الملف الشخصي!';

  @override
  String get shareProfileTooltip => 'مشاركة الملف الشخصي';

  @override
  String get profileFallbackTitle => 'الملف الشخصي';

  @override
  String get noUsersFound => 'لم يتم العثور على مستخدمين';

  @override
  String get skinLabel => 'سكن';

  @override
  String get skinsLabel => 'سكنات';

  @override
  String get javaEditionBadge => 'Java';

  @override
  String get bedrockEditionBadge => 'Bedrock';

  @override
  String get downloadLabel => 'تنزيل';

  @override
  String get justNow => 'الآن';

  @override
  String minutesAgo(int count) {
    return 'منذ $countد';
  }

  @override
  String hoursAgo(int count) {
    return 'منذ $countس';
  }

  @override
  String daysAgo(int count) {
    return 'منذ $countي';
  }

  @override
  String get rpPackInfo => 'معلومات';

  @override
  String get rpUseThisPack => 'استخدم هذه الحزمة';

  @override
  String get rpViewOnWebsite => 'عرض على الموقع →';

  @override
  String rpDownloads(int count) {
    return '$count تنزيلات';
  }

  @override
  String get rpPackDetailTitle => 'تفاصيل الحزمة';

  @override
  String get skinsSavedToMySkins => 'تم الحفظ في سكناتي';

  @override
  String get skinsDownloadFailed => 'فشل التنزيل';

  @override
  String get skinsDeletedFromCloud => 'تم الحذف من السحابة';

  @override
  String get skinsDeleteFailed => 'فشل الحذف';

  @override
  String get skinsLoginToUpload => 'سجّل دخولك لرفع السكنات';

  @override
  String get skinsUploading => 'جارٍ الرفع…';

  @override
  String get skinUploaded => 'تم رفع السكن!';

  @override
  String skinUploadFailed(String error) {
    return 'فشل الرفع: $error';
  }

  @override
  String get skinsTabSkins => 'السكنات';

  @override
  String get skinsTabRecent => 'الأخيرة';

  @override
  String get skinsEmptyCloudSkins => 'لا توجد سكنات سحابية بعد. ارفع سكناً لتراه هنا.';

  @override
  String get skinsEmptyLocalSkins => 'لا توجد سكنات بعد. أنشئ أو ارفع سكناً للبدء.';

  @override
  String get skinUploadToWebsite => 'رفع إلى الموقع';

  @override
  String get skinReuploadToWebsite => 'إعادة الرفع إلى الموقع';

  @override
  String get skinCloudEdit => 'تعديل';

  @override
  String get skinCloudSaveToDevice => 'حفظ على الجهاز';

  @override
  String get skinCloudDelete => 'حذف من السحابة';

  @override
  String get skinsTabGallery => 'معرض الصور';

  @override
  String get skinsGalleryEmpty => 'لا توجد سكنات مجتمعية بعد.';

  @override
  String get skinsTopLabel => 'أفضل 30';

  @override
  String get skinsAllLabel => 'جميع السكنات';

  @override
  String get skinUploadToCloud => 'رفع إلى السحابة';

  @override
  String get skinSaveDialog => 'حفظ السكن';

  @override
  String get skinNameHint => 'اسم السكن';

  @override
  String get skinDefaultName => 'سكني';

  @override
  String get skinUpdatedInCloud => 'تم تحديث السكن في السحابة';

  @override
  String skinByCreator(String name) {
    return 'بواسطة $name';
  }

  @override
  String skinLikesCount(int count) {
    return '$count إعجاب';
  }

  @override
  String get sectionRecentActivity => 'النشاط الأخير';

  @override
  String get activityNoEvents => 'لا يوجد نشاط حديث بعد.';

  @override
  String get activitySkinUploaded => 'تم رفع السكن';

  @override
  String get activitySkinLiked => 'أُعجب بالسكن';

  @override
  String get activityPackSubmitted => 'تم إرسال الحزمة';

  @override
  String get activityPackApproved => 'تمت الموافقة على الحزمة';

  @override
  String get activityPackRejected => 'لم تتم الموافقة على الحزمة';

  @override
  String get timeJustNow => 'الآن';

  @override
  String timeMinutesAgo(int count) {
    return 'منذ $count د';
  }

  @override
  String timeHoursAgo(int count) {
    return 'منذ $count س';
  }

  @override
  String timeDaysAgo(int count) {
    return 'منذ $count أيام';
  }

  @override
  String timeMonthsAgo(int count) {
    return 'منذ $count أشهر';
  }

  @override
  String get sectionNotifications => 'الإشعارات';

  @override
  String get sectionNotificationTypes => 'أنواع الإشعارات';

  @override
  String get notifMarkAllRead => 'تحديد الكل كمقروء';

  @override
  String get notifEmpty => 'لا توجد إشعارات بعد. ستظهر الإعجابات والتعليقات ونشاط الأصدقاء هنا.';

  @override
  String get notifSomeone => 'شخص ما';

  @override
  String notifSkinLiked(String actor) {
    return '$actor أعجب بسكنك';
  }

  @override
  String notifCommentReceived(String actor) {
    return '$actor علّق على سكنك';
  }

  @override
  String get notifPackApproved => 'تمت الموافقة على الحزمة';

  @override
  String get notifPackRejected => 'لم تتم الموافقة على الحزمة';

  @override
  String notifFriendRequest(String actor) {
    return '$actor أرسل لك طلب صداقة';
  }

  @override
  String notifFriendAccepted(String actor) {
    return '$actor قبل طلبك';
  }

  @override
  String notifMessageReceived(String actor) {
    return 'رسالة جديدة من $actor';
  }

  @override
  String get notifPrefSkinLiked => 'إعجاب بالسكن';

  @override
  String get notifPrefCommentReceived => 'تعليق مستلم';

  @override
  String get notifPrefPackApproved => 'حزمة موافق عليها';

  @override
  String get notifPrefPackRejected => 'حزمة مرفوضة';

  @override
  String get notifPrefFriendRequest => 'طلب صداقة';

  @override
  String get notifPrefFriendAccepted => 'صديق مضاف';

  @override
  String get notifPrefMessageReceived => 'رسالة جديدة';

  @override
  String get commentsTitle => 'التعليقات';

  @override
  String get commentsEmpty => 'لا توجد تعليقات بعد. كن الأول!';

  @override
  String get commentsPlaceholder => 'اكتب تعليقاً…';

  @override
  String get loadMore => 'تحميل المزيد';
}
