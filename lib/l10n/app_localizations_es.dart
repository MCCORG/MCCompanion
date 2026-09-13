// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get console => 'Consola';

  @override
  String get modeLabel => 'Modo';

  @override
  String get statusLabel => 'Estado';

  @override
  String get seeAll => 'Ver todo';

  @override
  String get sectionHelp => 'Ayuda';

  @override
  String get sectionAdvanced => 'Avanzado';

  @override
  String get versionLabel => 'Versión';

  @override
  String get consoleOutput => 'Salida de la consola';

  @override
  String get noLogsYet => 'Aún no hay registros';

  @override
  String get startBroadcastingToSeeOutput =>
      'Inicia la transmisión para ver la salida';

  @override
  String get close => 'Cerrar';

  @override
  String get ok => 'OK';

  @override
  String get back => 'Atrás';

  @override
  String get next => 'Siguiente';

  @override
  String get done => 'Listo';

  @override
  String get none => 'Ninguno';

  @override
  String get onboardingThemeTitle => 'Elige un tema';

  @override
  String get onboardingThemeSubtitle =>
      'Puedes ajustar cada color en los ajustes más tarde.';

  @override
  String get onboardingNavTitle => 'Acceso rápido';

  @override
  String get onboardingNavSubtitle =>
      'Elige dos funciones para tu barra de navegación.';

  @override
  String get onboardingNavLeftLabel => 'BOTÓN IZQUIERDO';

  @override
  String get onboardingNavRightLabel => 'BOTÓN DERECHO';

  @override
  String get onboardingNavPreviewConnector => 'Conector';

  @override
  String get onboardingNavPreviewProfile => 'Perfil';

  @override
  String get onboardingNavPreviewEmpty => 'Vacío';

  @override
  String get onboardingCustomizeDetail => 'Personalizar en detalle →';

  @override
  String get website => 'Sitio web';

  @override
  String get howToUseMenu => 'Cómo usar';

  @override
  String get support => 'Soporte';

  @override
  String get start => 'Iniciar';

  @override
  String get stop => 'Detener';

  @override
  String get labelJava => 'Java';

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
  String get addServer => 'Agregar servidor';

  @override
  String get addServersHint =>
      'Agrega servidores para conectarte rápidamente más tarde';

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
  String get clientDisconnected => 'Cliente desconectado: transmisión detenida';

  @override
  String get pleaseEnterServer =>
      '⚠️ Por favor, introduce una dirección de servidor';

  @override
  String get invalidPort => '⚠️ Número de puerto no válido (1-65535)';

  @override
  String get dataSentToServers =>
      'Datos enviados a los servidores de MCCompanion';

  @override
  String selectedServer(Object name) {
    return '📋 Seleccionado: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'Seleccionado: $name';
  }

  @override
  String copiedLogs(Object count) {
    return 'Se copiaron $count entradas de registro al portapapeles';
  }

  @override
  String get debugEnabled => 'Registros de depuración activados';

  @override
  String get iUnderstand => 'Entiendo';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'Seleccionado: $relayName\r\n\r\nCómo conectarte:\r\n1. Ve a la configuración de tu Switch y cambia el DNS a: $relayIp\r\n2. Abre Minecraft y selecciona un servidor de la lista (como Cubecraft o Hive).\r\n3. Ahora serás enviado automáticamente a tu propio servidor.';
  }

  @override
  String get noSavedServers => 'No hay servidores guardados';

  @override
  String get savedServers => 'Servidores guardados';

  @override
  String get manageServers => 'Administrar servidores';

  @override
  String get active => 'Activo';

  @override
  String get vpnDetected => 'VPN detectada';

  @override
  String get noWifi => 'Sin Wi‑Fi';

  @override
  String get vpnActive =>
      'Detectamos que tu VPN está activa.\n\nDesactiva tu VPN antes de usar MCCompanion; de lo contrario, la transmisión LAN puede no llegar a tu consola.';

  @override
  String get mobileActive =>
      'Detectado: datos móviles\n\nMCCompanion debe estar en la misma red que tu consola. Conéctate a tu Wi‑Fi doméstica o punto de acceso antes de continuar.';

  @override
  String get continueAnyway => 'Continuar de todos modos';

  @override
  String get updateAvailable => 'Actualización disponible';

  @override
  String get stopBroadcasting => 'Detener transmisión';

  @override
  String get startNintendoMode => 'Iniciar modo Nintendo';

  @override
  String get startFriendsMode => 'Iniciar modo Amigos';

  @override
  String get startBroadcasting => 'Iniciar transmisión';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'Amigos';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / conexión proxy)';

  @override
  String get howToXboxSubtitle => 'Juega mediante transmisión LAN o proxy';

  @override
  String get howToXboxBody =>
      'Cómo conectarte (Xbox / PS4 / PS5):\r\n1. Asegúrate de que el dispositivo que ejecuta MCCompanion y tu consola estén en la misma red local.\r\n2. En la aplicación, introduce la dirección y el puerto de tu servidor de Minecraft y pulsa \\\"Iniciar transmisión\\\".\r\n3. En la consola, abre Minecraft → Jugar → busca Mundos LAN o la pestaña Amigos y actualiza la lista.\r\n4. Selecciona el servidor LAN llamado \\\"MCCompanion\\\" para unirte.\r\nNotas:\r\n- Si el servidor no aparece, confirma que ambos dispositivos están en la misma subred y que la aplicación sigue transmitiendo.\r\n- Algunos modelos de consola o routers pueden bloquear el descubrimiento LAN; prueba cambiando la aplicación o la configuración del router si es necesario.';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (modo DNS)';

  @override
  String get howToNintendoSubtitle => 'Instrucciones de relay DNS para Switch';

  @override
  String get howToFriendsTitle => 'Modo Amigos';

  @override
  String get howToFriendsSubtitle => 'Invita a amigos y únete mediante LAN';

  @override
  String get helpMCCompanionTitle => 'MCCompanion no aparece';

  @override
  String get helpMCCompanionSubtitle =>
      'Solución de problemas de detección LAN';

  @override
  String get helpMCCompanionBody =>
      'Si el servidor no aparece en tu consola, prueba estos pasos:\r\n\r\n✅ Comprobaciones básicas:\r\n1. Misma red WiFi - Tu teléfono/tableta y tu consola DEBEN estar en la misma WiFi\r\n2. Dirección de servidor correcta - Verifica de nuevo la IP y el puerto (predeterminado: 19132)\r\n3. Transmisión activa - Verifica que MCCompanion muestre el estado \\\"Transmitiendo\\\"\r\n\r\n🔄 Soluciones rápidas:\r\n• Reinicia la aplicación: detén la transmisión, cierra MCCompanion por completo, vuelve a abrirla e inténtalo de nuevo\r\n• Reinicia tu consola: a veces la consola necesita actualizarse para detectar juegos LAN\r\n• Revisa la pestaña Amigos/LAN: el servidor aparece en \\\"Amigos\\\" o \\\"Juegos LAN\\\", NO en la lista de servidores\r\n• Espera 10-15 segundos después de iniciar la transmisión\r\n• Desactiva las VPN: las VPN pueden bloquear las transmisiones locales\r\n\r\n⚠️ Problemas comunes:\r\n\\\"No route found for user\\\" → Asegúrate de que ambos dispositivos estén en la misma Wi‑Fi (evita redes de invitados)\r\n\\\"Unable to connect to MCCompanion relay server\\\" → Revisa tu internet / estado del relay\r\n\r\n📱 ¿Sigues teniendo problemas? Activa el modo de depuración en MCCompanion y revisa los registros, o prueba con otro servidor.';

  @override
  String get helpMultiplayerFailedTitle => 'Conexión multijugador fallida';

  @override
  String get helpMultiplayerFailedSubtitle =>
      'Explicación de por qué esto no es un error de MCCompanion';

  @override
  String get helpMultiplayerFailedBody =>
      '⚠️ ¡Esto no es un problema de MCCompanion!\r\n\r\nMCCompanion te redirigió correctamente al servidor solicitado. El mensaje \\\"Conexión multijugador fallida\\\" indica que el servidor de destino no está disponible en este momento. Posibles razones:\r\n\r\n• El servidor de Minecraft de destino está desconectado o sobrecargado\r\n• El servidor requiere una versión actualizada del cliente o una edición específica\r\n• Problemas de red entre el relay y el servidor de destino\r\n\r\nIntenta conectarte a otro servidor o contacta con el soporte del servidor. Si el problema persiste en varios servidores, activa el modo de depuración en MCCompanion y revisa los registros.';

  @override
  String get helpNintendoDnsTitle => 'El DNS de Nintendo no funciona';

  @override
  String get helpNintendoDnsSubtitle => 'Problemas comunes de DNS / relay';

  @override
  String get helpNintendoDnsBody =>
      'Si el modo DNS de Nintendo no funciona, revisa lo siguiente:\r\n\r\n1. Confirma que enviaste la configuración DNS desde la aplicación (Enviar configuración DNS).\r\n2. Verifica que aplicaste la IP del relay como DNS primario en la Switch.\r\n3. Asegúrate de que el servidor relay seleccionado (EU/US) esté en línea y no sobrecargado.\r\n4. Algunas redes (por ejemplo, portales cautivos) impiden el uso de DNS personalizado, prueba en otra red.\r\n\r\nSi los problemas persisten, activa el modo de depuración y revisa los registros o prueba la alternativa del modo Amigos.';

  @override
  String get helpFriendsModeTitle => 'El modo Amigos no funciona';

  @override
  String get helpFriendsModeSubtitle => 'Problemas comunes con amigos';

  @override
  String get helpFriendsModeBody =>
      'Consejos para solucionar problemas del modo Amigos:\r\n\r\n1. Asegúrate de que la cuenta amiga del relay esté agregada/aceptada en la consola (si es necesario).\r\n2. Intenta reiniciar el juego y actualizar la pestaña Amigos/LAN después de activar el modo Amigos.\r\n\r\nSi el servidor sigue sin aparecer para tus amigos, activa el modo de depuración y revisa los registros para identificar errores.';

  @override
  String get changeLanguageTitle => 'Cambiar idioma';

  @override
  String get changeLanguage => 'Idioma';

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
  String get trackerSignInSubtitle =>
      'Inicia sesión para rastrear servidores y recibir notificaciones sin conexión.';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get noServersTracked => 'No hay servidores rastreados';

  @override
  String get trackerEmptySubtitle =>
      'Añade un servidor de Minecraft para monitorear su estado y recibir notificaciones.';

  @override
  String get fillAllFields =>
      'Por favor, completa todos los campos correctamente';

  @override
  String get slotUsedUpgrade =>
      'Tu espacio gratuito está en uso. Actualiza para más servidores.';

  @override
  String get addServerFailed =>
      'Error al añadir el servidor. Verifica tus datos.';

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
  String get failedUpdateNotifications =>
      'Error al actualizar las notificaciones';

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
  String get customizeSubtitle => 'Barra de navegacion y colores';

  @override
  String get resetLabel => 'Restablecer';

  @override
  String get navigationSection => 'NAVEGACIÓN';

  @override
  String get navFixed => 'Connector y Perfil siempre son fijos';

  @override
  String get leftSlot => 'Slot 2';

  @override
  String get outerSlot => 'Slot 1';

  @override
  String get rightSlot => 'Slot 3';

  @override
  String get farSlot => 'Slot 4';

  @override
  String get colorPickerApply => 'Aplicar';

  @override
  String get colorPickerHex => 'Hex';

  @override
  String get textColorSection => 'COLOR DE TEXTO';

  @override
  String get textColorPickerTitle => 'Color de texto';

  @override
  String get textColorHint =>
      'Toca el círculo para elegir un color de texto personalizado';

  @override
  String get textColorPreviewPrimary => 'Primario';

  @override
  String get textColorPreviewSecondary => 'Secundario';

  @override
  String get textColorPreviewMuted => 'Silenciado';

  @override
  String get colorSwatchCustom => 'Personalizado';

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
  String get reportUser => 'Reportar usuario';

  @override
  String reportUserWithName(Object name) {
    return 'Reportar a $name';
  }

  @override
  String get reportDisclaimer =>
      'Los informes son revisados por nuestro equipo.';

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
  String get addFriend => 'Añadir amigo';

  @override
  String get send => 'Enviar';

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
  String get deleteAccountBody =>
      'Esto eliminará permanentemente tu cuenta y todos los datos.';

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
  String get appleSignInFailed =>
      'Error de inicio de sesión de Apple. Inténtalo de nuevo.';

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
    return 'Si existe una cuenta para $email, el enlace ya va en camino';
  }

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
  String get chooseUsernameSubtitle =>
      'Elige un nombre de usuario para que otros jugadores puedan encontrarte.';

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
  String get linkAccountsHint => 'Vincula tus cuentas de Minecraft.';

  @override
  String get linkXbox => 'Vincular Xbox';

  @override
  String get linkJava => 'Vincular Java';

  @override
  String get profileUpdated => 'Perfil actualizado';

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
  String get skinsMustBe64 => 'El skin debe ser de 64×64 píxeles';

  @override
  String get skinsInvalidFile => 'Archivo de imagen no válido';

  @override
  String get skinsUpload => 'Subir';

  @override
  String get skinsCreate => 'Crear';

  @override
  String get skinsDownload => 'Descargar';

  @override
  String get chooseUniqueUsername =>
      'Elige un nombre de usuario único para comenzar.';

  @override
  String get usernameFieldLabel => 'Nombre de usuario';

  @override
  String get usernameExampleHint => 'ej. CoolPlayer123';

  @override
  String get usernameFormatHint =>
      '3–20 caracteres · letras, números y guiones bajos';

  @override
  String get displayNameOptional => 'Nombre para mostrar (opcional)';

  @override
  String get displayNameExampleHint => 'ej. Jugador Genial';

  @override
  String get usernameRequired => 'El nombre de usuario es obligatorio';

  @override
  String get usernameFormatError =>
      'El nombre de usuario debe tener 3–20 caracteres y solo puede contener letras, números y guiones bajos';

  @override
  String get usernameTaken => 'Este nombre de usuario ya está en uso';

  @override
  String get noConnectionError =>
      'Sin conexión. Verifica tu internet e inténtalo de nuevo.';

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
  String get paywallSubtitle =>
      'Rastrea más servidores y recibe notificaciones.';

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
  String get paywallManaged =>
      'Gestionado por Apple/Google. Cancela cuando quieras.';

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
  String get serversSection => 'Servidores';

  @override
  String get selectBedrockAccount => 'Seleccionar cuenta Bedrock';

  @override
  String get infoAndLegal => 'Info y Legal';

  @override
  String get legalSection => 'Legal';

  @override
  String get privacyPolicy => 'política de privacidad';

  @override
  String get privacyPolicySubtitle => 'Cómo recopilamos tus datos';

  @override
  String get termsOfService => 'términos del servicio';

  @override
  String get termsOfServiceSubtitle => 'Reglas y condiciones de uso';

  @override
  String get dataSourcesSection => 'Fuentes de datos y créditos';

  @override
  String get creditMojangTitle => 'Mojang / Microsoft';

  @override
  String get creditMojangSubtitle => 'Skins y perfiles Java vía API de Mojang.';

  @override
  String get creditGeyserTitle => 'GeyserMC';

  @override
  String get creditGeyserSubtitle =>
      'Renderizado de skins Bedrock vía GeyserMC.';

  @override
  String get creditXboxTitle => 'Xbox / Microsoft';

  @override
  String get creditXboxSubtitle =>
      'Vinculación de cuentas Bedrock vía Xbox Live.';

  @override
  String get aboutMCCompanionSection => 'Acerca de MCCompanion';

  @override
  String get aboutMCCompanionDisclaimer =>
      'MCCompanion es una app independiente no afiliada a Mojang o Microsoft.';

  @override
  String get minecraftTrademark =>
      '\"Minecraft\" es una marca registrada de Microsoft Corporation.';

  @override
  String get nldServerLabelShort => 'Servidor MCCompanion';

  @override
  String get editServer => 'Editar servidor';

  @override
  String get serverNameExampleHint => 'Mi Servidor Increíble';

  @override
  String get serverAddressExampleHint => 'play.ejemplo.com';

  @override
  String get serverDescriptionExampleHint =>
      'Servidor supervivencia con amigos';

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
  String get trackerLimitReached => 'Límite de servidores alcanzado';

  @override
  String get upgradeButton => 'Actualizar';

  @override
  String get javaLinkTitle => 'Vincular Java Edition';

  @override
  String get javaStartingLogin => 'Iniciando sesión de Microsoft…';

  @override
  String get javaSignInWithMicrosoft => 'Iniciar sesión con Microsoft';

  @override
  String get javaGoToLink =>
      'Ve al enlace de abajo e introduce el código para conectar tu cuenta de Minecraft Java Edition.';

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
  String get javaNoJavaBody =>
      'La cuenta de Microsoft con la que iniciaste sesión no posee Minecraft Java Edition.';

  @override
  String get javaTryDifferentAccount => 'Probar otra cuenta';

  @override
  String get javaCouldNotStart =>
      'No se pudo iniciar la sesión de Microsoft. Inténtalo de nuevo.';

  @override
  String get javaCodeExpired => 'El código expiró. Inténtalo de nuevo.';

  @override
  String get javaSomethingWrong => 'Algo salió mal. Inténtalo de nuevo.';

  @override
  String get javaCodeCopied => 'Código copiado al portapapeles';

  @override
  String get featureLabelConnector => 'Conector';

  @override
  String get featureLabelSkins => 'Skins';

  @override
  String get featureLabelPartners => 'Lista de servidores';

  @override
  String get featureLabelLookup => 'Buscar';

  @override
  String get featureLabelTracker => 'Rastreador';

  @override
  String get userSearchHint => 'Nombre de usuario, gamertag o nombre Java…';

  @override
  String get userSearchSub =>
      'Buscar por nombre de usuario, gamertag de Xbox o nombre Java';

  @override
  String get upgradeWindowsHint =>
      'Actualización disponible en Microsoft Store';

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
  String get accountActions => 'Cuenta';

  @override
  String get feedbackBugReport => 'Informe de error';

  @override
  String get feedbackFeatureRequest => 'Solicitud de función';

  @override
  String get feedbackTitleLabel => 'Título';

  @override
  String get feedbackTitleHintBug =>
      'ej. La app se cierra al abrir el editor de skins';

  @override
  String get feedbackTitleHintFeature =>
      'ej. Mostrar el ping del jugador en la lista de servidores';

  @override
  String get feedbackWhatHappened => '¿Qué pasó?';

  @override
  String get feedbackDescribeIdea => 'Describe tu idea';

  @override
  String get feedbackDescHintBug =>
      'Describe el error: ¿qué hiciste, qué esperabas y qué pasó en su lugar?';

  @override
  String get feedbackDescHintFeature =>
      'Explica qué te gustaría y por qué sería útil.';

  @override
  String get feedbackSubmitBug => 'Enviar informe de error';

  @override
  String get feedbackSubmitFeature => 'Enviar solicitud de función';

  @override
  String get feedbackDisclaimer =>
      'Va a nuestro equipo · No incluyas contraseñas';

  @override
  String get feedbackSuccessTitle => '¡Gracias por tu opinión!';

  @override
  String get feedbackSuccessBody =>
      '¡Gracias! Hemos recibido tu informe. Respondemos en la app, así que vuelve aquí para ver la respuesta.';

  @override
  String get feedbackSubmitAnother => 'Enviar otro';

  @override
  String get feedbackBackToApp => 'Volver a la app';

  @override
  String get feedbackTitleTooShort =>
      'El título debe tener al menos 5 caracteres.';

  @override
  String get feedbackDescTooShort =>
      'La descripción debe tener al menos 10 caracteres.';

  @override
  String get feedbackSubmitFailed =>
      'Error al enviar. Por favor, inténtalo de nuevo.';

  @override
  String get feedbackTileTitle => 'Comentarios';

  @override
  String get feedbackTileSubtitle => 'Ayúdanos a mejorar MCCompanion';

  @override
  String get friendsHowToStep1 =>
      'Abre la aplicación de Xbox en tu teléfono o consola.';

  @override
  String get friendsHowToStep2 =>
      'Añade uno de los bots de abajo como amigo en Xbox.';

  @override
  String get friendsHowToStep3 => 'Abre Minecraft y ve a la pestaña Amigos.';

  @override
  String get friendsHowToStep4 => 'Busca tu servidor en Mundos LAN y únete.';

  @override
  String get friendsHowToNote =>
      '⚠️ Cada vez que quieras jugar, debes iniciar el modo Amigos en la aplicación MCCompanion primero. Puedes cerrar la aplicación después de iniciarlo.';

  @override
  String get friendsBotLoadError =>
      '⚠️ No se pudo cargar la lista de bots. Inténtalo de nuevo más tarde.';

  @override
  String get regionEurope => 'Europa';

  @override
  String get regionUnitedStates => 'Estados Unidos';

  @override
  String get yourRegion => 'TU REGIÓN';

  @override
  String get botStatusOffline => 'Sin conexión';

  @override
  String get botStatusFull => 'Lleno';

  @override
  String botFriendCount(Object current, Object max) {
    return '$current / $max amigos';
  }

  @override
  String botCopied(Object gamertag) {
    return '$gamertag copiado';
  }

  @override
  String get copyLabel => 'Copiar';

  @override
  String get skinSavedToDocuments => 'Skin guardado en Documentos';

  @override
  String get skinMenuExport => 'Exportar';

  @override
  String get skinMenuDelete => 'Eliminar';

  @override
  String get rpScreenTitle => 'Paquete de recursos';

  @override
  String get rpWhatWorks => 'Qué funciona';

  @override
  String get rpSupportedBedrockOnly => 'Solo Bedrock Edition (.mcpack o .zip)';

  @override
  String get rpSupportedBedrockOnlyHint =>
      'Los packs de Java no funcionan en consolas.';

  @override
  String get rpSupportedTexture => 'Packs de recursos y texturas';

  @override
  String get rpSupportedTextureHint =>
      'Estos son oficialmente compatibles y funcionan de forma fiable.';

  @override
  String get rpUnsupportedShaders =>
      'Shaders, packs de comportamiento, packs de skins';

  @override
  String get rpUnsupportedShadersHint =>
      'Estos no se cargarán en consolas a través de MCCompanion.';

  @override
  String get rpUnsupportedAddons => 'Complementos y mods de UI';

  @override
  String get rpUnsupportedAddonsHint =>
      'A veces pueden funcionar, pero no son oficialmente compatibles. Úsalos bajo tu propio riesgo.';

  @override
  String get rpNoDiscord =>
      'Enlaces de Discord: sin extensión .mcpack y caducan a las pocas horas';

  @override
  String get rpNoDrive =>
      'Enlaces de Google Drive / Dropbox: no son descargas directas';

  @override
  String get rpNoEncrypted =>
      'Servidores con paquetes cifrados o protegidos con contraseña';

  @override
  String get rpConsolePerformanceTitle => 'Rendimiento de la consola';

  @override
  String get rpConsolePerformanceBody =>
      'Los packs de texturas de alta resolución pueden causar lag o bloqueos en las consolas. Si experimentas problemas, cambia a un pack de menor resolución o selecciona un subpack más ligero si el pack lo permite.';

  @override
  String get rpWarnDiscord =>
      'Los enlaces de Discord caducan y dejarán de funcionar. Usa un host permanente en su lugar.';

  @override
  String get rpWarnHttps => 'La URL debe comenzar con https://';

  @override
  String get rpWarnExtension => 'La URL debe terminar en .mcpack o .zip';

  @override
  String get rpToastSaved => 'Configuración del paquete de recursos guardada.';

  @override
  String get rpInvalidPackFormat =>
      'Este es un pack de Java Edition y no es compatible. Usa un pack de recursos de Bedrock Edition.';

  @override
  String get rpBehaviorContentWarning =>
      'Este pack contiene datos de behavior pack que no funcionarán en servidores. Las texturas sí funcionarán.';

  @override
  String get rpClearMinecraftTitle => '¿Primera vez con este pack?';

  @override
  String get rpClearStep1 =>
      'Abre Minecraft en tu consola y ve a Configuración → Almacenamiento';

  @override
  String get rpClearStep2 =>
      'Toca ‘Borrar’ o ‘Restablecer’ junto a Packs de recursos, esto elimina todos los packs en caché';

  @override
  String get rpClearStep3 =>
      'Vuélvete a conectar a través de MCCompanion, el pack fusionado se descargará automáticamente';

  @override
  String get rpRelayTitle => '¿El pack se ve mal?';

  @override
  String get rpRelayBody =>
      'El relay almacena el pack fusionado durante 1 hora usando tu URL de overlay como clave. Para forzar una nueva fusión: cambia ligeramente la URL del pack (p. ej. añade ?v=2) y guarda. Después, borra también la caché de packs de Minecraft, el pack fusionado sigue usando el UUID del servidor, por lo que Minecraft mostraría de todas formas la versión en caché.';

  @override
  String get rpNoDiscordHint =>
      'Los enlaces de Discord CDN caducan después de poco tiempo';

  @override
  String get rpNoDriveHint =>
      'Sin descarga directa: redirige a una página de vista previa';

  @override
  String get rpNoEncryptedHint =>
      'MCCompanion no puede combinar contenido de packs cifrados';

  @override
  String get rpClearWhy =>
      'Minecraft almacena los packs de recursos por su UUID. El pack fusionado conserva el UUID original del servidor, si Minecraft ya tiene en caché el pack del servidor de una sesión anterior (antes de MCCompanion), no descargará la nueva versión fusionada. Borra la caché para que Minecraft cargue el pack fusionado.';

  @override
  String get rpUploadTab => 'Upload';

  @override
  String get rpUploadButton => 'Tap to select your pack';

  @override
  String get rpUploadHint => '.mcpack or .zip • max 100 MB';

  @override
  String get rpUploading => 'Uploading...';

  @override
  String get rpMergerTitle => 'Fusionador de RP';

  @override
  String get rpMergerPriorityHint =>
      'El paquete superior tiene la mayor prioridad, sus archivos ganan conflictos.';

  @override
  String get rpMergerTopBadge => 'TOP';

  @override
  String get rpMergerAddPacks => 'Agregar paquetes de recursos';

  @override
  String rpMergerAddAnother(int current) {
    return 'Agregar otro paquete ($current/4)';
  }

  @override
  String get rpMergerFileTypes => '.zip o .mcpack';

  @override
  String get rpMergerMerging => 'Fusionando…';

  @override
  String rpMergerButton(int count) {
    return 'Fusionar $count paquetes';
  }

  @override
  String get rpMergerSetActiveToast =>
      'Establecido como paquete de recursos activo';

  @override
  String get rpDisabled => 'Desactivado';

  @override
  String get rpNoPackSelected => 'Ningún paquete de recursos seleccionado';

  @override
  String get rpActiveOnConnect => 'Activo: se aplica al conectar';

  @override
  String get rpBrowseSubtitle => 'Paquetes curados, listos para usar';

  @override
  String get rpBrowseEmpty => 'Aún no hay paquetes disponibles';

  @override
  String get rpBrowseEmptyHint =>
      'Vuelve más tarde para encontrar paquetes curados.';

  @override
  String get rpReplaceFile => 'Reemplazar con otro archivo';

  @override
  String get rpDropToUpload => 'Soltar para subir';

  @override
  String get rpTabBrowseInfo =>
      'Explora paquetes seleccionados por MCCompanion. Toca Usar para activar un paquete al instante, sin subida ni enlace.';

  @override
  String get rpTabUploadInfo =>
      'Sube tu propio archivo .mcpack o .zip. MCCompanion lo almacena de forma segura en la nube y lo envía a tu consola cada vez que te conectas.';

  @override
  String get rpTabMergeInfo =>
      'Combina 2 a 4 paquetes en uno. El paquete combinado se sube a MCCompanion Cloud y se activa automáticamente.';

  @override
  String get shareLabel => 'Compartir';

  @override
  String get sectionMinecraftAccounts => 'Cuentas de Minecraft';

  @override
  String get sectionSettings => 'Configuración';

  @override
  String get avatarUpdated => 'Avatar actualizado';

  @override
  String get uploadFailed => 'Error al subir';

  @override
  String get profileLinkCopied => '¡Enlace del perfil copiado!';

  @override
  String get shareProfileTooltip => 'Compartir perfil';

  @override
  String get profileFallbackTitle => 'Perfil';

  @override
  String get noUsersFound => 'No se encontraron usuarios';

  @override
  String get skinLabel => 'SKIN';

  @override
  String get skinsLabel => 'SKINS';

  @override
  String get javaEditionBadge => 'Java';

  @override
  String get bedrockEditionBadge => 'Bedrock';

  @override
  String get downloadLabel => 'Descargar';

  @override
  String get justNow => 'Ahora mismo';

  @override
  String minutesAgo(int count) {
    return 'Hace ${count}m';
  }

  @override
  String hoursAgo(int count) {
    return 'Hace ${count}h';
  }

  @override
  String daysAgo(int count) {
    return 'Hace ${count}d';
  }

  @override
  String get rpPackInfo => 'Info';

  @override
  String get rpUseThisPack => 'Usar este pack';

  @override
  String get rpViewOnWebsite => 'Ver en el sitio web →';

  @override
  String rpDownloads(int count) {
    return '$count descargas';
  }

  @override
  String get skinsSavedToMySkins => 'Guardado en Mis Skins';

  @override
  String get skinsDownloadFailed => 'Error al descargar';

  @override
  String get skinsDeletedFromCloud => 'Eliminado de la nube';

  @override
  String get skinsDeleteFailed => 'Error al eliminar';

  @override
  String get skinsLoginToUpload => 'Inicia sesión para subir skins';

  @override
  String get skinsUploading => 'Subiendo…';

  @override
  String get skinUploaded => '¡Skin subido!';

  @override
  String skinUploadFailed(String error) {
    return 'Error al subir: $error';
  }

  @override
  String get skinsEmptyLocalSkins =>
      'Aún no hay skins. Crea o sube un skin para empezar.';

  @override
  String get skinUploadToWebsite => 'Subir al sitio web';

  @override
  String get skinReuploadToWebsite => 'Volver a subir al sitio web';

  @override
  String get skinCloudEdit => 'Editar';

  @override
  String get skinCloudSaveToDevice => 'Guardar en dispositivo';

  @override
  String get skinCloudDelete => 'Eliminar de la nube';

  @override
  String get skinsTabGallery => 'Galería';

  @override
  String get skinsTopLabel => 'Top 30';

  @override
  String get skinsAllLabel => 'Todos los Skins';

  @override
  String get skinUploadToCloud => 'Subir a la nube';

  @override
  String get skinSaveDialog => 'Guardar skin';

  @override
  String get skinNameHint => 'Nombre del skin';

  @override
  String get skinDefaultName => 'Mi skin';

  @override
  String get skinUpdatedInCloud => 'Skin actualizado en la nube';

  @override
  String skinByCreator(String name) {
    return 'por $name';
  }

  @override
  String skinLikesCount(int count) {
    return '$count me gusta';
  }

  @override
  String get sectionRecentActivity => 'Actividad reciente';

  @override
  String get activityNoEvents => 'Sin actividad reciente todavía.';

  @override
  String get activitySkinUploaded => 'Skin subida';

  @override
  String get activitySkinLiked => 'Skin con me gusta';

  @override
  String get activityPackSubmitted => 'Pack enviado';

  @override
  String get activityPackApproved => 'Pack aprobado';

  @override
  String get activityPackRejected => 'Pack no aprobado';

  @override
  String get timeJustNow => 'ahora mismo';

  @override
  String timeMinutesAgo(int count) {
    return 'hace $count min';
  }

  @override
  String timeHoursAgo(int count) {
    return 'hace $count h';
  }

  @override
  String timeDaysAgo(int count) {
    return 'hace $count días';
  }

  @override
  String timeMonthsAgo(int count) {
    return 'hace $count meses';
  }

  @override
  String get sectionNotifications => 'Notificaciones';

  @override
  String get sectionNotificationTypes => 'Tipos de notificación';

  @override
  String get notifMarkAllRead => 'Marcar todo como leído';

  @override
  String get notifEmpty =>
      'Sin notificaciones todavía. Los likes, comentarios y actividad de amigos aparecerán aquí.';

  @override
  String get notifSomeone => 'Alguien';

  @override
  String notifSkinLiked(String actor) {
    return 'A $actor le gusta tu skin';
  }

  @override
  String notifCommentReceived(String actor) {
    return '$actor comentó tu skin';
  }

  @override
  String get notifPackApproved => 'Pack aprobado';

  @override
  String get notifPackRejected => 'Pack no aprobado';

  @override
  String notifFriendRequest(String actor) {
    return '$actor te envió una solicitud de amistad';
  }

  @override
  String notifFriendAccepted(String actor) {
    return '$actor aceptó tu solicitud';
  }

  @override
  String notifMessageReceived(String actor) {
    return 'Nuevo mensaje de $actor';
  }

  @override
  String get notifPrefSkinLiked => 'Skin con me gusta';

  @override
  String get notifPrefCommentReceived => 'Comentario recibido';

  @override
  String get notifPrefPackApproved => 'Pack aprobado';

  @override
  String get notifPrefPackRejected => 'Pack rechazado';

  @override
  String get notifPrefFriendRequest => 'Solicitud de amistad';

  @override
  String get notifPrefFriendAccepted => 'Amigo añadido';

  @override
  String get notifPrefMessageReceived => 'Nuevo mensaje';

  @override
  String get commentsTitle => 'Comentarios';

  @override
  String get commentsEmpty => 'Aún no hay comentarios. ¡Sé el primero!';

  @override
  String get commentsPlaceholder => 'Escribe un comentario…';

  @override
  String get loadMore => 'Cargar más';

  @override
  String get skinLayerInner => 'Interior';

  @override
  String get skinLayerOuter => 'Exterior';

  @override
  String get feedbackLoginRequiredTitle =>
      'Inicia sesión para enviar comentarios';

  @override
  String get feedbackLoginRequiredBody =>
      'Los comentarios están vinculados a tu cuenta de MCCompanion para que podamos responderte directamente en la app.';

  @override
  String get feedbackLoginButton => 'Iniciar sesión';

  @override
  String get supportInboxTitle => 'Bandeja de soporte';

  @override
  String get skinShareSubject => 'Skin de Minecraft';

  @override
  String get skinEditorTitle => 'Editor de skins';

  @override
  String get skinToolUndo => 'Deshacer';

  @override
  String get skinSaveToMySkins => 'Guardar en mis skins';

  @override
  String get skinUpdateInCloud => 'Actualizar en la nube';

  @override
  String get skinExportPng => 'Exportar PNG';

  @override
  String get skinToolDraw => 'Dibujar';

  @override
  String get skinToolFill => 'Rellenar';

  @override
  String get skinToolErase => 'Borrar';

  @override
  String get customColour => 'Color personalizado';

  @override
  String get featuredServerLabel => 'SERVIDOR DESTACADO';

  @override
  String get featuredServerTagline => 'Entra y empieza a jugar.';

  @override
  String get featuredServerPlay => 'Jugar';

  @override
  String rpUploadFailedCode(int code) {
    return 'Error al subir ($code)';
  }

  @override
  String rpUploadFailed(String error) {
    return 'Error al subir: $error';
  }

  @override
  String get rpLoadFailed => 'No se pudieron cargar los packs';

  @override
  String get rpRetry => 'Reintentar';

  @override
  String get rpSearchHint => 'Buscar packs…';

  @override
  String rpMergeFailed(String error) {
    return 'Error al combinar: $error';
  }

  @override
  String get rpMergerSize => 'Tamaño';

  @override
  String get rpMergerCreated => 'Creado';

  @override
  String get rpMergerSourcePacks => 'Packs de origen';

  @override
  String get rpMergerDropToAdd => 'Suelta para añadir';

  @override
  String get rpMergerSavedMerges => 'Combinaciones guardadas';

  @override
  String get rpMergerUse => 'Usar';

  @override
  String get supportInboxShared => 'Compartido con todos los admins';

  @override
  String get supportInboxEmpty => 'Aún no hay chats de soporte';

  @override
  String get supportReplyingAs => 'Respondes como MCCompanion Support';

  @override
  String get relayBlocked =>
      'Tu IP o tu cuenta está bloqueada por MCCompanion. Si crees que es un error, únete a nuestro Discord.';

  @override
  String relayBlockedWithReason(String reason) {
    return 'Tu IP o tu cuenta está bloqueada por MCCompanion.\nMotivo: $reason\nSi crees que es un error, únete a nuestro Discord.';
  }

  @override
  String relayConfigFailed(int code) {
    return 'No se pudo configurar el relay (estado $code). Prueba con otro relay o únete a nuestro Discord.';
  }

  @override
  String relayConfigFailedDetail(int code, String detail) {
    return 'No se pudo configurar el relay (estado $code): $detail. Prueba con otro relay o únete a nuestro Discord.';
  }

  @override
  String get relayTimeout => 'El relay no respondió a tiempo.';

  @override
  String get relayUnreachable => 'No se pudo contactar con el relay.';

  @override
  String get lookupNotFound => 'Jugador no encontrado.';

  @override
  String get lookupNetworkError => 'Error de red. Inténtalo de nuevo.';

  @override
  String get lookupBedrockUnavailable =>
      'La búsqueda de Bedrock no está disponible ahora mismo.';

  @override
  String get lookupFailed => 'Error en la búsqueda.';

  @override
  String get myFeedbackTitle => 'Mis comentarios';

  @override
  String get myFeedbackEmpty => 'Todavía no nos has enviado nada.';

  @override
  String get myFeedbackOpenList => 'Mis comentarios';

  @override
  String get fbStatusOpen => 'Abierto';

  @override
  String get fbStatusPlanned => 'Planeado';

  @override
  String get fbStatusInProgress => 'En curso';

  @override
  String get fbStatusImplemented => 'Listo';

  @override
  String get fbStatusNotPlanned => 'No planeado';

  @override
  String get fbStatusDuplicate => 'Duplicado';

  @override
  String get fbNoReplies => 'Aún no hay respuesta. Te avisamos aquí.';

  @override
  String get fbReplyHint => 'Añade algo a este informe…';

  @override
  String get fbFromTeam => 'MCCompanion';

  @override
  String get fbFromYou => 'Tú';

  @override
  String get feedbackGoesToTeam => 'Va directo al equipo';

  @override
  String get notifFeedbackStatus => 'Novedades sobre tus comentarios';

  @override
  String get notifFeedbackReply => 'Respuesta a tus comentarios';

  @override
  String get adminTicketsHeader => 'Informes y solicitudes';

  @override
  String get adminTicketReplyHint => 'Responder sobre este ticket…';

  @override
  String get chooseServerTitle => 'Elige un servidor';

  @override
  String get changeLabel => 'Cambiar';

  @override
  String get howToAutoShow => 'Mostrar esto al iniciar';

  @override
  String get skinEditorLoadFailed =>
      'No se pudo cargar esa skin. Empezamos con la predeterminada.';

  @override
  String get skinToolRecolour => 'Recolorear';

  @override
  String get skinToolPick => 'Cuentagotas';

  @override
  String get skinBases => 'Bases';

  @override
  String get skinBasesTitle => 'Empezar desde una base';

  @override
  String get skinBasesSubtitle =>
      'Esto reemplaza lo que hay ahora. Deshacer lo devuelve.';

  @override
  String get skinMirror => 'Espejo';

  @override
  String get skinSurprise => 'Sorpréndeme';

  @override
  String get skinToolFillHint => 'Rellena la zona que tocas';

  @override
  String get skinToolRecolourHint => 'Cambia ese color en toda la skin';

  @override
  String get skinToolPickHint => 'Toma el color que tocas';

  @override
  String get skinModelClassic => 'Ancho';

  @override
  String get skinModelSlim => 'Delgado';

  @override
  String get shareServerLabel => 'Compartir tu servidor';

  @override
  String get shareServerOn => 'Tus amigos ven en qué servidor estás';

  @override
  String get shareServerOff => 'Tus amigos ven que juegas, pero no dónde';

  @override
  String directHostNotFound(String host) {
    return 'No se encontró $host. Comprueba la dirección e inténtalo de nuevo.';
  }

  @override
  String get directPortBusy =>
      'No se pudo abrir el puerto local. Detén primero la conexión actual.';

  @override
  String directAddressNotSupported(String host) {
    return '$host es una dirección IPv6. El modo proxy/directo solo admite IPv4. Usa la dirección IPv4 o el nombre de host.';
  }

  @override
  String termsAgreement(String terms, String privacy) {
    return 'Acepto los $terms y la $privacy.';
  }

  @override
  String get verifyEmailTitle => 'Verifica tu correo';

  @override
  String get verifyEmailBody =>
      'Necesario antes de comentar, subir skins o enviar packs.';

  @override
  String get verifyEmailSent => 'Enviado, revisa tu bandeja de entrada.';

  @override
  String get verifyEmailSending => 'Enviando…';

  @override
  String get verifyEmailSend => 'Enviar enlace';

  @override
  String updateAvailableTitle(Object version) {
    return 'La versión $version ya está disponible';
  }

  @override
  String updateAvailableBody(Object current) {
    return 'Estás usando $current. Esta versión no se actualiza sola.';
  }

  @override
  String get updateAvailableAction => 'Descargar';

  @override
  String get updateAvailableDismiss => 'Ahora no';

  @override
  String get serverListSearchHint => 'Busca por nombre o dirección';

  @override
  String get serverListEditionAny => 'Java y Bedrock';

  @override
  String get serverListEditionJava => 'Solo Java';

  @override
  String get serverListEditionBedrock => 'Solo Bedrock';

  @override
  String get serverListSortVotes => 'Más votos';

  @override
  String get serverListSortPlayers => 'Más jugadores';

  @override
  String get serverListSortPeak => 'Pico más alto';

  @override
  String get serverListSortNewest => 'Más recientes';

  @override
  String get serverListSortName => 'Nombre';

  @override
  String get serverListAllCategories => 'Todas';

  @override
  String get serverListLoadFailed => 'No se pudo cargar la lista de servidores';

  @override
  String get serverListLoadFailedHint => 'Desliza hacia abajo para reintentar';

  @override
  String get serverListNoMatch => 'Ningún servidor coincide';

  @override
  String get serverListNoMatchHint => 'Prueba otra búsqueda u otra categoría';

  @override
  String get serverCardPlay => 'Jugar';

  @override
  String get serverCardVote => 'Votar';

  @override
  String get serverCardViewServer => 'Ver servidor';

  @override
  String get serverCopyIp => 'Copiar IP';

  @override
  String get serverCopied => 'Copiado';

  @override
  String get serverStatPlayers => 'Jugadores';

  @override
  String get serverStatPeak => 'Pico';

  @override
  String get serverStatUptime => 'Disponibilidad';

  @override
  String get serverStatVotesMonth => 'Votos este mes';

  @override
  String get serverBadgeFeatured => 'Destacado';

  @override
  String get serverEditionJava => 'Java';

  @override
  String get serverEditionBedrock => 'Bedrock';

  @override
  String get serverEditionCrossplay => 'Crossplay';

  @override
  String get serverSectionMotd => 'Mensaje del día';

  @override
  String get serverLinkDiscord => 'Discord';

  @override
  String get serverLinkWebsite => 'Sitio web';

  @override
  String get serverVotesThisMonth => 'Este mes';

  @override
  String get serverVotesAllTime => 'Histórico';

  @override
  String get serverVoteSignInRequired =>
      'Inicia sesión para votar desde la app.';

  @override
  String serverVoteSheetTitle(String name) {
    return 'Vota por $name';
  }

  @override
  String get serverVoteSheetSubtitle =>
      'Tu nombre de Minecraft, para que el servidor sepa a quién recompensar.';

  @override
  String get serverVoteSheetHint => 'Steve';

  @override
  String get serverVoteSheetButton => 'Votar';

  @override
  String get serverVoteSheetLimit => 'Un voto por servidor al día.';

  @override
  String get serverVoteDelivered =>
      'Voto registrado. Tu recompensa está en camino.';

  @override
  String get serverVoteNoRewards =>
      'Voto registrado. Este servidor no tiene recompensas configuradas.';

  @override
  String get serverVoteFailed => 'No ha funcionado, inténtalo de nuevo.';

  @override
  String get serverVoteOffline =>
      'No se pudo contactar con el servidor. Comprueba tu conexión.';

  @override
  String get feedbackViewYourReport => 'Ver tu informe';
}
