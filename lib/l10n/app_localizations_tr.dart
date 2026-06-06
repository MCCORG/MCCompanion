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
  String get nldServerLabel => 'MCCompanion SUNUCUSU';

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
  String get helpMCCompanionTitle => 'MCCompanion görünmüyor';

  @override
  String get helpMCCompanionSubtitle => 'LAN keşif sorunlarını giderme';

  @override
  String get helpMCCompanionBody => 'Sunucu konsolunuzda görünmüyorsa şu adımları deneyin:\n\n✅ Temel Kontroller:\n1. Aynı WiFi Ağı - Telefonunuz/tabletiniz ve konsolunuz AYNI WiFi ağına bağlı olmalıdır\n2. Doğru Sunucu Adresi - IP ve portu tekrar kontrol edin (varsayılan: 19132)\n3. Yayın Aktif - MCCompanion\'in \"Yayın Yapılıyor\" durumunu gösterdiğini doğrulayın\n\n🔄 Hızlı Çözümler:\n• Uygulamayı yeniden başlatın: Yayını durdurun, MCCompanion\'i tamamen kapatın, yeniden açın ve tekrar deneyin\n• Konsolunuzu yeniden başlatın: Bazen konsolun LAN oyunlarını algılaması için yenilenmesi gerekir\n• Arkadaşlar/LAN sekmesini kontrol edin: Sunucu, sunucu listesinde DEĞİL, \"Arkadaşlar\" veya \"LAN Oyunları\" altında görünür\n• Yayını başlattıktan sonra 10-15 saniye bekleyin\n• VPN\'leri devre dışı bırakın: VPN\'ler yerel yayınları engelleyebilir\n\n⚠️ Yaygın Sorunlar:\n\"Kullanıcı için rota bulunamadı\" → Her iki cihazın da aynı Wi‑Fi ağına bağlı olduğundan emin olun (Misafir ağlarından kaçının)\n\"MCCompanion aktarıcı sunucusuna bağlanılamıyor\" → İnternet bağlantınızı / aktarıcı durumunu kontrol edin\n\n📱 Hâlâ sorun mu yaşıyorsunuz? MCCompanion\'te Hata Ayıklama Modunu etkinleştirin ve kayıtları kontrol edin ya da farklı bir sunucu deneyin.';

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
  String get serverTrackerTitle => 'Sunucu Takipçisi';

  @override
  String get removeServerTitle => 'Sunucuyu kaldır';

  @override
  String removeServerConfirm(Object name) {
    return '\"$name\" adlı sunucuyu takipçinizden kaldırmak istiyor musunuz?';
  }

  @override
  String get removeServerFailed => 'Sunucu kaldırılamadı';

  @override
  String get refreshStatus => 'Durumu yenile';

  @override
  String get trackerSignInRequired => 'Giriş yapılması gerekiyor';

  @override
  String get trackerSignInSubtitle => 'Sunucuları takip etmek ve çevrimdışı bildirimler almak için giriş yapın.';

  @override
  String get signIn => 'Giriş yap';

  @override
  String get noServersTracked => 'Takip edilen sunucu yok';

  @override
  String get trackerEmptySubtitle => 'Durumunu izlemek ve bildirim almak için bir Minecraft sunucusu ekleyin.';

  @override
  String get fillAllFields => 'Lütfen tüm alanları doğru doldurun';

  @override
  String get slotUsedUpgrade => 'Ücretsiz alanınız kullanıldı. Daha fazla sunucu için yükseltin.';

  @override
  String get addServerFailed => 'Sunucu eklenemedi. Bilgilerinizi kontrol edin.';

  @override
  String get ipAddressLabel => 'IP adresi';

  @override
  String get platformLabel => 'Platform';

  @override
  String get bedrockLabel => 'Bedrock';

  @override
  String get addLabel => 'Ekle';

  @override
  String get statusOnline => 'Çevrimiçi';

  @override
  String get statusOffline => 'Çevrimdışı';

  @override
  String get statusChecking => 'Kontrol ediliyor...';

  @override
  String get notificationsOn => 'Bildirimler açık';

  @override
  String get notificationsOff => 'Bildirimler kapalı';

  @override
  String get failedUpdateNotifications => 'Bildirimler güncellenemedi';

  @override
  String get editServerTitle => 'Sunucuyu düzenle';

  @override
  String get serverNameHint => 'Sunucu adı';

  @override
  String get failedSave => 'Kaydedilemedi. Tekrar deneyin.';

  @override
  String get serverRenamed => 'Sunucu yeniden adlandırıldı';

  @override
  String get customizeLabel => 'Özelleştir';

  @override
  String get customizeSubtitle => 'Karoları yeniden sırala ve gezinmeyi özelleştir';

  @override
  String get resetLabel => 'Sıfırla';

  @override
  String get tilesSection => 'KAROLAR';

  @override
  String get dragToReorder => 'Yeniden sıralamak için sürükleyin';

  @override
  String get navigationSection => 'GEZİNME';

  @override
  String get navFixed => 'Ana Sayfa, Bağlayıcı ve Profil her zaman sabittir';

  @override
  String get leftSlot => 'Sol yuva (Ana Sayfanın yanında)';

  @override
  String get rightSlot => 'Sağ yuva (Profilin yanında)';

  @override
  String get accentColorSection => 'VURGU RENGİ';

  @override
  String get opacityLabel => 'Opaklık';

  @override
  String get backgroundSection => 'ARKA PLAN';

  @override
  String get cardsSection => 'KARTLAR';

  @override
  String get editLabel => 'Düzenle';

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
  String get reportUser => 'Kullanıcıyı rapor et';

  @override
  String get reportMessage => 'Mesajı rapor et';

  @override
  String reportUserWithName(Object name) {
    return '$name kullanıcısını rapor et';
  }

  @override
  String get reportDisclaimer => 'Raporlar ekibimiz tarafından incelenir.';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonHarassment => 'Taciz';

  @override
  String get reportReasonInappropriate => 'Uygunsuz içerik';

  @override
  String get reportReasonOther => 'Diğer';

  @override
  String get reportAdditionalDetails => 'Ek ayrıntılar (isteğe bağlı)…';

  @override
  String get reportSuccess => 'Rapor gönderildi. Teşekkürler.';

  @override
  String get reportFailed => 'Rapor gönderilemedi.';

  @override
  String get reportSubmit => 'Rapor gönder';

  @override
  String get today => 'Bugün';

  @override
  String get yesterday => 'Dün';

  @override
  String get messagePlaceholder => 'Mesaj…';

  @override
  String get noMessagesYet => 'Henüz mesaj yok.\nMerhaba deyin!';

  @override
  String get noConversationsYet => 'Henüz konuşma yok';

  @override
  String get startChatHint => 'Bir arkadaş bulun ve sohbet başlatın!';

  @override
  String get youPrefix => 'Sen';

  @override
  String get playerLookupTitle => 'Oyuncu ara';

  @override
  String get playerLookupSubtitle => 'Java veya Bedrock oyuncusu arayın';

  @override
  String get playerLookupHint => 'Kullanıcı adı girin…';

  @override
  String get playerLookupLinked => 'Bağlı hesaplar bulundu';

  @override
  String get playerLookupLabelUsername => 'Kullanıcı adı';

  @override
  String get playerLookupLabelTier => 'Kademe';

  @override
  String playerLookupCopied(Object value) {
    return '$value kopyalandı';
  }

  @override
  String get tabProfile => 'Profil';

  @override
  String get tabFriends => 'Arkadaşlar';

  @override
  String get tabRequests => 'İstekler';

  @override
  String get tabChats => 'Sohbetler';

  @override
  String get addFriend => 'Arkadaş ekle';

  @override
  String get usernameHint => 'Kullanıcı adı';

  @override
  String get send => 'Gönder';

  @override
  String friendRequestSentTo(Object name) {
    return '$name adlı kullanıcıya arkadaşlık isteği gönderildi';
  }

  @override
  String alreadyFriendsWith(Object name) {
    return '$name ile zaten arkadaşsınız';
  }

  @override
  String requestAlreadyPending(Object name) {
    return '$name için bekleyen bir istek zaten var';
  }

  @override
  String userNotFoundMsg(Object name) {
    return '$name kullanıcısı bulunamadı';
  }

  @override
  String cannotSendRequest(Object name) {
    return '$name kullanıcısına istek gönderilemiyor';
  }

  @override
  String get somethingWentWrong => 'Bir şeyler ters gitti. Tekrar deneyin.';

  @override
  String friendRequestAccepted(Object name) {
    return 'Artık $name ile arkadaşsınız';
  }

  @override
  String requestDeclined(Object name) {
    return '$name kullanıcısının isteği reddedildi';
  }

  @override
  String get deleteAccountTitle => 'Hesabı sil';

  @override
  String get deleteAccountBody => 'Bu işlem hesabınızı ve tüm verilerinizi kalıcı olarak siler.';

  @override
  String get deletePermanently => 'Kalıcı olarak sil';

  @override
  String get couldNotDeleteAccount => 'Hesap silinemedi.';

  @override
  String get removeFriendTitle => 'Arkadaşı kaldır';

  @override
  String removeFriendConfirm(Object name) {
    return '$name kişisini arkadaş listenizden kaldır?';
  }

  @override
  String get remove => 'Kaldır';

  @override
  String friendRemoved(Object name) {
    return '$name arkadaş listenizden kaldırıldı';
  }

  @override
  String get emailDifferentMethod => 'Bu e-posta farklı bir yöntemle bağlı';

  @override
  String get googleSignInFailed => 'Google girişi başarısız.';

  @override
  String get appleSignInFailed => 'Apple girişi başarısız. Tekrar deneyin.';

  @override
  String get resetPasswordTitle => 'Şifreyi sıfırla';

  @override
  String get resetPasswordBody => 'Sıfırlama bağlantısı almak için e-postanızı girin.';

  @override
  String get emailAddressHint => 'E-posta adresi';

  @override
  String get sendLink => 'Bağlantı gönder';

  @override
  String resetLinkSent(Object email) {
    return '$email adresine bağlantı gönderildi';
  }

  @override
  String get noAccountForEmail => 'Bu e-posta için hesap bulunamadı';

  @override
  String get invalidEmailError => 'E-posta adresi geçerli değil';

  @override
  String get couldNotSendResetEmail => 'E-posta gönderilemedi.';

  @override
  String get enterEmailAndPassword => 'E-posta ve şifrenizi girin';

  @override
  String get incorrectEmailOrPassword => 'Yanlış e-posta veya şifre';

  @override
  String get emailAlreadyInUse => 'Bu e-posta adresi zaten kullanımda';

  @override
  String get weakPassword => 'Şifre çok zayıf.';

  @override
  String get createAccount => 'Hesap oluştur';

  @override
  String get signInSubtitle => 'Profilinize erişmek için giriş yapın.';

  @override
  String get passwordHint => 'Şifre';

  @override
  String get forgotPassword => 'Şifrenizi mi unuttunuz?';

  @override
  String get orDivider => 'veya';

  @override
  String get continueWithGoogle => 'Google ile devam et';

  @override
  String get alreadyHaveAccount => 'Hesabınız var mı? Giriş yapın';

  @override
  String get noAccountYet => 'Hesabınız yok mu? Oluşturun';

  @override
  String get profileNotSetUp => 'Profil ayarlanmamış';

  @override
  String get chooseUsernameSubtitle => 'Bağlanmak için bir kullanıcı adı seçin.';

  @override
  String get createProfile => 'Profil oluştur';

  @override
  String get findUser => 'Kullanıcı bul';

  @override
  String get couldNotUpdateVisibility => 'Görünürlük güncellenemedi';

  @override
  String get signOut => 'Çıkış yap';

  @override
  String get appearOfflineLabel => 'Çevrimdışı görün';

  @override
  String get appearOfflineOn => 'Çevrimdışı görünüyorsunuz';

  @override
  String get appearOfflineOff => 'Çevrimiçi görünüyorsunuz';

  @override
  String get unlinkXboxTitle => 'Xbox hesabı bağlantısını kes';

  @override
  String removeLabelConfirm(Object name) {
    return '$name kişisini bağlı hesaplardan kaldır?';
  }

  @override
  String get unlink => 'Bağlantıyı kes';

  @override
  String get unlinkJavaTitle => 'Java hesabı bağlantısını kes';

  @override
  String removeJavaConfirm(Object name) {
    return '$name kişisini bağlı hesaplardan kaldır?';
  }

  @override
  String get linkedAccountsTitle => 'Bağlı hesaplar';

  @override
  String get linkAccountsHint => 'Minecraft hesaplarınızı bağlayın.';

  @override
  String get linkXbox => 'Xbox\'ı bağla';

  @override
  String get linkJava => 'Java\'yı bağla';

  @override
  String get profileUpdated => 'Profil güncellendi';

  @override
  String get profileCardTitle => 'Profil';

  @override
  String get edit => 'Düzenle';

  @override
  String get displayNameLabel => 'Görünen ad';

  @override
  String get yourNameHint => 'Adınız';

  @override
  String get bioLabel => 'Biyografi';

  @override
  String get bioHint => 'Kendinizden bahsedin…';

  @override
  String get avatarUrlLabel => 'Avatar URL';

  @override
  String get usernameDisplayLabel => 'Kullanıcı adı';

  @override
  String get aboutMe => 'Hakkımda';

  @override
  String get noFriendsYet => 'Henüz arkadaş yok';

  @override
  String get noFriendsSub => 'Arkadaş ekleyerek onları burada görün.';

  @override
  String onlineFriendsLabel(Object count) {
    return '$count çevrimiçi';
  }

  @override
  String offlineFriendsLabel(Object count) {
    return '$count çevrimdışı';
  }

  @override
  String get noPendingRequests => 'Bekleyen istek yok';

  @override
  String get requestsAppearHere => 'Yeni arkadaşlık istekleri burada görünecek.';

  @override
  String get skinsEdit => 'Düzenle';

  @override
  String get skinsNoAccountsTitle => 'Minecraft hesabı bağlı değil';

  @override
  String get skinsNoAccountsSubtitle => 'Skinlerinizi görmek için bir hesap bağlayın.';

  @override
  String get skinsSignInTitle => 'Skinleri görmek için giriş yapın';

  @override
  String get skinsSignInSubtitle => 'Skinlerinizi görmek için giriş yapın.';

  @override
  String get skinsMustBe64 => 'Skin 64×64 piksel olmalıdır';

  @override
  String get skinsInvalidFile => 'Geçersiz resim dosyası';

  @override
  String get skinsUpload => 'Yükle';

  @override
  String get skinsCreate => 'Oluştur';

  @override
  String get skinsSectionRecent => 'SON SKİNLER';

  @override
  String get skinsSectionMy => 'KENDİ SKİNLERİM';

  @override
  String get skinsEmptyMySkins => 'Henüz skin yok. Bir tane yükleyin!';

  @override
  String get skinsSectionYours => 'SKİNLERİNİZ';

  @override
  String get skinsCouldNotLoad => 'Skinler yüklenemedi';

  @override
  String skinsPageOf(Object page, Object total) {
    return 'Sayfa $page / $total';
  }

  @override
  String get skinsDownload => 'İndir';

  @override
  String get wikiTitle => 'Wiki';

  @override
  String get wikiMinecraftWiki => 'Minecraft Wiki';

  @override
  String get wikiSearchHint => 'Wiki\'de ara…';

  @override
  String get wikiCouldNotLoadPages => 'Sayfalar yüklenemedi.';

  @override
  String get wikiCouldNotReach => 'Wiki\'ye ulaşılamadı.';

  @override
  String wikiNoResults(Object query) {
    return '\"$query\" için sonuç bulunamadı';
  }

  @override
  String get wikiNoPagesFound => 'Sayfa bulunamadı';

  @override
  String wikiCategories(Object count) {
    return '$count kategori';
  }

  @override
  String get wikiCouldNotLoadContent => 'İçerik yüklenemedi.';

  @override
  String get wikiOpenInBrowser => 'Tarayıcıda aç';

  @override
  String get wikiCrafting => 'Üretim';

  @override
  String get wikiReadFullArticle => 'Tam makaleyi oku';

  @override
  String get wikiMobs => 'Yaratıklar';

  @override
  String get wikiBlocks => 'Bloklar';

  @override
  String get wikiItems => 'Eşyalar';

  @override
  String get wikiBiomes => 'Biyomlar';

  @override
  String get wikiStructures => 'Yapılar';

  @override
  String get wikiEnchantments => 'Büyüler';

  @override
  String get wikiPotions => 'İksirler';

  @override
  String get wikiPassive => 'Pasif';

  @override
  String get wikiNeutral => 'Tarafsız';

  @override
  String get wikiHostile => 'Düşman';

  @override
  String get wikiBoss => 'Boss';

  @override
  String get wikiUtility => 'Faydalı';

  @override
  String get wikiNatural => 'Doğal';

  @override
  String get wikiOres => 'Cevherler';

  @override
  String get wikiWood => 'Ahşap';

  @override
  String get wikiStone => 'Taş';

  @override
  String get wikiRedstone => 'Kırmızıtaş';

  @override
  String get wikiPlants => 'Bitkiler';

  @override
  String get wikiDecoration => 'Dekorasyon';

  @override
  String get wikiTools => 'Aletler';

  @override
  String get wikiSwords => 'Kılıçlar';

  @override
  String get wikiRanged => 'Menzilli';

  @override
  String get wikiArmor => 'Zırh';

  @override
  String get wikiFood => 'Yiyecek';

  @override
  String get wikiBrewing => 'Demleme';

  @override
  String get wikiMaterials => 'Malzemeler';

  @override
  String get wikiOverworld => 'Üst Dünya';

  @override
  String get wikiNether => 'Nether';

  @override
  String get wikiTheEnd => 'Son';

  @override
  String get wikiSword => 'Kılıç';

  @override
  String get wikiTool => 'Alet';

  @override
  String get wikiBow => 'Yay';

  @override
  String get wikiFishing => 'Balıkçılık';

  @override
  String get wikiStatusEffects => 'Durum efektleri';

  @override
  String get chooseUniqueUsername => 'Başlamak için benzersiz bir kullanıcı adı seç.';

  @override
  String get usernameFieldLabel => 'Kullanıcı adı';

  @override
  String get usernameExampleHint => 'örn. CoolPlayer123';

  @override
  String get usernameFormatHint => '3–20 karakter · harf, rakam ve alt çizgi';

  @override
  String get displayNameOptional => 'Görünen ad (isteğe bağlı)';

  @override
  String get displayNameExampleHint => 'örn. Harika Oyuncu';

  @override
  String get usernameRequired => 'Kullanıcı adı gerekli';

  @override
  String get usernameFormatError => 'Kullanıcı adı 3–20 karakter olmalı ve yalnızca harf, rakam ve alt çizgi içerebilir';

  @override
  String get usernameTaken => 'Bu kullanıcı adı zaten kullanımda';

  @override
  String get noConnectionError => 'Bağlantı yok. İnternet bağlantını kontrol et ve tekrar dene.';

  @override
  String get home => 'Ana Sayfa';

  @override
  String get info => 'Bilgi';

  @override
  String get navProfile => 'Profil';

  @override
  String serverRemoved(Object name) {
    return '$name kaldırıldı';
  }

  @override
  String serverAdded(Object name) {
    return '$name eklendi';
  }

  @override
  String get paywallRestore => 'Geri yükle';

  @override
  String get paywallMonthly => 'Aylık';

  @override
  String get paywallYearly => 'Yıllık';

  @override
  String get paywallSavePercent => '~%17 tasarruf';

  @override
  String get paywallSubtitle => 'Daha fazla sunucu takip edin ve bildirim alın.';

  @override
  String paywallSlotLabel(Object slots) {
    return '$slots sunucu slotu';
  }

  @override
  String get paywallPopular => 'Popüler';

  @override
  String get paywallContinue => 'Devam et';

  @override
  String get paywallNoPkgs => 'Paket yok.';

  @override
  String get paywallManaged => 'Apple/Google tarafından yönetilir. İstediğiniz zaman iptal edin.';

  @override
  String get paywallPurchaseSuccess => 'Satın alma başarılı!';

  @override
  String get paywallPurchaseFailed => 'Satın alma başarısız.';

  @override
  String get paywallPurchasesRestored => 'Satın almalar geri yüklendi!';

  @override
  String get paywallNoActivePurchases => 'Aktif satın alma bulunamadı.';

  @override
  String get paywallRestoreFailed => 'Geri yükleme başarısız.';

  @override
  String get relay => 'Relay';

  @override
  String get selectModeSection => 'MOD SEÇ';

  @override
  String get serversSection => 'SUNUCULAR';

  @override
  String get noServerSelected => 'Sunucu seçilmedi';

  @override
  String get selectBedrockAccount => 'Bedrock hesabı seç';

  @override
  String playersCount(Object players, Object max) {
    return '$players / $max oyuncu';
  }

  @override
  String get infoAndLegal => 'Bilgi ve Hukuki';

  @override
  String get legalSection => 'Hukuki';

  @override
  String get privacyPolicy => 'Gizlilik Politikası';

  @override
  String get privacyPolicySubtitle => 'Verilerinizi nasıl koruyoruz';

  @override
  String get termsOfService => 'Hizmet Şartları';

  @override
  String get termsOfServiceSubtitle => 'Kullanım kuralları ve koşulları';

  @override
  String get dataSourcesSection => 'Veri kaynakları ve katkılar';

  @override
  String get creditMinecraftWikiSubtitle => 'Wiki özelliği için veri kaynağı. Creative Commons altında içerik.';

  @override
  String get creditMojangTitle => 'Mojang / Microsoft';

  @override
  String get creditMojangSubtitle => 'Mojang API üzerinden Java oyuncu skinleri ve profilleri.';

  @override
  String get creditGeyserTitle => 'GeyserMC';

  @override
  String get creditGeyserSubtitle => 'GeyserMC üzerinden Bedrock skin işleme.';

  @override
  String get creditXboxTitle => 'Xbox / Microsoft';

  @override
  String get creditXboxSubtitle => 'Xbox Live üzerinden Bedrock hesap bağlama.';

  @override
  String get aboutMCCompanionSection => 'MCCompanion Hakkında';

  @override
  String get aboutMCCompanionDisclaimer => 'MCCompanion, Mojang veya Microsoft ile bağlantısı olmayan bağımsız bir uygulamadır.';

  @override
  String get minecraftTrademark => '\"Minecraft\", Microsoft Corporation\'ın tescilli markasıdır.';

  @override
  String get nldServerLabelShort => 'MCCompanion Sunucu';

  @override
  String get editServer => 'Sunucuyu düzenle';

  @override
  String get serverNameExampleHint => 'Harika Sunucum';

  @override
  String get serverAddressExampleHint => 'play.example.com';

  @override
  String get serverDescriptionExampleHint => 'Arkadaşlarla hayatta kalma sunucusu';

  @override
  String get editionLabel => 'Sürüm';

  @override
  String get nameLabel => 'Ad';

  @override
  String get ipAddressFieldLabel => 'IP Adresi';

  @override
  String get portFieldLabel => 'Port';

  @override
  String get platformFieldLabel => 'Platform';

  @override
  String get nameValidationError => 'Ad 1–50 karakter olmalıdır';

  @override
  String get ipRequiredError => 'IP adresi gereklidir';

  @override
  String get portRangeError => 'Port 1 ile 65535 arasında olmalıdır';

  @override
  String get partnerServersTitle => 'Ortak sunucular';

  @override
  String get noPartnerServers => 'Henüz ortak sunucu yok.';

  @override
  String get checkBackLater => 'Daha sonra tekrar kontrol edin.';

  @override
  String get xboxLinkTitle => 'Xbox hesabını bağla';

  @override
  String get xboxStartingLogin => 'Xbox girişi başlatılıyor…';

  @override
  String get xboxSignInWithMicrosoft => 'Microsoft ile giriş yap';

  @override
  String get xboxGoToLink => 'Aşağıdaki bağlantıya gidin ve kodu girin.';

  @override
  String get xboxYourCode => 'Kodunuz';

  @override
  String get xboxTapToCopy => 'Kopyalamak için koda dokunun';

  @override
  String get xboxOpenLink => 'microsoft.com/link\'i aç';

  @override
  String get xboxWaitingForLogin => 'Giriş bekleniyor…';

  @override
  String get xboxAccountLinked => 'Xbox hesabı bağlandı!';

  @override
  String get xboxCodeCopied => 'Kod panoya kopyalandı';

  @override
  String get xboxCouldNotStart => 'Xbox girişi başlatılamadı.';

  @override
  String get xboxCodeExpired => 'Kod süresi doldu. Tekrar deneyin.';

  @override
  String get xboxSomethingWrong => 'Bir şeyler ters gitti.';

  @override
  String get tryAgain => 'Tekrar dene';

  @override
  String get publicProfileTitle => 'Profil';

  @override
  String get userNotFound => 'Kullanıcı bulunamadı';

  @override
  String get profileSectionLabel => 'Profil';

  @override
  String get displayNameRowLabel => 'Görünen ad';

  @override
  String get usernameRowLabel => 'Kullanıcı adı';

  @override
  String get lastSeenLabel => 'Son görülme';

  @override
  String get aboutSectionLabel => 'Hakkında';

  @override
  String get xboxBedrockLabel => 'Xbox / Bedrock';

  @override
  String get friendRequestSent => 'Arkadaşlık isteği gönderildi';

  @override
  String get alreadyFriendsMsg => 'Zaten arkadaşsınız.';

  @override
  String get requestAlreadyPendingMsg => 'Bekleyen bir istek var.';

  @override
  String get userNotFoundMsg2 => 'Kullanıcı bulunamadı.';

  @override
  String get cannotSendRequestMsg => 'İstek gönderilemiyor.';

  @override
  String nowFriendsWith(Object username) {
    return '@$username ile artık arkadaşsınız';
  }

  @override
  String get removeFriendButton => 'Arkadaşı kaldır';

  @override
  String get requestSentButton => 'İstek gönderildi';

  @override
  String get acceptRequestButton => 'İsteği kabul et';

  @override
  String get addFriendButton => 'Arkadaş ekle';

  @override
  String get removeFriendDialogTitle => 'Arkadaşı kaldır';

  @override
  String removeFriendDialogBody(Object username) {
    return '@$username kişisini arkadaş listenizden kaldır?';
  }

  @override
  String get trackerLimitReached => 'Sunucu limitinize ulaştınız. Daha fazlası için yükseltin.';

  @override
  String get upgradeButton => 'Yükselt';

  @override
  String get javaLinkTitle => 'Java Edition Bağla';

  @override
  String get javaStartingLogin => 'Microsoft girişi başlatılıyor…';

  @override
  String get javaSignInWithMicrosoft => 'Microsoft ile giriş yap';

  @override
  String get javaGoToLink => 'Aşağıdaki bağlantıya git ve Minecraft Java Edition hesabını bağlamak için kodu gir.';

  @override
  String get javaYourCode => 'Kodun';

  @override
  String get javaTapToCopy => 'Kopyalamak için koda dokun';

  @override
  String get javaOpenLink => 'microsoft.com/link\'i aç';

  @override
  String get javaWaitingForLogin => 'Giriş bekleniyor…';

  @override
  String get javaAccountLinked => 'Java Edition bağlandı!';

  @override
  String get javaNoJavaTitle => 'Java Edition bulunamadı';

  @override
  String get javaNoJavaBody => 'Giriş yaptığın Microsoft hesabı Minecraft Java Edition\'a sahip değil.';

  @override
  String get javaTryDifferentAccount => 'Farklı hesap dene';

  @override
  String get javaCouldNotStart => 'Microsoft girişi başlatılamadı. Tekrar deneyin.';

  @override
  String get javaCodeExpired => 'Kod süresi doldu. Tekrar deneyin.';

  @override
  String get javaSomethingWrong => 'Bir şeyler ters gitti. Tekrar deneyin.';

  @override
  String get javaCodeCopied => 'Kod panoya kopyalandı';

  @override
  String get splashFeatureConnect => 'Bağlan';

  @override
  String get splashFeatureFriends => 'Arkadaşlar';

  @override
  String get splashFeatureChat => 'Sohbet';

  @override
  String get splashFeatureSkins => 'Skinler';

  @override
  String get featureLabelConnector => 'Bağlayıcı';

  @override
  String get featureLabelSkins => 'Skinler';

  @override
  String get featureLabelWiki => 'Wiki';

  @override
  String get featureLabelPartners => 'Ortaklar';

  @override
  String get featureLabelLookup => 'Arama';

  @override
  String get featureLabelTracker => 'Sunucu Takipçisi';

  @override
  String get featureSubtitleConnector => 'Konsolları Minecraft\'a bağlayın';

  @override
  String get featureSubtitleSkins => 'Minecraft skinlerini göz atın ve yönetin';

  @override
  String get featureSubtitleWiki => 'Minecraft ansiklopedisi';

  @override
  String get featureSubtitlePartners => 'Öne çıkan sunucular';

  @override
  String get featureSubtitleLookup => 'Java ve Bedrock profillerini arayın';

  @override
  String get featureSubtitleTracker => 'Sunucu durumunu izleyin ve bildirim alın';

  @override
  String get userSearchHint => 'Kullanıcı adı, gamertag veya Java adı…';

  @override
  String get userSearchSub => 'Kullanıcı adı, Xbox gamertag veya Java adıyla ara';

  @override
  String get onlineStatus => 'Çevrimiçi';

  @override
  String get upgradeWindowsHint => 'Yükseltme Microsoft Store\'da mevcut';

  @override
  String get chatEmptyHint => 'İlk mesajı sen gönder!';

  @override
  String get skinSaved => 'Skin kaydedildi';

  @override
  String skinSavedAs(String name) {
    return '\"$name\" olarak kaydedildi';
  }

  @override
  String get skinExportFailed => 'Disa aktarma basarisiz';

  @override
  String get skinExported => 'Skin basariyla disa aktarildi';
}
