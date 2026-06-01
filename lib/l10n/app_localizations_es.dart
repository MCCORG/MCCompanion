// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'MCCompanion';

  @override
  String get console => 'Consola';

  @override
  String get consoleOutput => 'Salida de la consola';

  @override
  String get noLogsYet => 'Aún no hay registros';

  @override
  String get startBroadcastingToSeeOutput => 'Inicia la transmisión para ver la salida';

  @override
  String get close => 'Cerrar';

  @override
  String get ok => 'OK';

  @override
  String get joinUs => 'Únete';

  @override
  String get more => 'Más';

  @override
  String get website => 'Sitio web';

  @override
  String get howToUseMenu => 'Cómo usar';

  @override
  String get support => 'Soporte';

  @override
  String helpText(Object appCreator) {
    return 'Creado por $appCreator.\r\n\r\nCómo usar:\r\n1. Introduce la dirección y el puerto de tu servidor de Minecraft (predeterminado: 19132)\r\n   — o selecciona un servidor guardado previamente en el menú desplegable\r\n2. (Opcional) Elige un servidor relay (EU o US) cercano a tu ubicación\r\n3. Haz clic en \\\"Iniciar transmisión\\\" para comenzar\r\n4. En tu consola/dispositivo: Minecraft > Jugar > Amigos\r\n5. Deberías ver un servidor LAN llamado \\\"MCCompanion\\\"\r\n6. Haz clic en él para unirte a tu servidor externo mediante MCCompanion\r\n\r\nNintendo Switch (modo DNS):\r\n1. Activa \\\"Nintendo Switch\\\" en el panel de conexión\r\n2. Selecciona un servidor relay (EU o US)\r\n3. Haz clic en \\\"Enviar configuración DNS\\\" — esto envía tu configuración al relay\r\n   (NO transmite un servidor LAN)\r\n4. En tu Switch, aplica la configuración DNS de MCCompanion y únete\r\n   usando la entrada de servidor que utilizas para MCCompanion\r\n\r\nNotas:\r\n- Para la transmisión LAN, MCCompanion y la consola deben estar en la misma red local.\r\n- Consejo: Elige el servidor relay más cercano para obtener el mejor rendimiento.';
  }

  @override
  String get serverDetailsLabel => 'Detalles del servidor';

  @override
  String get start => 'Iniciar';

  @override
  String get stop => 'Detener';

  @override
  String get labelJava => 'Java';

  @override
  String get startJavaMode => 'Iniciar modo Java';

  @override
  String get javaInfoTitle => 'Modo Java';

  @override
  String get javaInfoText => 'Conéctate a servidores de Java Edition';

  @override
  String get howToJavaTitle => 'Modo Java';

  @override
  String get howToJavaSubtitle => 'Conéctate a servidores de Java Edition mediante MCCompanion';

  @override
  String get aternosSubtext => 'Crea tu propio servidor gratuito de Minecraft';

  @override
  String get howToJavaBody => 'Modo Java — pasos rápidos:\n1. En la app, selecciona el modo Java.\n2. Introduce la dirección y el puerto de tu servidor de Java Edition (predeterminado: 25565).\n3. Pulsa \"Iniciar modo Java\" — MCCompanion conectará ambos extremos.\n4. Abre Minecraft Bedrock y ve a la pestaña Amigos.\n5. Selecciona el servidor LAN llamado \"MCCompanion\" para entrar al servidor Java.\n\n⚠️ Advertencias importantes:\n- Se requiere una cuenta válida de Java Edition (Microsoft).\n- Algunos servidores usan sistemas antitrampas que pueden detectar y bloquear tu cuenta.\n- Algunos servidores prohíben explícitamente clientes Bedrock — revisa siempre las reglas del servidor.\n- MCCompanion no se hace responsable de bloqueos, suspensiones ni otros problemas relacionados con la cuenta que puedan producirse por usar esta función.\n- Úsalo bajo tu propia responsabilidad.';

  @override
  String get language => 'Español';

  @override
  String get discord => 'Discord';

  @override
  String get toggleDebug => 'Activar/desactivar depuración';

  @override
  String get copyLogs => 'Copiar registros';

  @override
  String get clear => 'Limpiar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get deleteServer => 'Eliminar servidor';

  @override
  String get delete => 'Eliminar';

  @override
  String get myServers => 'Mis servidores';

  @override
  String get quickAccessServers => 'Servidores de acceso rápido';

  @override
  String get addServer => 'Agregar servidor';

  @override
  String get addServersHint => 'Agrega servidores para conectarte rápidamente más tarde';

  @override
  String get serverNameLabel => 'Nombre del servidor *';

  @override
  String get addressLabel => 'Dirección *';

  @override
  String get portLabel => 'Puerto *';

  @override
  String get descriptionLabel => 'Descripción (opcional)';

  @override
  String get save => 'Guardar';

  @override
  String get initializing => 'Inicializando...';

  @override
  String get createdBy => 'Creado por NetherDev';

  @override
  String get bedrockBridge => 'Puente Bedrock';

  @override
  String get clientDisconnected => 'Cliente desconectado — transmisión detenida';

  @override
  String get pleaseEnterServer => '⚠️ Por favor, introduce una dirección de servidor';

  @override
  String get invalidPort => '⚠️ Número de puerto no válido (1-65535)';

  @override
  String get dnsConfigSent => '✅ Configuración DNS enviada al relay';

  @override
  String get broadcastingStarted => 'Transmisión iniciada';

  @override
  String get broadcastStopped => 'Transmisión detenida';

  @override
  String selectedServer(Object name) {
    return '📋 Seleccionado: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'Seleccionado: $name';
  }

  @override
  String get noLogsToCopy => 'No hay registros para copiar';

  @override
  String copiedLogs(Object count) {
    return 'Se copiaron $count entradas de registro al portapapeles';
  }

  @override
  String get debugEnabled => 'Registros de depuración activados';

  @override
  String get debugDisabled => 'Registros de depuración desactivados';

  @override
  String get howToUseTitle => 'Cómo usar MCCompanion';

  @override
  String get iUnderstand => 'Entiendo';

  @override
  String get playOnSwitchTitle => 'Jugar en Nintendo Switch';

  @override
  String get playWithFriendsTitle => 'Jugar con amigos';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'Seleccionado: $relayName\r\n\r\nCómo conectarte:\r\n1. Ve a la configuración de tu Switch y cambia el DNS a: $relayIp\r\n2. Abre Minecraft y selecciona un servidor de la lista (como Cubecraft o Hive).\r\n3. Ahora serás enviado automáticamente a tu propio servidor.';
  }

  @override
  String playInstructionsFriends(Object friend) {
    return 'Cómo conectarte:\r\n1. En tu consola, agrega a $friend como amigo.\r\n2. Abre Minecraft y ve a la pestaña Amigos.\r\n3. Busca tu servidor en Mundos LAN y selecciónalo para unirte.';
  }

  @override
  String get nldServerLabel => 'SERVIDOR MCCompanion';

  @override
  String selectRelayLabel(Object name) {
    return 'Seleccionar relay $name';
  }

  @override
  String get noSavedServers => 'No hay servidores guardados';

  @override
  String get savedServers => 'Servidores guardados';

  @override
  String get serverAddressHint => 'Dirección del servidor';

  @override
  String get portHint => 'Puerto';

  @override
  String get manageServers => 'Administrar servidores';

  @override
  String get manageServersTooltip => 'Administrar servidores';

  @override
  String get noServerYet => 'Aún no hay servidores guardados.\nToca Administrar para añadir uno.';

  @override
  String get serverNotSelected => 'Ningún servidor seleccionado';

  @override
  String get ready => 'Listo';

  @override
  String get active => 'Activo';

  @override
  String get vpnDetected => 'VPN detectada';

  @override
  String get noWifi => 'Sin Wi‑Fi';

  @override
  String get vpnActive => 'Detectamos que tu VPN está activa.\n\nDesactiva tu VPN antes de usar MCCompanion; de lo contrario, la transmisión LAN puede no llegar a tu consola.';

  @override
  String get mobileActive => 'Detectado: datos móviles\n\nMCCompanion debe estar en la misma red que tu consola. Conéctate a tu Wi‑Fi doméstica o punto de acceso antes de continuar.';

  @override
  String get continueAnyway => 'Continuar de todos modos';

  @override
  String get sameWifi => 'Misma red Wi‑Fi';

  @override
  String get needSameWifi => 'El dispositivo que ejecuta MCCompanion DEBE estar en la misma red Wi‑Fi que la consola en la que juegas Minecraft.';

  @override
  String get subscription => 'Se requiere suscripción en línea';

  @override
  String get needSubscription => 'Cada consola necesita su propia suscripción en línea activa (Xbox Live, PS Plus, NSO). Sin ella, MCCompanion no aparecerá.';

  @override
  String get updateAvailable => 'Actualización disponible';

  @override
  String get newVersion => 'Hay una nueva versión de la aplicación disponible.\nActualiza ahora para obtener las últimas funciones y correcciones.';

  @override
  String get later => 'Más tarde';

  @override
  String get updateNow => 'Actualizar ahora';

  @override
  String get beforeYouStart => 'ANTES DE EMPEZAR';

  @override
  String get stopBroadcasting => 'Detener transmisión';

  @override
  String get startNintendoMode => 'Iniciar modo Nintendo';

  @override
  String get startFriendsMode => 'Iniciar modo Amigos';

  @override
  String get startBroadcasting => 'Iniciar transmisión';

  @override
  String get modeLabel => 'Modo';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'Amigos';

  @override
  String get nintendoInfoTitle => 'Modo DNS de Nintendo Switch';

  @override
  String get nintendoInfoText => 'Inicia en modo Nintendo, configura tu DNS y únete a un servidor destacado.';

  @override
  String get friendModeTitle => 'Modo Amigos';

  @override
  String get friendModeText => 'Agrega los bots de amigos de MCCompanion como amigos. Inicia el modo Amigos y juega';

  @override
  String get selectedRelayCheck => 'Seleccionado';

  @override
  String relayFallbackWarning(Object name) {
    return 'Advertencia: el relay original no respondió. Relay de respaldo en uso: $name';
  }

  @override
  String get relayUnableConnect => 'No se pudo conectar a NINGÚN servidor relay de MCCompanion. Inténtalo más tarde o revisa tu conexión a internet.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / conexión proxy)';

  @override
  String get howToXboxSubtitle => 'Juega mediante transmisión LAN o proxy';

  @override
  String get howToXboxBody => 'Cómo conectarte (Xbox / PS4 / PS5):\r\n1. Asegúrate de que el dispositivo que ejecuta MCCompanion y tu consola estén en la misma red local.\r\n2. En la aplicación, introduce la dirección y el puerto de tu servidor de Minecraft y pulsa \\\"Iniciar transmisión\\\".\r\n3. En la consola, abre Minecraft → Jugar → busca Mundos LAN o la pestaña Amigos y actualiza la lista.\r\n4. Selecciona el servidor LAN llamado \\\"MCCompanion\\\" para unirte.\r\nNotas:\r\n- Si el servidor no aparece, confirma que ambos dispositivos están en la misma subred y que la aplicación sigue transmitiendo.\r\n- Algunos modelos de consola o routers pueden bloquear el descubrimiento LAN; prueba cambiando la aplicación o la configuración del router si es necesario.';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (modo DNS)';

  @override
  String get howToNintendoSubtitle => 'Instrucciones de relay DNS para Switch';

  @override
  String get howToNintendoBody => 'Nintendo Switch — modo DNS (paso a paso):\r\n1. En la aplicación, activa el modo \\\"Nintendo\\\" y selecciona un servidor relay (EU o US).\r\n2. Toca \\\"Enviar configuración DNS\\\" para enviar la IP DNS al relay.\r\n3. En tu Nintendo Switch, ve a Configuración del sistema → Internet → Configuración de Internet → (tu red) → Cambiar configuración → DNS y establece el DNS primario en la IP del relay.\r\n4. Abre Minecraft y únete a un servidor público; serás redirigido a tu servidor usando el DNS del relay.\r\nNotas:\r\n- El modo DNS no transmite un servidor LAN; enruta el tráfico del juego a través del relay.\r\n- Restablece tu DNS cuando termines si necesitas un comportamiento normal de la red.';

  @override
  String get howToFriendsTitle => 'Modo Amigos';

  @override
  String get howToFriendsSubtitle => 'Invita a amigos y únete mediante LAN';

  @override
  String get howToFriendsBody => 'Modo Amigos — pasos rápidos:\r\n1. Agrega la cuenta amiga de MCCompanion (relay friend) en tu consola o plataforma si es necesario.\r\n2. En la aplicación, activa el modo Amigos y envía la configuración del relay (si corresponde).\r\n3. En tu consola, abre Minecraft → Amigos y busca Mundos LAN — tu servidor debería aparecer allí como un mundo LAN.\r\n4. Selecciónalo para unirte a tu servidor con amigos.\r\nNotas:\r\n- Asegúrate de que tú y tus amigos tengan la misma configuración NAT/ajustes que permitan la presencia de amigos.\r\n- El modo Amigos depende de las funciones de amigos de la plataforma y puede requerir aceptar solicitudes de amistad.';

  @override
  String get helpMCCompanionTitle => 'MCCompanion no aparece';

  @override
  String get helpMCCompanionSubtitle => 'Solución de problemas de detección LAN';

  @override
  String get helpMCCompanionBody => 'Si el servidor no aparece en tu consola, prueba estos pasos:\r\n\r\n✅ Comprobaciones básicas:\r\n1. Misma red WiFi - Tu teléfono/tableta y tu consola DEBEN estar en la misma WiFi\r\n2. Dirección de servidor correcta - Verifica de nuevo la IP y el puerto (predeterminado: 19132)\r\n3. Transmisión activa - Verifica que MCCompanion muestre el estado \\\"Transmitiendo\\\"\r\n\r\n🔄 Soluciones rápidas:\r\n• Reinicia la aplicación: detén la transmisión, cierra MCCompanion por completo, vuelve a abrirla e inténtalo de nuevo\r\n• Reinicia tu consola: a veces la consola necesita actualizarse para detectar juegos LAN\r\n• Revisa la pestaña Amigos/LAN: el servidor aparece en \\\"Amigos\\\" o \\\"Juegos LAN\\\", NO en la lista de servidores\r\n• Espera 10-15 segundos después de iniciar la transmisión\r\n• Desactiva las VPN: las VPN pueden bloquear las transmisiones locales\r\n\r\n⚠️ Problemas comunes:\r\n\\\"No route found for user\\\" → Asegúrate de que ambos dispositivos estén en la misma Wi‑Fi (evita redes de invitados)\r\n\\\"Unable to connect to MCCompanion relay server\\\" → Revisa tu internet / estado del relay\r\n\r\n📱 ¿Sigues teniendo problemas? Activa el modo de depuración en MCCompanion y revisa los registros, o prueba con otro servidor.';

  @override
  String get helpMultiplayerFailedTitle => 'Conexión multijugador fallida';

  @override
  String get helpMultiplayerFailedSubtitle => 'Explicación de por qué esto no es un error de MCCompanion';

  @override
  String get helpMultiplayerFailedBody => '⚠️ ¡Esto no es un problema de MCCompanion!\r\n\r\nMCCompanion te redirigió correctamente al servidor solicitado. El mensaje \\\"Conexión multijugador fallida\\\" indica que el servidor de destino no está disponible en este momento. Posibles razones:\r\n\r\n• El servidor de Minecraft de destino está desconectado o sobrecargado\r\n• El servidor requiere una versión actualizada del cliente o una edición específica\r\n• Problemas de red entre el relay y el servidor de destino\r\n\r\nIntenta conectarte a otro servidor o contacta con el soporte del servidor. Si el problema persiste en varios servidores, activa el modo de depuración en MCCompanion y revisa los registros.';

  @override
  String get helpNintendoDnsTitle => 'El DNS de Nintendo no funciona';

  @override
  String get helpNintendoDnsSubtitle => 'Problemas comunes de DNS / relay';

  @override
  String get helpNintendoDnsBody => 'Si el modo DNS de Nintendo no funciona, revisa lo siguiente:\r\n\r\n1. Confirma que enviaste la configuración DNS desde la aplicación (Enviar configuración DNS).\r\n2. Verifica que aplicaste la IP del relay como DNS primario en la Switch.\r\n3. Asegúrate de que el servidor relay seleccionado (EU/US) esté en línea y no sobrecargado.\r\n4. Algunas redes (por ejemplo, portales cautivos) impiden el uso de DNS personalizado — prueba en otra red.\r\n\r\nSi los problemas persisten, activa el modo de depuración y revisa los registros o prueba la alternativa del modo Amigos.';

  @override
  String get helpFriendsModeTitle => 'El modo Amigos no funciona';

  @override
  String get helpFriendsModeSubtitle => 'Problemas comunes con amigos';

  @override
  String get helpFriendsModeBody => 'Consejos para solucionar problemas del modo Amigos:\r\n\r\n1. Asegúrate de que la cuenta amiga del relay esté agregada/aceptada en la consola (si es necesario).\r\n2. Intenta reiniciar el juego y actualizar la pestaña Amigos/LAN después de activar el modo Amigos.\r\n\r\nSi el servidor sigue sin aparecer para tus amigos, activa el modo de depuración y revisa los registros para identificar errores.';

  @override
  String get changeLanguageTitle => 'Cambiar idioma';

  @override
  String get changeLanguage => 'Idioma';

  @override
  String get useSystemLanguage => 'Usar idioma del sistema';

  @override
  String get couldNotOpenUrl => 'No se pudo abrir la URL';

  @override
  String get serverTrackerTitle => 'Rastreador de servidores';

  @override
  String get removeServerTitle => 'Eliminar servidor';

  @override
  String removeServerConfirm(Object name) {
    return '¿Eliminar \"$name\" de tu rastreador?';
  }

  @override
  String get removeServerFailed => 'Error al eliminar el servidor';

  @override
  String get refreshStatus => 'Actualizar estado';

  @override
  String get trackerSignInRequired => 'Inicio de sesión requerido';

  @override
  String get trackerSignInSubtitle => 'Inicia sesión para rastrear servidores y recibir notificaciones sin conexión.';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get noServersTracked => 'No hay servidores rastreados';

  @override
  String get trackerEmptySubtitle => 'Añade un servidor de Minecraft para monitorear su estado y recibir notificaciones.';

  @override
  String get fillAllFields => 'Por favor, completa todos los campos correctamente';

  @override
  String get slotUsedUpgrade => 'Tu espacio gratuito está en uso. Actualiza para más servidores.';

  @override
  String get addServerFailed => 'Error al añadir el servidor. Verifica tus datos.';

  @override
  String get ipAddressLabel => 'Dirección IP';

  @override
  String get platformLabel => 'Plataforma';

  @override
  String get bedrockLabel => 'Bedrock';

  @override
  String get addLabel => 'Añadir';

  @override
  String get statusOnline => 'En línea';

  @override
  String get statusOffline => 'Sin conexión';

  @override
  String get statusChecking => 'Verificando...';

  @override
  String get notificationsOn => 'Notificaciones activadas';

  @override
  String get notificationsOff => 'Notificaciones desactivadas';

  @override
  String get failedUpdateNotifications => 'Error al actualizar las notificaciones';

  @override
  String get editServerTitle => 'Editar servidor';

  @override
  String get serverNameHint => 'Nombre del servidor';

  @override
  String get failedSave => 'Error al guardar. Inténtalo de nuevo.';

  @override
  String get serverRenamed => 'Servidor renombrado';

  @override
  String get customizeLabel => 'Personalizar';

  @override
  String get customizeSubtitle => 'Reordena los mosaicos y personaliza la navegación';

  @override
  String get resetLabel => 'Restablecer';

  @override
  String get tilesSection => 'MOSAICOS';

  @override
  String get dragToReorder => 'Arrastra para reordenar';

  @override
  String get navigationSection => 'NAVEGACIÓN';

  @override
  String get navFixed => 'Inicio, Conector y Perfil siempre están fijos';

  @override
  String get leftSlot => 'Ranura izquierda (junto a Inicio)';

  @override
  String get rightSlot => 'Ranura derecha (junto a Perfil)';

  @override
  String get accentColorSection => 'COLOR DE ACENTO';

  @override
  String get opacityLabel => 'Opacidad';

  @override
  String get backgroundSection => 'FONDO';

  @override
  String get cardsSection => 'TARJETAS';

  @override
  String get editLabel => 'Editar';

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
  String get chooseUniqueUsername => 'Elige un nombre de usuario único para comenzar.';

  @override
  String get usernameFieldLabel => 'Nombre de usuario';

  @override
  String get usernameExampleHint => 'ej. CoolPlayer123';

  @override
  String get usernameFormatHint => '3–20 caracteres · letras, números y guiones bajos';

  @override
  String get displayNameOptional => 'Nombre para mostrar (opcional)';

  @override
  String get displayNameExampleHint => 'ej. Jugador Genial';

  @override
  String get usernameRequired => 'El nombre de usuario es obligatorio';

  @override
  String get usernameFormatError => 'El nombre de usuario debe tener 3–20 caracteres y solo puede contener letras, números y guiones bajos';

  @override
  String get usernameTaken => 'Este nombre de usuario ya está en uso';

  @override
  String get noConnectionError => 'Sin conexión. Verifica tu internet e inténtalo de nuevo.';

  @override
  String get home => 'Inicio';

  @override
  String get info => 'Info';

  @override
  String get navProfile => 'Perfil';

  @override
  String serverRemoved(Object name) {
    return '$name eliminado';
  }

  @override
  String serverAdded(Object name) {
    return '$name añadido';
  }
}
