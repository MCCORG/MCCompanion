// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'MCCompanion';

  @override
  String get console => 'Konsol';

  @override
  String get consoleOutput => 'Konsol Çıktısı';

  @override
  String get noLogsYet => 'Henüz kayıt yok';

  @override
  String get startBroadcastingToSeeOutput => 'Çıktıyı görmek için yayına başlayın';

  @override
  String get close => 'Kapat';

  @override
  String get ok => 'OK';

  @override
  String get joinUs => 'Bize Katılın';

  @override
  String get more => 'Daha Fazla';

  @override
  String get website => 'Websitesi';

  @override
  String get howToUseMenu => 'Nasıl kullanılır';

  @override
  String get support => 'Destek';

  @override
  String helpText(Object appCreator) {
    return 'Yapan: $appCreator\n\nKullanım Talimatları:\n1. Minecraft sunucu adresinizi ve portunuzu girin (varsayılan: 19132)\n   — veya daha önce kaydedilmiş bir sunucuyu açılır menüden seçin\n2. (İsteğe bağlı) Konumunuza en yakın aktarma sunucusunu (EU veya US) seçin\n3. Yayına başlamak için \"Yayına Başla\" düğmesine tıklayın\n4. Konsolunuz/cihazınızda: Minecraft > Oyna > Arkadaşlar\n5. \"MCCompanion\" adlı bir LAN sunucusu görmelisiniz\n6. MCCompanion üzerinden seçtiğiniz sunucunuya katılmak için üzerine tıklayın\n\nNintendo Switch (DNS modu):\n1. Bağlantı panelinde \"Nintendo Switch\"i etkinleştirin\n2. Bir  aktarma sunucusu  (EU veya US) seçin\n3. \"DNS Yapılandırmasını Gönder\" düğmesine tıklayın — bu yapılandırmanızı aktarıcıya gönderir\n   (LAN sunucusu yayınlamaz)\n4. Switch’inizde MCCompanion DNS ayarlarınızı uygulayın ve MCCompanion için kullandığınız sunucu girişini kullanarak katılın\n\nNotlar:\n- LAN yayını için MCCompanion ve konsol aynı yerel ağda olmalıdır.\n- İpucu: En iyi performans için size en yakın aktarma sunucusunu seçin.';
  }

  @override
  String get serverDetailsLabel => 'Sunucu Detayları';

  @override
  String get start => 'Başlat';

  @override
  String get stop => 'Durdur';

  @override
  String get labelJava => 'Java';

  @override
  String get startJavaMode => 'Java Modunu Başlat';

  @override
  String get javaInfoTitle => 'Java Modu';

  @override
  String get javaInfoText => 'Java Edition sunucularına bağlanın';

  @override
  String get howToJavaTitle => 'Java Modu';

  @override
  String get howToJavaSubtitle => 'MCCompanion üzerinden Java Edition sunucularına bağlanın';

  @override
  String get aternosSubtext => 'Kendi ücretsiz Minecraft sunucunuzu oluşturun';

  @override
  String get howToJavaBody => 'Java Modu — hızlı adımlar:\n1. Uygulamada Java modunu seçin.\n2. Java Edition sunucu adresinizi ve portunuzu girin (varsayılan: 25565).\n3. \"Java Modunu Başlat\" düğmesine basın — MCCompanion bağlantıyı köprüleyecektir.\n4. Minecraft Bedrock\'u açın ve Arkadaşlar sekmesine gidin.\n5. Java sunucusuna katılmak için \"MCCompanion\" adlı LAN sunucusunu seçin.\n\n⚠️ Önemli uyarılar:\n- Geçerli bir Java Edition hesabı (Microsoft) gereklidir.\n- Bazı sunucular hesabınızı tespit edip yasaklayabilecek hile önleme sistemleri kullanır.\n- Bazı sunucular Bedrock istemcilerini açıkça yasaklar — her zaman sunucu kurallarını kontrol edin.\n- Bu özelliğin kullanılmasından kaynaklanabilecek hesap yasakları, askıya almalar veya hesapla ilgili diğer sorunlardan MCCompanion sorumlu değildir.\n- Kendi riskinizle kullanın.';

  @override
  String get language => 'Türkçe';

  @override
  String get discord => 'Discord';

  @override
  String get toggleDebug => 'Hata ayıklamayı aç/kapat';

  @override
  String get copyLogs => 'Kayıtları kopyala';

  @override
  String get clear => 'Temizle';

  @override
  String get cancel => 'İptal';

  @override
  String get deleteServer => 'Sunucuyu sil';

  @override
  String get delete => 'Sil';

  @override
  String get myServers => 'Benim sunucularım';

  @override
  String get quickAccessServers => 'Sunuculara hızlı eriş';

  @override
  String get addServer => 'Sunucu Ekle';

  @override
  String get addServersHint => 'Daha sonra hızlıca bağlanmak için sunucu ekleyin';

  @override
  String get serverNameLabel => 'Sunucu Adı *';

  @override
  String get addressLabel => 'Adres *';

  @override
  String get portLabel => 'Bağlantı Noktası *';

  @override
  String get descriptionLabel => 'Açıklama (Opsiyonel)';

  @override
  String get save => 'Kaydet';

  @override
  String get initializing => 'Başlatılıyor...';

  @override
  String get createdBy => 'NetherDev tarafından yapıldı';

  @override
  String get bedrockBridge => 'Bedrock Köprüsü';

  @override
  String get clientDisconnected => 'İstemci bağlantısı kesildi — Yayın durduruldu';

  @override
  String get pleaseEnterServer => '⚠️ Lütfen bir sunucu adresi girin';

  @override
  String get invalidPort => '⚠️ Geçersiz port numarası (1-65535)';

  @override
  String get dnsConfigSent => '✅ DNS yapılandırması aktarıcıya gönderildi';

  @override
  String get broadcastingStarted => 'Yayın başladı';

  @override
  String get broadcastStopped => 'Yayın durdu';

  @override
  String selectedServer(Object name) {
    return '📋 Seçilen: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'Seçilen: $name';
  }

  @override
  String get noLogsToCopy => 'Kopyalanacak kayıt yok';

  @override
  String copiedLogs(Object count) {
    return '$count kayıt panoya kopyalandı';
  }

  @override
  String get debugEnabled => 'Hata ayıklama kayıtları etkinleştirildi';

  @override
  String get debugDisabled => 'Hata ayıklama kayıtları devre dışı bırakıldı';

  @override
  String get howToUseTitle => 'MCCompanion nasıl kullanılır';

  @override
  String get iUnderstand => 'Anlıyorum';

  @override
  String get playOnSwitchTitle => 'Nintendo Switch\'te oyna';

  @override
  String get playWithFriendsTitle => 'Arkadaşlar ile oyna';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'Seçilen: $relayName\n\nBağlanma Adımları:\n1. Switch Ayarlarına gidin ve DNS’inizi bu ip ile değiştirin: $relayIp\n2. Minecraft’ı açın ve listeden bir sunucu seçin (örneğin Cubecraft veya Hive).\n3. Artık otomatik olarak kendi sunucunuza yönlendirileceksiniz.';
  }

  @override
  String playInstructionsFriends(Object friend) {
    return 'Bağlanma Adımları:\n1. Konsolunuzda $friend’i arkadaş olarak ekleyin.\n2. Minecraft’ı açın ve Arkadaşlar sekmesine gidin.\n3. LAN Dünyaları altında sunucunuzu bulun ve katılmak için seçin.';
  }

  @override
  String get nldServerLabel => 'NETHERLINK SUNUCUSU';

  @override
  String selectRelayLabel(Object name) {
    return 'Seçilen aktarıcı $name';
  }

  @override
  String get noSavedServers => 'Kaydedilen sunucu yok';

  @override
  String get savedServers => 'Kaydedilen sunucular';

  @override
  String get serverAddressHint => 'Sunucu Adresi';

  @override
  String get portHint => 'Bağlantı Noktası';

  @override
  String get manageServers => 'Sunucuları yönet';

  @override
  String get manageServersTooltip => 'Sunucuları yönet';

  @override
  String get noServerYet => 'Henüz kaydedilmiş sunucu yok.\nBir tane eklemek için Yönet\'e dokunun.';

  @override
  String get serverNotSelected => 'Sunucu seçilmedi';

  @override
  String get ready => 'Hazır';

  @override
  String get active => 'Aktif';

  @override
  String get vpnDetected => 'VPN Tespit Edildi';

  @override
  String get noWifi => 'Wi‑Fi\'a bağlı değil';

  @override
  String get vpnActive => 'VPN\'inizin etkin olduğunu tespit ettik.\n\nLütfen MCCompanion\'i kullanmadan önce VPN\'inizi devre dışı bırakın, aksi halde LAN yayını konsolunuza ulaşmayabilir.';

  @override
  String get mobileActive => 'Tespit edildi: Mobil Veri\n\nMCCompanion\'in konsolunuzla aynı ağda olması gerekir. Devam etmeden önce ev Wi‑Fi\'nize veya erişim noktanıza bağlanın.';

  @override
  String get continueAnyway => 'Yine de Devam Et';

  @override
  String get sameWifi => 'Aynı Wi‑Fi Ağı';

  @override
  String get needSameWifi => 'MCCompanion\'i çalıştıran cihaz, Minecraft oynadığınız konsolla AYNI Wi‑Fi ağına bağlı OLMALIDIR.';

  @override
  String get subscription => 'Çevrim İçi Abonelik Gerekli';

  @override
  String get needSubscription => 'Her konsolun kendi etkin çevrim içi aboneliği (Xbox Live, PS Plus, NSO) olmalıdır. Aksi halde MCCompanion görünmez.';

  @override
  String get updateAvailable => 'Güncelleme Mevcut';

  @override
  String get newVersion => 'Uygulamanın yeni bir sürümü mevcut.\nEn son özellikler ve düzeltmeler için şimdi güncelleyin.';

  @override
  String get later => 'Daha Sonra';

  @override
  String get updateNow => 'Şimdi Güncelle';

  @override
  String get beforeYouStart => 'BAŞLAMADAN ÖNCE';

  @override
  String get stopBroadcasting => 'Yayını Durdur';

  @override
  String get startNintendoMode => 'Nintendo Modunu başlat';

  @override
  String get startFriendsMode => 'Arkadaş Modunu başlat';

  @override
  String get startBroadcasting => 'Yayına Başla';

  @override
  String get modeLabel => 'Mod';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'Arkadaşlar';

  @override
  String get nintendoInfoTitle => 'Nintendo Switch DNS modu';

  @override
  String get nintendoInfoText => 'Nintendo modunu başlatın, DNS ayarlarınızı ayarlayın ve öne çıkan bir sunucuya bağlanın.';

  @override
  String get friendModeTitle => 'Arkadaş modu';

  @override
  String get friendModeText => 'MCCompanion\'in arkadaş botlarını arkadaş olarak ekle. Arkadaş modunu başlat ve oyna';

  @override
  String get selectedRelayCheck => 'Seçilen';

  @override
  String relayFallbackWarning(Object name) {
    return 'Uyarı: Orijinal aktarıcı yanıt vermedi. Yedek aktarıcı kullanılıyor: $name';
  }

  @override
  String get relayUnableConnect => 'Hiçbir MCCompanion aktarım sunucusuna bağlanılamıyor. Daha sonra tekrar deneyin veya internet bağlantınızı kontrol edin.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / vekil)';

  @override
  String get howToXboxSubtitle => 'LAN yayını veya proxy ile oyna';

  @override
  String get howToXboxBody => 'Xbox / PS4 / PS5 için bağlanma adımları:\n1. MCCompanion çalıştıran cihazınızın ve konsolunuzun aynı yerel ağda olduğundan emin olun.\n2. Uygulamada Minecraft sunucu adresinizi ve portunuzu girin, ardından \"Yayına Başla\" düğmesine basın.\n3. Konsolda Minecraft → Oyna bölümünü açın, LAN Dünyaları veya Arkadaşlar sekmesini bulun ve listeyi yenileyin.\n4. Katılmak için \"MCCompanion\" adlı LAN sunucusunu seçin.\nNotlar:\n- Sunucu görünmüyorsa, iki cihazın da aynı alt ağda olduğunu ve uygulamanın hâlâ yayın yaptığını doğrulayın.\n- Bazı konsol modelleri veya yönlendiriciler LAN keşfini engelleyebilir; gerekirse uygulama ya da yönlendirici ayarlarını değiştirerek tekrar deneyin.';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (DNS modu)';

  @override
  String get howToNintendoSubtitle => 'Switch için DNS aktarıcı talimatları';

  @override
  String get howToNintendoBody => 'Nintendo Switch — DNS modu (adım adım):\n1. Uygulamada \"Nintendo\" modunu etkinleştirin ve bir Aktarım Sunucusu (EU veya US) seçin.\n2. DNS IP adresini aktarıcıya göndermek için \"DNS Yapılandırmasını Gönder\" düğmesine dokunun.\n3. Nintendo Switch\'inizde Sistem Ayarları → İnternet → İnternet Ayarları → (ağınız) → Ayarları Değiştir → DNS bölümüne gidin ve Birincil DNS\'i aktarıcı IP adresi olarak ayarlayın.\n4. Minecraft\'ı açın ve herkese açık bir sunucuya katılın; aktarıcı DNS\'i üzerinden kendi sunucunuza yönlendirileceksiniz.\nNotlar:\n- DNS modu bir LAN sunucusu yayınlamaz; oyun trafiğini aktarıcı üzerinden yönlendirir.\n- Normal ağ davranışına dönmek istediğinizde DNS ayarınızı eski haline getirin.';

  @override
  String get howToFriendsTitle => 'Arkadaş modu';

  @override
  String get howToFriendsSubtitle => 'Arkadaşlarını davet et ve LAN üzerinden katıl';

  @override
  String get howToFriendsBody => 'Arkadaş modu — hızlı adımlar:\n1. Gerekliyse MCCompanion arkadaş hesabını (aktarıcı arkadaş) konsolunuza veya platformunuza ekleyin.\n2. Uygulamada Arkadaş modunu etkinleştirin ve aktarıcı yapılandırmasını gönderin (uygunsa).\n3. Konsolunuzda Minecraft → Arkadaşlar bölümünü açın ve LAN Dünyaları\'nı arayın; sunucunuz orada bir LAN dünyası olarak görünmelidir.\n4. Arkadaşlarınızla sunucunuza katılmak için onu seçin.\nNotlar:\n- Hem sizin hem de arkadaşlarınızın arkadaş görünürlüğüne izin veren aynı NAT/ayarlarına sahip olduğundan emin olun.\n- Arkadaş modu, platformun arkadaş özelliklerine dayanır ve arkadaşlık isteklerinin kabul edilmesini gerektirebilir.';

  @override
  String get helpNetherlinkTitle => 'MCCompanion görünmüyor';

  @override
  String get helpNetherlinkSubtitle => 'LAN keşif sorunlarını giderme';

  @override
  String get helpNetherlinkBody => 'Sunucu konsolunuzda görünmüyorsa şu adımları deneyin:\n\n✅ Temel Kontroller:\n1. Aynı WiFi Ağı - Telefonunuz/tabletiniz ve konsolunuz AYNI WiFi ağına bağlı olmalıdır\n2. Doğru Sunucu Adresi - IP ve portu tekrar kontrol edin (varsayılan: 19132)\n3. Yayın Aktif - MCCompanion\'in \"Yayın Yapılıyor\" durumunu gösterdiğini doğrulayın\n\n🔄 Hızlı Çözümler:\n• Uygulamayı yeniden başlatın: Yayını durdurun, MCCompanion\'i tamamen kapatın, yeniden açın ve tekrar deneyin\n• Konsolunuzu yeniden başlatın: Bazen konsolun LAN oyunlarını algılaması için yenilenmesi gerekir\n• Arkadaşlar/LAN sekmesini kontrol edin: Sunucu, sunucu listesinde DEĞİL, \"Arkadaşlar\" veya \"LAN Oyunları\" altında görünür\n• Yayını başlattıktan sonra 10-15 saniye bekleyin\n• VPN\'leri devre dışı bırakın: VPN\'ler yerel yayınları engelleyebilir\n\n⚠️ Yaygın Sorunlar:\n\"Kullanıcı için rota bulunamadı\" → Her iki cihazın da aynı Wi‑Fi ağına bağlı olduğundan emin olun (Misafir ağlarından kaçının)\n\"MCCompanion aktarıcı sunucusuna bağlanılamıyor\" → İnternet bağlantınızı / aktarıcı durumunu kontrol edin\n\n📱 Hâlâ sorun mu yaşıyorsunuz? MCCompanion\'te Hata Ayıklama Modunu etkinleştirin ve kayıtları kontrol edin ya da farklı bir sunucu deneyin.';

  @override
  String get helpMultiplayerFailedTitle => 'Çok Oyunculu Bağlantı Başarısız';

  @override
  String get helpMultiplayerFailedSubtitle => 'Bunun neden bir MCCompanion hatası olmadığının açıklaması';

  @override
  String get helpMultiplayerFailedBody => '⚠️ Bu, MCCompanion ile ilgili bir sorun değildir!\n\nMCCompanion sizi istenen sunucuya başarıyla yönlendirdi. \"Çok Oyunculu Bağlantı Başarısız\" mesajı, hedef sunucunun şu anda erişilemez olduğunu gösterir. Olası nedenler:\n\n• Hedef Minecraft sunucusu çevrimdışı veya aşırı yüklü olabilir\n• Sunucu güncel bir istemci sürümü ya da belirli bir sürüm gerektiriyor olabilir\n• Aktarıcı ile hedef sunucu arasında ağ sorunları olabilir\n\nFarklı bir sunucuya bağlanmayı deneyin veya sunucunun destek ekibiyle iletişime geçin. Sorun birden fazla sunucuda sürerse, MCCompanion\'te Hata Ayıklama Modunu etkinleştirip kayıtları kontrol edin.';

  @override
  String get helpNintendoDnsTitle => 'Nintendo DNS çalışmıyor';

  @override
  String get helpNintendoDnsSubtitle => 'Yaygın DNS / aktarıcı sorunları';

  @override
  String get helpNintendoDnsBody => 'Nintendo DNS modu çalışmıyorsa aşağıdakileri kontrol edin:\n\n1. Uygulamadan DNS yapılandırmasını gönderdiğinizi doğrulayın (DNS Yapılandırmasını Gönder).\n2. Aktarıcı IP adresini Switch\'te Birincil DNS olarak uyguladığınızı doğrulayın.\n3. Seçilen aktarıcı sunucusunun (EU/US) çevrimiçi ve aşırı yük altında olmadığından emin olun.\n4. Bazı ağlar (örneğin captive portal kullanılan ağlar) özel DNS kullanımını engeller; farklı bir ağda test edin.\n\nSorun devam ederse Hata Ayıklama Modunu etkinleştirip kayıtları kontrol edin veya Arkadaş modu alternatifini deneyin.';

  @override
  String get helpFriendsModeTitle => 'Arkadaş modu çalışmıyor';

  @override
  String get helpFriendsModeSubtitle => 'Yaygın arkadaş sorunları';

  @override
  String get helpFriendsModeBody => 'Arkadaş modu için sorun giderme ipuçları:\n\n1. Aktarıcı arkadaş hesabının konsolda eklendiğinden/kabul edildiğinden emin olun (gerekiyorsa).\n2. Arkadaş modunu etkinleştirdikten sonra oyunu yeniden başlatmayı ve Arkadaşlar/LAN sekmesini yenilemeyi deneyin.\n\nSunucu arkadaşlarınıza hâlâ görünmüyorsa hataları belirlemek için Hata Ayıklama Modunu etkinleştirin ve kayıtları kontrol edin.';

  @override
  String get changeLanguageTitle => 'Dili değiştir';

  @override
  String get changeLanguage => 'Dil';

  @override
  String get useSystemLanguage => 'Sistem dilini kullan';

  @override
  String get couldNotOpenUrl => 'URL açılamadı';

  @override
  String get reportUser => 'Kullanıcıyı şikayet et';
  @override
  String reportUserWithName(String username) => '@$username kullanıcısını şikayet et';
  @override
  String get reportMessage => 'Mesajı şikayet et';
  @override
  String get reportDisclaimer => 'Ekibimiz bu şikayeti inceleyecek. Topluluğu güvende tuttuğunuz için teşekkürler.';
  @override
  String get reportReasonSpam => 'Spam';
  @override
  String get reportReasonHarassment => 'Taciz veya zorbalık';
  @override
  String get reportReasonInappropriate => 'Uygunsuz içerik';
  @override
  String get reportReasonOther => 'Diğer';
  @override
  String get reportAdditionalDetails => 'Ek ayrıntılar (isteğe bağlı)';
  @override
  String get reportSubmit => 'Şikayeti gönder';
  @override
  String get reportSuccess => 'Şikayet gönderildi. Teşekkürler.';
  @override
  String get reportFailed => 'Şikayet gönderilemedi. Lütfen tekrar deneyin.';
  @override
  String get messagePlaceholder => 'Mesaj...';
  @override
  String get noMessagesYet => 'Henüz mesaj yok.\nMerhaba deyin!';
  @override
  String get today => 'Bugün';
  @override
  String get yesterday => 'Dün';
  @override
  String get noConversationsYet => 'Henüz sohbet yok';
  @override
  String get startChatHint => 'Arkadaş listenizden bir sohbet başlatın.';
  @override
  String get youPrefix => 'Siz';
  @override
  String get tabProfile => 'PROFİL';
  @override
  String get tabFriends => 'ARKADAŞLAR';
  @override
  String get tabRequests => 'İSTEKLER';
  @override
  String get tabChats => 'SOHBETLER';
  @override
  String get addFriend => 'Arkadaş ekle';
  @override
  String get usernameHint => 'kullanıcı adı';
  @override
  String get send => 'Gönder';
  @override
  String friendRequestSentTo(String username) => '@$username kişisine arkadaşlık isteği gönderildi';
  @override
  String alreadyFriendsWith(String username) => '@$username ile zaten arkadaşsınız.';
  @override
  String requestAlreadyPending(String username) => '@$username ile zaten bekleyen bir istek var.';
  @override
  String userNotFoundMsg(String username) => '@$username kullanıcısı bulunamadı.';
  @override
  String cannotSendRequest(String username) => '@$username kişisine istek gönderemezsiniz.';
  @override
  String get somethingWentWrong => 'Bir şeyler ters gitti. Lütfen tekrar deneyin.';
  @override
  String friendRequestAccepted(String username) => '@$username kişisinden gelen arkadaşlık isteği kabul edildi';
  @override
  String requestDeclined(String username) => '@$username kişisinden gelen istek reddedildi';
  @override
  String get deleteAccountTitle => 'Hesabı sil';
  @override
  String get deleteAccountBody => 'Bu işlem hesabınızı, mesajlarınızı, arkadaşlarınızı ve tüm ilgili verileri kalıcı olarak siler. Bu işlem geri alınamaz.';
  @override
  String get deletePermanently => 'Kalıcı olarak sil';
  @override
  String get couldNotDeleteAccount => 'Hesap silinemedi. Lütfen tekrar deneyin.';
  @override
  String get removeFriendTitle => 'Arkadaşı kaldır';
  @override
  String removeFriendConfirm(String username) => '@$username kişisini arkadaş listesinden kaldırmak istiyor musunuz?';
  @override
  String get remove => 'Kaldır';
  @override
  String friendRemoved(String username) => '@$username arkadaş listesinden kaldırıldı';
  @override
  String get noFriendsYet => 'Henüz arkadaş yok';
  @override
  String get noFriendsSub => 'Sağ üstteki düğmeyi kullanarak birini ekleyin.';
  @override
  String get noPendingRequests => 'Bekleyen istek yok';
  @override
  String get requestsAppearHere => 'Arkadaşlık istekleri burada görünecek.';
  @override
  String onlineFriendsLabel(int count) => 'ÇEVRİMİÇİ — $count';
  @override
  String offlineFriendsLabel(int count) => 'ÇEVRİMDIŞI — $count';
  @override
  String get couldNotUpdateVisibility => 'Görünürlük güncellenemedi. Tekrar deneyin.';
  @override
  String get aboutMe => 'Hakkımda';
  @override
  String get linkedAccountsTitle => 'Bağlı hesaplar';
  @override
  String get linkAccountsHint => 'Minecraft hesaplarınızı profilinizde göstermek için bağlayın.';
  @override
  String get unlinkXboxTitle => 'Xbox hesabının bağlantısını kaldır';
  @override
  String removeLabelConfirm(String label) => '$label bağlı hesaplardan kaldırılsın mı?';
  @override
  String get unlinkJavaTitle => 'Java Edition bağlantısını kaldır';
  @override
  String removeJavaConfirm(String username) => '$username bağlı hesaplardan kaldırılsın mı?';
  @override
  String get unlink => 'Bağlantıyı kaldır';
  @override
  String get linkXbox => 'Xbox bağla';
  @override
  String get linkJava => 'Java bağla';
  @override
  String get appearOfflineLabel => 'Çevrimdışı görün';
  @override
  String get appearOfflineOn => 'Arkadaşlar sizi çevrimdışı görüyor';
  @override
  String get appearOfflineOff => 'Arkadaşlar çevrimiçi olduğunuzda görebilir';
  @override
  String get signOut => 'Çıkış yap';
  @override
  String get profileCardTitle => 'Profil';
  @override
  String get edit => 'Düzenle';
  @override
  String get displayNameLabel => 'Görünen ad';
  @override
  String get bioLabel => 'Bio';
  @override
  String get yourNameHint => 'Adınız';
  @override
  String get bioHint => 'Kendiniz hakkında bir şeyler anlatın';
  @override
  String get avatarUrlLabel => 'Avatar URL';
  @override
  String get usernameDisplayLabel => 'Kullanıcı adı';
  @override
  String get profileUpdated => 'Profil güncellendi';
  @override
  String get findUser => 'Kullanıcı bul';
  @override
  String get signIn => 'Giriş yap';
  @override
  String get createAccount => 'Hesap oluştur';
  @override
  String get signInSubtitle => 'Arkadaş eklemek ve oturumlarınızı paylaşmak için giriş yapın.';
  @override
  String get emailAddressHint => 'E-posta adresi';
  @override
  String get passwordHint => 'Parola';
  @override
  String get forgotPassword => 'Parolanızı mı unuttunuz?';
  @override
  String get continueWithGoogle => 'Google ile devam et';
  @override
  String get alreadyHaveAccount => 'Zaten hesabınız var mı? Giriş yapın';
  @override
  String get noAccountYet => 'Henüz hesabınız yok mu? Kayıt olun';
  @override
  String get orDivider => 'veya';
  @override
  String get resetPasswordTitle => 'Parolayı sıfırla';
  @override
  String get resetPasswordBody => 'E-posta adresinizi girin, parolanızı sıfırlamak için bir bağlantı göndereceğiz.';
  @override
  String get sendLink => 'Bağlantı gönder';
  @override
  String resetLinkSent(String email) => 'Sıfırlama bağlantısı $email adresine gönderildi';
  @override
  String get noAccountForEmail => 'Bu e-posta adresi için hesap bulunamadı.';
  @override
  String get invalidEmailError => 'Geçersiz e-posta adresi.';
  @override
  String get couldNotSendResetEmail => 'Sıfırlama e-postası gönderilemedi. Lütfen tekrar deneyin.';
  @override
  String get incorrectEmailOrPassword => 'Yanlış e-posta veya parola.';
  @override
  String get emailAlreadyInUse => 'Bu e-posta adresi zaten kullanımda.';
  @override
  String get weakPassword => 'Parola en az 6 karakter olmalıdır.';
  @override
  String get googleSignInFailed => 'Google girişi başarısız. Lütfen tekrar deneyin.';
  @override
  String get appleSignInFailed => 'Apple girişi başarısız. Lütfen tekrar deneyin.';
  @override
  String get emailDifferentMethod => 'Bu e-posta ile farklı bir giriş yöntemi kullanılarak oluşturulmuş bir hesap zaten var.';
  @override
  String get enterEmailAndPassword => 'Lütfen e-posta adresinizi ve parolanızı girin.';
  @override
  String get profileNotSetUp => 'Profil henüz ayarlanmadı';
  @override
  String get chooseUsernameSubtitle => 'Arkadaş eklemek ve oturumlarınızı paylaşmak için bir kullanıcı adı seçin.';
  @override
  String get createProfile => 'Profil oluştur';
  @override
  String get chooseUniqueUsername => 'Arkadaş eklemek için benzersiz bir kullanıcı adı seçin.';
  @override
  String get usernameFieldLabel => 'Kullanıcı adı *';
  @override
  String get usernameFormatHint => '3–20 karakter · yalnızca a-z, 0-9 ve _';
  @override
  String get displayNameOptional => 'Görünen ad (isteğe bağlı)';
  @override
  String get usernameRequired => 'Lütfen bir kullanıcı adı girin.';
  @override
  String get usernameFormatError => '3–20 karakter, yalnızca küçük harf, rakam ve _';
  @override
  String get usernameTaken => 'Bu kullanıcı adı zaten alınmış.';
  @override
  String get noConnectionError => 'Bağlantı yok. Lütfen tekrar deneyin.';
  @override
  String get usernameExampleHint => 'örn. jens_mc';
  @override
  String get displayNameExampleHint => 'örn. Jens';
  @override
  String get home => 'Ana Sayfa';
  @override
  String get info => 'Bilgi';
  @override
  String get consoleConnect => 'Console Connect';
  @override
  String get consoleConnectSubtitle => 'Minecraft sunucularına bağlanın';
  @override
  String get minecraftSkins => 'Minecraft Skinleri';
  @override
  String get minecraftSkinsSubtitle => 'Java ve Bedrock skinlerini görüntüleyin ve düzenleyin';
  @override
  String get minecraftWiki => 'Minecraft Wiki';
  @override
  String get minecraftWikiSubtitle => 'Moblar, bloklar, tarifler ve daha fazlası';
  @override
  String get partnerServersLabel => 'Partner Sunucular';
  @override
  String get partnerServersSubtitle => 'Öne çıkan Minecraft sunucuları';
  @override
  String get userLookup => 'Minecraft Kullanıcı Arama';
  @override
  String get userLookupSubtitle => 'Java ve Bedrock profillerini arayın';

  @override
  String get navSkins => 'Skins';
  @override
  String get navWiki => 'Wiki';
  @override
  String get navProfile => 'Profil';

  @override
  String get skinsUpload => 'Yükle';
  @override
  String get skinsCreate => 'Oluştur';
  @override
  String get skinsSubtitle => 'Minecraft skinlerini görüntüle ve indir.';
  @override
  String get skinsSectionRecent => 'SON SKİNLER';
  @override
  String get skinsSectionMy => 'SKİNLERİM';
  @override
  String get skinsSectionYours => 'SKİNLERİN';
  @override
  String get skinsEmptyMySkins => 'Henüz kayıtlı skin yok. Bir skin oluştur veya yükle.';
  @override
  String get skinsCouldNotLoad => 'Skinler yüklenemedi';
  @override
  String skinsPageOf(int page, int total) => 'Sayfa $page / $total';
  @override
  String get skinsMustBe64 => 'Skin 64×64 piksel olmalıdır';
  @override
  String get skinsInvalidFile => 'Geçersiz görsel dosyası';
  @override
  String get skinsDownload => 'İndir';
  @override
  String get skinsEdit => 'Düzenle';
  @override
  String get skinsNoAccountsTitle => 'Bağlı hesap yok';
  @override
  String get skinsNoAccountsSubtitle => 'Skinini görmek için Profil\'de Java veya Bedrock bağla.';
  @override
  String get skinsSignInTitle => 'Skinini görmek için giriş yap';
  @override
  String get skinsSignInSubtitle => 'Hesap oluştur ve Profil\'de Java veya Bedrock bağla.';
}
