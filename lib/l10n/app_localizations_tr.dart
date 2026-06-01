// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appName => 'NetherLink';

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
    return 'Yapan: $appCreator\n\nKullanım Talimatları:\n1. Minecraft sunucu adresinizi ve portunuzu girin (varsayılan: 19132)\n   — veya daha önce kaydedilmiş bir sunucuyu açılır menüden seçin\n2. (İsteğe bağlı) Konumunuza en yakın aktarma sunucusunu (EU veya US) seçin\n3. Yayına başlamak için \"Yayına Başla\" düğmesine tıklayın\n4. Konsolunuz/cihazınızda: Minecraft > Oyna > Arkadaşlar\n5. \"NetherLink\" adlı bir LAN sunucusu görmelisiniz\n6. NetherLink üzerinden seçtiğiniz sunucunuya katılmak için üzerine tıklayın\n\nNintendo Switch (DNS modu):\n1. Bağlantı panelinde \"Nintendo Switch\"i etkinleştirin\n2. Bir  aktarma sunucusu  (EU veya US) seçin\n3. \"DNS Yapılandırmasını Gönder\" düğmesine tıklayın — bu yapılandırmanızı aktarıcıya gönderir\n   (LAN sunucusu yayınlamaz)\n4. Switch’inizde NetherLink DNS ayarlarınızı uygulayın ve NetherLink için kullandığınız sunucu girişini kullanarak katılın\n\nNotlar:\n- LAN yayını için NetherLink ve konsol aynı yerel ağda olmalıdır.\n- İpucu: En iyi performans için size en yakın aktarma sunucusunu seçin.';
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
  String get howToJavaSubtitle => 'NetherLink üzerinden Java Edition sunucularına bağlanın';

  @override
  String get aternosSubtext => 'Kendi ücretsiz Minecraft sunucunuzu oluşturun';

  @override
  String get howToJavaBody => 'Java Modu — hızlı adımlar:\n1. Uygulamada Java modunu seçin.\n2. Java Edition sunucu adresinizi ve portunuzu girin (varsayılan: 25565).\n3. \"Java Modunu Başlat\" düğmesine basın — NetherLink bağlantıyı köprüleyecektir.\n4. Minecraft Bedrock\'u açın ve Arkadaşlar sekmesine gidin.\n5. Java sunucusuna katılmak için \"NetherLink\" adlı LAN sunucusunu seçin.\n\n⚠️ Önemli uyarılar:\n- Geçerli bir Java Edition hesabı (Microsoft) gereklidir.\n- Bazı sunucular hesabınızı tespit edip yasaklayabilecek hile önleme sistemleri kullanır.\n- Bazı sunucular Bedrock istemcilerini açıkça yasaklar — her zaman sunucu kurallarını kontrol edin.\n- Bu özelliğin kullanılmasından kaynaklanabilecek hesap yasakları, askıya almalar veya hesapla ilgili diğer sorunlardan NetherLink sorumlu değildir.\n- Kendi riskinizle kullanın.';

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
  String get howToUseTitle => 'NetherLink nasıl kullanılır';

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
  String get vpnActive => 'VPN\'inizin etkin olduğunu tespit ettik.\n\nLütfen NetherLink\'i kullanmadan önce VPN\'inizi devre dışı bırakın, aksi halde LAN yayını konsolunuza ulaşmayabilir.';

  @override
  String get mobileActive => 'Tespit edildi: Mobil Veri\n\nNetherLink\'in konsolunuzla aynı ağda olması gerekir. Devam etmeden önce ev Wi‑Fi\'nize veya erişim noktanıza bağlanın.';

  @override
  String get continueAnyway => 'Yine de Devam Et';

  @override
  String get sameWifi => 'Aynı Wi‑Fi Ağı';

  @override
  String get needSameWifi => 'NetherLink\'i çalıştıran cihaz, Minecraft oynadığınız konsolla AYNI Wi‑Fi ağına bağlı OLMALIDIR.';

  @override
  String get subscription => 'Çevrim İçi Abonelik Gerekli';

  @override
  String get needSubscription => 'Her konsolun kendi etkin çevrim içi aboneliği (Xbox Live, PS Plus, NSO) olmalıdır. Aksi halde NetherLink görünmez.';

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
  String get friendModeText => 'NetherLink\'in arkadaş botlarını arkadaş olarak ekle. Arkadaş modunu başlat ve oyna';

  @override
  String get selectedRelayCheck => 'Seçilen';

  @override
  String relayFallbackWarning(Object name) {
    return 'Uyarı: Orijinal aktarıcı yanıt vermedi. Yedek aktarıcı kullanılıyor: $name';
  }

  @override
  String get relayUnableConnect => 'Hiçbir NetherLink aktarım sunucusuna bağlanılamıyor. Daha sonra tekrar deneyin veya internet bağlantınızı kontrol edin.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / vekil)';

  @override
  String get howToXboxSubtitle => 'LAN yayını veya proxy ile oyna';

  @override
  String get howToXboxBody => 'Xbox / PS4 / PS5 için bağlanma adımları:\n1. NetherLink çalıştıran cihazınızın ve konsolunuzun aynı yerel ağda olduğundan emin olun.\n2. Uygulamada Minecraft sunucu adresinizi ve portunuzu girin, ardından \"Yayına Başla\" düğmesine basın.\n3. Konsolda Minecraft → Oyna bölümünü açın, LAN Dünyaları veya Arkadaşlar sekmesini bulun ve listeyi yenileyin.\n4. Katılmak için \"NetherLink\" adlı LAN sunucusunu seçin.\nNotlar:\n- Sunucu görünmüyorsa, iki cihazın da aynı alt ağda olduğunu ve uygulamanın hâlâ yayın yaptığını doğrulayın.\n- Bazı konsol modelleri veya yönlendiriciler LAN keşfini engelleyebilir; gerekirse uygulama ya da yönlendirici ayarlarını değiştirerek tekrar deneyin.';

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
  String get howToFriendsBody => 'Arkadaş modu — hızlı adımlar:\n1. Gerekliyse NetherLink arkadaş hesabını (aktarıcı arkadaş) konsolunuza veya platformunuza ekleyin.\n2. Uygulamada Arkadaş modunu etkinleştirin ve aktarıcı yapılandırmasını gönderin (uygunsa).\n3. Konsolunuzda Minecraft → Arkadaşlar bölümünü açın ve LAN Dünyaları\'nı arayın; sunucunuz orada bir LAN dünyası olarak görünmelidir.\n4. Arkadaşlarınızla sunucunuza katılmak için onu seçin.\nNotlar:\n- Hem sizin hem de arkadaşlarınızın arkadaş görünürlüğüne izin veren aynı NAT/ayarlarına sahip olduğundan emin olun.\n- Arkadaş modu, platformun arkadaş özelliklerine dayanır ve arkadaşlık isteklerinin kabul edilmesini gerektirebilir.';

  @override
  String get helpNetherlinkTitle => 'NetherLink görünmüyor';

  @override
  String get helpNetherlinkSubtitle => 'LAN keşif sorunlarını giderme';

  @override
  String get helpNetherlinkBody => 'Sunucu konsolunuzda görünmüyorsa şu adımları deneyin:\n\n✅ Temel Kontroller:\n1. Aynı WiFi Ağı - Telefonunuz/tabletiniz ve konsolunuz AYNI WiFi ağına bağlı olmalıdır\n2. Doğru Sunucu Adresi - IP ve portu tekrar kontrol edin (varsayılan: 19132)\n3. Yayın Aktif - NetherLink\'in \"Yayın Yapılıyor\" durumunu gösterdiğini doğrulayın\n\n🔄 Hızlı Çözümler:\n• Uygulamayı yeniden başlatın: Yayını durdurun, NetherLink\'i tamamen kapatın, yeniden açın ve tekrar deneyin\n• Konsolunuzu yeniden başlatın: Bazen konsolun LAN oyunlarını algılaması için yenilenmesi gerekir\n• Arkadaşlar/LAN sekmesini kontrol edin: Sunucu, sunucu listesinde DEĞİL, \"Arkadaşlar\" veya \"LAN Oyunları\" altında görünür\n• Yayını başlattıktan sonra 10-15 saniye bekleyin\n• VPN\'leri devre dışı bırakın: VPN\'ler yerel yayınları engelleyebilir\n\n⚠️ Yaygın Sorunlar:\n\"Kullanıcı için rota bulunamadı\" → Her iki cihazın da aynı Wi‑Fi ağına bağlı olduğundan emin olun (Misafir ağlarından kaçının)\n\"NetherLink aktarıcı sunucusuna bağlanılamıyor\" → İnternet bağlantınızı / aktarıcı durumunu kontrol edin\n\n📱 Hâlâ sorun mu yaşıyorsunuz? NetherLink\'te Hata Ayıklama Modunu etkinleştirin ve kayıtları kontrol edin ya da farklı bir sunucu deneyin.';

  @override
  String get helpMultiplayerFailedTitle => 'Çok Oyunculu Bağlantı Başarısız';

  @override
  String get helpMultiplayerFailedSubtitle => 'Bunun neden bir NetherLink hatası olmadığının açıklaması';

  @override
  String get helpMultiplayerFailedBody => '⚠️ Bu, NetherLink ile ilgili bir sorun değildir!\n\nNetherLink sizi istenen sunucuya başarıyla yönlendirdi. \"Çok Oyunculu Bağlantı Başarısız\" mesajı, hedef sunucunun şu anda erişilemez olduğunu gösterir. Olası nedenler:\n\n• Hedef Minecraft sunucusu çevrimdışı veya aşırı yüklü olabilir\n• Sunucu güncel bir istemci sürümü ya da belirli bir sürüm gerektiriyor olabilir\n• Aktarıcı ile hedef sunucu arasında ağ sorunları olabilir\n\nFarklı bir sunucuya bağlanmayı deneyin veya sunucunun destek ekibiyle iletişime geçin. Sorun birden fazla sunucuda sürerse, NetherLink\'te Hata Ayıklama Modunu etkinleştirip kayıtları kontrol edin.';

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
}
