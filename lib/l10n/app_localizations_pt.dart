// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appName => 'MCCompanion';

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
    return 'Criado por $appCreator.\r\n\r\nComo usar:\r\n1. Digite o endereço e a porta do seu servidor de Minecraft (padrão: 19132)\r\n   — ou selecione um servidor salvo anteriormente no menu suspenso\r\n2. (Opcional) Escolha um Servidor Relay (EU ou US) mais próximo da sua localização\r\n3. Clique em \\\"Iniciar Transmissão\\\" para começar\r\n4. No seu console/dispositivo: Minecraft > Jogar > Amigos\r\n5. Você deverá ver um servidor LAN chamado \\\"MCCompanion\\\"\r\n6. Clique nele para entrar no seu servidor externo via MCCompanion\r\n\r\nNintendo Switch (modo DNS):\r\n1. Ative \\\"Nintendo Switch\\\" no painel de conexão\r\n2. Selecione um Servidor Relay (EU ou US)\r\n3. Clique em \\\"Enviar Configuração DNS\\\" — isso envia sua configuração ao relay\r\n   (isso NÃO transmite um servidor LAN)\r\n4. No seu Switch, aplique a configuração DNS do MCCompanion e entre\r\n   usando a entrada de servidor que você usa para o MCCompanion\r\n\r\nNotas:\r\n- Para transmissão LAN, o MCCompanion e o console devem estar na mesma rede local.\r\n- Dica: escolha o servidor relay mais próximo de você para obter o melhor desempenho.';
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
  String get howToJavaSubtitle => 'Conecte-se a servidores Java Edition via MCCompanion';

  @override
  String get aternosSubtext => 'Crie o seu próprio servidor Minecraft gratuito';

  @override
  String get howToJavaBody => 'Modo Java — etapas rápidas:\n1. No aplicativo, selecione o modo Java.\n2. Digite o endereço e a porta do seu servidor Java Edition (padrão: 25565).\n3. Toque em \"Iniciar modo Java\" — o MCCompanion fará a ponte da conexão.\n4. Abra o Minecraft Bedrock e vá para a aba Amigos.\n5. Selecione o servidor LAN chamado \"MCCompanion\" para entrar no servidor Java.\n\n⚠️ Avisos importantes:\n- É necessária uma conta válida do Java Edition (Microsoft).\n- Alguns servidores usam sistemas anti-cheat que podem detectar e banir sua conta.\n- Alguns servidores proíbem explicitamente clientes Bedrock — sempre verifique as regras do servidor.\n- O MCCompanion não se responsabiliza por banimentos, suspensões ou outros problemas relacionados à conta que possam resultar do uso deste recurso.\n- Use por sua conta e risco.';

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
  String get howToUseTitle => 'Como usar o MCCompanion';

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
  String get vpnActive => 'Detectamos que sua VPN está ativa.\n\nDesative a VPN antes de usar o MCCompanion, caso contrário a transmissão LAN pode não alcançar o seu console.';

  @override
  String get mobileActive => 'Detectado: dados móveis\n\nO MCCompanion precisa estar na mesma rede que o seu console. Conecte-se ao Wi‑Fi da sua casa ou ao hotspot antes de continuar.';

  @override
  String get continueAnyway => 'Continuar mesmo assim';

  @override
  String get sameWifi => 'Mesma rede Wi‑Fi';

  @override
  String get needSameWifi => 'O dispositivo que executa o MCCompanion DEVE estar na mesma rede Wi‑Fi que o console em que você joga Minecraft.';

  @override
  String get subscription => 'Assinatura online necessária';

  @override
  String get needSubscription => 'Cada console precisa da sua própria assinatura online ativa (Xbox Live, PS Plus, NSO). Sem isso, o MCCompanion não aparecerá.';

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
  String get friendModeText => 'Adicione os bots de amigos do MCCompanion como amigos. Inicie o modo Amigos e jogue';

  @override
  String get selectedRelayCheck => 'Selecionado';

  @override
  String relayFallbackWarning(Object name) {
    return 'Aviso: o relay original não respondeu. Relay alternativo em uso: $name';
  }

  @override
  String get relayUnableConnect => 'Não foi possível conectar a NENHUM servidor relay do MCCompanion. Tente novamente mais tarde ou verifique sua internet.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / conexão proxy)';

  @override
  String get howToXboxSubtitle => 'Jogue via transmissão LAN ou proxy';

  @override
  String get howToXboxBody => 'Como se conectar (Xbox / PS4 / PS5):\r\n1. Certifique-se de que o dispositivo que está executando o MCCompanion e o seu console estejam na mesma rede local.\r\n2. No aplicativo, informe o endereço e a porta do seu servidor de Minecraft e pressione \\\"Iniciar transmissão\\\".\r\n3. No console, abra Minecraft → Jogar → procure por Mundos LAN ou pela aba Amigos e atualize a lista.\r\n4. Selecione o servidor LAN chamado \\\"MCCompanion\\\" para entrar.\r\nNotas:\r\n- Se o servidor não aparecer, confirme que ambos os dispositivos estão na mesma sub-rede e que o aplicativo ainda está transmitindo.\r\n- Alguns modelos de console ou roteadores podem bloquear a descoberta LAN; tente ajustar as configurações do aplicativo ou do roteador, se necessário.';

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
  String get howToFriendsBody => 'Modo Amigos — passos rápidos:\r\n1. Adicione a conta de amigo do MCCompanion no seu console ou plataforma, se necessário.\r\n2. No aplicativo, ative o modo Amigos e envie a configuração do relay (se aplicável).\r\n3. No seu console, abra Minecraft → Amigos e procure por Mundos LAN — seu servidor deve aparecer lá como um mundo LAN.\r\n4. Selecione-o para entrar no seu servidor com amigos.\r\nNotas:\r\n- Certifique-se de que você e seus amigos tenham as mesmas configurações de NAT/configurações que permitem presença de amigos.\r\n- O modo Amigos depende dos recursos de amizade da plataforma e pode exigir aceitar solicitações de amizade.';

  @override
  String get helpNetherlinkTitle => 'MCCompanion não aparece';

  @override
  String get helpNetherlinkSubtitle => 'Solução de problemas de descoberta LAN';

  @override
  String get helpNetherlinkBody => 'Se o servidor não estiver aparecendo no seu console, tente estas etapas:\r\n\r\n✅ Verificações básicas:\r\n1. Mesma rede WiFi - Seu telefone/tablet e o console DEVEM estar na mesma rede WiFi\r\n2. Endereço correto do servidor - Verifique novamente o IP e a porta (padrão: 19132)\r\n3. Transmissão ativa - Verifique se o MCCompanion mostra o status \"Transmitindo\"\r\n\r\n🔄 Correções rápidas:\r\n• Reinicie o aplicativo: pare a transmissão, feche o MCCompanion completamente, abra-o novamente e tente de novo\r\n• Reinicie seu console: às vezes o console precisa ser atualizado para detectar jogos LAN\r\n• Verifique a aba Amigos/LAN: o servidor aparece em \"Amigos\" ou \"Jogos LAN\", e NÃO na lista de servidores\r\n• Aguarde de 10 a 15 segundos após iniciar a transmissão\r\n• Desative VPNs: VPNs podem bloquear transmissões locais\r\n\r\n⚠️ Problemas comuns:\r\n\"No route found for user\" → Certifique-se de que ambos os dispositivos estejam na mesma rede Wi‑Fi (evite redes de convidados)\r\n\"Unable to connect to MCCompanion relay server\" → Verifique sua internet / status do relay\r\n\r\n📱 Ainda está com problemas? Ative o Modo de depuração no MCCompanion e verifique os logs, ou tente um servidor diferente.';

  @override
  String get helpMultiplayerFailedTitle => 'Falha na conexão multijogador';

  @override
  String get helpMultiplayerFailedSubtitle => 'Explicação de por que isso não é um erro do MCCompanion';

  @override
  String get helpMultiplayerFailedBody => '⚠️ Isso não é um problema do MCCompanion!\r\n\r\nO MCCompanion redirecionou você com sucesso para o servidor solicitado. A mensagem \\\"Falha na conexão multijogador\\\" indica que o servidor de destino está inacessível no momento. Motivos possíveis:\r\n\r\n• O servidor de Minecraft de destino está offline ou sobrecarregado\r\n• O servidor exige uma versão atualizada do cliente ou uma edição específica\r\n• Problemas de rede entre o relay e o servidor de destino\r\n\r\nTente se conectar a outro servidor ou entre em contato com o suporte do servidor. Se o problema persistir em vários servidores, ative o Modo de depuração no MCCompanion e verifique os logs.';

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
  String get reportUser => 'Denunciar usuário';
  @override
  String reportUserWithName(String username) => 'Denunciar @$username';
  @override
  String get reportMessage => 'Denunciar mensagem';
  @override
  String get reportDisclaimer => 'Nossa equipe revisará esta denúncia. Obrigado por manter a comunidade segura.';
  @override
  String get reportReasonSpam => 'Spam';
  @override
  String get reportReasonHarassment => 'Assédio ou bullying';
  @override
  String get reportReasonInappropriate => 'Conteúdo inapropriado';
  @override
  String get reportReasonOther => 'Outro';
  @override
  String get reportAdditionalDetails => 'Detalhes adicionais (opcional)';
  @override
  String get reportSubmit => 'Enviar denúncia';
  @override
  String get reportSuccess => 'Denúncia enviada. Obrigado.';
  @override
  String get reportFailed => 'Não foi possível enviar a denúncia. Tente novamente.';
  @override
  String get messagePlaceholder => 'Mensagem...';
  @override
  String get noMessagesYet => 'Nenhuma mensagem ainda.\nDiga olá!';
  @override
  String get today => 'Hoje';
  @override
  String get yesterday => 'Ontem';
  @override
  String get noConversationsYet => 'Nenhuma conversa ainda';
  @override
  String get startChatHint => 'Inicie uma conversa pela sua lista de amigos.';
  @override
  String get youPrefix => 'Você';
  @override
  String get tabProfile => 'PERFIL';
  @override
  String get tabFriends => 'AMIGOS';
  @override
  String get tabRequests => 'SOLICITAÇÕES';
  @override
  String get tabChats => 'CHATS';
  @override
  String get addFriend => 'Adicionar amigo';
  @override
  String get usernameHint => 'nome de usuário';
  @override
  String get send => 'Enviar';
  @override
  String friendRequestSentTo(String username) => 'Solicitação de amizade enviada para @$username';
  @override
  String alreadyFriendsWith(String username) => 'Você já é amigo de @$username.';
  @override
  String requestAlreadyPending(String username) => 'Já existe uma solicitação pendente com @$username.';
  @override
  String userNotFoundMsg(String username) => 'Usuário @$username não encontrado.';
  @override
  String cannotSendRequest(String username) => 'Você não pode enviar uma solicitação para @$username.';
  @override
  String get somethingWentWrong => 'Algo deu errado. Tente novamente.';
  @override
  String friendRequestAccepted(String username) => 'Solicitação de amizade de @$username aceita';
  @override
  String requestDeclined(String username) => 'Solicitação de @$username recusada';
  @override
  String get deleteAccountTitle => 'Excluir conta';
  @override
  String get deleteAccountBody => 'Isso excluirá permanentemente sua conta, mensagens, amigos e todos os dados associados. Esta ação não pode ser desfeita.';
  @override
  String get deletePermanently => 'Excluir permanentemente';
  @override
  String get couldNotDeleteAccount => 'Não foi possível excluir a conta. Tente novamente.';
  @override
  String get removeFriendTitle => 'Remover amigo';
  @override
  String removeFriendConfirm(String username) => 'Deseja remover @$username como amigo?';
  @override
  String get remove => 'Remover';
  @override
  String friendRemoved(String username) => '@$username removido dos seus amigos';
  @override
  String get noFriendsYet => 'Nenhum amigo ainda';
  @override
  String get noFriendsSub => 'Adicione alguém usando o botão no canto superior direito.';
  @override
  String get noPendingRequests => 'Nenhuma solicitação pendente';
  @override
  String get requestsAppearHere => 'As solicitações de amizade aparecerão aqui.';
  @override
  String onlineFriendsLabel(int count) => 'ONLINE — $count';
  @override
  String offlineFriendsLabel(int count) => 'OFFLINE — $count';
  @override
  String get couldNotUpdateVisibility => 'Não foi possível atualizar a visibilidade. Tente novamente.';
  @override
  String get aboutMe => 'Sobre mim';
  @override
  String get linkedAccountsTitle => 'Contas vinculadas';
  @override
  String get linkAccountsHint => 'Vincule suas contas do Minecraft para exibi-las no seu perfil.';
  @override
  String get unlinkXboxTitle => 'Desvincular conta Xbox';
  @override
  String removeLabelConfirm(String label) => 'Remover $label das suas contas vinculadas?';
  @override
  String get unlinkJavaTitle => 'Desvincular Java Edition';
  @override
  String removeJavaConfirm(String username) => 'Remover $username das suas contas vinculadas?';
  @override
  String get unlink => 'Desvincular';
  @override
  String get linkXbox => 'Vincular Xbox';
  @override
  String get linkJava => 'Vincular Java';
  @override
  String get appearOfflineLabel => 'Aparecer offline';
  @override
  String get appearOfflineOn => 'Amigos te veem como offline';
  @override
  String get appearOfflineOff => 'Amigos podem ver quando você está online';
  @override
  String get signOut => 'Sair';
  @override
  String get profileCardTitle => 'Perfil';
  @override
  String get edit => 'Editar';
  @override
  String get displayNameLabel => 'Nome de exibição';
  @override
  String get bioLabel => 'Bio';
  @override
  String get yourNameHint => 'Seu nome';
  @override
  String get bioHint => 'Conte algo sobre você';
  @override
  String get avatarUrlLabel => 'URL do avatar';
  @override
  String get usernameDisplayLabel => 'Nome de usuário';
  @override
  String get profileUpdated => 'Perfil atualizado';
  @override
  String get findUser => 'Encontrar usuário';
  @override
  String get signIn => 'Entrar';
  @override
  String get createAccount => 'Criar conta';
  @override
  String get signInSubtitle => 'Entre para adicionar amigos e compartilhar suas sessões.';
  @override
  String get emailAddressHint => 'Endereço de e-mail';
  @override
  String get passwordHint => 'Senha';
  @override
  String get forgotPassword => 'Esqueceu a senha?';
  @override
  String get continueWithGoogle => 'Continuar com o Google';
  @override
  String get alreadyHaveAccount => 'Já tem uma conta? Entre';
  @override
  String get noAccountYet => 'Ainda não tem conta? Cadastre-se';
  @override
  String get orDivider => 'ou';
  @override
  String get resetPasswordTitle => 'Redefinir senha';
  @override
  String get resetPasswordBody => 'Digite seu e-mail e enviaremos um link para redefinir sua senha.';
  @override
  String get sendLink => 'Enviar link';
  @override
  String resetLinkSent(String email) => 'Link de redefinição enviado para $email';
  @override
  String get noAccountForEmail => 'Nenhuma conta encontrada para este e-mail.';
  @override
  String get invalidEmailError => 'Endereço de e-mail inválido.';
  @override
  String get couldNotSendResetEmail => 'Não foi possível enviar o e-mail de redefinição. Tente novamente.';
  @override
  String get incorrectEmailOrPassword => 'E-mail ou senha incorretos.';
  @override
  String get emailAlreadyInUse => 'Este endereço de e-mail já está em uso.';
  @override
  String get weakPassword => 'A senha deve ter pelo menos 6 caracteres.';
  @override
  String get googleSignInFailed => 'Falha no login com Google. Tente novamente.';
  @override
  String get appleSignInFailed => 'Falha no login com Apple. Tente novamente.';
  @override
  String get emailDifferentMethod => 'Já existe uma conta com este e-mail usando um método de login diferente.';
  @override
  String get enterEmailAndPassword => 'Por favor, insira seu e-mail e senha.';
  @override
  String get profileNotSetUp => 'Perfil ainda não configurado';
  @override
  String get chooseUsernameSubtitle => 'Escolha um nome de usuário para adicionar amigos e compartilhar suas sessões.';
  @override
  String get createProfile => 'Criar perfil';
  @override
  String get chooseUniqueUsername => 'Escolha um nome de usuário único para adicionar amigos.';
  @override
  String get usernameFieldLabel => 'Nome de usuário *';
  @override
  String get usernameFormatHint => '3–20 caracteres · apenas a-z, 0-9 e _';
  @override
  String get displayNameOptional => 'Nome de exibição (opcional)';
  @override
  String get usernameRequired => 'Por favor, insira um nome de usuário.';
  @override
  String get usernameFormatError => '3–20 caracteres, apenas letras minúsculas, números e _';
  @override
  String get usernameTaken => 'Este nome de usuário já está em uso.';
  @override
  String get noConnectionError => 'Sem conexão. Tente novamente.';
  @override
  String get usernameExampleHint => 'ex. jens_mc';
  @override
  String get displayNameExampleHint => 'ex. Jens';
  @override
  String get home => 'Início';
  @override
  String get info => 'Info';
  @override
  String get consoleConnect => 'Console Connect';
  @override
  String get consoleConnectSubtitle => 'Conectar a servidores Minecraft';
  @override
  String get minecraftSkins => 'Skins do Minecraft';
  @override
  String get minecraftSkinsSubtitle => 'Ver e editar skins Java e Bedrock';
  @override
  String get minecraftWiki => 'Wiki do Minecraft';
  @override
  String get minecraftWikiSubtitle => 'Mobs, blocos, receitas e mais';
  @override
  String get partnerServersLabel => 'Servidores parceiros';
  @override
  String get partnerServersSubtitle => 'Servidores Minecraft em destaque';
  @override
  String get userLookup => 'Busca de usuário Minecraft';
  @override
  String get userLookupSubtitle => 'Buscar perfis Java e Bedrock';

  @override
  String get navSkins => 'Skins';
  @override
  String get navWiki => 'Wiki';
  @override
  String get navProfile => 'Perfil';

  @override
  String get skinsUpload => 'Carregar';
  @override
  String get skinsCreate => 'Criar';
  @override
  String get skinsSubtitle => 'Ver e baixar skins de Minecraft.';
  @override
  String get skinsSectionRecent => 'SKINS RECENTES';
  @override
  String get skinsSectionMy => 'MEUS SKINS';
  @override
  String get skinsSectionYours => 'SEUS SKINS';
  @override
  String get skinsEmptyMySkins => 'Nenhum skin salvo ainda. Crie ou carregue um skin para começar.';
  @override
  String get skinsCouldNotLoad => 'Não foi possível carregar os skins';
  @override
  String skinsPageOf(int page, int total) => 'Página $page / $total';
  @override
  String get skinsMustBe64 => 'O skin deve ter 64×64 pixels';
  @override
  String get skinsInvalidFile => 'Arquivo de imagem inválido';
  @override
  String get skinsDownload => 'Baixar';
  @override
  String get skinsEdit => 'Editar';
  @override
  String get skinsNoAccountsTitle => 'Nenhuma conta vinculada';
  @override
  String get skinsNoAccountsSubtitle => 'Vincule Java ou Bedrock no Perfil para ver seu skin.';
  @override
  String get skinsSignInTitle => 'Faça login para ver seu skin';
  @override
  String get skinsSignInSubtitle => 'Crie uma conta e vincule Java ou Bedrock no Perfil.';
}
