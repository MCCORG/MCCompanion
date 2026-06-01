// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'NetherLink';

  @override
  String get console => 'Console';

  @override
  String get consoleOutput => 'Saída do console';

  @override
  String get noLogsYet => 'Ainda não há logs';

  @override
  String get startBroadcastingToSeeOutput => 'Inicie a transmissão para ver a saída';

  @override
  String get close => 'Fechar';

  @override
  String get ok => 'OK';

  @override
  String get joinUs => 'Junte-se a nós';

  @override
  String get more => 'Mais';

  @override
  String get website => 'Site';

  @override
  String get howToUseMenu => 'Como usar';

  @override
  String get support => 'Suporte';

  @override
  String helpText(Object appCreator) {
    return 'Criado por $appCreator.\r\n\r\nComo usar:\r\n1. Digite o endereço e a porta do seu servidor de Minecraft (padrão: 19132)\r\n   — ou selecione um servidor salvo anteriormente no menu suspenso\r\n2. (Opcional) Escolha um Servidor Relay (EU ou US) mais próximo da sua localização\r\n3. Clique em \\\"Iniciar Transmissão\\\" para começar\r\n4. No seu console/dispositivo: Minecraft > Jogar > Amigos\r\n5. Você deverá ver um servidor LAN chamado \\\"NetherLink\\\"\r\n6. Clique nele para entrar no seu servidor externo via NetherLink\r\n\r\nNintendo Switch (modo DNS):\r\n1. Ative \\\"Nintendo Switch\\\" no painel de conexão\r\n2. Selecione um Servidor Relay (EU ou US)\r\n3. Clique em \\\"Enviar Configuração DNS\\\" — isso envia sua configuração ao relay\r\n   (isso NÃO transmite um servidor LAN)\r\n4. No seu Switch, aplique a configuração DNS do NetherLink e entre\r\n   usando a entrada de servidor que você usa para o NetherLink\r\n\r\nNotas:\r\n- Para transmissão LAN, o NetherLink e o console devem estar na mesma rede local.\r\n- Dica: escolha o servidor relay mais próximo de você para obter o melhor desempenho.';
  }

  @override
  String get serverDetailsLabel => 'Detalhes do servidor';

  @override
  String get start => 'Iniciar';

  @override
  String get stop => 'Parar';

  @override
  String get labelJava => 'Java';

  @override
  String get startJavaMode => 'Iniciar modo Java';

  @override
  String get javaInfoTitle => 'Modo Java';

  @override
  String get javaInfoText => 'Conecte-se a servidores Java Edition';

  @override
  String get howToJavaTitle => 'Modo Java';

  @override
  String get howToJavaSubtitle => 'Conecte-se a servidores Java Edition via NetherLink';

  @override
  String get aternosSubtext => 'Crie o seu próprio servidor Minecraft gratuito';

  @override
  String get howToJavaBody => 'Modo Java — etapas rápidas:\n1. No aplicativo, selecione o modo Java.\n2. Digite o endereço e a porta do seu servidor Java Edition (padrão: 25565).\n3. Toque em \"Iniciar modo Java\" — o NetherLink fará a ponte da conexão.\n4. Abra o Minecraft Bedrock e vá para a aba Amigos.\n5. Selecione o servidor LAN chamado \"NetherLink\" para entrar no servidor Java.\n\n⚠️ Avisos importantes:\n- É necessária uma conta válida do Java Edition (Microsoft).\n- Alguns servidores usam sistemas anti-cheat que podem detectar e banir sua conta.\n- Alguns servidores proíbem explicitamente clientes Bedrock — sempre verifique as regras do servidor.\n- O NetherLink não se responsabiliza por banimentos, suspensões ou outros problemas relacionados à conta que possam resultar do uso deste recurso.\n- Use por sua conta e risco.';

  @override
  String get language => 'Português';

  @override
  String get discord => 'Discord';

  @override
  String get toggleDebug => 'Alternar depuração';

  @override
  String get copyLogs => 'Copiar logs';

  @override
  String get clear => 'Limpar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get deleteServer => 'Excluir servidor';

  @override
  String get delete => 'Excluir';

  @override
  String get myServers => 'Meus servidores';

  @override
  String get quickAccessServers => 'Servidores de acesso rápido';

  @override
  String get addServer => 'Adicionar servidor';

  @override
  String get addServersHint => 'Adicione servidores para se conectar rapidamente depois';

  @override
  String get serverNameLabel => 'Nome do servidor *';

  @override
  String get addressLabel => 'Endereço *';

  @override
  String get portLabel => 'Porta *';

  @override
  String get descriptionLabel => 'Descrição (Opcional)';

  @override
  String get save => 'Salvar';

  @override
  String get initializing => 'Inicializando...';

  @override
  String get createdBy => 'Criado por NetherDev';

  @override
  String get bedrockBridge => 'Ponte Bedrock';

  @override
  String get clientDisconnected => 'Cliente desconectado — transmissão interrompida';

  @override
  String get pleaseEnterServer => '⚠️ Por favor, insira um endereço de servidor';

  @override
  String get invalidPort => '⚠️ Número de porta inválido (1-65535)';

  @override
  String get dnsConfigSent => '✅ Configuração DNS enviada ao relay';

  @override
  String get broadcastingStarted => 'Transmissão iniciada';

  @override
  String get broadcastStopped => 'Transmissão interrompida';

  @override
  String selectedServer(Object name) {
    return '📋 Selecionado: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'Selecionado: $name';
  }

  @override
  String get noLogsToCopy => 'Não há logs para copiar';

  @override
  String copiedLogs(Object count) {
    return '$count entradas de log copiadas para a área de transferência';
  }

  @override
  String get debugEnabled => 'Logs de depuração ativados';

  @override
  String get debugDisabled => 'Logs de depuração desativados';

  @override
  String get howToUseTitle => 'Como usar o NetherLink';

  @override
  String get iUnderstand => 'Entendi';

  @override
  String get playOnSwitchTitle => 'Jogar no Nintendo Switch';

  @override
  String get playWithFriendsTitle => 'Jogar com amigos';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'Selecionado: $relayName\r\n\r\nComo se conectar:\r\n1. Vá para as configurações do seu Switch e altere o DNS para: $relayIp\r\n2. Abra o Minecraft e selecione um servidor da lista (como Cubecraft ou Hive).\r\n3. Agora você será enviado automaticamente para o seu próprio servidor.';
  }

  @override
  String playInstructionsFriends(Object friend) {
    return 'Como se conectar:\r\n1. No seu console, adicione $friend como amigo.\r\n2. Abra o Minecraft e vá para a aba Amigos.\r\n3. Procure seu servidor em Mundos LAN e selecione-o para entrar.';
  }

  @override
  String get nldServerLabel => 'SERVIDOR NETHERLINK';

  @override
  String selectRelayLabel(Object name) {
    return 'Selecionar relay $name';
  }

  @override
  String get noSavedServers => 'Nenhum servidor salvo';

  @override
  String get savedServers => 'Servidores salvos';

  @override
  String get serverAddressHint => 'Endereço do servidor';

  @override
  String get portHint => 'Porta';

  @override
  String get manageServers => 'Gerenciar servidores';

  @override
  String get manageServersTooltip => 'Gerenciar servidores';

  @override
  String get noServerYet => 'Ainda não há servidores salvos.\nToque em Gerenciar para adicionar um.';

  @override
  String get serverNotSelected => 'Nenhum servidor selecionado';

  @override
  String get ready => 'Pronto';

  @override
  String get active => 'Ativo';

  @override
  String get vpnDetected => 'VPN detectada';

  @override
  String get noWifi => 'Sem Wi‑Fi';

  @override
  String get vpnActive => 'Detectamos que sua VPN está ativa.\n\nDesative a VPN antes de usar o NetherLink, caso contrário a transmissão LAN pode não alcançar o seu console.';

  @override
  String get mobileActive => 'Detectado: dados móveis\n\nO NetherLink precisa estar na mesma rede que o seu console. Conecte-se ao Wi‑Fi da sua casa ou ao hotspot antes de continuar.';

  @override
  String get continueAnyway => 'Continuar mesmo assim';

  @override
  String get sameWifi => 'Mesma rede Wi‑Fi';

  @override
  String get needSameWifi => 'O dispositivo que executa o NetherLink DEVE estar na mesma rede Wi‑Fi que o console em que você joga Minecraft.';

  @override
  String get subscription => 'Assinatura online necessária';

  @override
  String get needSubscription => 'Cada console precisa da sua própria assinatura online ativa (Xbox Live, PS Plus, NSO). Sem isso, o NetherLink não aparecerá.';

  @override
  String get updateAvailable => 'Atualização disponível';

  @override
  String get newVersion => 'Há uma nova versão do aplicativo disponível.\nAtualize agora para obter os recursos e correções mais recentes.';

  @override
  String get later => 'Mais tarde';

  @override
  String get updateNow => 'Atualizar agora';

  @override
  String get beforeYouStart => 'ANTES DE COMEÇAR';

  @override
  String get stopBroadcasting => 'Parar transmissão';

  @override
  String get startNintendoMode => 'Iniciar modo Nintendo';

  @override
  String get startFriendsMode => 'Iniciar modo Amigos';

  @override
  String get startBroadcasting => 'Iniciar transmissão';

  @override
  String get modeLabel => 'Modo';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'Amigos';

  @override
  String get nintendoInfoTitle => 'Modo DNS do Nintendo Switch';

  @override
  String get nintendoInfoText => 'Comece no modo Nintendo, configure seu DNS e entre em um servidor em destaque.';

  @override
  String get friendModeTitle => 'Modo Amigos';

  @override
  String get friendModeText => 'Adicione os bots de amigos do NetherLink como amigos. Inicie o modo Amigos e jogue';

  @override
  String get selectedRelayCheck => 'Selecionado';

  @override
  String relayFallbackWarning(Object name) {
    return 'Aviso: o relay original não respondeu. Relay alternativo em uso: $name';
  }

  @override
  String get relayUnableConnect => 'Não foi possível conectar a NENHUM servidor relay do NetherLink. Tente novamente mais tarde ou verifique sua internet.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / conexão proxy)';

  @override
  String get howToXboxSubtitle => 'Jogue via transmissão LAN ou proxy';

  @override
  String get howToXboxBody => 'Como se conectar (Xbox / PS4 / PS5):\r\n1. Certifique-se de que o dispositivo que está executando o NetherLink e o seu console estejam na mesma rede local.\r\n2. No aplicativo, informe o endereço e a porta do seu servidor de Minecraft e pressione \\\"Iniciar transmissão\\\".\r\n3. No console, abra Minecraft → Jogar → procure por Mundos LAN ou pela aba Amigos e atualize a lista.\r\n4. Selecione o servidor LAN chamado \\\"NetherLink\\\" para entrar.\r\nNotas:\r\n- Se o servidor não aparecer, confirme que ambos os dispositivos estão na mesma sub-rede e que o aplicativo ainda está transmitindo.\r\n- Alguns modelos de console ou roteadores podem bloquear a descoberta LAN; tente ajustar as configurações do aplicativo ou do roteador, se necessário.';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (modo DNS)';

  @override
  String get howToNintendoSubtitle => 'Instruções de relay DNS para Switch';

  @override
  String get howToNintendoBody => 'Nintendo Switch — modo DNS (passo a passo):\r\n1. No aplicativo, ative o modo \\\"Nintendo\\\" e selecione um Servidor Relay (EU ou US).\r\n2. Toque em \\\"Enviar Configuração DNS\\\" para enviar o IP DNS ao relay.\r\n3. No seu Nintendo Switch, vá para Configurações do sistema → Internet → Configurações de Internet → (sua rede) → Alterar configurações → DNS e defina o DNS primário como o IP do relay.\r\n4. Abra o Minecraft e entre em um servidor público; você será redirecionado ao seu servidor usando o DNS do relay.\r\nNotas:\r\n- O modo DNS não transmite um servidor LAN; ele roteia o tráfego do jogo pelo relay.\r\n- Reverta seu DNS quando terminar se precisar do comportamento normal da rede.';

  @override
  String get howToFriendsTitle => 'Modo Amigos';

  @override
  String get howToFriendsSubtitle => 'Convide amigos e entre via LAN';

  @override
  String get howToFriendsBody => 'Modo Amigos — passos rápidos:\r\n1. Adicione a conta de amigo do NetherLink no seu console ou plataforma, se necessário.\r\n2. No aplicativo, ative o modo Amigos e envie a configuração do relay (se aplicável).\r\n3. No seu console, abra Minecraft → Amigos e procure por Mundos LAN — seu servidor deve aparecer lá como um mundo LAN.\r\n4. Selecione-o para entrar no seu servidor com amigos.\r\nNotas:\r\n- Certifique-se de que você e seus amigos tenham as mesmas configurações de NAT/configurações que permitem presença de amigos.\r\n- O modo Amigos depende dos recursos de amizade da plataforma e pode exigir aceitar solicitações de amizade.';

  @override
  String get helpNetherlinkTitle => 'NetherLink não aparece';

  @override
  String get helpNetherlinkSubtitle => 'Solução de problemas de descoberta LAN';

  @override
  String get helpNetherlinkBody => 'Se o servidor não estiver aparecendo no seu console, tente estas etapas:\r\n\r\n✅ Verificações básicas:\r\n1. Mesma rede WiFi - Seu telefone/tablet e o console DEVEM estar na mesma rede WiFi\r\n2. Endereço correto do servidor - Verifique novamente o IP e a porta (padrão: 19132)\r\n3. Transmissão ativa - Verifique se o NetherLink mostra o status \"Transmitindo\"\r\n\r\n🔄 Correções rápidas:\r\n• Reinicie o aplicativo: pare a transmissão, feche o NetherLink completamente, abra-o novamente e tente de novo\r\n• Reinicie seu console: às vezes o console precisa ser atualizado para detectar jogos LAN\r\n• Verifique a aba Amigos/LAN: o servidor aparece em \"Amigos\" ou \"Jogos LAN\", e NÃO na lista de servidores\r\n• Aguarde de 10 a 15 segundos após iniciar a transmissão\r\n• Desative VPNs: VPNs podem bloquear transmissões locais\r\n\r\n⚠️ Problemas comuns:\r\n\"No route found for user\" → Certifique-se de que ambos os dispositivos estejam na mesma rede Wi‑Fi (evite redes de convidados)\r\n\"Unable to connect to NetherLink relay server\" → Verifique sua internet / status do relay\r\n\r\n📱 Ainda está com problemas? Ative o Modo de depuração no NetherLink e verifique os logs, ou tente um servidor diferente.';

  @override
  String get helpMultiplayerFailedTitle => 'Falha na conexão multijogador';

  @override
  String get helpMultiplayerFailedSubtitle => 'Explicação de por que isso não é um erro do NetherLink';

  @override
  String get helpMultiplayerFailedBody => '⚠️ Isso não é um problema do NetherLink!\r\n\r\nO NetherLink redirecionou você com sucesso para o servidor solicitado. A mensagem \\\"Falha na conexão multijogador\\\" indica que o servidor de destino está inacessível no momento. Motivos possíveis:\r\n\r\n• O servidor de Minecraft de destino está offline ou sobrecarregado\r\n• O servidor exige uma versão atualizada do cliente ou uma edição específica\r\n• Problemas de rede entre o relay e o servidor de destino\r\n\r\nTente se conectar a outro servidor ou entre em contato com o suporte do servidor. Se o problema persistir em vários servidores, ative o Modo de depuração no NetherLink e verifique os logs.';

  @override
  String get helpNintendoDnsTitle => 'O DNS do Nintendo não funciona';

  @override
  String get helpNintendoDnsSubtitle => 'Problemas comuns de DNS / relay';

  @override
  String get helpNintendoDnsBody => 'Se o modo DNS do Nintendo não estiver funcionando, verifique o seguinte:\r\n\r\n1. Confirme que você enviou a configuração DNS pelo aplicativo (Enviar Configuração DNS).\r\n2. Verifique se você aplicou o IP do relay como DNS Primário no Switch.\r\n3. Certifique-se de que o servidor relay selecionado (EU/US) está online e não está sobrecarregado.\r\n4. Algumas redes (por exemplo, captive portals) impedem DNS personalizado — teste em outra rede.\r\n\r\nSe os problemas persistirem, ative o Modo de depuração e verifique os logs, ou tente a alternativa do modo Amigos.';

  @override
  String get helpFriendsModeTitle => 'O modo Amigos não funciona';

  @override
  String get helpFriendsModeSubtitle => 'Problemas comuns com amigos';

  @override
  String get helpFriendsModeBody => 'Dicas de solução de problemas para o modo Amigos:\r\n\r\n1. Certifique-se de que a conta de amigo do relay foi adicionada/aceita no console (se necessário).\r\n2. Tente reiniciar o jogo e atualizar a aba Amigos/LAN depois de ativar o modo Amigos.\r\n\r\nSe o servidor ainda não aparecer para os amigos, ative o Modo de depuração e verifique os logs para identificar erros.';

  @override
  String get changeLanguageTitle => 'Alterar idioma';

  @override
  String get changeLanguage => 'Idioma';

  @override
  String get useSystemLanguage => 'Usar idioma do sistema';

  @override
  String get couldNotOpenUrl => 'Não foi possível abrir a URL';

  @override
  String get serverTrackerTitle => 'Rastreador de servidores';

  @override
  String get removeServerTitle => 'Remover servidor';

  @override
  String removeServerConfirm(Object name) {
    return 'Remover \"$name\" do seu rastreador?';
  }

  @override
  String get removeServerFailed => 'Falha ao remover o servidor';

  @override
  String get refreshStatus => 'Atualizar status';

  @override
  String get trackerSignInRequired => 'Login necessário';

  @override
  String get trackerSignInSubtitle => 'Faça login para rastrear servidores e receber notificações offline.';

  @override
  String get signIn => 'Entrar';

  @override
  String get noServersTracked => 'Nenhum servidor rastreado';

  @override
  String get trackerEmptySubtitle => 'Adicione um servidor Minecraft para monitorar seu status e receber notificações.';

  @override
  String get fillAllFields => 'Por favor, preencha todos os campos corretamente';

  @override
  String get slotUsedUpgrade => 'Seu slot gratuito está em uso. Faça upgrade para mais servidores.';

  @override
  String get addServerFailed => 'Falha ao adicionar o servidor. Verifique suas informações.';

  @override
  String get ipAddressLabel => 'Endereço IP';

  @override
  String get platformLabel => 'Plataforma';

  @override
  String get bedrockLabel => 'Bedrock';

  @override
  String get addLabel => 'Adicionar';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusChecking => 'Verificando...';

  @override
  String get notificationsOn => 'Notificações ativadas';

  @override
  String get notificationsOff => 'Notificações desativadas';

  @override
  String get failedUpdateNotifications => 'Falha ao atualizar notificações';

  @override
  String get editServerTitle => 'Editar servidor';

  @override
  String get serverNameHint => 'Nome do servidor';

  @override
  String get failedSave => 'Falha ao salvar. Tente novamente.';

  @override
  String get serverRenamed => 'Servidor renomeado';

  @override
  String get customizeLabel => 'Personalizar';

  @override
  String get customizeSubtitle => 'Reordenar blocos e personalizar navegação';

  @override
  String get resetLabel => 'Redefinir';

  @override
  String get tilesSection => 'BLOCOS';

  @override
  String get dragToReorder => 'Arraste para reordenar';

  @override
  String get navigationSection => 'NAVEGAÇÃO';

  @override
  String get navFixed => 'Início, Conector e Perfil são sempre fixos';

  @override
  String get leftSlot => 'Slot esquerdo (ao lado de Início)';

  @override
  String get rightSlot => 'Slot direito (ao lado de Perfil)';

  @override
  String get accentColorSection => 'COR DE DESTAQUE';

  @override
  String get opacityLabel => 'Opacidade';

  @override
  String get backgroundSection => 'FUNDO';

  @override
  String get cardsSection => 'CARTÕES';

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
  String get chooseUniqueUsername => 'Escolha um nome de usuário único para começar.';

  @override
  String get usernameFieldLabel => 'Nome de usuário';

  @override
  String get usernameExampleHint => 'ex. CoolPlayer123';

  @override
  String get usernameFormatHint => '3–20 caracteres · letras, números e sublinhados';

  @override
  String get displayNameOptional => 'Nome de exibição (opcional)';

  @override
  String get displayNameExampleHint => 'ex. Jogador Legal';

  @override
  String get usernameRequired => 'Nome de usuário é obrigatório';

  @override
  String get usernameFormatError => 'O nome de usuário deve ter 3–20 caracteres e conter apenas letras, números e sublinhados';

  @override
  String get usernameTaken => 'Este nome de usuário já está em uso';

  @override
  String get noConnectionError => 'Sem conexão. Verifique sua internet e tente novamente.';

  @override
  String get home => 'Início';

  @override
  String get info => 'Info';

  @override
  String get navProfile => 'Perfil';

  @override
  String serverRemoved(Object name) {
    return '$name removido';
  }

  @override
  String serverAdded(Object name) {
    return '$name adicionado';
  }
}
