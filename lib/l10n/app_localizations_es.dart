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
  String get reportUser => 'Reportar usuario';

  @override
  String get reportMessage => 'Reportar mensaje';

  @override
  String reportUserWithName(Object name) {
    return 'Reportar a $name';
  }

  @override
  String get reportDisclaimer => 'Los informes son revisados por nuestro equipo.';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonHarassment => 'Acoso';

  @override
  String get reportReasonInappropriate => 'Contenido inapropiado';

  @override
  String get reportReasonOther => 'Otro';

  @override
  String get reportAdditionalDetails => 'Detalles adicionales (opcional)…';

  @override
  String get reportSuccess => 'Informe enviado. Gracias.';

  @override
  String get reportFailed => 'No se pudo enviar el informe.';

  @override
  String get reportSubmit => 'Enviar informe';

  @override
  String get today => 'Hoy';

  @override
  String get yesterday => 'Ayer';

  @override
  String get messagePlaceholder => 'Mensaje…';

  @override
  String get noMessagesYet => 'Aún no hay mensajes.\n¡Di hola!';

  @override
  String get noConversationsYet => 'Aún no hay conversaciones';

  @override
  String get startChatHint => '¡Encuentra un amigo y empieza a chatear!';

  @override
  String get youPrefix => 'Tú';

  @override
  String get playerLookupTitle => 'Buscar jugador';

  @override
  String get playerLookupSubtitle => 'Busca un jugador Java o Bedrock';

  @override
  String get playerLookupHint => 'Introduce un nombre de usuario…';

  @override
  String get playerLookupLinked => 'Cuentas vinculadas encontradas';

  @override
  String get playerLookupLabelUsername => 'Nombre de usuario';

  @override
  String get playerLookupLabelTier => 'Nivel';

  @override
  String playerLookupCopied(Object value) {
    return '$value copiado';
  }

  @override
  String get tabProfile => 'Perfil';

  @override
  String get tabFriends => 'Amigos';

  @override
  String get tabRequests => 'Solicitudes';

  @override
  String get tabChats => 'Chats';

  @override
  String get addFriend => 'Añadir amigo';

  @override
  String get usernameHint => 'Nombre de usuario';

  @override
  String get send => 'Enviar';

  @override
  String friendRequestSentTo(Object name) {
    return 'Solicitud enviada a $name';
  }

  @override
  String alreadyFriendsWith(Object name) {
    return 'Ya eres amigo de $name';
  }

  @override
  String requestAlreadyPending(Object name) {
    return 'Ya hay una solicitud pendiente para $name';
  }

  @override
  String userNotFoundMsg(Object name) {
    return 'Usuario $name no encontrado';
  }

  @override
  String cannotSendRequest(Object name) {
    return 'No se puede enviar solicitud a $name';
  }

  @override
  String get somethingWentWrong => 'Algo salió mal. Inténtalo de nuevo.';

  @override
  String friendRequestAccepted(Object name) {
    return 'Ahora eres amigo de $name';
  }

  @override
  String requestDeclined(Object name) {
    return 'Solicitud de $name rechazada';
  }

  @override
  String get deleteAccountTitle => 'Eliminar cuenta';

  @override
  String get deleteAccountBody => 'Esto eliminará permanentemente tu cuenta y todos los datos.';

  @override
  String get deletePermanently => 'Eliminar permanentemente';

  @override
  String get couldNotDeleteAccount => 'No se pudo eliminar la cuenta.';

  @override
  String get removeFriendTitle => 'Eliminar amigo';

  @override
  String removeFriendConfirm(Object name) {
    return '¿Eliminar a $name de tus amigos?';
  }

  @override
  String get remove => 'Eliminar';

  @override
  String friendRemoved(Object name) {
    return '$name ha sido eliminado de tus amigos';
  }

  @override
  String get emailDifferentMethod => 'Este correo está vinculado a otro método';

  @override
  String get googleSignInFailed => 'Error de inicio de sesión de Google.';

  @override
  String get appleSignInFailed => 'Error de inicio de sesión de Apple. Inténtalo de nuevo.';

  @override
  String get resetPasswordTitle => 'Restablecer contraseña';

  @override
  String get resetPasswordBody => 'Introduce tu correo para recibir un enlace.';

  @override
  String get emailAddressHint => 'Correo electrónico';

  @override
  String get sendLink => 'Enviar enlace';

  @override
  String resetLinkSent(Object email) {
    return 'Enlace enviado a $email';
  }

  @override
  String get noAccountForEmail => 'No se encontró cuenta para ese correo';

  @override
  String get invalidEmailError => 'El correo electrónico no es válido';

  @override
  String get couldNotSendResetEmail => 'No se pudo enviar el correo.';

  @override
  String get enterEmailAndPassword => 'Introduce tu correo y contraseña';

  @override
  String get incorrectEmailOrPassword => 'Correo o contraseña incorrectos';

  @override
  String get emailAlreadyInUse => 'Este correo ya está en uso';

  @override
  String get weakPassword => 'Contraseña demasiado débil.';

  @override
  String get createAccount => 'Crear cuenta';

  @override
  String get signInSubtitle => 'Inicia sesión para acceder a tu perfil.';

  @override
  String get passwordHint => 'Contraseña';

  @override
  String get forgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get orDivider => 'o';

  @override
  String get continueWithGoogle => 'Continuar con Google';

  @override
  String get alreadyHaveAccount => '¿Ya tienes cuenta? Iniciar sesión';

  @override
  String get noAccountYet => '¿Sin cuenta? Crea una';

  @override
  String get profileNotSetUp => 'Perfil no configurado';

  @override
  String get chooseUsernameSubtitle => 'Elige un nombre de usuario para conectarte.';

  @override
  String get createProfile => 'Crear perfil';

  @override
  String get findUser => 'Buscar usuario';

  @override
  String get couldNotUpdateVisibility => 'No se pudo actualizar la visibilidad';

  @override
  String get signOut => 'Cerrar sesión';

  @override
  String get appearOfflineLabel => 'Aparecer sin conexión';

  @override
  String get appearOfflineOn => 'Apareces sin conexión';

  @override
  String get appearOfflineOff => 'Apareces en línea';

  @override
  String get unlinkXboxTitle => 'Desvincular cuenta Xbox';

  @override
  String removeLabelConfirm(Object name) {
    return '¿Eliminar a $name de tus cuentas vinculadas?';
  }

  @override
  String get unlink => 'Desvincular';

  @override
  String get unlinkJavaTitle => 'Desvincular cuenta Java';

  @override
  String removeJavaConfirm(Object name) {
    return '¿Eliminar a $name de tus cuentas vinculadas?';
  }

  @override
  String get linkedAccountsTitle => 'Cuentas vinculadas';

  @override
  String get linkAccountsHint => 'Vincula tus cuentas de Minecraft.';

  @override
  String get linkXbox => 'Vincular Xbox';

  @override
  String get linkJava => 'Vincular Java';

  @override
  String get profileUpdated => 'Perfil actualizado';

  @override
  String get profileCardTitle => 'Perfil';

  @override
  String get edit => 'Editar';

  @override
  String get displayNameLabel => 'Nombre para mostrar';

  @override
  String get yourNameHint => 'Tu nombre';

  @override
  String get bioLabel => 'Bio';

  @override
  String get bioHint => 'Cuéntales a otros sobre ti…';

  @override
  String get avatarUrlLabel => 'URL del avatar';

  @override
  String get usernameDisplayLabel => 'Nombre de usuario';

  @override
  String get aboutMe => 'Sobre mí';

  @override
  String get noFriendsYet => 'Aún no hay amigos';

  @override
  String get noFriendsSub => 'Añade amigos para verlos aquí.';

  @override
  String onlineFriendsLabel(Object count) {
    return '$count en línea';
  }

  @override
  String offlineFriendsLabel(Object count) {
    return '$count sin conexión';
  }

  @override
  String get noPendingRequests => 'No hay solicitudes pendientes';

  @override
  String get requestsAppearHere => 'Las nuevas solicitudes aparecerán aquí.';

  @override
  String get skinsEdit => 'Editar';

  @override
  String get skinsNoAccountsTitle => 'No hay cuentas de Minecraft vinculadas';

  @override
  String get skinsNoAccountsSubtitle => 'Vincula una cuenta para ver tus skins.';

  @override
  String get skinsSignInTitle => 'Inicia sesión para ver tus skins';

  @override
  String get skinsSignInSubtitle => 'Inicia sesión para ver tus skins.';

  @override
  String get skinsMustBe64 => 'El skin debe ser de 64×64 píxeles';

  @override
  String get skinsInvalidFile => 'Archivo de imagen no válido';

  @override
  String get skinsUpload => 'Subir';

  @override
  String get skinsCreate => 'Crear';

  @override
  String get skinsSectionRecent => 'SKINS RECIENTES';

  @override
  String get skinsSectionMy => 'MIS SKINS';

  @override
  String get skinsEmptyMySkins => 'Aún no hay skins. ¡Sube uno!';

  @override
  String get skinsSectionYours => 'TUS SKINS';

  @override
  String get skinsCouldNotLoad => 'No se pudieron cargar los skins';

  @override
  String skinsPageOf(Object page, Object total) {
    return 'Página $page de $total';
  }

  @override
  String get skinsDownload => 'Descargar';

  @override
  String get wikiTitle => 'Wiki';

  @override
  String get wikiMinecraftWiki => 'Wiki de Minecraft';

  @override
  String get wikiSearchHint => 'Buscar en el wiki…';

  @override
  String get wikiCouldNotLoadPages => 'No se pudieron cargar las páginas.';

  @override
  String get wikiCouldNotReach => 'No se pudo acceder al wiki.';

  @override
  String wikiNoResults(Object query) {
    return 'No hay resultados para \"$query\"';
  }

  @override
  String get wikiNoPagesFound => 'No se encontraron páginas';

  @override
  String wikiCategories(Object count) {
    return '$count categorías';
  }

  @override
  String get wikiCouldNotLoadContent => 'No se pudo cargar el contenido.';

  @override
  String get wikiOpenInBrowser => 'Abrir en el navegador';

  @override
  String get wikiCrafting => 'Fabricación';

  @override
  String get wikiReadFullArticle => 'Leer artículo completo';

  @override
  String get wikiMobs => 'Mobs';

  @override
  String get wikiBlocks => 'Bloques';

  @override
  String get wikiItems => 'Objetos';

  @override
  String get wikiBiomes => 'Biomas';

  @override
  String get wikiStructures => 'Estructuras';

  @override
  String get wikiEnchantments => 'Encantamientos';

  @override
  String get wikiPotions => 'Pociones';

  @override
  String get wikiPassive => 'Pasivo';

  @override
  String get wikiNeutral => 'Neutral';

  @override
  String get wikiHostile => 'Hostil';

  @override
  String get wikiBoss => 'Jefe';

  @override
  String get wikiUtility => 'Utilidad';

  @override
  String get wikiNatural => 'Natural';

  @override
  String get wikiOres => 'Minerales';

  @override
  String get wikiWood => 'Madera';

  @override
  String get wikiStone => 'Piedra';

  @override
  String get wikiRedstone => 'Redstone';

  @override
  String get wikiPlants => 'Plantas';

  @override
  String get wikiDecoration => 'Decoración';

  @override
  String get wikiTools => 'Herramientas';

  @override
  String get wikiSwords => 'Espadas';

  @override
  String get wikiRanged => 'A distancia';

  @override
  String get wikiArmor => 'Armadura';

  @override
  String get wikiFood => 'Comida';

  @override
  String get wikiBrewing => 'Elaboración';

  @override
  String get wikiMaterials => 'Materiales';

  @override
  String get wikiOverworld => 'Mundo superior';

  @override
  String get wikiNether => 'Nether';

  @override
  String get wikiTheEnd => 'El Fin';

  @override
  String get wikiSword => 'Espada';

  @override
  String get wikiTool => 'Herramienta';

  @override
  String get wikiBow => 'Arco';

  @override
  String get wikiFishing => 'Pesca';

  @override
  String get wikiStatusEffects => 'Efectos de estado';

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

  @override
  String get paywallRestore => 'Restaurar';

  @override
  String get paywallMonthly => 'Mensual';

  @override
  String get paywallYearly => 'Anual';

  @override
  String get paywallSavePercent => 'Ahorra ~17%';

  @override
  String get paywallSubtitle => 'Rastrea más servidores y recibe notificaciones.';

  @override
  String paywallSlotLabel(Object slots) {
    return '$slots slots de servidor';
  }

  @override
  String get paywallPopular => 'Popular';

  @override
  String get paywallContinue => 'Continuar';

  @override
  String get paywallNoPkgs => 'No hay paquetes disponibles.';

  @override
  String get paywallManaged => 'Gestionado por Apple/Google. Cancela cuando quieras.';

  @override
  String get paywallPurchaseSuccess => '¡Compra exitosa!';

  @override
  String get paywallPurchaseFailed => 'Compra fallida.';

  @override
  String get paywallPurchasesRestored => '¡Compras restauradas!';

  @override
  String get paywallNoActivePurchases => 'No se encontraron compras activas.';

  @override
  String get paywallRestoreFailed => 'Restauración fallida.';

  @override
  String get relay => 'Relay';

  @override
  String get selectModeSection => 'SELECCIONAR MODO';

  @override
  String get serversSection => 'SERVIDORES';

  @override
  String get noServerSelected => 'Ningún servidor seleccionado';

  @override
  String get selectBedrockAccount => 'Seleccionar cuenta Bedrock';

  @override
  String playersCount(Object players, Object max) {
    return '$players / $max jugadores';
  }

  @override
  String get infoAndLegal => 'Info y Legal';

  @override
  String get legalSection => 'Legal';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get privacyPolicySubtitle => 'Cómo recopilamos tus datos';

  @override
  String get termsOfService => 'Términos de servicio';

  @override
  String get termsOfServiceSubtitle => 'Reglas y condiciones de uso';

  @override
  String get dataSourcesSection => 'Fuentes de datos y créditos';

  @override
  String get creditMinecraftWikiSubtitle => 'Fuente de datos para el Wiki. Contenido bajo Creative Commons.';

  @override
  String get creditMojangTitle => 'Mojang / Microsoft';

  @override
  String get creditMojangSubtitle => 'Skins y perfiles Java vía API de Mojang.';

  @override
  String get creditGeyserTitle => 'GeyserMC';

  @override
  String get creditGeyserSubtitle => 'Renderizado de skins Bedrock vía GeyserMC.';

  @override
  String get creditXboxTitle => 'Xbox / Microsoft';

  @override
  String get creditXboxSubtitle => 'Vinculación de cuentas Bedrock vía Xbox Live.';

  @override
  String get aboutMCCompanionSection => 'Acerca de MCCompanion';

  @override
  String get aboutMCCompanionDisclaimer => 'MCCompanion es una app independiente no afiliada a Mojang o Microsoft.';

  @override
  String get minecraftTrademark => '\"Minecraft\" es una marca registrada de Microsoft Corporation.';

  @override
  String get nldServerLabelShort => 'Servidor MCCompanion';

  @override
  String get editServer => 'Editar servidor';

  @override
  String get serverNameExampleHint => 'Mi Servidor Increíble';

  @override
  String get serverAddressExampleHint => 'play.ejemplo.com';

  @override
  String get serverDescriptionExampleHint => 'Servidor supervivencia con amigos';

  @override
  String get editionLabel => 'Edición';

  @override
  String get nameLabel => 'Nombre';

  @override
  String get ipAddressFieldLabel => 'Dirección IP';

  @override
  String get portFieldLabel => 'Puerto';

  @override
  String get platformFieldLabel => 'Plataforma';

  @override
  String get nameValidationError => 'El nombre debe tener 1–50 caracteres';

  @override
  String get ipRequiredError => 'La dirección IP es obligatoria';

  @override
  String get portRangeError => 'El puerto debe estar entre 1 y 65535';

  @override
  String get partnerServersTitle => 'Servidores asociados';

  @override
  String get noPartnerServers => 'Aún no hay servidores asociados.';

  @override
  String get checkBackLater => 'Vuelve más tarde.';

  @override
  String get xboxLinkTitle => 'Vincular cuenta Xbox';

  @override
  String get xboxStartingLogin => 'Iniciando sesión de Xbox…';

  @override
  String get xboxSignInWithMicrosoft => 'Iniciar sesión con Microsoft';

  @override
  String get xboxGoToLink => 'Ve al enlace e introduce el código.';

  @override
  String get xboxYourCode => 'Tu código';

  @override
  String get xboxTapToCopy => 'Toca el código para copiarlo';

  @override
  String get xboxOpenLink => 'Abrir microsoft.com/link';

  @override
  String get xboxWaitingForLogin => 'Esperando inicio de sesión…';

  @override
  String get xboxAccountLinked => '¡Cuenta Xbox vinculada!';

  @override
  String get xboxCodeCopied => 'Código copiado al portapapeles';

  @override
  String get xboxCouldNotStart => 'No se pudo iniciar la sesión de Xbox.';

  @override
  String get xboxCodeExpired => 'El código expiró. Inténtalo de nuevo.';

  @override
  String get xboxSomethingWrong => 'Algo salió mal.';

  @override
  String get tryAgain => 'Intentar de nuevo';

  @override
  String get publicProfileTitle => 'Perfil';

  @override
  String get userNotFound => 'Usuario no encontrado';

  @override
  String get profileSectionLabel => 'Perfil';

  @override
  String get displayNameRowLabel => 'Nombre para mostrar';

  @override
  String get usernameRowLabel => 'Nombre de usuario';

  @override
  String get lastSeenLabel => 'Última vez visto';

  @override
  String get aboutSectionLabel => 'Acerca de';

  @override
  String get xboxBedrockLabel => 'Xbox / Bedrock';

  @override
  String get friendRequestSent => 'Solicitud de amistad enviada';

  @override
  String get alreadyFriendsMsg => 'Ya sois amigos.';

  @override
  String get requestAlreadyPendingMsg => 'Ya hay una solicitud pendiente.';

  @override
  String get userNotFoundMsg2 => 'Usuario no encontrado.';

  @override
  String get cannotSendRequestMsg => 'No se puede enviar una solicitud.';

  @override
  String nowFriendsWith(Object username) {
    return 'Ahora amigos con @$username';
  }

  @override
  String get removeFriendButton => 'Eliminar amigo';

  @override
  String get requestSentButton => 'Solicitud enviada';

  @override
  String get acceptRequestButton => 'Aceptar solicitud';

  @override
  String get addFriendButton => 'Añadir amigo';

  @override
  String get removeFriendDialogTitle => 'Eliminar amigo';

  @override
  String removeFriendDialogBody(Object username) {
    return '¿Eliminar a @$username como amigo?';
  }

  @override
  String get trackerLimitReached => 'Has alcanzado tu límite. Actualiza para más servidores.';

  @override
  String get upgradeButton => 'Actualizar';

  @override
  String get javaLinkTitle => 'Vincular Java Edition';

  @override
  String get javaStartingLogin => 'Iniciando sesión de Microsoft…';

  @override
  String get javaSignInWithMicrosoft => 'Iniciar sesión con Microsoft';

  @override
  String get javaGoToLink => 'Ve al enlace de abajo e introduce el código para conectar tu cuenta de Minecraft Java Edition.';

  @override
  String get javaYourCode => 'Tu código';

  @override
  String get javaTapToCopy => 'Toca el código para copiarlo';

  @override
  String get javaOpenLink => 'Abrir microsoft.com/link';

  @override
  String get javaWaitingForLogin => 'Esperando inicio de sesión…';

  @override
  String get javaAccountLinked => '¡Java Edition vinculado!';

  @override
  String get javaNoJavaTitle => 'No se encontró Java Edition';

  @override
  String get javaNoJavaBody => 'La cuenta de Microsoft con la que iniciaste sesión no posee Minecraft Java Edition.';

  @override
  String get javaTryDifferentAccount => 'Probar otra cuenta';

  @override
  String get javaCouldNotStart => 'No se pudo iniciar la sesión de Microsoft. Inténtalo de nuevo.';

  @override
  String get javaCodeExpired => 'El código expiró. Inténtalo de nuevo.';

  @override
  String get javaSomethingWrong => 'Algo salió mal. Inténtalo de nuevo.';

  @override
  String get javaCodeCopied => 'Código copiado al portapapeles';

  @override
  String get splashFeatureConnect => 'Conectar';

  @override
  String get splashFeatureFriends => 'Amigos';

  @override
  String get splashFeatureChat => 'Chat';

  @override
  String get splashFeatureSkins => 'Skins';

  @override
  String get featureLabelConnector => 'Conector';

  @override
  String get featureLabelSkins => 'Skins';

  @override
  String get featureLabelWiki => 'Wiki';

  @override
  String get featureLabelPartners => 'Socios';

  @override
  String get featureLabelLookup => 'Buscar';

  @override
  String get featureLabelTracker => 'Rastreador';

  @override
  String get featureSubtitleConnector => 'Conectar consolas a Minecraft';

  @override
  String get featureSubtitleSkins => 'Explorar y gestionar skins de Minecraft';

  @override
  String get featureSubtitleWiki => 'Enciclopedia de Minecraft';

  @override
  String get featureSubtitlePartners => 'Servidores destacados';

  @override
  String get featureSubtitleLookup => 'Buscar perfiles Java y Bedrock';

  @override
  String get featureSubtitleTracker => 'Monitorear estado del servidor y recibir notificaciones';

  @override
  String get userSearchHint => 'Nombre de usuario, gamertag o nombre Java…';

  @override
  String get userSearchSub => 'Buscar por nombre de usuario, gamertag de Xbox o nombre Java';

  @override
  String get onlineStatus => 'En línea';

  @override
  String get upgradeWindowsHint => 'Actualización disponible en Microsoft Store';

  @override
  String get chatEmptyHint => '¡Sé el primero en decir algo!';

  @override
  String get skinSaved => 'Skin guardado';

  @override
  String skinSavedAs(String name) {
    return 'Guardado como \"$name\"';
  }

  @override
  String get skinExportFailed => 'Error al exportar';

  @override
  String get skinExported => 'Skin exportado correctamente';

  @override
  String get accountActions => 'CUENTA';

  @override
  String get feedbackBugReport => 'Informe de error';

  @override
  String get feedbackFeatureRequest => 'Solicitud de función';

  @override
  String get feedbackGoesToGithub => 'Va directo a GitHub';

  @override
  String get feedbackTitleLabel => 'Título';

  @override
  String get feedbackTitleHintBug => 'ej. La app se cierra al abrir el editor de skins';

  @override
  String get feedbackTitleHintFeature => 'ej. Mostrar el ping del jugador en la lista de servidores';

  @override
  String get feedbackWhatHappened => '¿Qué pasó?';

  @override
  String get feedbackDescribeIdea => 'Describe tu idea';

  @override
  String get feedbackDescHintBug => 'Describe el error — ¿qué hiciste, qué esperabas y qué pasó en su lugar?';

  @override
  String get feedbackDescHintFeature => 'Explica qué te gustaría y por qué sería útil.';

  @override
  String get feedbackEmailLabel => 'Correo electrónico (opcional)';

  @override
  String get feedbackEmailHint => 'Para que podamos contactarte';

  @override
  String get feedbackEmailNote => 'Tu correo nunca se comparte públicamente.';

  @override
  String get feedbackSubmitBug => 'Enviar informe de error';

  @override
  String get feedbackSubmitFeature => 'Enviar solicitud de función';

  @override
  String get feedbackDisclaimer => 'Crea un ticket público en GitHub · No incluyas contraseñas';

  @override
  String get feedbackSuccessTitle => '¡Gracias por tu opinión!';

  @override
  String get feedbackSuccessBody => 'Tu informe fue enviado y se creó un ticket en GitHub. Lo revisaremos lo antes posible.';

  @override
  String get feedbackViewOnGithub => 'Ver en GitHub';

  @override
  String get feedbackSubmitAnother => 'Enviar otro';

  @override
  String get feedbackBackToApp => 'Volver a la app';

  @override
  String get feedbackTitleTooShort => 'El título debe tener al menos 5 caracteres.';

  @override
  String get feedbackDescTooShort => 'La descripción debe tener al menos 10 caracteres.';

  @override
  String get feedbackSubmitFailed => 'Error al enviar. Por favor, inténtalo de nuevo.';

  @override
  String get feedbackTileTitle => 'Reportar un error o sugerir una función';

  @override
  String get feedbackTileSubtitle => 'Ayúdanos a mejorar MCCompanion';
}
