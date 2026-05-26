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
  String get startBroadcastingToSeeOutput => 'Mulai siaran untuk melihat output';

  @override
  String get close => 'Tutup';

  @override
  String get ok => 'OK';

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
    return 'Dibuat oleh $appCreator.\r\n\r\nCara menggunakan:\r\n1. Masukkan alamat dan port server Minecraft Anda (default: 19132)\r\n   — atau pilih server yang sebelumnya disimpan dari menu dropdown\r\n2. (Opsional) Pilih Server Relay (EU atau US) yang paling dekat dengan lokasi Anda\r\n3. Klik \"Mulai Siaran\" untuk memulai\r\n4. Di konsol/perangkat Anda: Minecraft > Play > Friends\r\n5. Anda akan melihat server LAN bernama \"MCCompanion\"\r\n6. Klik server tersebut untuk bergabung ke server eksternal Anda melalui MCCompanion\r\n\r\nNintendo Switch (mode DNS):\r\n1. Aktifkan \"Nintendo Switch\" di panel koneksi\r\n2. Pilih Server Relay (EU atau US)\r\n3. Klik \"Send DNS Config\" — ini mengirim konfigurasi Anda ke relay\r\n   (ini TIDAK menyiarkan server LAN)\r\n4. Di Switch Anda, terapkan pengaturan DNS MCCompanion lalu bergabung\r\n   menggunakan entri server yang Anda pakai untuk MCCompanion\r\n\r\nCatatan:\r\n- Untuk siaran LAN, MCCompanion dan konsol harus berada di jaringan lokal yang sama.\r\n- Tips: Pilih server relay yang paling dekat dengan Anda untuk performa terbaik.';
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
  String get howToJavaSubtitle => 'Hubungkan ke server Java Edition melalui MCCompanion';

  @override
  String get aternosSubtext => 'Buat server Minecraft gratis Anda sendiri';

  @override
  String get howToJavaBody => 'Mode Java — langkah cepat:\n1. Di aplikasi, pilih mode Java.\n2. Masukkan alamat dan port server Java Edition Anda (default: 25565).\n3. Tekan \"Mulai Mode Java\" — MCCompanion akan menjembatani koneksi.\n4. Buka Minecraft Bedrock dan masuk ke tab Teman.\n5. Pilih server LAN bernama \"MCCompanion\" untuk bergabung ke server Java.\n\n⚠️ Peringatan penting:\n- Diperlukan akun Java Edition yang valid (Microsoft).\n- Beberapa server menggunakan sistem anti-cheat yang dapat mendeteksi dan memblokir akun Anda.\n- Beberapa server secara eksplisit melarang klien Bedrock — selalu periksa aturan server.\n- MCCompanion tidak bertanggung jawab atas ban akun, penangguhan, atau masalah terkait akun lainnya yang mungkin terjadi akibat penggunaan fitur ini.\n- Gunakan dengan risiko Anda sendiri.';

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
  String get clientDisconnected => 'Klien terputus — Siaran dihentikan';

  @override
  String get pleaseEnterServer => '⚠️ Harap masukkan alamat server';

  @override
  String get invalidPort => '⚠️ Nomor port tidak valid (1-65535)';

  @override
  String get dnsConfigSent => '✅ Konfigurasi DNS dikirim ke relay';

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
  String get nldServerLabel => 'SERVER NETHERLINK';

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
  String get noServerYet => 'Belum ada server tersimpan.\nKetuk Kelola untuk menambahkan satu.';

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
  String get vpnActive => 'Kami mendeteksi VPN Anda aktif.\n\nMatikan VPN sebelum menggunakan MCCompanion, jika tidak siaran LAN mungkin tidak akan mencapai konsol Anda.';

  @override
  String get mobileActive => 'Terdeteksi: Data Seluler\n\nMCCompanion harus berada di jaringan yang sama dengan konsol Anda. Sambungkan ke Wi‑Fi rumah atau hotspot sebelum melanjutkan.';

  @override
  String get continueAnyway => 'Tetap lanjutkan';

  @override
  String get sameWifi => 'Jaringan Wi‑Fi yang sama';

  @override
  String get needSameWifi => 'Perangkat yang menjalankan MCCompanion HARUS berada di jaringan Wi‑Fi yang sama dengan konsol tempat Anda bermain Minecraft.';

  @override
  String get subscription => 'Langganan online diperlukan';

  @override
  String get needSubscription => 'Setiap konsol memerlukan langganan online aktifnya sendiri (Xbox Live, PS Plus, NSO). Tanpa itu, MCCompanion tidak akan muncul.';

  @override
  String get updateAvailable => 'Pembaruan tersedia';

  @override
  String get newVersion => 'Versi baru aplikasi tersedia.\nPerbarui sekarang untuk mendapatkan fitur dan perbaikan terbaru.';

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
  String get nintendoInfoText => 'Mulai dalam mode Nintendo, atur DNS Anda, dan gabung ke server unggulan.';

  @override
  String get friendModeTitle => 'Mode Teman';

  @override
  String get friendModeText => 'Tambahkan bot teman MCCompanion sebagai teman. Mulai mode Teman dan bermain';

  @override
  String get selectedRelayCheck => 'Dipilih';

  @override
  String relayFallbackWarning(Object name) {
    return 'Peringatan: relay asli tidak merespons. Relay cadangan yang digunakan: $name';
  }

  @override
  String get relayUnableConnect => 'Tidak dapat terhubung ke server relay MCCompanion mana pun. Coba lagi nanti atau periksa internet Anda.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / Proksi)';

  @override
  String get howToXboxSubtitle => 'Main melalui siaran LAN atau proxy';

  @override
  String get howToXboxBody => 'Cara terhubung (Xbox / PS4 / PS5):\r\n1. Pastikan perangkat yang menjalankan MCCompanion dan konsol Anda berada di jaringan lokal yang sama.\r\n2. Di aplikasi, masukkan alamat dan port server Minecraft Anda lalu tekan \"Mulai Siaran\".\r\n3. Di konsol, buka Minecraft → Play → cari LAN Worlds atau tab Friends lalu segarkan daftar.\r\n4. Pilih server LAN bernama \"MCCompanion\" untuk bergabung.\r\nCatatan:\r\n- Jika server tidak muncul, pastikan kedua perangkat berada di subnet yang sama dan aplikasi masih menyiarkan.\r\n- Beberapa model konsol atau router dapat memblokir penemuan LAN; coba ubah pengaturan aplikasi atau router jika perlu.';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (mode DNS)';

  @override
  String get howToNintendoSubtitle => 'Petunjuk relay DNS untuk Switch';

  @override
  String get howToNintendoBody => 'Nintendo Switch — mode DNS (langkah demi langkah):\r\n1. Di aplikasi, aktifkan mode \"Nintendo\" dan pilih Server Relay (EU atau US).\r\n2. Ketuk \"Send DNS Config\" untuk mengirim IP DNS ke relay.\r\n3. Di Nintendo Switch Anda buka System Settings → Internet → Internet Settings → (jaringan Anda) → Change Settings → DNS lalu atur Primary DNS ke IP relay.\r\n4. Buka Minecraft dan gabung ke server publik; Anda akan diarahkan ke server Anda menggunakan DNS relay.\r\nCatatan:\r\n- Mode DNS tidak menyiarkan server LAN; mode ini mengarahkan lalu lintas game melalui relay.\r\n- Kembalikan DNS Anda setelah selesai jika Anda memerlukan perilaku jaringan normal.';

  @override
  String get howToFriendsTitle => 'Mode Teman';

  @override
  String get howToFriendsSubtitle => 'Undang teman dan gabung melalui LAN';

  @override
  String get howToFriendsBody => 'Mode Teman — langkah cepat:\r\n1. Tambahkan akun teman MCCompanion di konsol atau platform Anda jika diperlukan.\r\n2. Di aplikasi, aktifkan mode Teman dan kirim konfigurasi relay (jika berlaku).\r\n3. Di konsol, buka Minecraft → Friends dan cari LAN Worlds — server Anda seharusnya muncul di sana sebagai dunia LAN.\r\n4. Pilih server tersebut untuk bergabung ke server Anda bersama teman.\r\nCatatan:\r\n- Pastikan Anda dan teman Anda memiliki NAT/pengaturan yang sama yang memungkinkan kehadiran teman.\r\n- Mode Teman bergantung pada fitur pertemanan platform dan mungkin memerlukan penerimaan permintaan pertemanan.';

  @override
  String get helpNetherlinkTitle => 'MCCompanion tidak muncul';

  @override
  String get helpNetherlinkSubtitle => 'Pemecahan masalah penemuan LAN';

  @override
  String get helpNetherlinkBody => 'Jika server tidak muncul di konsol Anda, coba langkah-langkah berikut:\r\n\r\n✅ Pemeriksaan Dasar:\r\n1. Jaringan WiFi yang Sama - Ponsel/tablet dan konsol Anda HARUS berada di WiFi yang sama\r\n2. Alamat Server yang Benar - Periksa kembali IP dan port (default: 19132)\r\n3. Siaran Aktif - Pastikan MCCompanion menampilkan status \"Menyiarkan\"\r\n\r\n🔄 Perbaikan Cepat:\r\n• Mulai ulang aplikasi: hentikan siaran, tutup MCCompanion sepenuhnya, buka lagi, lalu coba kembali\r\n• Mulai ulang konsol Anda: terkadang konsol perlu disegarkan untuk mendeteksi game LAN\r\n• Periksa tab Friends/LAN: server muncul di bawah \"Friends\" atau \"LAN Games\", BUKAN di daftar server\r\n• Tunggu 10-15 detik setelah memulai siaran\r\n• Nonaktifkan VPN: VPN dapat memblokir siaran lokal\r\n\r\n⚠️ Masalah Umum:\r\n\"No route found for user\" → Pastikan kedua perangkat berada di Wi‑Fi yang sama (hindari jaringan tamu)\r\n\"Unable to connect to MCCompanion relay server\" → Periksa internet / status relay Anda\r\n\r\n📱 Masih bermasalah? Aktifkan Mode Debug di MCCompanion dan periksa log, atau coba server lain.';

  @override
  String get helpMultiplayerFailedTitle => 'Koneksi Multiplayer Gagal';

  @override
  String get helpMultiplayerFailedSubtitle => 'Penjelasan mengapa ini bukan kesalahan MCCompanion';

  @override
  String get helpMultiplayerFailedBody => '⚠️ Ini bukan masalah pada MCCompanion!\r\n\r\nMCCompanion berhasil mengarahkan Anda ke server yang diminta. Pesan \"Multiplayer Connection Failed\" menunjukkan bahwa server tujuan saat ini tidak dapat dijangkau. Kemungkinan alasan:\r\n\r\n• Server Minecraft tujuan sedang offline atau kelebihan beban\r\n• Server memerlukan versi klien yang diperbarui atau edisi tertentu\r\n• Masalah jaringan antara relay dan server tujuan\r\n\r\nCoba hubungkan ke server lain atau hubungi dukungan server tersebut. Jika masalah tetap terjadi pada beberapa server, aktifkan Mode Debug di MCCompanion dan periksa log.';

  @override
  String get helpNintendoDnsTitle => 'DNS Nintendo tidak berfungsi';

  @override
  String get helpNintendoDnsSubtitle => 'Masalah DNS / relay umum';

  @override
  String get helpNintendoDnsBody => 'Jika mode DNS Nintendo tidak berfungsi, periksa hal berikut:\r\n\r\n1. Pastikan Anda mengirim konfigurasi DNS dari aplikasi (Send DNS Config).\r\n2. Pastikan Anda menerapkan IP relay sebagai DNS Utama di Switch.\r\n3. Pastikan server relay yang dipilih (EU/US) sedang online dan tidak kelebihan beban.\r\n4. Beberapa jaringan (misalnya captive portal) mencegah DNS kustom — uji di jaringan lain.\r\n\r\nJika masalah berlanjut, aktifkan Mode Debug dan periksa log atau coba alternatif mode Teman.';

  @override
  String get helpFriendsModeTitle => 'Mode Teman tidak berfungsi';

  @override
  String get helpFriendsModeSubtitle => 'Masalah pertemanan umum';

  @override
  String get helpFriendsModeBody => 'Tips pemecahan masalah mode Teman:\r\n\r\n1. Pastikan akun teman relay sudah ditambahkan/diterima di konsol (jika diperlukan).\r\n2. Coba mulai ulang game dan segarkan tab Friends/LAN setelah mengaktifkan mode Teman.\r\n\r\nJika server masih tidak muncul untuk teman, aktifkan Mode Debug dan periksa log untuk mengidentifikasi kesalahan.';

  @override
  String get changeLanguageTitle => 'Ganti bahasa';

  @override
  String get changeLanguage => 'Bahasa';

  @override
  String get useSystemLanguage => 'Gunakan bahasa sistem';

  @override
  String get couldNotOpenUrl => 'Tidak dapat membuka URL';

  @override
  String get reportUser => 'Laporkan pengguna';
  @override
  String reportUserWithName(String username) => 'Laporkan @$username';
  @override
  String get reportMessage => 'Laporkan pesan';
  @override
  String get reportDisclaimer => 'Tim kami akan meninjau laporan ini. Terima kasih telah menjaga keamanan komunitas.';
  @override
  String get reportReasonSpam => 'Spam';
  @override
  String get reportReasonHarassment => 'Pelecehan atau perundungan';
  @override
  String get reportReasonInappropriate => 'Konten tidak pantas';
  @override
  String get reportReasonOther => 'Lainnya';
  @override
  String get reportAdditionalDetails => 'Detail tambahan (opsional)';
  @override
  String get reportSubmit => 'Kirim laporan';
  @override
  String get reportSuccess => 'Laporan terkirim. Terima kasih.';
  @override
  String get reportFailed => 'Tidak dapat mengirim laporan. Silakan coba lagi.';
  @override
  String get messagePlaceholder => 'Pesan...';
  @override
  String get noMessagesYet => 'Belum ada pesan.\nSapa duluan!';
  @override
  String get today => 'Hari ini';
  @override
  String get yesterday => 'Kemarin';
  @override
  String get noConversationsYet => 'Belum ada percakapan';
  @override
  String get startChatHint => 'Mulai obrolan dari daftar teman Anda.';
  @override
  String get youPrefix => 'Anda';
  @override
  String get tabProfile => 'PROFIL';
  @override
  String get tabFriends => 'TEMAN';
  @override
  String get tabRequests => 'PERMINTAAN';
  @override
  String get tabChats => 'OBROLAN';
  @override
  String get addFriend => 'Tambah teman';
  @override
  String get usernameHint => 'nama pengguna';
  @override
  String get send => 'Kirim';
  @override
  String friendRequestSentTo(String username) => 'Permintaan pertemanan dikirim ke @$username';
  @override
  String alreadyFriendsWith(String username) => 'Anda sudah berteman dengan @$username.';
  @override
  String requestAlreadyPending(String username) => 'Sudah ada permintaan yang tertunda dengan @$username.';
  @override
  String userNotFoundMsg(String username) => 'Pengguna @$username tidak ditemukan.';
  @override
  String cannotSendRequest(String username) => 'Anda tidak dapat mengirim permintaan ke @$username.';
  @override
  String get somethingWentWrong => 'Terjadi kesalahan. Silakan coba lagi.';
  @override
  String friendRequestAccepted(String username) => 'Permintaan pertemanan dari @$username diterima';
  @override
  String requestDeclined(String username) => 'Permintaan dari @$username ditolak';
  @override
  String get deleteAccountTitle => 'Hapus akun';
  @override
  String get deleteAccountBody => 'Ini akan menghapus akun, pesan, teman, dan semua data terkait secara permanen. Tindakan ini tidak dapat dibatalkan.';
  @override
  String get deletePermanently => 'Hapus secara permanen';
  @override
  String get couldNotDeleteAccount => 'Tidak dapat menghapus akun. Silakan coba lagi.';
  @override
  String get removeFriendTitle => 'Hapus teman';
  @override
  String removeFriendConfirm(String username) => 'Ingin menghapus @$username sebagai teman?';
  @override
  String get remove => 'Hapus';
  @override
  String friendRemoved(String username) => '@$username dihapus dari teman Anda';
  @override
  String get noFriendsYet => 'Belum ada teman';
  @override
  String get noFriendsSub => 'Tambahkan seseorang menggunakan tombol di kanan atas.';
  @override
  String get noPendingRequests => 'Tidak ada permintaan yang tertunda';
  @override
  String get requestsAppearHere => 'Permintaan pertemanan akan muncul di sini.';
  @override
  String onlineFriendsLabel(int count) => 'ONLINE — $count';
  @override
  String offlineFriendsLabel(int count) => 'OFFLINE — $count';
  @override
  String get couldNotUpdateVisibility => 'Tidak dapat memperbarui visibilitas. Coba lagi.';
  @override
  String get aboutMe => 'Tentang saya';
  @override
  String get linkedAccountsTitle => 'Akun terhubung';
  @override
  String get linkAccountsHint => 'Hubungkan akun Minecraft Anda untuk ditampilkan di profil.';
  @override
  String get unlinkXboxTitle => 'Putuskan akun Xbox';
  @override
  String removeLabelConfirm(String label) => 'Hapus $label dari akun terhubung?';
  @override
  String get unlinkJavaTitle => 'Putuskan Java Edition';
  @override
  String removeJavaConfirm(String username) => 'Hapus $username dari akun terhubung?';
  @override
  String get unlink => 'Putuskan';
  @override
  String get linkXbox => 'Hubungkan Xbox';
  @override
  String get linkJava => 'Hubungkan Java';
  @override
  String get appearOfflineLabel => 'Tampil offline';
  @override
  String get appearOfflineOn => 'Teman melihat Anda sebagai offline';
  @override
  String get appearOfflineOff => 'Teman dapat melihat saat Anda online';
  @override
  String get signOut => 'Keluar';
  @override
  String get profileCardTitle => 'Profil';
  @override
  String get edit => 'Edit';
  @override
  String get displayNameLabel => 'Nama tampilan';
  @override
  String get bioLabel => 'Bio';
  @override
  String get yourNameHint => 'Nama Anda';
  @override
  String get bioHint => 'Ceritakan sesuatu tentang diri Anda';
  @override
  String get avatarUrlLabel => 'URL avatar';
  @override
  String get usernameDisplayLabel => 'Nama pengguna';
  @override
  String get profileUpdated => 'Profil diperbarui';
  @override
  String get findUser => 'Cari pengguna';
  @override
  String get signIn => 'Masuk';
  @override
  String get createAccount => 'Buat akun';
  @override
  String get signInSubtitle => 'Masuk untuk menambah teman dan berbagi sesi Anda.';
  @override
  String get emailAddressHint => 'Alamat email';
  @override
  String get passwordHint => 'Kata sandi';
  @override
  String get forgotPassword => 'Lupa kata sandi?';
  @override
  String get continueWithGoogle => 'Lanjutkan dengan Google';
  @override
  String get alreadyHaveAccount => 'Sudah punya akun? Masuk';
  @override
  String get noAccountYet => 'Belum punya akun? Daftar';
  @override
  String get orDivider => 'atau';
  @override
  String get resetPasswordTitle => 'Reset kata sandi';
  @override
  String get resetPasswordBody => 'Masukkan alamat email Anda dan kami akan mengirim tautan untuk mereset kata sandi.';
  @override
  String get sendLink => 'Kirim tautan';
  @override
  String resetLinkSent(String email) => 'Tautan reset dikirim ke $email';
  @override
  String get noAccountForEmail => 'Tidak ada akun yang ditemukan untuk alamat email ini.';
  @override
  String get invalidEmailError => 'Alamat email tidak valid.';
  @override
  String get couldNotSendResetEmail => 'Tidak dapat mengirim email reset. Silakan coba lagi.';
  @override
  String get incorrectEmailOrPassword => 'Email atau kata sandi salah.';
  @override
  String get emailAlreadyInUse => 'Alamat email ini sudah digunakan.';
  @override
  String get weakPassword => 'Kata sandi harus minimal 6 karakter.';
  @override
  String get googleSignInFailed => 'Masuk dengan Google gagal. Silakan coba lagi.';
  @override
  String get appleSignInFailed => 'Masuk dengan Apple gagal. Silakan coba lagi.';
  @override
  String get emailDifferentMethod => 'Akun dengan email ini sudah ada menggunakan metode masuk yang berbeda.';
  @override
  String get enterEmailAndPassword => 'Silakan masukkan email dan kata sandi Anda.';
  @override
  String get profileNotSetUp => 'Profil belum disiapkan';
  @override
  String get chooseUsernameSubtitle => 'Pilih nama pengguna untuk menambah teman dan berbagi sesi Anda.';
  @override
  String get createProfile => 'Buat profil';
  @override
  String get chooseUniqueUsername => 'Pilih nama pengguna unik untuk menambah teman.';
  @override
  String get usernameFieldLabel => 'Nama pengguna *';
  @override
  String get usernameFormatHint => '3–20 karakter · hanya a-z, 0-9 dan _';
  @override
  String get displayNameOptional => 'Nama tampilan (opsional)';
  @override
  String get usernameRequired => 'Silakan masukkan nama pengguna.';
  @override
  String get usernameFormatError => '3–20 karakter, hanya huruf kecil, angka dan _';
  @override
  String get usernameTaken => 'Nama pengguna ini sudah digunakan.';
  @override
  String get noConnectionError => 'Tidak ada koneksi. Silakan coba lagi.';
  @override
  String get usernameExampleHint => 'mis. jens_mc';
  @override
  String get displayNameExampleHint => 'mis. Jens';
  @override
  String get home => 'Beranda';
  @override
  String get info => 'Info';
  @override
  String get consoleConnect => 'Console Connect';
  @override
  String get consoleConnectSubtitle => 'Sambungkan ke server Minecraft';
  @override
  String get minecraftSkins => 'Skin Minecraft';
  @override
  String get minecraftSkinsSubtitle => 'Lihat & edit skin Java & Bedrock';
  @override
  String get minecraftWiki => 'Wiki Minecraft';
  @override
  String get minecraftWikiSubtitle => 'Mob, blok, resep & lainnya';
  @override
  String get partnerServersLabel => 'Server Mitra';
  @override
  String get partnerServersSubtitle => 'Server Minecraft unggulan';
  @override
  String get userLookup => 'Pencarian Pengguna Minecraft';
  @override
  String get userLookupSubtitle => 'Cari profil Java & Bedrock';

  @override
  String get navSkins => 'Skins';
  @override
  String get navWiki => 'Wiki';
  @override
  String get navProfile => 'Profil';

  @override
  String get skinsUpload => 'Unggah';
  @override
  String get skinsCreate => 'Buat';
  @override
  String get skinsSubtitle => 'Lihat dan unduh skin Minecraft.';
  @override
  String get skinsSectionRecent => 'SKIN TERBARU';
  @override
  String get skinsSectionMy => 'SKIN SAYA';
  @override
  String get skinsSectionYours => 'SKIN ANDA';
  @override
  String get skinsEmptyMySkins => 'Belum ada skin tersimpan. Buat atau unggah skin untuk memulai.';
  @override
  String get skinsCouldNotLoad => 'Tidak dapat memuat skin';
  @override
  String skinsPageOf(int page, int total) => 'Halaman $page / $total';
  @override
  String get skinsMustBe64 => 'Skin harus berukuran 64×64 piksel';
  @override
  String get skinsInvalidFile => 'File gambar tidak valid';
  @override
  String get skinsDownload => 'Unduh';
  @override
  String get skinsEdit => 'Edit';
  @override
  String get skinsNoAccountsTitle => 'Tidak ada akun yang terhubung';
  @override
  String get skinsNoAccountsSubtitle => 'Hubungkan Java atau Bedrock di Profil untuk melihat skin Anda.';
  @override
  String get skinsSignInTitle => 'Masuk untuk melihat skin Anda';
  @override
  String get skinsSignInSubtitle => 'Buat akun dan hubungkan Java atau Bedrock di Profil.';
}
