// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'NetherLink';

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
    return 'تم الإنشاء بواسطة $appCreator.\r\n\r\nطريقة الاستخدام:\r\n1. أدخل عنوان خادم Minecraft والمنفذ الخاص بك (الافتراضي: 19132)\r\n   — أو اختر خادمًا محفوظًا مسبقًا من القائمة المنسدلة\r\n2. (اختياري) اختر خادم ترحيل (EU أو US) الأقرب إلى موقعك\r\n3. اضغط على \\\"بدء البث\\\" للبدء\r\n4. على جهازك/وحدة التحكم: Minecraft > لعب > الأصدقاء\r\n5. يجب أن ترى خادم شبكة محلية باسم \\\"NetherLink\\\"\r\n6. اضغط عليه للانضمام إلى خادمك الخارجي عبر NetherLink\r\n\r\nNintendo Switch (وضع DNS):\r\n1. فعّل \\\"Nintendo Switch\\\" في لوحة الاتصال\r\n2. اختر خادم ترحيل (EU أو US)\r\n3. اضغط على \\\"إرسال إعداد DNS\\\" — سيؤدي ذلك إلى إرسال إعداداتك إلى خادم الترحيل\r\n   (لن يقوم ببث خادم شبكة محلية)\r\n4. على جهاز Switch الخاص بك، طبّق إعدادات DNS الخاصة بـ NetherLink وانضم\r\n   باستخدام إدخال الخادم الذي تستخدمه مع NetherLink\r\n\r\nملاحظات:\r\n- لكي يعمل بث الشبكة المحلية، يجب أن يكون NetherLink ووحدة التحكم على نفس الشبكة المحلية.\r\n- نصيحة: اختر خادم الترحيل الأقرب إليك للحصول على أفضل أداء.';
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
  String get howToJavaSubtitle => 'اتصل بخوادم Java Edition عبر NetherLink';

  @override
  String get aternosSubtext => 'أنشئ خادم ماينكرافت مجاني خاص بك';

  @override
  String get howToJavaBody => 'وضع Java — خطوات سريعة:\n1. في التطبيق، اختر وضع Java.\n2. أدخل عنوان خادم Java Edition والمنفذ (الافتراضي: 25565).\n3. اضغط على \"ابدأ وضع Java\" — سيقوم NetherLink بربط الاتصال.\n4. افتح Minecraft Bedrock وانتقل إلى علامة تبويب الأصدقاء.\n5. اختر خادم LAN المسمى \"NetherLink\" للانضمام إلى خادم Java.\n\n⚠️ تحذيرات مهمة:\n- يلزم وجود حساب Java Edition صالح (Microsoft).\n- تستخدم بعض الخوادم أنظمة مكافحة الغش وقد تكتشف حسابك وتحظره.\n- بعض الخوادم تحظر عملاء Bedrock صراحةً — تحقق دائمًا من قواعد الخادم.\n- NetherLink غير مسؤول عن أي حظر أو تعليق أو أي مشكلات أخرى متعلقة بالحساب قد تنتج عن استخدام هذه الميزة.\n- استخدمها على مسؤوليتك الخاصة.';

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
  String get howToUseTitle => 'كيفية استخدام NetherLink';

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
  String get nldServerLabel => 'خادم NETHERLINK';

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
  String get vpnActive => 'اكتشفنا أن الـ VPN لديك مفعّل.\n\nيرجى تعطيل الـ VPN قبل استخدام NetherLink، وإلا فقد لا يصل بث LAN إلى جهازك.';

  @override
  String get mobileActive => 'تم الاكتشاف: بيانات الجوال\n\nيجب أن يكون NetherLink على نفس الشبكة مثل جهازك. يرجى الاتصال بشبكة Wi‑Fi المنزلية أو نقطة الاتصال قبل المتابعة.';

  @override
  String get continueAnyway => 'المتابعة على أي حال';

  @override
  String get sameWifi => 'نفس شبكة Wi‑Fi';

  @override
  String get needSameWifi => 'يجب أن يكون الجهاز الذي يشغّل NetherLink على نفس شبكة Wi‑Fi الخاصة بالجهاز الذي تلعب عليه Minecraft.';

  @override
  String get subscription => 'اشتراك عبر الإنترنت مطلوب';

  @override
  String get needSubscription => 'تحتاج كل منصة إلى اشتراكها النشط الخاص بها عبر الإنترنت (Xbox Live أو PS Plus أو NSO). بدون ذلك، لن يظهر NetherLink.';

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
  String get friendModeText => 'أضف روبوتات أصدقاء NetherLink كأصدقاء. ابدأ وضع الأصدقاء وابدأ اللعب';

  @override
  String get selectedRelayCheck => 'المحدد';

  @override
  String relayFallbackWarning(Object name) {
    return 'تحذير: لم يستجب Relay الأصلي. يتم استخدام Relay احتياطي: $name';
  }

  @override
  String get relayUnableConnect => 'تعذر الاتصال بأي خادم Relay تابع لـ NetherLink. حاول مرة أخرى لاحقًا أو تحقق من اتصالك بالإنترنت.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (شبكة محلية / وكيل)';

  @override
  String get howToXboxSubtitle => 'العب عبر بث الشبكة المحلية أو الوكيل';

  @override
  String get howToXboxBody => 'كيفية الاتصال (Xbox / PS4 / PS5):\r\n1. تأكد من أن الجهاز الذي يشغّل NetherLink ووحدة التحكم الخاصة بك على نفس الشبكة المحلية.\r\n2. في التطبيق، أدخل عنوان خادم Minecraft والمنفذ ثم اضغط على \\\"بدء البث\\\".\r\n3. على وحدة التحكم افتح Minecraft → لعب → وابحث عن عوالم الشبكة المحلية أو تبويب الأصدقاء ثم حدّث القائمة.\r\n4. اختر خادم الشبكة المحلية المسمى \\\"NetherLink\\\" للانضمام.\r\nملاحظات:\r\n- إذا لم يظهر الخادم، فتأكد من أن الجهازين على نفس الشبكة الفرعية وأن التطبيق ما يزال يبث.\r\n- قد تمنع بعض طرازات وحدات التحكم أو أجهزة التوجيه اكتشاف الشبكة المحلية؛ جرّب تغيير إعدادات التطبيق أو جهاز التوجيه عند الحاجة.';

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
  String get howToFriendsBody => 'وضع الأصدقاء — خطوات سريعة:\r\n1. أضف حساب صديق NetherLink (صديق الترحيل) على وحدة التحكم أو المنصة إذا لزم الأمر.\r\n2. في التطبيق، فعّل وضع الأصدقاء وأرسل إعداد خادم الترحيل (إذا كان ذلك مطلوبًا).\r\n3. على وحدة التحكم، افتح Minecraft → الأصدقاء وابحث عن عوالم الشبكة المحلية — يجب أن يظهر خادمك هناك كعالم شبكة محلية.\r\n4. اختره للانضمام إلى خادمك مع الأصدقاء.\r\nملاحظات:\r\n- تأكد من أن لديك أنت وأصدقاؤك نفس إعدادات NAT/الإعدادات التي تسمح بظهور الأصدقاء.\r\n- يعتمد وضع الأصدقاء على ميزات الأصدقاء الخاصة بالمنصة وقد يتطلب قبول طلبات الصداقة.';

  @override
  String get helpNetherlinkTitle => 'NetherLink لا يظهر';

  @override
  String get helpNetherlinkSubtitle => 'استكشاف مشكلات اكتشاف الشبكة المحلية وإصلاحها';

  @override
  String get helpNetherlinkBody => 'إذا لم يظهر الخادم على وحدة التحكم الخاصة بك، فجرّب هذه الخطوات:\r\n\r\n✅ فحوصات أساسية:\r\n1. نفس شبكة WiFi - يجب أن يكون هاتفك/جهازك اللوحي ووحدة التحكم على نفس شبكة WiFi\r\n2. عنوان الخادم الصحيح - تحقق مرة أخرى من IP والمنفذ (الافتراضي: 19132)\r\n3. البث نشط - تأكد من أن NetherLink يعرض حالة \\\"جاري البث\\\"\r\n\r\n🔄 إصلاحات سريعة:\r\n• أعد تشغيل التطبيق: أوقف البث، أغلق NetherLink بالكامل، أعد فتحه ثم حاول مرة أخرى\r\n• أعد تشغيل وحدة التحكم: أحيانًا تحتاج وحدة التحكم إلى تحديث لاكتشاف ألعاب الشبكة المحلية\r\n• تحقق من تبويب الأصدقاء/الشبكة المحلية: يظهر الخادم ضمن \\\"الأصدقاء\\\" أو \\\"ألعاب الشبكة المحلية\\\" وليس في قائمة الخوادم\r\n• انتظر من 10 إلى 15 ثانية بعد بدء البث\r\n• عطّل VPN: يمكن أن تمنع شبكات VPN البث المحلي\r\n\r\n⚠️ مشكلات شائعة:\r\n\\\"No route found for user\\\" → تأكد من أن كلا الجهازين على نفس شبكة Wi‑Fi (وتجنب شبكات الضيوف)\r\n\\\"Unable to connect to NetherLink relay server\\\" → تحقق من الإنترنت / حالة خادم الترحيل\r\n\r\n📱 ما زلت تواجه مشاكل؟ فعّل وضع التصحيح في NetherLink وافحص السجلات، أو جرّب خادمًا مختلفًا.';

  @override
  String get helpMultiplayerFailedTitle => 'فشل اتصال اللعب الجماعي';

  @override
  String get helpMultiplayerFailedSubtitle => 'شرح لماذا لا يعد هذا خطأ في NetherLink';

  @override
  String get helpMultiplayerFailedBody => '⚠️ هذه ليست مشكلة في NetherLink!\r\n\r\nلقد قام NetherLink بإعادتك بنجاح إلى الخادم المطلوب. تشير رسالة \\\"فشل اتصال اللعب الجماعي\\\" إلى أن الخادم الهدف غير متاح حاليًا. الأسباب المحتملة:\r\n\r\n• خادم Minecraft الهدف غير متصل أو مثقل بالتحميل\r\n• يتطلب الخادم إصدار عميل محدثًا أو إصدارًا معينًا\r\n• توجد مشكلات في الشبكة بين Relay والخادم الهدف\r\n\r\nحاول الاتصال بخادم مختلف أو تواصل مع دعم الخادم. إذا استمرت المشكلة على عدة خوادم، فعّل وضع التصحيح في NetherLink وافحص السجلات.';

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
}
