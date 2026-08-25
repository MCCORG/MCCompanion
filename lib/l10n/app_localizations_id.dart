// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'MCCompanion';

  @override
  String get console => 'Konsol';

  @override
  String get consoleOutput => 'Output Konsol';

  @override
  String get noLogsYet => 'Belum ada log';

  @override
  String get startBroadcastingToSeeOutput =>
      'Mulai siaran untuk melihat output';

  @override
  String get close => 'Tutup';

  @override
  String get ok => 'OK';

  @override
  String get back => 'Kembali';

  @override
  String get next => 'Lanjut';

  @override
  String get done => 'Selesai';

  @override
  String get none => 'Tidak ada';

  @override
  String get onboardingThemeTitle => 'Pilih tema';

  @override
  String get onboardingThemeSubtitle =>
      'Kamu bisa menyesuaikan setiap warna di pengaturan nanti.';

  @override
  String get onboardingNavTitle => 'Akses cepat';

  @override
  String get onboardingNavSubtitle =>
      'Pilih dua fitur untuk bilah navigasi kamu.';

  @override
  String get onboardingNavLeftLabel => 'TOMBOL KIRI';

  @override
  String get onboardingNavRightLabel => 'TOMBOL KANAN';

  @override
  String get onboardingNavPreviewHome => 'Beranda';

  @override
  String get onboardingNavPreviewConnector => 'Konektor';

  @override
  String get onboardingNavPreviewProfile => 'Profil';

  @override
  String get onboardingNavPreviewEmpty => 'Kosong';

  @override
  String get onboardingStartTitle => 'Halaman awal';

  @override
  String get onboardingStartSubtitle =>
      'Aplikasi terbuka di sini setiap kali diluncurkan.';

  @override
  String get onboardingCustomizeDetail => 'Kustomisasi lebih lanjut →';

  @override
  String get startPageHome => 'Beranda';

  @override
  String get startPageHomeSubtitle => 'Tampilkan layar beranda dengan ubin';

  @override
  String get startPageFeature => 'Fitur';

  @override
  String get startPageFeatureSubtitle => 'Buka langsung ke halaman tertentu';

  @override
  String get startPageSectionLabel => 'HALAMAN AWAL';

  @override
  String get joinUs => 'Gabung dengan Kami';

  @override
  String get more => 'Lainnya';

  @override
  String get website => 'Situs Web';

  @override
  String get howToUseMenu => 'Cara menggunakan';

  @override
  String get support => 'Dukungan';

  @override
  String helpText(Object appCreator) {
    return 'Dibuat oleh $appCreator.\r\n\r\nCara menggunakan:\r\n1. Masukkan alamat dan port server Minecraft Anda (default: 19132)\r\n  , atau pilih server yang sebelumnya disimpan dari menu dropdown\r\n2. (Opsional) Pilih Server Relay (EU atau US) yang paling dekat dengan lokasi Anda\r\n3. Klik \"Mulai Siaran\" untuk memulai\r\n4. Di konsol/perangkat Anda: Minecraft > Play > Friends\r\n5. Anda akan melihat server LAN bernama \"MCCompanion\"\r\n6. Klik server tersebut untuk bergabung ke server eksternal Anda melalui MCCompanion\r\n\r\nNintendo Switch (mode DNS):\r\n1. Aktifkan \"Nintendo Switch\" di panel koneksi\r\n2. Pilih Server Relay (EU atau US)\r\n3. Klik \"Send DNS Config\": ini mengirim konfigurasi Anda ke relay\r\n   (ini TIDAK menyiarkan server LAN)\r\n4. Di Switch Anda, terapkan pengaturan DNS MCCompanion lalu bergabung\r\n   menggunakan entri server yang Anda pakai untuk MCCompanion\r\n\r\nCatatan:\r\n- Untuk siaran LAN, MCCompanion dan konsol harus berada di jaringan lokal yang sama.\r\n- Tips: Pilih server relay yang paling dekat dengan Anda untuk performa terbaik.';
  }

  @override
  String get serverDetailsLabel => 'Detail Server';

  @override
  String get start => 'Mulai';

  @override
  String get stop => 'Berhenti';

  @override
  String get labelJava => 'Java';

  @override
  String get startJavaMode => 'Mulai Mode Java';

  @override
  String get javaInfoTitle => 'Mode Java';

  @override
  String get javaInfoText => 'Hubungkan ke server Java Edition';

  @override
  String get howToJavaTitle => 'Mode Java';

  @override
  String get howToJavaSubtitle =>
      'Hubungkan ke server Java Edition melalui MCCompanion';

  @override
  String get aternosSubtext => 'Buat server Minecraft gratis Anda sendiri';

  @override
  String get howToJavaBody =>
      'Mode Java: langkah cepat:\n1. Di aplikasi, pilih mode Java.\n2. Masukkan alamat dan port server Java Edition Anda (default: 25565).\n3. Tekan \"Mulai Mode Java\": MCCompanion akan menjembatani koneksi.\n4. Buka Minecraft Bedrock dan masuk ke tab Teman.\n5. Pilih server LAN bernama \"MCCompanion\" untuk bergabung ke server Java.\n\n⚠️ Peringatan penting:\n- Diperlukan akun Java Edition yang valid (Microsoft).\n- Beberapa server menggunakan sistem anti-cheat yang dapat mendeteksi dan memblokir akun Anda.\n- Beberapa server secara eksplisit melarang klien Bedrock, selalu periksa aturan server.\n- MCCompanion tidak bertanggung jawab atas ban akun, penangguhan, atau masalah terkait akun lainnya yang mungkin terjadi akibat penggunaan fitur ini.\n- Gunakan dengan risiko Anda sendiri.';

  @override
  String get language => 'Indonesia';

  @override
  String get discord => 'Discord';

  @override
  String get toggleDebug => 'Alihkan debug';

  @override
  String get copyLogs => 'Salin log';

  @override
  String get clear => 'Bersihkan';

  @override
  String get cancel => 'Batal';

  @override
  String get deleteServer => 'Hapus Server';

  @override
  String get delete => 'Hapus';

  @override
  String get myServers => 'Server Saya';

  @override
  String get quickAccessServers => 'Server akses cepat';

  @override
  String get addServer => 'Tambah Server';

  @override
  String get addServersHint => 'Tambahkan server agar cepat terhubung nanti';

  @override
  String get serverNameLabel => 'Nama Server *';

  @override
  String get addressLabel => 'Alamat *';

  @override
  String get portLabel => 'Port *';

  @override
  String get descriptionLabel => 'Deskripsi (Opsional)';

  @override
  String get save => 'Simpan';

  @override
  String get initializing => 'Memulai...';

  @override
  String get createdBy => 'Dibuat oleh NetherDev';

  @override
  String get bedrockBridge => 'Jembatan Bedrock';

  @override
  String get clientDisconnected => 'Klien terputus: Siaran dihentikan';

  @override
  String get pleaseEnterServer => '⚠️ Harap masukkan alamat server';

  @override
  String get invalidPort => '⚠️ Nomor port tidak valid (1-65535)';

  @override
  String get dataSentToServers => 'Data dikirim ke server MCCompanion';

  @override
  String get broadcastingStarted => 'Siaran dimulai';

  @override
  String get broadcastStopped => 'Siaran dihentikan';

  @override
  String selectedServer(Object name) {
    return '📋 Dipilih: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'Dipilih: $name';
  }

  @override
  String get noLogsToCopy => 'Tidak ada log untuk disalin';

  @override
  String copiedLogs(Object count) {
    return '$count entri log disalin ke clipboard';
  }

  @override
  String get debugEnabled => 'Log debug diaktifkan';

  @override
  String get debugDisabled => 'Log debug dinonaktifkan';

  @override
  String get howToUseTitle => 'Cara menggunakan MCCompanion';

  @override
  String get iUnderstand => 'Saya mengerti';

  @override
  String get playOnSwitchTitle => 'Main di Nintendo Switch';

  @override
  String get playWithFriendsTitle => 'Main dengan Teman';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'Dipilih: $relayName\r\n\r\nCara terhubung:\r\n1. Buka Pengaturan Switch Anda dan ubah DNS menjadi: $relayIp\r\n2. Buka Minecraft dan pilih server dari daftar (seperti Cubecraft atau Hive).\r\n3. Sekarang Anda akan otomatis dikirim ke server Anda sendiri.';
  }

  @override
  String playInstructionsFriends(Object friend) {
    return 'Cara terhubung:\r\n1. Di konsol Anda, tambahkan $friend sebagai teman.\r\n2. Buka Minecraft dan masuk ke tab Friends.\r\n3. Cari server Anda di LAN Worlds lalu pilih untuk bergabung.';
  }

  @override
  String get nldServerLabel => 'SERVER MCCompanion';

  @override
  String selectRelayLabel(Object name) {
    return 'Pilih relay $name';
  }

  @override
  String get noSavedServers => 'Tidak ada server tersimpan';

  @override
  String get savedServers => 'Server tersimpan';

  @override
  String get serverAddressHint => 'Alamat Server';

  @override
  String get portHint => 'Port';

  @override
  String get manageServers => 'Kelola server';

  @override
  String get manageServersTooltip => 'Kelola server';

  @override
  String get noServerYet =>
      'Belum ada server tersimpan.\nKetuk Kelola untuk menambahkan satu.';

  @override
  String get serverNotSelected => 'Belum ada server yang dipilih';

  @override
  String get ready => 'Siap';

  @override
  String get active => 'Aktif';

  @override
  String get vpnDetected => 'VPN terdeteksi';

  @override
  String get noWifi => 'Tidak di Wi‑Fi';

  @override
  String get vpnActive =>
      'Kami mendeteksi VPN Anda aktif.\n\nMatikan VPN sebelum menggunakan MCCompanion, jika tidak siaran LAN mungkin tidak akan mencapai konsol Anda.';

  @override
  String get mobileActive =>
      'Terdeteksi: Data Seluler\n\nMCCompanion harus berada di jaringan yang sama dengan konsol Anda. Sambungkan ke Wi‑Fi rumah atau hotspot sebelum melanjutkan.';

  @override
  String get continueAnyway => 'Tetap lanjutkan';

  @override
  String get sameWifi => 'Jaringan Wi‑Fi yang sama';

  @override
  String get needSameWifi =>
      'Perangkat yang menjalankan MCCompanion HARUS berada di jaringan Wi‑Fi yang sama dengan konsol tempat Anda bermain Minecraft.';

  @override
  String get subscription => 'Langganan online diperlukan';

  @override
  String get needSubscription =>
      'Setiap konsol memerlukan langganan online aktifnya sendiri (Xbox Live, PS Plus, NSO). Tanpa itu, MCCompanion tidak akan muncul.';

  @override
  String get updateAvailable => 'Pembaruan tersedia';

  @override
  String get newVersion =>
      'Versi baru aplikasi tersedia.\nPerbarui sekarang untuk mendapatkan fitur dan perbaikan terbaru.';

  @override
  String get later => 'Nanti';

  @override
  String get updateNow => 'Perbarui sekarang';

  @override
  String get beforeYouStart => 'SEBELUM MEMULAI';

  @override
  String get stopBroadcasting => 'Hentikan Siaran';

  @override
  String get startNintendoMode => 'Mulai Mode Nintendo';

  @override
  String get startFriendsMode => 'Mulai Mode Teman';

  @override
  String get startBroadcasting => 'Mulai Siaran';

  @override
  String get modeLabel => 'Mode';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'Teman';

  @override
  String get nintendoInfoTitle => 'Mode DNS Nintendo Switch';

  @override
  String get nintendoInfoText =>
      'Mulai dalam mode Nintendo, atur DNS Anda, dan gabung ke server unggulan.';

  @override
  String get friendModeTitle => 'Mode Teman';

  @override
  String get friendModeText =>
      'Tambahkan bot teman MCCompanion sebagai teman. Mulai mode Teman dan bermain';

  @override
  String get selectedRelayCheck => 'Dipilih';

  @override
  String relayFallbackWarning(Object name) {
    return 'Peringatan: relay asli tidak merespons. Relay cadangan yang digunakan: $name';
  }

  @override
  String get relayUnableConnect =>
      'Tidak dapat terhubung ke server relay MCCompanion mana pun. Coba lagi nanti atau periksa internet Anda.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / Proksi)';

  @override
  String get howToXboxSubtitle => 'Main melalui siaran LAN atau proxy';

  @override
  String get howToXboxBody =>
      'Cara terhubung (Xbox / PS4 / PS5):\r\n1. Pastikan perangkat yang menjalankan MCCompanion dan konsol Anda berada di jaringan lokal yang sama.\r\n2. Di aplikasi, masukkan alamat dan port server Minecraft Anda lalu tekan \"Mulai Siaran\".\r\n3. Di konsol, buka Minecraft → Play → cari LAN Worlds atau tab Friends lalu segarkan daftar.\r\n4. Pilih server LAN bernama \"MCCompanion\" untuk bergabung.\r\nCatatan:\r\n- Jika server tidak muncul, pastikan kedua perangkat berada di subnet yang sama dan aplikasi masih menyiarkan.\r\n- Beberapa model konsol atau router dapat memblokir penemuan LAN; coba ubah pengaturan aplikasi atau router jika perlu.';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (mode DNS)';

  @override
  String get howToNintendoSubtitle => 'Petunjuk relay DNS untuk Switch';

  @override
  String get howToNintendoBody =>
      'Nintendo Switch: mode DNS (langkah demi langkah):\r\n1. Di aplikasi, aktifkan mode \"Nintendo\" dan pilih Server Relay (EU atau US).\r\n2. Ketuk \"Send DNS Config\" untuk mengirim IP DNS ke relay.\r\n3. Di Nintendo Switch Anda buka System Settings → Internet → Internet Settings → (jaringan Anda) → Change Settings → DNS lalu atur Primary DNS ke IP relay.\r\n4. Buka Minecraft dan gabung ke server publik; Anda akan diarahkan ke server Anda menggunakan DNS relay.\r\nCatatan:\r\n- Mode DNS tidak menyiarkan server LAN; mode ini mengarahkan lalu lintas game melalui relay.\r\n- Kembalikan DNS Anda setelah selesai jika Anda memerlukan perilaku jaringan normal.';

  @override
  String get howToFriendsTitle => 'Mode Teman';

  @override
  String get howToFriendsSubtitle => 'Undang teman dan gabung melalui LAN';

  @override
  String get howToFriendsBody =>
      'Mode Teman: langkah cepat:\r\n1. Tambahkan akun teman MCCompanion di konsol atau platform Anda jika diperlukan.\r\n2. Di aplikasi, aktifkan mode Teman dan kirim konfigurasi relay (jika berlaku).\r\n3. Di konsol, buka Minecraft → Friends dan cari LAN Worlds, server Anda seharusnya muncul di sana sebagai dunia LAN.\r\n4. Pilih server tersebut untuk bergabung ke server Anda bersama teman.\r\nCatatan:\r\n- Pastikan Anda dan teman Anda memiliki NAT/pengaturan yang sama yang memungkinkan kehadiran teman.\r\n- Mode Teman bergantung pada fitur pertemanan platform dan mungkin memerlukan penerimaan permintaan pertemanan.';

  @override
  String get helpMCCompanionTitle => 'MCCompanion tidak muncul';

  @override
  String get helpMCCompanionSubtitle => 'Pemecahan masalah penemuan LAN';

  @override
  String get helpMCCompanionBody =>
      'Jika server tidak muncul di konsol Anda, coba langkah-langkah berikut:\r\n\r\n✅ Pemeriksaan Dasar:\r\n1. Jaringan WiFi yang Sama - Ponsel/tablet dan konsol Anda HARUS berada di WiFi yang sama\r\n2. Alamat Server yang Benar - Periksa kembali IP dan port (default: 19132)\r\n3. Siaran Aktif - Pastikan MCCompanion menampilkan status \"Menyiarkan\"\r\n\r\n🔄 Perbaikan Cepat:\r\n• Mulai ulang aplikasi: hentikan siaran, tutup MCCompanion sepenuhnya, buka lagi, lalu coba kembali\r\n• Mulai ulang konsol Anda: terkadang konsol perlu disegarkan untuk mendeteksi game LAN\r\n• Periksa tab Friends/LAN: server muncul di bawah \"Friends\" atau \"LAN Games\", BUKAN di daftar server\r\n• Tunggu 10-15 detik setelah memulai siaran\r\n• Nonaktifkan VPN: VPN dapat memblokir siaran lokal\r\n\r\n⚠️ Masalah Umum:\r\n\"No route found for user\" → Pastikan kedua perangkat berada di Wi‑Fi yang sama (hindari jaringan tamu)\r\n\"Unable to connect to MCCompanion relay server\" → Periksa internet / status relay Anda\r\n\r\n📱 Masih bermasalah? Aktifkan Mode Debug di MCCompanion dan periksa log, atau coba server lain.';

  @override
  String get helpMultiplayerFailedTitle => 'Koneksi Multiplayer Gagal';

  @override
  String get helpMultiplayerFailedSubtitle =>
      'Penjelasan mengapa ini bukan kesalahan MCCompanion';

  @override
  String get helpMultiplayerFailedBody =>
      '⚠️ Ini bukan masalah pada MCCompanion!\r\n\r\nMCCompanion berhasil mengarahkan Anda ke server yang diminta. Pesan \"Multiplayer Connection Failed\" menunjukkan bahwa server tujuan saat ini tidak dapat dijangkau. Kemungkinan alasan:\r\n\r\n• Server Minecraft tujuan sedang offline atau kelebihan beban\r\n• Server memerlukan versi klien yang diperbarui atau edisi tertentu\r\n• Masalah jaringan antara relay dan server tujuan\r\n\r\nCoba hubungkan ke server lain atau hubungi dukungan server tersebut. Jika masalah tetap terjadi pada beberapa server, aktifkan Mode Debug di MCCompanion dan periksa log.';

  @override
  String get helpNintendoDnsTitle => 'DNS Nintendo tidak berfungsi';

  @override
  String get helpNintendoDnsSubtitle => 'Masalah DNS / relay umum';

  @override
  String get helpNintendoDnsBody =>
      'Jika mode DNS Nintendo tidak berfungsi, periksa hal berikut:\r\n\r\n1. Pastikan Anda mengirim konfigurasi DNS dari aplikasi (Send DNS Config).\r\n2. Pastikan Anda menerapkan IP relay sebagai DNS Utama di Switch.\r\n3. Pastikan server relay yang dipilih (EU/US) sedang online dan tidak kelebihan beban.\r\n4. Beberapa jaringan (misalnya captive portal) mencegah DNS kustom, uji di jaringan lain.\r\n\r\nJika masalah berlanjut, aktifkan Mode Debug dan periksa log atau coba alternatif mode Teman.';

  @override
  String get helpFriendsModeTitle => 'Mode Teman tidak berfungsi';

  @override
  String get helpFriendsModeSubtitle => 'Masalah pertemanan umum';

  @override
  String get helpFriendsModeBody =>
      'Tips pemecahan masalah mode Teman:\r\n\r\n1. Pastikan akun teman relay sudah ditambahkan/diterima di konsol (jika diperlukan).\r\n2. Coba mulai ulang game dan segarkan tab Friends/LAN setelah mengaktifkan mode Teman.\r\n\r\nJika server masih tidak muncul untuk teman, aktifkan Mode Debug dan periksa log untuk mengidentifikasi kesalahan.';

  @override
  String get changeLanguageTitle => 'Ganti bahasa';

  @override
  String get changeLanguage => 'Bahasa';

  @override
  String get useSystemLanguage => 'Gunakan bahasa sistem';

  @override
  String get couldNotOpenUrl => 'Tidak dapat membuka URL';

  @override
  String get serverTrackerTitle => 'Pelacak Server';

  @override
  String get removeServerTitle => 'Hapus server';

  @override
  String removeServerConfirm(Object name) {
    return 'Hapus \"$name\" dari pelacak Anda?';
  }

  @override
  String get removeServerFailed => 'Gagal menghapus server';

  @override
  String get refreshStatus => 'Perbarui status';

  @override
  String get trackerSignInRequired => 'Masuk diperlukan';

  @override
  String get trackerSignInSubtitle =>
      'Masuk untuk melacak server dan menerima notifikasi offline.';

  @override
  String get signIn => 'Masuk';

  @override
  String get noServersTracked => 'Tidak ada server yang dilacak';

  @override
  String get trackerEmptySubtitle =>
      'Tambahkan server Minecraft untuk memantau statusnya dan menerima notifikasi.';

  @override
  String get fillAllFields => 'Harap isi semua kolom dengan benar';

  @override
  String get slotUsedUpgrade =>
      'Slot gratis Anda sudah digunakan. Upgrade untuk lebih banyak server.';

  @override
  String get addServerFailed =>
      'Gagal menambahkan server. Periksa detail Anda.';

  @override
  String get ipAddressLabel => 'Alamat IP';

  @override
  String get platformLabel => 'Platform';

  @override
  String get bedrockLabel => 'Bedrock';

  @override
  String get addLabel => 'Tambah';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusChecking => 'Memeriksa...';

  @override
  String get notificationsOn => 'Notifikasi aktif';

  @override
  String get notificationsOff => 'Notifikasi nonaktif';

  @override
  String get failedUpdateNotifications => 'Gagal memperbarui notifikasi';

  @override
  String get editServerTitle => 'Edit server';

  @override
  String get serverNameHint => 'Nama server';

  @override
  String get failedSave => 'Gagal menyimpan. Coba lagi.';

  @override
  String get serverRenamed => 'Server diubah namanya';

  @override
  String get customizeLabel => 'Sesuaikan';

  @override
  String get customizeSubtitle => 'Atur ulang ubin dan sesuaikan navigasi';

  @override
  String get resetLabel => 'Atur ulang';

  @override
  String get tilesSection => 'UBIN';

  @override
  String get dragToReorder => 'Seret untuk mengatur ulang';

  @override
  String get navigationSection => 'NAVIGASI';

  @override
  String get navFixed => 'Beranda, Konektor, dan Profil selalu tetap';

  @override
  String get leftSlot => 'Slot kiri (di sebelah Beranda)';

  @override
  String get rightSlot => 'Slot kanan (di sebelah Profil)';

  @override
  String get tileWideTooltipRemove => 'Hapus tata letak lebar';

  @override
  String get tileWideTooltipAdd => 'Jadikan ubin lebar';

  @override
  String get tileVisibilityShow => 'Tampilkan ubin';

  @override
  String get tileVisibilityHide => 'Sembunyikan ubin';

  @override
  String get tileVisibilityMin => 'Tidak dapat disembunyikan (ubin terakhir)';

  @override
  String get colorPickerApply => 'Terapkan';

  @override
  String get colorPickerHex => 'Hex';

  @override
  String get textColorSection => 'WARNA TEKS';

  @override
  String get textColorPickerTitle => 'Warna Teks';

  @override
  String get textColorHint => 'Ketuk lingkaran untuk memilih warna teks kustom';

  @override
  String get textColorPreviewPrimary => 'Utama';

  @override
  String get textColorPreviewSecondary => 'Sekunder';

  @override
  String get textColorPreviewMuted => 'Redup';

  @override
  String get colorSwatchCustom => 'Kustom';

  @override
  String get accentColorSection => 'WARNA AKSEN';

  @override
  String get opacityLabel => 'Opasitas';

  @override
  String get backgroundSection => 'LATAR BELAKANG';

  @override
  String get cardsSection => 'KARTU';

  @override
  String get editLabel => 'Edit';

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
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String get youPrefix => 'You';

  @override
  String get playerLookupTitle => 'Player Lookup';

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
  String get tabProfile => 'Profile';

  @override
  String get tabFriends => 'Friends';

  @override
  String get tabRequests => 'Requests';

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
    return 'Jika ada akun untuk $email, tautan sedang dikirim';
  }

  @override
  String get noAccountForEmail => 'No account found for that email address';

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
  String get chooseUsernameSubtitle =>
      'Pilih username agar pemain lain bisa menemukanmu.';

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
  String get linkAccountsHint =>
      'Link your Minecraft accounts to show your skins and stats.';

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
  String get skinsNoAccountsSubtitle =>
      'Link a Java or Bedrock account to view your skins.';

  @override
  String get skinsSignInTitle => 'Sign in to view your skins';

  @override
  String get skinsSignInSubtitle =>
      'Sign in and link your Minecraft accounts to see your skins here.';

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
  String get wikiCouldNotReach =>
      'Could not reach the wiki. Check your connection.';

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
  String get wikiRecent => 'Baru dilihat';

  @override
  String get wikiFavourites => 'Favorit';

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
  String get chooseUniqueUsername => 'Pilih nama pengguna unik untuk memulai.';

  @override
  String get usernameFieldLabel => 'Nama pengguna';

  @override
  String get usernameExampleHint => 'mis. CoolPlayer123';

  @override
  String get usernameFormatHint =>
      '3–20 karakter · huruf, angka, dan garis bawah';

  @override
  String get displayNameOptional => 'Nama tampilan (opsional)';

  @override
  String get displayNameExampleHint => 'mis. Pemain Keren';

  @override
  String get usernameRequired => 'Nama pengguna diperlukan';

  @override
  String get usernameFormatError =>
      'Nama pengguna harus 3–20 karakter dan hanya boleh berisi huruf, angka, dan garis bawah';

  @override
  String get usernameTaken => 'Nama pengguna ini sudah digunakan';

  @override
  String get noConnectionError =>
      'Tidak ada koneksi. Periksa internet Anda dan coba lagi.';

  @override
  String get home => 'Beranda';

  @override
  String get info => 'Info';

  @override
  String get navProfile => 'Profil';

  @override
  String serverRemoved(Object name) {
    return '$name dihapus';
  }

  @override
  String serverAdded(Object name) {
    return '$name ditambahkan';
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
  String get privacyPolicy => 'kebijakan privasi';

  @override
  String get privacyPolicySubtitle => 'How we collect and protect your data';

  @override
  String get termsOfService => 'ketentuan layanan';

  @override
  String get termsOfServiceSubtitle => 'Rules and conditions of use';

  @override
  String get dataSourcesSection => 'Data Sources & Credits';

  @override
  String get creditMinecraftWikiSubtitle =>
      'Used as data source for the Wiki feature. Content is provided by the community under Creative Commons.';

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
  String get trackerLimitReached =>
      'You\'ve reached your server limit. Upgrade to track more servers.';

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
  String get splashFeatureConnect => 'Connect';

  @override
  String get splashFeatureFriends => 'Friends';

  @override
  String get splashFeatureChat => 'Chat';

  @override
  String get splashFeatureSkins => 'Skins';

  @override
  String get featureLabelConnector => 'Konektor';

  @override
  String get featureLabelSkins => 'Skin';

  @override
  String get featureLabelWiki => 'Wiki';

  @override
  String get featureLabelPartners => 'Mitra';

  @override
  String get featureLabelLookup => 'Cari';

  @override
  String get featureLabelTracker => 'Pelacak Server';

  @override
  String get featureSubtitleConnector => 'Hubungkan konsol ke Minecraft';

  @override
  String get featureSubtitleSkins => 'Jelajahi & kelola skin Minecraft';

  @override
  String get featureSubtitleWiki => 'Ensiklopedia Minecraft';

  @override
  String get featureSubtitlePartners => 'Server unggulan';

  @override
  String get featureSubtitleLookup => 'Cari profil Java & Bedrock';

  @override
  String get featureSubtitleTracker =>
      'Pantau status server & dapatkan notifikasi';

  @override
  String get userSearchHint => 'Nama pengguna, gamertag atau nama Java…';

  @override
  String get userSearchSub =>
      'Cari berdasarkan nama pengguna, gamertag Xbox atau nama Java';

  @override
  String get onlineStatus => 'Online';

  @override
  String get upgradeWindowsHint => 'Upgrade tersedia melalui Microsoft Store';

  @override
  String get skinSaved => 'Skin disimpan';

  @override
  String skinSavedAs(String name) {
    return 'Disimpan sebagai \"$name\"';
  }

  @override
  String get skinExportFailed => 'Ekspor gagal';

  @override
  String get skinExported => 'Skin berhasil diekspor';

  @override
  String get accountActions => 'AKUN';

  @override
  String get feedbackBugReport => 'Laporan Bug';

  @override
  String get feedbackFeatureRequest => 'Permintaan Fitur';

  @override
  String get feedbackGoesToGithub => 'Langsung dikirim ke GitHub';

  @override
  String get feedbackTitleLabel => 'Judul';

  @override
  String get feedbackTitleHintBug =>
      'contoh: Aplikasi crash saat membuka skin editor';

  @override
  String get feedbackTitleHintFeature =>
      'contoh: Tampilkan ping pemain di daftar server';

  @override
  String get feedbackWhatHappened => 'Apa yang terjadi?';

  @override
  String get feedbackDescribeIdea => 'Jelaskan ide kamu';

  @override
  String get feedbackDescHintBug =>
      'Jelaskan bug-nya: apa yang kamu lakukan, apa yang kamu harapkan, dan apa yang terjadi?';

  @override
  String get feedbackDescHintFeature =>
      'Jelaskan apa yang kamu inginkan dan mengapa itu berguna.';

  @override
  String get feedbackEmailLabel => 'Email';

  @override
  String get feedbackEmailHint => 'Agar kami bisa menghubungi kamu';

  @override
  String get feedbackEmailNote =>
      'Email kamu tidak akan pernah dibagikan secara publik.';

  @override
  String get feedbackSubmitBug => 'Kirim Laporan Bug';

  @override
  String get feedbackSubmitFeature => 'Kirim Permintaan Fitur';

  @override
  String get feedbackDisclaimer =>
      'Membuat issue publik di GitHub · Jangan sertakan kata sandi';

  @override
  String get feedbackSuccessTitle => 'Terima kasih atas masukan kamu!';

  @override
  String get feedbackSuccessBody =>
      'Terima kasih! Laporanmu sudah masuk. Kami akan segera memeriksanya.';

  @override
  String get feedbackViewOnGithub => 'Lihat di GitHub';

  @override
  String get feedbackSubmitAnother => 'Kirim lagi';

  @override
  String get feedbackBackToApp => 'Kembali ke aplikasi';

  @override
  String get feedbackTitleTooShort => 'Judul harus minimal 5 karakter.';

  @override
  String get feedbackDescTooShort => 'Deskripsi harus minimal 10 karakter.';

  @override
  String get feedbackEmailInvalid => 'Harap masukkan alamat email yang valid.';

  @override
  String get feedbackSubmitFailed => 'Gagal mengirim. Coba lagi.';

  @override
  String get feedbackTileTitle => 'Laporkan bug atau sarankan fitur';

  @override
  String get reportBug => 'Masukan';

  @override
  String get feedbackTileSubtitle => 'Bantu kami meningkatkan MCCompanion';

  @override
  String get friendsHowToStep1 => 'Buka aplikasi Xbox di ponsel atau konsolmu.';

  @override
  String get friendsHowToStep2 =>
      'Tambahkan salah satu bot di bawah ini sebagai teman di Xbox.';

  @override
  String get friendsHowToStep3 => 'Buka Minecraft dan buka tab Teman.';

  @override
  String get friendsHowToStep4 =>
      'Cari servermu di bawah Dunia LAN dan bergabung.';

  @override
  String get friendsHowToNote =>
      '⚠️ Setiap kali ingin bermain, kamu harus terlebih dahulu memulai mode Teman di aplikasi MCCompanion. Kamu bisa menutup aplikasi setelah memulai.';

  @override
  String get friendsBotLoadError =>
      '⚠️ Gagal memuat daftar bot. Coba lagi nanti.';

  @override
  String get regionEurope => 'Eropa';

  @override
  String get regionUnitedStates => 'Amerika Serikat';

  @override
  String get yourRegion => 'WILAYAH ANDA';

  @override
  String get botStatusOffline => 'Offline';

  @override
  String get botStatusFull => 'Penuh';

  @override
  String botFriendCount(Object current, Object max) {
    return '$current / $max teman';
  }

  @override
  String botCopied(Object gamertag) {
    return '$gamertag disalin';
  }

  @override
  String get copyLabel => 'Salin';

  @override
  String get skinSavedToDocuments => 'Skin disimpan ke Dokumen';

  @override
  String get skinMenuExport => 'Ekspor';

  @override
  String get skinMenuDelete => 'Hapus';

  @override
  String get rpScreenTitle => 'Paket Sumber Daya';

  @override
  String get rpWhatIsThis => 'Apa ini?';

  @override
  String get rpExplanation =>
      'Pack sumber daya mengubah tampilan Minecraft di konsol kamu, blok, warna, atau suara baru. Tempel tautan file .mcpack di bawah, aktifkan, dan simpan. MCCompanion memuat secara otomatis setiap kali kamu terhubung.';

  @override
  String get rpPackUrlLabel => 'URL Paket';

  @override
  String get rpPackUrlHint => 'https://example.com/pack.mcpack';

  @override
  String get rpEnableToggle => 'Aktifkan paket sumber daya';

  @override
  String get rpWhatWorks => 'Yang berfungsi';

  @override
  String get rpSupportedBedrockOnly =>
      'Hanya Bedrock Edition (.mcpack atau .zip)';

  @override
  String get rpSupportedBedrockOnlyHint =>
      'Pack Java tidak berfungsi di konsol.';

  @override
  String get rpSupportedTexture => 'Resource pack & texture pack';

  @override
  String get rpSupportedTextureHint =>
      'Ini didukung secara resmi dan bekerja dengan andal.';

  @override
  String get rpUnsupportedShaders => 'Shader, behavior pack, skin pack';

  @override
  String get rpUnsupportedShadersHint =>
      'Ini tidak akan dimuat di konsol melalui MCCompanion.';

  @override
  String get rpUnsupportedAddons => 'Add-on & mod UI';

  @override
  String get rpUnsupportedAddonsHint =>
      'Kadang bisa berfungsi, tetapi tidak didukung secara resmi. Gunakan dengan risiko sendiri.';

  @override
  String get rpNoDiscord =>
      'Tautan Discord: tidak ada ekstensi .mcpack dan kedaluwarsa setelah beberapa jam';

  @override
  String get rpNoDrive =>
      'Tautan berbagi Google Drive / Dropbox: bukan unduhan langsung';

  @override
  String get rpNoEncrypted =>
      'Server dengan paket terenkripsi atau dilindungi kata sandi';

  @override
  String get rpConsolePerformanceTitle => 'Performa konsol';

  @override
  String get rpConsolePerformanceBody =>
      'Texture pack beresolusi tinggi dapat menyebabkan lag atau crash di konsol. Jika mengalami masalah, beralih ke pack beresolusi lebih rendah atau pilih subpack yang lebih ringan jika pack mendukungnya.';

  @override
  String get rpWarnDiscord =>
      'Tautan Discord kedaluwarsa dan tidak akan berfungsi. Gunakan host permanen sebagai gantinya.';

  @override
  String get rpWarnHttps => 'URL harus dimulai dengan https://';

  @override
  String get rpWarnExtension => 'URL harus diakhiri dengan .mcpack atau .zip';

  @override
  String get rpToastEnterUrl =>
      'Masukkan URL sebelum mengaktifkan paket sumber daya.';

  @override
  String get rpToastSaved => 'Pengaturan paket sumber daya disimpan.';

  @override
  String get rpInvalidPackFormat =>
      'Ini adalah pack Java Edition dan tidak didukung. Gunakan resource pack Bedrock Edition.';

  @override
  String get rpBehaviorContentWarning =>
      'Pack ini berisi data behavior pack yang tidak akan berfungsi di server. Teksturnya tetap berfungsi.';

  @override
  String get rpClearMinecraftTitle => 'Pertama kali dengan pack ini?';

  @override
  String get rpClearMinecraftBody =>
      'Minecraft menyimpan paket sumber daya secara lokal. Jika kamu pernah terhubung ke server ini sebelum mengaktifkan paket MCCompanion, Minecraft sudah menyimpan paket asli dan tidak akan mengunduh ulang versi yang telah digabungkan.';

  @override
  String get rpClearStep1 =>
      'Buka Minecraft di konsolmu dan pergi ke Pengaturan → Penyimpanan';

  @override
  String get rpClearStep2 =>
      'Ketuk ‘Hapus’ atau ‘Reset’ di sebelah Pack Sumber Daya, ini menghapus semua pack yang tersimpan lokal';

  @override
  String get rpClearStep3 =>
      'Sambungkan kembali melalui MCCompanion: pack yang digabungkan akan diunduh secara otomatis';

  @override
  String get rpRelayTitle => 'Pack terlihat tidak benar?';

  @override
  String get rpRelayBody =>
      'Relay menyimpan pack yang digabungkan selama 1 jam menggunakan URL overlay-mu sebagai kunci cache. Untuk memaksa penggabungan baru: ubah sedikit URL pack (mis. tambahkan ?v=2) dan simpan. Setelah itu, hapus juga cache pack Minecraft, pack yang digabungkan masih menggunakan UUID server, jadi Minecraft akan tetap menampilkan versi lama dari cache.';

  @override
  String get rpWorksGithubHint =>
      'Tautan unduhan langsung: selalu bisa diakses';

  @override
  String get rpWorksCloudflareHint =>
      'Penyimpanan cloud publik: cepat dan andal';

  @override
  String get rpWorksDirectHint => 'URL HTTPS publik .mcpack atau .zip apa pun';

  @override
  String get rpNoDiscordHint =>
      'Tautan Discord CDN kadaluarsa setelah waktu singkat';

  @override
  String get rpNoDriveHint =>
      'Tidak ada unduhan langsung: mengarahkan ke halaman pratinjau';

  @override
  String get rpNoEncryptedHint =>
      'MCCompanion tidak dapat menggabungkan konten pack terenkripsi';

  @override
  String get rpClearWhy =>
      'Minecraft menyimpan pack sumber daya berdasarkan UUID. Pack yang digabungkan tetap menggunakan UUID asli server, jika Minecraft sudah menyimpan pack server dari sesi sebelumnya (sebelum MCCompanion aktif), ia tidak akan mengunduh versi gabungan yang baru. Hapus cache agar Minecraft memuat pack gabungan terbaru.';

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
  String get rpMergerTitle => 'Penggabung RP';

  @override
  String get rpMergerSubtitle => 'Gabungkan hingga 4 paket sumber daya';

  @override
  String get rpMergerPriorityHint =>
      'Paket teratas memiliki prioritas tertinggi, filenya menang dalam konflik.';

  @override
  String get rpMergerTopBadge => 'ATAS';

  @override
  String get rpMergerAddPacks => 'Tambah paket sumber daya';

  @override
  String rpMergerAddAnother(int current) {
    return 'Tambah paket lain ($current/4)';
  }

  @override
  String get rpMergerFileTypes => '.zip atau .mcpack';

  @override
  String get rpMergerMerging => 'Menggabungkan…';

  @override
  String rpMergerButton(int count) {
    return 'Gabungkan $count paket';
  }

  @override
  String get rpMergerComplete => 'Penggabungan selesai!';

  @override
  String rpMergerConflicts(int count) {
    return '$count konflik terselesaikan: paket teratas menang.';
  }

  @override
  String get rpMergerSetActive => 'Jadikan paket sumber daya aktif';

  @override
  String get rpMergerSetActiveToast => 'Dijadikan paket sumber daya aktif';

  @override
  String get rpMergerOpenButton => 'Gabungkan paket sumber daya';

  @override
  String get rpMergerOpenSubtitle => 'Gabungkan 2–4 paket menjadi satu';

  @override
  String get rpDisabled => 'Nonaktif';

  @override
  String get rpNoPackSelected => 'Tidak ada paket sumber daya yang dipilih';

  @override
  String get rpActiveOnConnect => 'Aktif: diterapkan saat terhubung';

  @override
  String get rpBrowseSubtitle => 'Paket pilihan, siap digunakan';

  @override
  String get rpBrowseEmpty => 'Belum ada paket tersedia';

  @override
  String get rpBrowseEmptyHint => 'Periksa lagi nanti untuk paket pilihan.';

  @override
  String get rpReplaceFile => 'Ganti dengan file lain';

  @override
  String get rpDropToUpload => 'Lepaskan untuk mengunggah';

  @override
  String get rpTabBrowseInfo =>
      'Jelajahi paket pilihan MCCompanion. Ketuk Gunakan untuk mengaktifkan paket seketika, tanpa unggah atau tautan.';

  @override
  String get rpTabUploadInfo =>
      'Unggah file .mcpack atau .zip Anda sendiri. MCCompanion menyimpannya dengan aman di cloud dan mengirimkannya ke konsol Anda setiap kali terhubung.';

  @override
  String get rpTabUrlInfo =>
      'Tempel tautan unduhan langsung ke file .mcpack atau .zip. URL harus dapat diakses publik, tidak ada tautan Discord atau Google Drive.';

  @override
  String get rpTabMergeInfo =>
      'Gabungkan 2 hingga 4 paket menjadi satu. Paket gabungan diunggah ke MCCompanion Cloud dan diaktifkan secara otomatis.';

  @override
  String get shareLabel => 'Bagikan';

  @override
  String get sectionMinecraftAccounts => 'Akun Minecraft';

  @override
  String get sectionSettings => 'Pengaturan';

  @override
  String get avatarUpdated => 'Avatar diperbarui';

  @override
  String get uploadFailed => 'Unggah gagal';

  @override
  String get profileLinkCopied => 'Tautan profil disalin!';

  @override
  String get shareProfileTooltip => 'Bagikan profil';

  @override
  String get profileFallbackTitle => 'Profil';

  @override
  String get noUsersFound => 'Pengguna tidak ditemukan';

  @override
  String get skinLabel => 'SKIN';

  @override
  String get skinsLabel => 'SKINS';

  @override
  String get javaEditionBadge => 'Java';

  @override
  String get bedrockEditionBadge => 'Bedrock';

  @override
  String get downloadLabel => 'Unduh';

  @override
  String get justNow => 'Baru saja';

  @override
  String minutesAgo(int count) {
    return '${count}m lalu';
  }

  @override
  String hoursAgo(int count) {
    return '${count}j lalu';
  }

  @override
  String daysAgo(int count) {
    return '${count}h lalu';
  }

  @override
  String get rpPackInfo => 'Info';

  @override
  String get rpUseThisPack => 'Gunakan paket ini';

  @override
  String get rpViewOnWebsite => 'Lihat di website →';

  @override
  String rpDownloads(int count) {
    return '$count unduhan';
  }

  @override
  String get rpPackDetailTitle => 'Detail paket';

  @override
  String get skinsSavedToMySkins => 'Disimpan ke Skin Saya';

  @override
  String get skinsDownloadFailed => 'Unduhan gagal';

  @override
  String get skinsDeletedFromCloud => 'Dihapus dari cloud';

  @override
  String get skinsDeleteFailed => 'Penghapusan gagal';

  @override
  String get skinsLoginToUpload => 'Masuk untuk mengunggah skin';

  @override
  String get skinsUploading => 'Mengunggah…';

  @override
  String get skinUploaded => 'Skin berhasil diunggah!';

  @override
  String skinUploadFailed(String error) {
    return 'Pengunggahan gagal: $error';
  }

  @override
  String get skinsTabSkins => 'Skin';

  @override
  String get skinsTabRecent => 'Terbaru';

  @override
  String get skinsEmptyCloudSkins =>
      'Belum ada skin cloud. Unggah skin untuk melihatnya di sini.';

  @override
  String get skinsEmptyLocalSkins =>
      'Belum ada skin. Buat atau unggah skin untuk memulai.';

  @override
  String get skinUploadToWebsite => 'Unggah ke situs web';

  @override
  String get skinReuploadToWebsite => 'Unggah ulang ke situs web';

  @override
  String get skinCloudEdit => 'Edit';

  @override
  String get skinCloudSaveToDevice => 'Simpan ke perangkat';

  @override
  String get skinCloudDelete => 'Hapus dari cloud';

  @override
  String get skinsTabGallery => 'Galeri';

  @override
  String get skinsGalleryEmpty => 'Belum ada skin komunitas.';

  @override
  String get skinsTopLabel => '30 Teratas';

  @override
  String get skinsAllLabel => 'Semua Skin';

  @override
  String get skinUploadToCloud => 'Unggah ke Cloud';

  @override
  String get skinSaveDialog => 'Simpan Skin';

  @override
  String get skinNameHint => 'Nama skin';

  @override
  String get skinDefaultName => 'Skin saya';

  @override
  String get skinUpdatedInCloud => 'Skin diperbarui di cloud';

  @override
  String skinByCreator(String name) {
    return 'oleh $name';
  }

  @override
  String skinLikesCount(int count) {
    return '$count suka';
  }

  @override
  String get sectionRecentActivity => 'Aktivitas terbaru';

  @override
  String get activityNoEvents => 'Belum ada aktivitas terbaru.';

  @override
  String get activitySkinUploaded => 'Skin diunggah';

  @override
  String get activitySkinLiked => 'Skin disukai';

  @override
  String get activityPackSubmitted => 'Pack dikirim';

  @override
  String get activityPackApproved => 'Pack disetujui';

  @override
  String get activityPackRejected => 'Pack tidak disetujui';

  @override
  String get timeJustNow => 'baru saja';

  @override
  String timeMinutesAgo(int count) {
    return '$count mnt lalu';
  }

  @override
  String timeHoursAgo(int count) {
    return '$count jam lalu';
  }

  @override
  String timeDaysAgo(int count) {
    return '$count hari lalu';
  }

  @override
  String timeMonthsAgo(int count) {
    return '$count bln lalu';
  }

  @override
  String get sectionNotifications => 'Notifikasi';

  @override
  String get sectionNotificationTypes => 'Jenis notifikasi';

  @override
  String get notifMarkAllRead => 'Tandai semua sudah dibaca';

  @override
  String get notifEmpty =>
      'Belum ada notifikasi. Like, komentar, dan aktivitas teman akan muncul di sini.';

  @override
  String get notifSomeone => 'Seseorang';

  @override
  String notifSkinLiked(String actor) {
    return '$actor menyukai skin Anda';
  }

  @override
  String notifCommentReceived(String actor) {
    return '$actor mengomentari skin Anda';
  }

  @override
  String get notifPackApproved => 'Pack disetujui';

  @override
  String get notifPackRejected => 'Pack tidak disetujui';

  @override
  String notifFriendRequest(String actor) {
    return '$actor mengirim permintaan pertemanan';
  }

  @override
  String notifFriendAccepted(String actor) {
    return '$actor menerima permintaan Anda';
  }

  @override
  String notifMessageReceived(String actor) {
    return 'Pesan baru dari $actor';
  }

  @override
  String get notifPrefSkinLiked => 'Skin disukai';

  @override
  String get notifPrefCommentReceived => 'Komentar diterima';

  @override
  String get notifPrefPackApproved => 'Pack disetujui';

  @override
  String get notifPrefPackRejected => 'Pack ditolak';

  @override
  String get notifPrefFriendRequest => 'Permintaan pertemanan';

  @override
  String get notifPrefFriendAccepted => 'Teman ditambahkan';

  @override
  String get notifPrefMessageReceived => 'Pesan baru';

  @override
  String get commentsTitle => 'Komentar';

  @override
  String get commentsEmpty => 'Belum ada komentar. Jadilah yang pertama!';

  @override
  String get commentsPlaceholder => 'Tulis komentar…';

  @override
  String get loadMore => 'Muat lebih banyak';

  @override
  String get skinLayerInner => 'Dalam';

  @override
  String get skinLayerOuter => 'Luar';

  @override
  String get feedbackLoginRequiredTitle => 'Masuk untuk mengirim masukan';

  @override
  String get feedbackLoginRequiredBody =>
      'Masukan terhubung dengan akun MCCompanion Anda sehingga kami dapat membalas Anda langsung di aplikasi.';

  @override
  String get feedbackLoginButton => 'Masuk';

  @override
  String get supportInboxTitle => 'Kotak masuk dukungan';

  @override
  String get supportInboxSubtitle =>
      'Semua obrolan dukungan, dibagikan ke semua admin';

  @override
  String get adminBadge => 'Admin';

  @override
  String get skinShareSubject => 'Skin Minecraft';

  @override
  String get skinEditorTitle => 'Editor skin';

  @override
  String get skinToolUndo => 'Urungkan';

  @override
  String get skinSaveToMySkins => 'Simpan ke skin saya';

  @override
  String get skinUpdateInCloud => 'Perbarui di cloud';

  @override
  String get skinExportPng => 'Ekspor PNG';

  @override
  String get skinToolDraw => 'Gambar';

  @override
  String get skinToolFill => 'Isi';

  @override
  String get skinToolErase => 'Hapus';

  @override
  String get customColour => 'Warna khusus';

  @override
  String get featuredServerLabel => 'SERVER PILIHAN';

  @override
  String get featuredServerTagline => 'Langsung gabung dan main.';

  @override
  String get featuredServerPlay => 'Main';

  @override
  String rpUploadFailedCode(int code) {
    return 'Gagal mengunggah ($code)';
  }

  @override
  String rpUploadFailed(String error) {
    return 'Gagal mengunggah: $error';
  }

  @override
  String get rpLoadFailed => 'Tidak bisa memuat pack';

  @override
  String get rpRetry => 'Coba lagi';

  @override
  String get rpSearchHint => 'Cari pack…';

  @override
  String rpMergeFailed(String error) {
    return 'Gagal menggabungkan: $error';
  }

  @override
  String get rpMergerSize => 'Ukuran';

  @override
  String get rpMergerCreated => 'Dibuat';

  @override
  String get rpMergerSourcePacks => 'Pack sumber';

  @override
  String get rpMergerDropToAdd => 'Lepas untuk menambah';

  @override
  String get rpMergerSavedMerges => 'Gabungan tersimpan';

  @override
  String get rpMergerUse => 'Pakai';

  @override
  String get supportInboxShared => 'Dibagikan ke semua admin';

  @override
  String get supportInboxEmpty => 'Belum ada obrolan dukungan';

  @override
  String get supportReplyingAs => 'Kamu membalas sebagai MCCompanion Support';

  @override
  String get supportReplyHint => 'Balas sebagai dukungan…';

  @override
  String get relayBlocked =>
      'IP atau akunmu diblokir oleh MCCompanion. Kalau menurutmu ini keliru, gabung ke Discord kami.';

  @override
  String relayBlockedWithReason(String reason) {
    return 'IP atau akunmu diblokir oleh MCCompanion.\nAlasan: $reason\nKalau menurutmu ini keliru, gabung ke Discord kami.';
  }

  @override
  String relayConfigFailed(int code) {
    return 'Tidak bisa menyiapkan relay (status $code). Coba relay lain atau gabung ke Discord kami.';
  }

  @override
  String relayConfigFailedDetail(int code, String detail) {
    return 'Tidak bisa menyiapkan relay (status $code): $detail. Coba relay lain atau gabung ke Discord kami.';
  }

  @override
  String get relayTimeout => 'Relay tidak menjawab tepat waktu.';

  @override
  String get relayUnreachable => 'Tidak bisa menghubungi relay.';

  @override
  String get lookupNotFound => 'Pemain tidak ditemukan.';

  @override
  String get lookupNetworkError => 'Kesalahan jaringan. Coba lagi.';

  @override
  String get lookupBedrockUnavailable =>
      'Pencarian Bedrock sedang tidak tersedia.';

  @override
  String get lookupFailed => 'Pencarian gagal.';

  @override
  String get myFeedbackTitle => 'Masukan saya';

  @override
  String get myFeedbackEmpty => 'Kamu belum mengirim apa pun.';

  @override
  String get myFeedbackOpenList => 'Masukan saya';

  @override
  String get fbStatusOpen => 'Terbuka';

  @override
  String get fbStatusPlanned => 'Direncanakan';

  @override
  String get fbStatusInProgress => 'Sedang dikerjakan';

  @override
  String get fbStatusImplemented => 'Selesai';

  @override
  String get fbStatusNotPlanned => 'Tidak direncanakan';

  @override
  String get fbStatusDuplicate => 'Duplikat';

  @override
  String get fbNoReplies => 'Belum ada balasan. Kami kabari di sini.';

  @override
  String get fbReplyHint => 'Tambahkan sesuatu ke laporan ini…';

  @override
  String get fbFromTeam => 'MCCompanion';

  @override
  String get fbFromYou => 'Kamu';

  @override
  String get feedbackGoesToTeam => 'Langsung ke tim kami';

  @override
  String get notifFeedbackStatus => 'Kabar tentang masukanmu';

  @override
  String get notifFeedbackReply => 'Balasan untuk masukanmu';

  @override
  String get adminTicketsHeader => 'Laporan dan permintaan';

  @override
  String get adminTicketReplyHint => 'Balas tentang tiket ini…';

  @override
  String get adminNoTicketsForUser => 'Tidak ada tiket dari pengguna ini';

  @override
  String get undo => 'Urungkan';

  @override
  String get chooseServerTitle => 'Pilih server';

  @override
  String get changeLabel => 'Ubah';

  @override
  String get howToAutoShow => 'Tampilkan ini saat mulai';

  @override
  String get skinEditorLoadFailed =>
      'Skin itu tidak bisa dimuat. Kita mulai dari skin bawaan.';

  @override
  String get skinToolRecolour => 'Warnai ulang';

  @override
  String get skinToolPick => 'Ambil warna';

  @override
  String get skinBases => 'Dasar';

  @override
  String get skinBasesTitle => 'Mulai dari dasar';

  @override
  String get skinBasesSubtitle =>
      'Ini mengganti yang ada sekarang. Urungkan mengembalikannya.';

  @override
  String get skinMirror => 'Cermin';

  @override
  String get skinSurprise => 'Kejutan';

  @override
  String get skinToolFillHint => 'Mengisi bidang yang kamu sentuh';

  @override
  String get skinToolRecolourHint => 'Mengubah warna itu di seluruh skin';

  @override
  String get skinToolPickHint => 'Mengambil warna yang kamu sentuh';

  @override
  String get skinModelClassic => 'Lebar';

  @override
  String get skinModelSlim => 'Ramping';

  @override
  String get shareServerLabel => 'Bagikan servermu';

  @override
  String get shareServerOn => 'Teman bisa melihat server yang kamu mainkan';

  @override
  String get shareServerOff => 'Teman melihat kamu bermain, tapi tidak di mana';

  @override
  String get makeDefaultServer => 'Jadikan server default';

  @override
  String get isDefaultServer => 'Dibuka secara default';

  @override
  String defaultServerSet(String name) {
    return '$name akan dibuka secara default';
  }

  @override
  String get labelDirect => 'Proxy/Langsung';

  @override
  String get startDirectMode => 'Mulai Mode Proxy/Langsung';

  @override
  String get howToDirectTitle => 'Mode Proxy/Langsung';

  @override
  String get howToDirectSubtitle => 'Bermain tanpa melewati server kami';

  @override
  String get howToDirectBody =>
      'Mode Proxy/Langsung: perangkat Anda adalah koneksinya.\n1. Pastikan perangkat yang menjalankan MCCompanion dan konsol Anda berada di jaringan lokal yang sama.\n2. Masukkan alamat dan port server Bedrock, lalu tekan \"Mulai Mode Proxy/Langsung\".\n3. Di konsol buka Minecraft → Main → tab Teman, lalu segarkan daftarnya.\n4. Pilih server LAN bernama \"MCCompanion\" untuk bergabung.\n\nMengapa mode ini ada:\n- Tidak ada yang melewati server MCCompanion. Perangkat Anda meneruskan lalu lintasnya sendiri, sehingga tetap berfungsi bahkan saat relai kami tidak dapat dijangkau.\n- Tidak perlu masuk ke akun.\n\nPerlu diingat:\n- Aplikasi harus tetap terbuka dan tampil di layar selama sesi berlangsung. Menutupnya atau berpindah ke aplikasi lain akan memutus koneksi.\n- Hanya server Bedrock. Untuk server Java gunakan Mode Java, yang menerjemahkan protokol di sisi kami.\n- Penggunaan baterai lebih tinggi dibanding mode lainnya.\n- Paket sumber daya tidak diterapkan. Paket berjalan lewat relay kami, yang dilewati mode ini.';

  @override
  String directHostNotFound(String host) {
    return '$host tidak ditemukan. Periksa alamatnya dan coba lagi.';
  }

  @override
  String get directPortBusy =>
      'Tidak dapat membuka port lokal. Hentikan koneksi saat ini terlebih dahulu.';

  @override
  String get directServerOfflineTitle => 'Server tidak merespons';

  @override
  String directServerOfflineBody(String target) {
    return '$target tidak menjawab. Mungkin sedang offline, atau hanya mengabaikan ping. Anda tetap bisa memulai tunnel.';
  }

  @override
  String get directStartAnyway => 'Tetap mulai';

  @override
  String get directNoResourcePack =>
      'Paket sumber daya tidak berfungsi di Mode Proxy/Langsung.';

  @override
  String directAddressNotSupported(String host) {
    return '$host adalah alamat IPv6. Mode Proxy/Langsung hanya mendukung IPv4. Gunakan alamat IPv4 atau nama host.';
  }

  @override
  String termsAgreement(String terms, String privacy) {
    return 'Saya menyetujui $terms dan $privacy.';
  }

  @override
  String get verifyEmailTitle => 'Verifikasi email kamu';

  @override
  String get verifyEmailBody =>
      'Diperlukan sebelum kamu bisa berkomentar, mengunggah skin, atau mengirim pack.';

  @override
  String get verifyEmailSent => 'Terkirim, cek kotak masuk kamu.';

  @override
  String get verifyEmailSending => 'Mengirim…';

  @override
  String get verifyEmailSend => 'Kirim tautan';

  @override
  String updateAvailableTitle(Object version) {
    return 'Versi $version sudah tersedia';
  }

  @override
  String updateAvailableBody(Object current) {
    return 'Kamu memakai $current. Versi ini tidak memperbarui dirinya sendiri.';
  }

  @override
  String get updateAvailableAction => 'Unduh';

  @override
  String get updateAvailableDismiss => 'Nanti saja';

  @override
  String get serverListSearchHint => 'Cari berdasarkan nama atau alamat';

  @override
  String get serverListEditionAny => 'Java dan Bedrock';

  @override
  String get serverListEditionJava => 'Hanya Java';

  @override
  String get serverListEditionBedrock => 'Hanya Bedrock';

  @override
  String get serverListSortVotes => 'Vote terbanyak';

  @override
  String get serverListSortPlayers => 'Pemain terbanyak';

  @override
  String get serverListSortPeak => 'Puncak tertinggi';

  @override
  String get serverListSortNewest => 'Terbaru';

  @override
  String get serverListSortName => 'Nama';

  @override
  String get serverListAllCategories => 'Semua';

  @override
  String get serverListLoadFailed => 'Tidak dapat memuat daftar server';

  @override
  String get serverListLoadFailedHint => 'Tarik ke bawah untuk mencoba lagi';

  @override
  String get serverListNoMatch => 'Tidak ada server yang cocok';

  @override
  String get serverListNoMatchHint => 'Coba pencarian atau kategori lain';

  @override
  String get serverCardPlay => 'Main';

  @override
  String get serverCardVote => 'Vote';

  @override
  String get serverCardViewServer => 'Lihat server';

  @override
  String get serverCopyIp => 'Salin IP';

  @override
  String get serverCopied => 'Disalin';

  @override
  String get serverStatPlayers => 'Pemain';

  @override
  String get serverStatPeak => 'Puncak';

  @override
  String get serverStatUptime => 'Uptime';

  @override
  String get serverStatVotesMonth => 'Vote bulan ini';

  @override
  String get serverStatVotesAllTime => 'Total vote';

  @override
  String get serverBadgeFeatured => 'Unggulan';

  @override
  String get serverEditionJava => 'Java';

  @override
  String get serverEditionBedrock => 'Bedrock';

  @override
  String get serverEditionCrossplay => 'Crossplay';

  @override
  String get serverSectionMotd => 'Pesan hari ini';

  @override
  String get serverSectionAbout => 'Tentang';

  @override
  String get serverSectionCategories => 'Kategori';

  @override
  String get serverSectionVotes => 'Vote';

  @override
  String get serverLinkDiscord => 'Discord';

  @override
  String get serverLinkWebsite => 'Situs web';

  @override
  String get serverVotesThisMonth => 'Bulan ini';

  @override
  String get serverVotesAllTime => 'Sepanjang waktu';

  @override
  String get serverVoteAction => 'Vote server ini';

  @override
  String get serverPlayAction => 'Main di server ini';

  @override
  String get serverVoteSignInRequired => 'Masuk untuk vote dari aplikasi.';

  @override
  String serverVoteSheetTitle(String name) {
    return 'Vote untuk $name';
  }

  @override
  String get serverVoteSheetSubtitle =>
      'Nama Minecraft kamu, supaya server tahu siapa yang diberi hadiah.';

  @override
  String get serverVoteSheetHint => 'Steve';

  @override
  String get serverVoteSheetButton => 'Vote';

  @override
  String get serverVoteSheetLimit => 'Satu vote per server per hari.';

  @override
  String get serverVoteDelivered => 'Vote terkirim. Hadiahmu sedang dikirim.';

  @override
  String get serverVoteNoRewards =>
      'Vote terkirim. Server ini belum mengatur hadiah.';

  @override
  String get serverVoteFailed => 'Gagal, silakan coba lagi.';

  @override
  String get serverVoteOffline =>
      'Tidak dapat menghubungi server. Periksa koneksimu.';
}
