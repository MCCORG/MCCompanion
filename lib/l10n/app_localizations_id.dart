// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get console => 'Konsol';

  @override
  String get modeLabel => 'Mode';

  @override
  String get statusLabel => 'Status';

  @override
  String get seeAll => 'Lihat semua';

  @override
  String get sectionHelp => 'Bantuan';

  @override
  String get sectionAdvanced => 'Lanjutan';

  @override
  String get versionLabel => 'Versi';

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
  String get onboardingNavPreviewConnector => 'Konektor';

  @override
  String get onboardingNavPreviewProfile => 'Profil';

  @override
  String get onboardingNavPreviewEmpty => 'Kosong';

  @override
  String get onboardingCustomizeDetail => 'Kustomisasi lebih lanjut →';

  @override
  String get website => 'Situs Web';

  @override
  String get howToUseMenu => 'Cara menggunakan';

  @override
  String get support => 'Dukungan';

  @override
  String get start => 'Mulai';

  @override
  String get stop => 'Berhenti';

  @override
  String get labelJava => 'Java';

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
  String get pleaseEnterServer => '⚠️ Harap masukkan alamat server';

  @override
  String get invalidPort => '⚠️ Nomor port tidak valid (1-65535)';

  @override
  String get dataSentToServers => 'Data dikirim ke server MCCompanion';

  @override
  String selectedServer(Object name) {
    return '📋 Dipilih: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'Dipilih: $name';
  }

  @override
  String copiedLogs(Object count) {
    return '$count entri log disalin ke clipboard';
  }

  @override
  String get debugEnabled => 'Log debug diaktifkan';

  @override
  String get iUnderstand => 'Saya mengerti';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'Dipilih: $relayName\r\n\r\nCara terhubung:\r\n1. Buka Pengaturan Switch Anda dan ubah DNS menjadi: $relayIp\r\n2. Buka Minecraft dan pilih server dari daftar (seperti Cubecraft atau Hive).\r\n3. Sekarang Anda akan otomatis dikirim ke server Anda sendiri.';
  }

  @override
  String get noSavedServers => 'Tidak ada server tersimpan';

  @override
  String get savedServers => 'Server tersimpan';

  @override
  String get manageServers => 'Kelola server';

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
  String get updateAvailable => 'Pembaruan tersedia';

  @override
  String get stopBroadcasting => 'Hentikan Siaran';

  @override
  String get startNintendoMode => 'Mulai Mode Nintendo';

  @override
  String get startFriendsMode => 'Mulai Mode Teman';

  @override
  String get startBroadcasting => 'Mulai Siaran';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'Teman';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / Proksi)';

  @override
  String get howToXboxSubtitle => 'Hubungkan lewat LAN';

  @override
  String get howToXboxBody =>
      'Cara terhubung (Xbox / PS4 / PS5):\r\n1. Pastikan perangkat yang menjalankan MCCompanion dan konsol Anda berada di jaringan lokal yang sama.\r\n2. Di aplikasi, masukkan alamat dan port server Minecraft Anda lalu tekan \"Mulai Siaran\".\r\n3. Di konsol, buka Minecraft → Play → cari LAN Worlds atau tab Friends lalu segarkan daftar.\r\n4. Pilih server LAN bernama \"MCCompanion\" untuk bergabung.\r\nCatatan:\r\n- Jika server tidak muncul, pastikan kedua perangkat berada di subnet yang sama dan aplikasi masih menyiarkan.\r\n- Beberapa model konsol atau router dapat memblokir penemuan LAN; coba ubah pengaturan aplikasi atau router jika perlu.';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (mode DNS)';

  @override
  String get howToNintendoSubtitle => 'Hubungkan lewat DNS';

  @override
  String get howToFriendsTitle => 'Mode Teman';

  @override
  String get howToFriendsSubtitle => 'Hubungkan lewat Teman';

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
  String get failedUpdateNotifications => 'Gagal memperbarui notifikasi';

  @override
  String get editServerTitle => 'Edit Server';

  @override
  String get serverNameHint => 'Nama server';

  @override
  String get failedSave => 'Gagal menyimpan. Coba lagi.';

  @override
  String get serverRenamed => 'Server diubah namanya';

  @override
  String get customizeLabel => 'Sesuaikan';

  @override
  String get customizeSubtitle => 'Bilah navigasi dan warna';

  @override
  String get resetLabel => 'Atur ulang';

  @override
  String get navigationSection => 'NAVIGASI';

  @override
  String get navFixed => 'Connector dan Profil selalu tetap';

  @override
  String get leftSlot => 'Slot 2';

  @override
  String get outerSlot => 'Slot 1';

  @override
  String get rightSlot => 'Slot 3';

  @override
  String get farSlot => 'Slot 4';

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
  String get reportUser => 'Laporkan pengguna';

  @override
  String reportUserWithName(Object name) {
    return 'Laporkan $name';
  }

  @override
  String get reportDisclaimer =>
      'Laporan ditinjau oleh tim kami. Laporan palsu dapat berakibat tindakan terhadap akunmu.';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonHarassment => 'Pelecehan';

  @override
  String get reportReasonInappropriate => 'Konten tidak pantas';

  @override
  String get reportReasonOther => 'Lainnya';

  @override
  String get reportAdditionalDetails => 'Detail tambahan (opsional)…';

  @override
  String get reportSuccess => 'Laporan terkirim. Terima kasih.';

  @override
  String get reportFailed => 'Gagal mengirim laporan. Silakan coba lagi.';

  @override
  String get reportSubmit => 'Kirim laporan';

  @override
  String get playerLookupSubtitle =>
      'Cari pemain Java atau Bedrock berdasarkan nama pengguna';

  @override
  String get playerLookupHint => 'Masukkan nama pengguna…';

  @override
  String get playerLookupLinked => 'Akun tertaut ditemukan';

  @override
  String get playerLookupLabelUsername => 'Nama pengguna';

  @override
  String get playerLookupLabelTier => 'Tier';

  @override
  String playerLookupCopied(Object value) {
    return '$value disalin';
  }

  @override
  String get addFriend => 'Tambah Teman';

  @override
  String get send => 'Send';

  @override
  String get somethingWentWrong => 'Terjadi kesalahan. Silakan coba lagi.';

  @override
  String friendRequestAccepted(Object name) {
    return 'Kamu sekarang berteman dengan $name';
  }

  @override
  String requestDeclined(Object name) {
    return 'Permintaan dari $name ditolak';
  }

  @override
  String get deleteAccountTitle => 'Hapus Akun';

  @override
  String get deleteAccountBody =>
      'Ini akan menghapus akun dan semua datamu secara permanen. Tindakan ini tidak dapat dibatalkan.';

  @override
  String get deletePermanently => 'Hapus Permanen';

  @override
  String get couldNotDeleteAccount =>
      'Tidak dapat menghapus akun. Silakan coba lagi.';

  @override
  String get removeFriendTitle => 'Hapus Teman';

  @override
  String removeFriendConfirm(Object name) {
    return 'Hapus $name dari daftar temanmu?';
  }

  @override
  String get remove => 'Hapus';

  @override
  String friendRemoved(Object name) {
    return '$name telah dihapus dari daftar temanmu';
  }

  @override
  String get emailDifferentMethod =>
      'Email ini tertaut ke metode masuk yang berbeda';

  @override
  String get googleSignInFailed =>
      'Masuk dengan Google gagal. Silakan coba lagi.';

  @override
  String get appleSignInFailed =>
      'Masuk dengan Apple gagal. Silakan coba lagi.';

  @override
  String get resetPasswordTitle => 'Atur Ulang Kata Sandi';

  @override
  String get resetPasswordBody =>
      'Masukkan alamat emailmu dan kami akan mengirimkan tautan untuk mengatur ulang kata sandi.';

  @override
  String get emailAddressHint => 'Alamat email';

  @override
  String get sendLink => 'Kirim tautan';

  @override
  String resetLinkSent(Object email) {
    return 'Jika ada akun untuk $email, tautan sedang dikirim';
  }

  @override
  String get invalidEmailError => 'Alamat email tidak valid';

  @override
  String get couldNotSendResetEmail =>
      'Tidak dapat mengirim email pengaturan ulang. Silakan coba lagi.';

  @override
  String get enterEmailAndPassword => 'Masukkan email dan kata sandimu';

  @override
  String get incorrectEmailOrPassword => 'Email atau kata sandi salah';

  @override
  String get emailAlreadyInUse => 'Alamat email ini sudah digunakan';

  @override
  String get weakPassword => 'Kata sandi terlalu lemah. Pilih yang lebih kuat.';

  @override
  String get createAccount => 'Buat Akun';

  @override
  String get signInSubtitle =>
      'Masuk untuk mengakses profil, teman, dan obrolanmu.';

  @override
  String get passwordHint => 'Kata sandi';

  @override
  String get forgotPassword => 'Lupa kata sandi?';

  @override
  String get orDivider => 'or';

  @override
  String get continueWithGoogle => 'Lanjutkan dengan Google';

  @override
  String get alreadyHaveAccount => 'Sudah punya akun? Masuk';

  @override
  String get noAccountYet => 'Belum punya akun? Buat sekarang';

  @override
  String get profileNotSetUp => 'Profil belum diatur';

  @override
  String get chooseUsernameSubtitle =>
      'Pilih username agar pemain lain bisa menemukanmu.';

  @override
  String get createProfile => 'Buat Profil';

  @override
  String get findUser => 'Cari pengguna';

  @override
  String get couldNotUpdateVisibility =>
      'Tidak dapat memperbarui pengaturan visibilitas';

  @override
  String get signOut => 'Keluar';

  @override
  String get appearOfflineLabel => 'Tampil Offline';

  @override
  String get appearOfflineOn => 'Kamu terlihat offline oleh pemain lain';

  @override
  String get appearOfflineOff => 'Kamu terlihat online oleh pemain lain';

  @override
  String get unlinkXboxTitle => 'Putuskan Tautan Akun Xbox';

  @override
  String removeLabelConfirm(Object name) {
    return 'Hapus $name dari akun tertautmu?';
  }

  @override
  String get unlink => 'Putuskan tautan';

  @override
  String get unlinkJavaTitle => 'Putuskan Tautan Akun Java';

  @override
  String removeJavaConfirm(Object name) {
    return 'Hapus $name dari akun tertautmu?';
  }

  @override
  String get linkAccountsHint =>
      'Tautkan akun Minecraft-mu untuk menampilkan skin dan statistik.';

  @override
  String get linkXbox => 'Tautkan Xbox';

  @override
  String get linkJava => 'Tautkan Java';

  @override
  String get profileUpdated => 'Profil diperbarui';

  @override
  String get edit => 'Edit';

  @override
  String get displayNameLabel => 'Nama Tampilan';

  @override
  String get yourNameHint => 'Namamu';

  @override
  String get bioLabel => 'Bio';

  @override
  String get bioHint => 'Ceritakan tentang dirimu…';

  @override
  String get noFriendsYet => 'Belum ada teman';

  @override
  String get noFriendsSub => 'Tambahkan teman agar muncul di sini.';

  @override
  String onlineFriendsLabel(Object count) {
    return '$count online';
  }

  @override
  String offlineFriendsLabel(Object count) {
    return '$count offline';
  }

  @override
  String get noPendingRequests => 'Tidak ada permintaan tertunda';

  @override
  String get requestsAppearHere =>
      'Permintaan pertemanan baru akan muncul di sini.';

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
  String get paywallRestore => 'Pulihkan';

  @override
  String get paywallMonthly => 'Bulanan';

  @override
  String get paywallYearly => 'Tahunan';

  @override
  String get paywallSavePercent => 'Hemat ~17%';

  @override
  String get paywallSubtitle =>
      'Lacak lebih banyak server dan dapatkan notifikasi\nsaat server online atau offline.';

  @override
  String paywallSlotLabel(Object slots) {
    return '$slots slot server';
  }

  @override
  String get paywallPopular => 'Populer';

  @override
  String get paywallContinue => 'Lanjutkan';

  @override
  String get paywallNoPkgs => 'Tidak ada paket tersedia.';

  @override
  String get paywallManaged =>
      'Dikelola oleh Apple/Google. Berhenti kapan saja.';

  @override
  String get paywallPurchaseSuccess => 'Pembelian berhasil!';

  @override
  String get paywallPurchaseFailed => 'Pembelian gagal. Silakan coba lagi.';

  @override
  String get paywallPurchasesRestored => 'Pembelian dipulihkan!';

  @override
  String get paywallNoActivePurchases => 'Tidak ada pembelian aktif.';

  @override
  String get paywallRestoreFailed => 'Pemulihan gagal. Silakan coba lagi.';

  @override
  String get relay => 'Relay';

  @override
  String get serversSection => 'Server';

  @override
  String get selectBedrockAccount => 'Pilih akun Bedrock';

  @override
  String get infoAndLegal => 'Info & Hukum';

  @override
  String get legalSection => 'Hukum';

  @override
  String get privacyPolicy => 'kebijakan privasi';

  @override
  String get privacyPolicySubtitle =>
      'Bagaimana kami mengumpulkan dan melindungi datamu';

  @override
  String get termsOfService => 'ketentuan layanan';

  @override
  String get termsOfServiceSubtitle => 'Aturan dan ketentuan penggunaan';

  @override
  String get dataSourcesSection => 'Sumber Data & Kredit';

  @override
  String get creditMojangTitle => 'Mojang / Microsoft';

  @override
  String get creditMojangSubtitle =>
      'Skin pemain Java, UUID, dan data profil melalui API resmi Mojang.';

  @override
  String get creditGeyserTitle => 'GeyserMC';

  @override
  String get creditGeyserSubtitle =>
      'Perenderan skin Bedrock. Skin pemain Bedrock diambil melalui server skin GeyserMC.';

  @override
  String get creditXboxTitle => 'Xbox / Microsoft';

  @override
  String get creditXboxSubtitle =>
      'Penautan akun Bedrock melalui Xbox Live. Gamertag dan XUID diperoleh melalui alur autentikasi Microsoft.';

  @override
  String get aboutMCCompanionSection => 'Tentang MCCompanion';

  @override
  String get aboutMCCompanionDisclaimer =>
      'MCCompanion adalah aplikasi independen dan tidak berafiliasi dengan, didukung oleh, atau disponsori oleh Mojang Studios maupun Microsoft Corporation.';

  @override
  String get minecraftTrademark =>
      '\"Minecraft\" adalah merek dagang Microsoft Corporation.';

  @override
  String get nldServerLabelShort => 'MCCompanion Server';

  @override
  String get editServer => 'Edit Server';

  @override
  String get serverNameExampleHint => 'Server Kerenku';

  @override
  String get serverAddressExampleHint => 'play.example.com';

  @override
  String get serverDescriptionExampleHint => 'Server survival bersama teman';

  @override
  String get editionLabel => 'Edisi';

  @override
  String get nameLabel => 'Name';

  @override
  String get ipAddressFieldLabel => 'Alamat IP';

  @override
  String get portFieldLabel => 'Port';

  @override
  String get platformFieldLabel => 'Platform';

  @override
  String get nameValidationError => 'Nama harus 1–50 karakter';

  @override
  String get ipRequiredError => 'Alamat IP wajib diisi';

  @override
  String get portRangeError => 'Port harus antara 1 dan 65535';

  @override
  String get xboxLinkTitle => 'Tautkan Akun Xbox';

  @override
  String get xboxStartingLogin => 'Memulai login Xbox…';

  @override
  String get xboxSignInWithMicrosoft => 'Masuk dengan Microsoft';

  @override
  String get xboxGoToLink =>
      'Buka tautan di bawah dan masukkan kode untuk menghubungkan akun Xbox-mu.';

  @override
  String get xboxYourCode => 'Kodemu';

  @override
  String get xboxTapToCopy => 'Ketuk kode untuk menyalin';

  @override
  String get xboxOpenLink => 'Buka microsoft.com/link';

  @override
  String get xboxWaitingForLogin => 'Menunggu login…';

  @override
  String get xboxAccountLinked => 'Akun Xbox tertaut!';

  @override
  String get xboxCodeCopied => 'Kode disalin ke papan klip';

  @override
  String get xboxCouldNotStart =>
      'Tidak dapat memulai login Xbox. Silakan coba lagi.';

  @override
  String get xboxCodeExpired => 'Kode kedaluwarsa. Silakan coba lagi.';

  @override
  String get xboxSomethingWrong => 'Terjadi kesalahan. Silakan coba lagi.';

  @override
  String get tryAgain => 'Coba lagi';

  @override
  String get userNotFound => 'Pengguna tidak ditemukan';

  @override
  String get profileSectionLabel => 'Profil';

  @override
  String get displayNameRowLabel => 'Nama Tampilan';

  @override
  String get usernameRowLabel => 'Nama pengguna';

  @override
  String get lastSeenLabel => 'Terakhir dilihat';

  @override
  String get aboutSectionLabel => 'Tentang';

  @override
  String get xboxBedrockLabel => 'Xbox / Bedrock';

  @override
  String get friendRequestSent => 'Permintaan pertemanan terkirim';

  @override
  String get alreadyFriendsMsg => 'Kalian sudah berteman.';

  @override
  String get requestAlreadyPendingMsg => 'Sudah ada permintaan yang tertunda.';

  @override
  String get userNotFoundMsg2 => 'Pengguna tidak ditemukan.';

  @override
  String get cannotSendRequestMsg =>
      'Tidak dapat mengirim permintaan ke pengguna ini.';

  @override
  String nowFriendsWith(Object username) {
    return 'Sekarang berteman dengan @$username';
  }

  @override
  String get removeFriendButton => 'Hapus teman';

  @override
  String get requestSentButton => 'Permintaan terkirim';

  @override
  String get acceptRequestButton => 'Terima permintaan';

  @override
  String get addFriendButton => 'Tambah teman';

  @override
  String get removeFriendDialogTitle => 'Hapus Teman';

  @override
  String removeFriendDialogBody(Object username) {
    return 'Hapus @$username dari daftar teman?';
  }

  @override
  String get trackerLimitReached => 'Batas server tercapai';

  @override
  String get upgradeButton => 'Tingkatkan';

  @override
  String get javaLinkTitle => 'Tautkan Java Edition';

  @override
  String get javaStartingLogin => 'Memulai login Microsoft…';

  @override
  String get javaSignInWithMicrosoft => 'Masuk dengan Microsoft';

  @override
  String get javaGoToLink =>
      'Buka tautan di bawah dan masukkan kode untuk menghubungkan akun Minecraft Java Edition-mu.';

  @override
  String get javaYourCode => 'Kodemu';

  @override
  String get javaTapToCopy => 'Ketuk kode untuk menyalin';

  @override
  String get javaOpenLink => 'Buka microsoft.com/link';

  @override
  String get javaWaitingForLogin => 'Menunggu login…';

  @override
  String get javaAccountLinked => 'Java Edition tertaut!';

  @override
  String get javaNoJavaTitle => 'Java Edition tidak ditemukan';

  @override
  String get javaNoJavaBody =>
      'Akun Microsoft yang kamu gunakan untuk masuk tidak memiliki Minecraft Java Edition.';

  @override
  String get javaTryDifferentAccount => 'Coba akun lain';

  @override
  String get javaCouldNotStart =>
      'Tidak dapat memulai login Microsoft. Silakan coba lagi.';

  @override
  String get javaCodeExpired => 'Kode kedaluwarsa. Silakan coba lagi.';

  @override
  String get javaSomethingWrong => 'Terjadi kesalahan. Silakan coba lagi.';

  @override
  String get javaCodeCopied => 'Kode disalin ke papan klip';

  @override
  String get featureLabelConnector => 'Konektor';

  @override
  String get featureLabelSkins => 'Skin';

  @override
  String get featureLabelPartners => 'Daftar server';

  @override
  String get featureLabelLookup => 'Cari';

  @override
  String get featureLabelTracker => 'Pelacak Server';

  @override
  String get userSearchHint => 'Nama pengguna, gamertag atau nama Java…';

  @override
  String get userSearchSub =>
      'Cari berdasarkan nama pengguna, gamertag Xbox atau nama Java';

  @override
  String get upgradeWindowsHint => 'Upgrade tersedia melalui Microsoft Store';

  @override
  String get accountActions => 'Akun';

  @override
  String get feedbackBugReport => 'Laporan Bug';

  @override
  String get feedbackFeatureRequest => 'Permintaan Fitur';

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
  String get feedbackSubmitBug => 'Kirim Laporan Bug';

  @override
  String get feedbackSubmitFeature => 'Kirim Permintaan Fitur';

  @override
  String get feedbackDisclaimer =>
      'Menuju tim kami · Jangan sertakan kata sandi';

  @override
  String get feedbackSuccessTitle => 'Terima kasih atas masukan kamu!';

  @override
  String get feedbackSuccessBody =>
      'Terima kasih! Laporanmu sudah masuk. Kami membalas di aplikasi, jadi cek lagi di sini.';

  @override
  String get feedbackSubmitAnother => 'Kirim lagi';

  @override
  String get feedbackBackToApp => 'Kembali ke aplikasi';

  @override
  String get feedbackTitleTooShort => 'Judul harus minimal 5 karakter.';

  @override
  String get feedbackDescTooShort => 'Deskripsi harus minimal 10 karakter.';

  @override
  String get feedbackSubmitFailed => 'Gagal mengirim. Coba lagi.';

  @override
  String get feedbackTileTitle => 'Masukan';

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
  String get rpUploadTab => 'Unggah';

  @override
  String get rpBrowseTab => 'Jelajahi';

  @override
  String get rpCategoryRealism => 'Realisme';

  @override
  String get rpCategoryFaithful => 'Faithful';

  @override
  String get rpCategoryPvp => 'PvP';

  @override
  String get rpCategoryCartoon => 'Kartun';

  @override
  String get rpCategoryDark => 'Gelap';

  @override
  String get rpCategoryMedieval => 'Abad Pertengahan';

  @override
  String get rpCategoryNature => 'Alam';

  @override
  String get rpCategoryThemed => 'Bertema';

  @override
  String get rpCategoryOther => 'Lainnya';

  @override
  String get rpUploadButton => 'Ketuk untuk memilih paketmu';

  @override
  String get rpUploadHint => '.mcpack atau .zip • maks. 100 MB';

  @override
  String get rpUploading => 'Mengunggah...';

  @override
  String get rpMergerTitle => 'Penggabung RP';

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
  String get rpMergerSetActiveToast => 'Dijadikan paket sumber daya aktif';

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
  String get skinsLabel => 'SKIN';

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
  String get skinsSavedToMySkins => 'Disimpan ke Skin Saya';

  @override
  String get skinsEmptyLocalSkins => 'Belum ada skin tersimpan.';

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
  String get feedbackLoginRequiredTitle => 'Masuk untuk mengirim masukan';

  @override
  String get feedbackLoginRequiredBody =>
      'Masukan terhubung dengan akun MCCompanion Anda sehingga kami dapat membalas Anda langsung di aplikasi.';

  @override
  String get feedbackLoginButton => 'Masuk';

  @override
  String get supportInboxTitle => 'Kotak masuk dukungan';

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
  String get chooseServerTitle => 'Pilih server';

  @override
  String get changeLabel => 'Ubah';

  @override
  String get howToAutoShow => 'Tampilkan ini saat mulai';

  @override
  String get shareServerLabel => 'Bagikan servermu';

  @override
  String get shareServerOn => 'Teman bisa melihat server yang kamu mainkan';

  @override
  String get shareServerOff => 'Teman melihat kamu bermain, tapi tidak di mana';

  @override
  String directHostNotFound(String host) {
    return '$host tidak ditemukan. Periksa alamatnya dan coba lagi.';
  }

  @override
  String get directPortBusy =>
      'Tidak dapat membuka port lokal. Hentikan koneksi saat ini terlebih dahulu.';

  @override
  String get waitingForConsole => 'Menunggu konsol Anda…';

  @override
  String get consoleFound => 'Konsol ditemukan';

  @override
  String get consoleLanHint =>
      'Di konsol Anda, buka Minecraft dan cari game LAN di bagian Teman.';

  @override
  String get localNetworkBlocked =>
      'MCCompanion tidak dapat menjangkau jaringan lokal Anda. Aktifkan Jaringan Lokal untuk MCCompanion di pengaturan perangkat dan pastikan Anda terhubung ke Wi-Fi.';

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
  String get serverListPlayersAny => 'Ukuran apa pun';

  @override
  String get serverListPlayersHint => 'Rata-rata pemain online';

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
  String get serverCopyIp => 'Salin IP';

  @override
  String get serverCopied => 'Disalin';

  @override
  String get serverStatPlayers => 'Pemain';

  @override
  String get serverStatPeak => 'Puncak';

  @override
  String get serverStatUptime => 'Waktu aktif';

  @override
  String get serverStatVotesMonth => 'Vote bulan ini';

  @override
  String get serverBadgeFeatured => 'Unggulan';

  @override
  String get serverEditionJava => 'Java';

  @override
  String get serverEditionBedrock => 'Bedrock';

  @override
  String get serverEditionCrossplay => 'Lintas platform';

  @override
  String get serverSectionMotd => 'Pesan hari ini';

  @override
  String get serverLinkDiscord => 'Discord';

  @override
  String get serverLinkWebsite => 'Situs web';

  @override
  String get serverVotesThisMonth => 'Bulan ini';

  @override
  String get serverVotesAllTime => 'Sepanjang waktu';

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

  @override
  String get feedbackViewYourReport => 'Lihat laporanmu';

  @override
  String get showMore => 'Selengkapnya';

  @override
  String get showLess => 'Lebih sedikit';

  @override
  String get lookupRecent => 'Terbaru';

  @override
  String get skinsRemovalNotice =>
      'Skin akan dihapus pada pembaruan berikutnya. Ekspor skin yang ingin kamu simpan.';

  @override
  String get feedbackRpNotice =>
      'Kami tidak membalas laporan tentang resource pack. Beberapa pack memang tidak berfungsi, dan beberapa server menolak pack kustom.';
}
