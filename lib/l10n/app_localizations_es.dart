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
  String get nldServerLabel => 'SERVIDOR NETHERLINK';

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
  String get helpNetherlinkTitle => 'MCCompanion no aparece';

  @override
  String get helpNetherlinkSubtitle => 'Solución de problemas de detección LAN';

  @override
  String get helpNetherlinkBody => 'Si el servidor no aparece en tu consola, prueba estos pasos:\r\n\r\n✅ Comprobaciones básicas:\r\n1. Misma red WiFi - Tu teléfono/tableta y tu consola DEBEN estar en la misma WiFi\r\n2. Dirección de servidor correcta - Verifica de nuevo la IP y el puerto (predeterminado: 19132)\r\n3. Transmisión activa - Verifica que MCCompanion muestre el estado \\\"Transmitiendo\\\"\r\n\r\n🔄 Soluciones rápidas:\r\n• Reinicia la aplicación: detén la transmisión, cierra MCCompanion por completo, vuelve a abrirla e inténtalo de nuevo\r\n• Reinicia tu consola: a veces la consola necesita actualizarse para detectar juegos LAN\r\n• Revisa la pestaña Amigos/LAN: el servidor aparece en \\\"Amigos\\\" o \\\"Juegos LAN\\\", NO en la lista de servidores\r\n• Espera 10-15 segundos después de iniciar la transmisión\r\n• Desactiva las VPN: las VPN pueden bloquear las transmisiones locales\r\n\r\n⚠️ Problemas comunes:\r\n\\\"No route found for user\\\" → Asegúrate de que ambos dispositivos estén en la misma Wi‑Fi (evita redes de invitados)\r\n\\\"Unable to connect to MCCompanion relay server\\\" → Revisa tu internet / estado del relay\r\n\r\n📱 ¿Sigues teniendo problemas? Activa el modo de depuración en MCCompanion y revisa los registros, o prueba con otro servidor.';

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
  String get reportUser => 'Reportar usuario';
  @override
  String reportUserWithName(String username) => 'Reportar a @$username';
  @override
  String get reportMessage => 'Reportar mensaje';
  @override
  String get reportDisclaimer => 'Nuestro equipo revisará este reporte. Gracias por mantener la comunidad segura.';
  @override
  String get reportReasonSpam => 'Spam';
  @override
  String get reportReasonHarassment => 'Acoso o intimidación';
  @override
  String get reportReasonInappropriate => 'Contenido inapropiado';
  @override
  String get reportReasonOther => 'Otro';
  @override
  String get reportAdditionalDetails => 'Detalles adicionales (opcional)';
  @override
  String get reportSubmit => 'Enviar reporte';
  @override
  String get reportSuccess => 'Reporte enviado. Gracias.';
  @override
  String get reportFailed => 'No se pudo enviar el reporte. Inténtalo de nuevo.';
  @override
  String get messagePlaceholder => 'Mensaje...';
  @override
  String get noMessagesYet => 'Aún no hay mensajes.\n¡Di hola!';
  @override
  String get today => 'Hoy';
  @override
  String get yesterday => 'Ayer';
  @override
  String get noConversationsYet => 'Aún no hay conversaciones';
  @override
  String get startChatHint => 'Inicia un chat desde tu lista de amigos.';
  @override
  String get youPrefix => 'Tú';
  @override
  String get tabProfile => 'PERFIL';
  @override
  String get tabFriends => 'AMIGOS';
  @override
  String get tabRequests => 'SOLICITUDES';
  @override
  String get tabChats => 'CHATS';
  @override
  String get addFriend => 'Agregar amigo';
  @override
  String get usernameHint => 'nombre de usuario';
  @override
  String get send => 'Enviar';
  @override
  String friendRequestSentTo(String username) => 'Solicitud de amistad enviada a @$username';
  @override
  String alreadyFriendsWith(String username) => 'Ya eres amigo de @$username.';
  @override
  String requestAlreadyPending(String username) => 'Ya hay una solicitud pendiente con @$username.';
  @override
  String userNotFoundMsg(String username) => 'Usuario @$username no encontrado.';
  @override
  String cannotSendRequest(String username) => 'No puedes enviar una solicitud a @$username.';
  @override
  String get somethingWentWrong => 'Algo salió mal. Inténtalo de nuevo.';
  @override
  String friendRequestAccepted(String username) => 'Solicitud de amistad de @$username aceptada';
  @override
  String requestDeclined(String username) => 'Solicitud de @$username rechazada';
  @override
  String get deleteAccountTitle => 'Eliminar cuenta';
  @override
  String get deleteAccountBody => 'Esto eliminará permanentemente tu cuenta, mensajes, amigos y todos los datos asociados. Esta acción no se puede deshacer.';
  @override
  String get deletePermanently => 'Eliminar permanentemente';
  @override
  String get couldNotDeleteAccount => 'No se pudo eliminar la cuenta. Inténtalo de nuevo.';
  @override
  String get removeFriendTitle => 'Eliminar amigo';
  @override
  String removeFriendConfirm(String username) => '¿Deseas eliminar a @$username como amigo?';
  @override
  String get remove => 'Eliminar';
  @override
  String friendRemoved(String username) => '@$username eliminado de tus amigos';
  @override
  String get noFriendsYet => 'Aún no tienes amigos';
  @override
  String get noFriendsSub => 'Añade a alguien usando el botón en la parte superior derecha.';
  @override
  String get noPendingRequests => 'Sin solicitudes pendientes';
  @override
  String get requestsAppearHere => 'Las solicitudes de amistad aparecerán aquí.';
  @override
  String onlineFriendsLabel(int count) => 'EN LÍNEA — $count';
  @override
  String offlineFriendsLabel(int count) => 'DESCONECTADO — $count';
  @override
  String get couldNotUpdateVisibility => 'No se pudo actualizar la visibilidad. Inténtalo de nuevo.';
  @override
  String get aboutMe => 'Sobre mí';
  @override
  String get linkedAccountsTitle => 'Cuentas vinculadas';
  @override
  String get linkAccountsHint => 'Vincula tus cuentas de Minecraft para mostrarlas en tu perfil.';
  @override
  String get unlinkXboxTitle => 'Desvincular cuenta de Xbox';
  @override
  String removeLabelConfirm(String label) => '¿Eliminar $label de tus cuentas vinculadas?';
  @override
  String get unlinkJavaTitle => 'Desvincular Java Edition';
  @override
  String removeJavaConfirm(String username) => '¿Eliminar $username de tus cuentas vinculadas?';
  @override
  String get unlink => 'Desvincular';
  @override
  String get linkXbox => 'Vincular Xbox';
  @override
  String get linkJava => 'Vincular Java';
  @override
  String get appearOfflineLabel => 'Aparecer desconectado';
  @override
  String get appearOfflineOn => 'Los amigos te ven como desconectado';
  @override
  String get appearOfflineOff => 'Los amigos pueden ver cuando estás en línea';
  @override
  String get signOut => 'Cerrar sesión';
  @override
  String get profileCardTitle => 'Perfil';
  @override
  String get edit => 'Editar';
  @override
  String get displayNameLabel => 'Nombre visible';
  @override
  String get bioLabel => 'Bio';
  @override
  String get yourNameHint => 'Tu nombre';
  @override
  String get bioHint => 'Cuéntanos algo sobre ti';
  @override
  String get avatarUrlLabel => 'URL del avatar';
  @override
  String get usernameDisplayLabel => 'Nombre de usuario';
  @override
  String get profileUpdated => 'Perfil actualizado';
  @override
  String get findUser => 'Buscar usuario';
  @override
  String get signIn => 'Iniciar sesión';
  @override
  String get createAccount => 'Crear cuenta';
  @override
  String get signInSubtitle => 'Inicia sesión para agregar amigos y compartir tus sesiones.';
  @override
  String get emailAddressHint => 'Correo electrónico';
  @override
  String get passwordHint => 'Contraseña';
  @override
  String get forgotPassword => '¿Olvidaste tu contraseña?';
  @override
  String get continueWithGoogle => 'Continuar con Google';
  @override
  String get alreadyHaveAccount => '¿Ya tienes cuenta? Inicia sesión';
  @override
  String get noAccountYet => '¿No tienes cuenta? Regístrate';
  @override
  String get orDivider => 'o';
  @override
  String get resetPasswordTitle => 'Restablecer contraseña';
  @override
  String get resetPasswordBody => 'Ingresa tu correo electrónico y te enviaremos un enlace para restablecer tu contraseña.';
  @override
  String get sendLink => 'Enviar enlace';
  @override
  String resetLinkSent(String email) => 'Enlace de restablecimiento enviado a $email';
  @override
  String get noAccountForEmail => 'No se encontró ninguna cuenta para este correo electrónico.';
  @override
  String get invalidEmailError => 'Correo electrónico no válido.';
  @override
  String get couldNotSendResetEmail => 'No se pudo enviar el correo de restablecimiento. Inténtalo de nuevo.';
  @override
  String get incorrectEmailOrPassword => 'Correo o contraseña incorrectos.';
  @override
  String get emailAlreadyInUse => 'Este correo electrónico ya está en uso.';
  @override
  String get weakPassword => 'La contraseña debe tener al menos 6 caracteres.';
  @override
  String get googleSignInFailed => 'Error al iniciar sesión con Google. Inténtalo de nuevo.';
  @override
  String get appleSignInFailed => 'Error al iniciar sesión con Apple. Inténtalo de nuevo.';
  @override
  String get emailDifferentMethod => 'Ya existe una cuenta con este correo usando un método de inicio de sesión diferente.';
  @override
  String get enterEmailAndPassword => 'Por favor ingresa tu correo y contraseña.';
  @override
  String get profileNotSetUp => 'Perfil aún no configurado';
  @override
  String get chooseUsernameSubtitle => 'Elige un nombre de usuario para agregar amigos y compartir tus sesiones.';
  @override
  String get createProfile => 'Crear perfil';
  @override
  String get chooseUniqueUsername => 'Elige un nombre de usuario único para agregar amigos.';
  @override
  String get usernameFieldLabel => 'Nombre de usuario *';
  @override
  String get usernameFormatHint => '3–20 caracteres · solo a-z, 0-9 y _';
  @override
  String get displayNameOptional => 'Nombre visible (opcional)';
  @override
  String get usernameRequired => 'Por favor ingresa un nombre de usuario.';
  @override
  String get usernameFormatError => '3–20 caracteres, solo letras minúsculas, números y _';
  @override
  String get usernameTaken => 'Este nombre de usuario ya está en uso.';
  @override
  String get noConnectionError => 'Sin conexión. Inténtalo de nuevo.';
  @override
  String get usernameExampleHint => 'p.ej. jens_mc';
  @override
  String get displayNameExampleHint => 'p.ej. Jens';
  @override
  String get home => 'Inicio';
  @override
  String get info => 'Info';
  @override
  String get consoleConnect => 'Console Connect';
  @override
  String get consoleConnectSubtitle => 'Conectarse a servidores de Minecraft';
  @override
  String get minecraftSkins => 'Skins de Minecraft';
  @override
  String get minecraftSkinsSubtitle => 'Ver y editar skins de Java y Bedrock';
  @override
  String get minecraftWiki => 'Wiki de Minecraft';
  @override
  String get minecraftWikiSubtitle => 'Mobs, bloques, recetas y más';
  @override
  String get partnerServersLabel => 'Servidores asociados';
  @override
  String get partnerServersSubtitle => 'Servidores de Minecraft destacados';
  @override
  String get userLookup => 'Búsqueda de usuario de Minecraft';
  @override
  String get userLookupSubtitle => 'Buscar perfiles de Java y Bedrock';

  @override
  String get navSkins => 'Skins';
  @override
  String get navWiki => 'Wiki';
  @override
  String get navProfile => 'Perfil';

  @override
  String get skinsUpload => 'Subir';
  @override
  String get skinsCreate => 'Crear';
  @override
  String get skinsSubtitle => 'Ver y descargar skins de Minecraft.';
  @override
  String get skinsSectionRecent => 'SKINS RECIENTES';
  @override
  String get skinsSectionMy => 'MIS SKINS';
  @override
  String get skinsSectionYours => 'TUS SKINS';
  @override
  String get skinsEmptyMySkins => 'Aún no hay skins guardados. Crea o sube uno para empezar.';
  @override
  String get skinsCouldNotLoad => 'No se pudieron cargar los skins';
  @override
  String skinsPageOf(int page, int total) => 'Página $page / $total';
  @override
  String get skinsMustBe64 => 'El skin debe ser de 64×64 píxeles';
  @override
  String get skinsInvalidFile => 'Archivo de imagen inválido';
  @override
  String get skinsDownload => 'Descargar';
  @override
  String get skinsEdit => 'Editar';
  @override
  String get skinsNoAccountsTitle => 'No hay cuentas vinculadas';
  @override
  String get skinsNoAccountsSubtitle => 'Vincula Java o Bedrock en Perfil para ver tu skin.';
  @override
  String get skinsSignInTitle => 'Inicia sesión para ver tu skin';
  @override
  String get skinsSignInSubtitle => 'Crea una cuenta y vincula Java o Bedrock en Perfil.';

  // ── Player Lookup ────────────────────────────────────────────────────────
  @override
  String get playerLookupTitle => 'Buscar jugador';
  @override
  String get playerLookupSubtitle => 'Busca por nombre de usuario Java, UUID, gamertag de Bedrock o XUID.';
  @override
  String get playerLookupHint => 'Nombre de usuario, gamertag, UUID o XUID…';
  @override
  String get playerLookupLinked => 'Cuentas vinculadas a través de GeyserMC';
  @override
  String get playerLookupLabelUsername => 'Nombre de usuario';
  @override
  String get playerLookupLabelTier => 'Nivel';
  @override
  String playerLookupCopied(String label) => '$label copiado';
  // ── Wiki ──────────────────────────────────────────────────────────────────
  @override
  String get wikiTitle => 'Wiki';
  @override
  String get wikiSearchHint => 'Buscar mobs, objetos, bloques…';
  @override
  String get wikiMinecraftWiki => 'minecraft.wiki';
  @override
  String wikiCategories(int count) => '$count categorías';
  @override
  String wikiNoResults(String query) => 'Sin resultados para "$query"';
  @override
  String get wikiNoPagesFound => 'No se encontraron páginas en esta categoría.';
  @override
  String get wikiCouldNotLoadPages => 'No se pudieron cargar las páginas.';
  @override
  String get wikiCouldNotReach => 'No se pudo acceder a la Wiki de Minecraft.';
  @override
  String get wikiCouldNotLoadContent => 'No se pudo cargar el contenido de la página.';
  @override
  String get wikiOpenInBrowser => 'Abrir en el navegador';
  @override
  String get wikiReadFullArticle => 'Leer el artículo completo en minecraft.wiki';
  @override
  String get wikiCrafting => 'Fabricación';
  @override
  String get wikiMobs => 'Criaturas';
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
  String get wikiUtility => 'Utilitario';
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
  String get wikiFood => 'Alimento';
  @override
  String get wikiBrewing => 'Elaboración';
  @override
  String get wikiMaterials => 'Materiales';
  @override
  String get wikiOverworld => 'Mundo Superior';
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
}
