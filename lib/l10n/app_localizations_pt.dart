// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get console => 'Console';

  @override
  String get modeLabel => 'Modo';

  @override
  String get statusLabel => 'Estado';

  @override
  String get seeAll => 'Ver tudo';

  @override
  String get sectionHelp => 'Ajuda';

  @override
  String get sectionAdvanced => 'Avançado';

  @override
  String get versionLabel => 'Versão';

  @override
  String get consoleOutput => 'Saída do console';

  @override
  String get noLogsYet => 'Ainda não há logs';

  @override
  String get startBroadcastingToSeeOutput =>
      'Inicie a transmissão para ver a saída';

  @override
  String get close => 'Fechar';

  @override
  String get ok => 'OK';

  @override
  String get back => 'Voltar';

  @override
  String get next => 'Próximo';

  @override
  String get done => 'Concluir';

  @override
  String get none => 'Nenhum';

  @override
  String get onboardingThemeTitle => 'Escolha um tema';

  @override
  String get onboardingThemeSubtitle =>
      'Você pode ajustar cada cor nas configurações mais tarde.';

  @override
  String get onboardingNavTitle => 'Acesso rápido';

  @override
  String get onboardingNavSubtitle =>
      'Escolha dois recursos para sua barra de navegação.';

  @override
  String get onboardingNavLeftLabel => 'BOTÃO ESQUERDO';

  @override
  String get onboardingNavRightLabel => 'BOTÃO DIREITO';

  @override
  String get onboardingNavPreviewConnector => 'Conector';

  @override
  String get onboardingNavPreviewProfile => 'Perfil';

  @override
  String get onboardingNavPreviewEmpty => 'Vazio';

  @override
  String get onboardingCustomizeDetail => 'Personalizar em detalhes →';

  @override
  String get website => 'Site';

  @override
  String get howToUseMenu => 'Como usar';

  @override
  String get support => 'Suporte';

  @override
  String get start => 'Iniciar';

  @override
  String get stop => 'Parar';

  @override
  String get labelJava => 'Java';

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
  String get addServer => 'Adicionar servidor';

  @override
  String get addServersHint =>
      'Adicione servidores para se conectar rapidamente depois';

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
  String get clientDisconnected =>
      'Cliente desconectado: transmissão interrompida';

  @override
  String get pleaseEnterServer =>
      '⚠️ Por favor, insira um endereço de servidor';

  @override
  String get invalidPort => '⚠️ Número de porta inválido (1-65535)';

  @override
  String get dataSentToServers =>
      'Dados enviados para os servidores MCCompanion';

  @override
  String selectedServer(Object name) {
    return '📋 Selecionado: $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'Selecionado: $name';
  }

  @override
  String copiedLogs(Object count) {
    return '$count entradas de log copiadas para a área de transferência';
  }

  @override
  String get debugEnabled => 'Logs de depuração ativados';

  @override
  String get iUnderstand => 'Entendi';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'Selecionado: $relayName\r\n\r\nComo se conectar:\r\n1. Vá para as configurações do seu Switch e altere o DNS para: $relayIp\r\n2. Abra o Minecraft e selecione um servidor da lista (como Cubecraft ou Hive).\r\n3. Agora você será enviado automaticamente para o seu próprio servidor.';
  }

  @override
  String get noSavedServers => 'Nenhum servidor salvo';

  @override
  String get savedServers => 'Servidores salvos';

  @override
  String get manageServers => 'Gerenciar servidores';

  @override
  String get active => 'Ativo';

  @override
  String get vpnDetected => 'VPN detectada';

  @override
  String get noWifi => 'Sem Wi‑Fi';

  @override
  String get vpnActive =>
      'Detectamos que sua VPN está ativa.\n\nDesative a VPN antes de usar o MCCompanion, caso contrário a transmissão LAN pode não alcançar o seu console.';

  @override
  String get mobileActive =>
      'Detectado: dados móveis\n\nO MCCompanion precisa estar na mesma rede que o seu console. Conecte-se ao Wi‑Fi da sua casa ou ao hotspot antes de continuar.';

  @override
  String get continueAnyway => 'Continuar mesmo assim';

  @override
  String get updateAvailable => 'Atualização disponível';

  @override
  String get stopBroadcasting => 'Parar transmissão';

  @override
  String get startNintendoMode => 'Iniciar modo Nintendo';

  @override
  String get startFriendsMode => 'Iniciar modo Amigos';

  @override
  String get startBroadcasting => 'Iniciar transmissão';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'Amigos';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / conexão proxy)';

  @override
  String get howToXboxSubtitle => 'Ligar por LAN';

  @override
  String get howToXboxBody =>
      'Como se conectar (Xbox / PS4 / PS5):\r\n1. Certifique-se de que o dispositivo que está executando o MCCompanion e o seu console estejam na mesma rede local.\r\n2. No aplicativo, informe o endereço e a porta do seu servidor de Minecraft e pressione \\\"Iniciar transmissão\\\".\r\n3. No console, abra Minecraft → Jogar → procure por Mundos LAN ou pela aba Amigos e atualize a lista.\r\n4. Selecione o servidor LAN chamado \\\"MCCompanion\\\" para entrar.\r\nNotas:\r\n- Se o servidor não aparecer, confirme que ambos os dispositivos estão na mesma sub-rede e que o aplicativo ainda está transmitindo.\r\n- Alguns modelos de console ou roteadores podem bloquear a descoberta LAN; tente ajustar as configurações do aplicativo ou do roteador, se necessário.';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (modo DNS)';

  @override
  String get howToNintendoSubtitle => 'Ligar por DNS';

  @override
  String get howToFriendsTitle => 'Modo Amigos';

  @override
  String get howToFriendsSubtitle => 'Ligar por amigos';

  @override
  String get helpMCCompanionTitle => 'MCCompanion não aparece';

  @override
  String get helpMCCompanionSubtitle =>
      'Solução de problemas de descoberta LAN';

  @override
  String get helpMCCompanionBody =>
      'Se o servidor não estiver aparecendo no seu console, tente estas etapas:\r\n\r\n✅ Verificações básicas:\r\n1. Mesma rede WiFi - Seu telefone/tablet e o console DEVEM estar na mesma rede WiFi\r\n2. Endereço correto do servidor - Verifique novamente o IP e a porta (padrão: 19132)\r\n3. Transmissão ativa - Verifique se o MCCompanion mostra o status \"Transmitindo\"\r\n\r\n🔄 Correções rápidas:\r\n• Reinicie o aplicativo: pare a transmissão, feche o MCCompanion completamente, abra-o novamente e tente de novo\r\n• Reinicie seu console: às vezes o console precisa ser atualizado para detectar jogos LAN\r\n• Verifique a aba Amigos/LAN: o servidor aparece em \"Amigos\" ou \"Jogos LAN\", e NÃO na lista de servidores\r\n• Aguarde de 10 a 15 segundos após iniciar a transmissão\r\n• Desative VPNs: VPNs podem bloquear transmissões locais\r\n\r\n⚠️ Problemas comuns:\r\n\"No route found for user\" → Certifique-se de que ambos os dispositivos estejam na mesma rede Wi‑Fi (evite redes de convidados)\r\n\"Unable to connect to MCCompanion relay server\" → Verifique sua internet / status do relay\r\n\r\n📱 Ainda está com problemas? Ative o Modo de depuração no MCCompanion e verifique os logs, ou tente um servidor diferente.';

  @override
  String get helpMultiplayerFailedTitle => 'Falha na conexão multijogador';

  @override
  String get helpMultiplayerFailedSubtitle =>
      'Explicação de por que isso não é um erro do MCCompanion';

  @override
  String get helpMultiplayerFailedBody =>
      '⚠️ Isso não é um problema do MCCompanion!\r\n\r\nO MCCompanion redirecionou você com sucesso para o servidor solicitado. A mensagem \\\"Falha na conexão multijogador\\\" indica que o servidor de destino está inacessível no momento. Motivos possíveis:\r\n\r\n• O servidor de Minecraft de destino está offline ou sobrecarregado\r\n• O servidor exige uma versão atualizada do cliente ou uma edição específica\r\n• Problemas de rede entre o relay e o servidor de destino\r\n\r\nTente se conectar a outro servidor ou entre em contato com o suporte do servidor. Se o problema persistir em vários servidores, ative o Modo de depuração no MCCompanion e verifique os logs.';

  @override
  String get helpNintendoDnsTitle => 'O DNS do Nintendo não funciona';

  @override
  String get helpNintendoDnsSubtitle => 'Problemas comuns de DNS / relay';

  @override
  String get helpNintendoDnsBody =>
      'Se o modo DNS do Nintendo não estiver funcionando, verifique o seguinte:\r\n\r\n1. Confirme que você enviou a configuração DNS pelo aplicativo (Enviar Configuração DNS).\r\n2. Verifique se você aplicou o IP do relay como DNS Primário no Switch.\r\n3. Certifique-se de que o servidor relay selecionado (EU/US) está online e não está sobrecarregado.\r\n4. Algumas redes (por exemplo, captive portals) impedem DNS personalizado, teste em outra rede.\r\n\r\nSe os problemas persistirem, ative o Modo de depuração e verifique os logs, ou tente a alternativa do modo Amigos.';

  @override
  String get helpFriendsModeTitle => 'O modo Amigos não funciona';

  @override
  String get helpFriendsModeSubtitle => 'Problemas comuns com amigos';

  @override
  String get helpFriendsModeBody =>
      'Dicas de solução de problemas para o modo Amigos:\r\n\r\n1. Certifique-se de que a conta de amigo do relay foi adicionada/aceita no console (se necessário).\r\n2. Tente reiniciar o jogo e atualizar a aba Amigos/LAN depois de ativar o modo Amigos.\r\n\r\nSe o servidor ainda não aparecer para os amigos, ative o Modo de depuração e verifique os logs para identificar erros.';

  @override
  String get changeLanguageTitle => 'Alterar idioma';

  @override
  String get changeLanguage => 'Idioma';

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
  String get trackerSignInSubtitle =>
      'Faça login para rastrear servidores e receber notificações offline.';

  @override
  String get signIn => 'Entrar';

  @override
  String get noServersTracked => 'Nenhum servidor rastreado';

  @override
  String get trackerEmptySubtitle =>
      'Adicione um servidor Minecraft para monitorar seu status e receber notificações.';

  @override
  String get fillAllFields =>
      'Por favor, preencha todos os campos corretamente';

  @override
  String get slotUsedUpgrade =>
      'Seu slot gratuito está em uso. Faça upgrade para mais servidores.';

  @override
  String get addServerFailed =>
      'Falha ao adicionar o servidor. Verifique suas informações.';

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
  String get customizeSubtitle => 'Barra de navegacao e cores';

  @override
  String get resetLabel => 'Redefinir';

  @override
  String get navigationSection => 'NAVEGAÇÃO';

  @override
  String get navFixed => 'Connector e Perfil sao sempre fixos';

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
  String get textColorSection => 'COR DO TEXTO';

  @override
  String get textColorPickerTitle => 'Cor do texto';

  @override
  String get textColorHint =>
      'Toque no círculo para escolher uma cor de texto personalizada';

  @override
  String get textColorPreviewPrimary => 'Primário';

  @override
  String get textColorPreviewSecondary => 'Secundário';

  @override
  String get textColorPreviewMuted => 'Silenciado';

  @override
  String get colorSwatchCustom => 'Personalizado';

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
  String get reportUser => 'Denunciar utilizador';

  @override
  String reportUserWithName(Object name) {
    return 'Denunciar $name';
  }

  @override
  String get reportDisclaimer =>
      'Os relatórios são revistos pela nossa equipa.';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonHarassment => 'Assédio';

  @override
  String get reportReasonInappropriate => 'Conteúdo inapropriado';

  @override
  String get reportReasonOther => 'Outro';

  @override
  String get reportAdditionalDetails => 'Detalhes adicionais (opcional)…';

  @override
  String get reportSuccess => 'Relatório enviado. Obrigado.';

  @override
  String get reportFailed => 'Não foi possível enviar o relatório.';

  @override
  String get reportSubmit => 'Enviar relatório';

  @override
  String get playerLookupSubtitle => 'Procura um jogador Java ou Bedrock';

  @override
  String get playerLookupHint => 'Introduz um nome de utilizador…';

  @override
  String get playerLookupLinked => 'Contas ligadas encontradas';

  @override
  String get playerLookupLabelUsername => 'Nome de utilizador';

  @override
  String get playerLookupLabelTier => 'Nível';

  @override
  String playerLookupCopied(Object value) {
    return '$value copiado';
  }

  @override
  String get addFriend => 'Adicionar amigo';

  @override
  String get send => 'Enviar';

  @override
  String get somethingWentWrong => 'Algo correu mal. Tente novamente.';

  @override
  String friendRequestAccepted(Object name) {
    return 'Agora és amigo de $name';
  }

  @override
  String requestDeclined(Object name) {
    return 'Pedido de $name recusado';
  }

  @override
  String get deleteAccountTitle => 'Apagar conta';

  @override
  String get deleteAccountBody =>
      'Isto irá apagar permanentemente a tua conta e todos os dados.';

  @override
  String get deletePermanently => 'Apagar permanentemente';

  @override
  String get couldNotDeleteAccount => 'Não foi possível apagar a conta.';

  @override
  String get removeFriendTitle => 'Remover amigo';

  @override
  String removeFriendConfirm(Object name) {
    return 'Remover $name dos teus amigos?';
  }

  @override
  String get remove => 'Remover';

  @override
  String friendRemoved(Object name) {
    return '$name foi removido dos teus amigos';
  }

  @override
  String get emailDifferentMethod => 'Este email está ligado a outro método';

  @override
  String get googleSignInFailed => 'Falha no login com Google.';

  @override
  String get appleSignInFailed => 'Falha no login com Apple. Tente novamente.';

  @override
  String get resetPasswordTitle => 'Redefinir senha';

  @override
  String get resetPasswordBody =>
      'Introduz o teu email para receber um link de redefinição.';

  @override
  String get emailAddressHint => 'Endereço de email';

  @override
  String get sendLink => 'Enviar link';

  @override
  String resetLinkSent(Object email) {
    return 'Se existir uma conta para $email, o link já vai a caminho';
  }

  @override
  String get invalidEmailError => 'O endereço de email não é válido';

  @override
  String get couldNotSendResetEmail => 'Não foi possível enviar o email.';

  @override
  String get enterEmailAndPassword => 'Introduz o teu email e senha';

  @override
  String get incorrectEmailOrPassword => 'Email ou senha incorretos';

  @override
  String get emailAlreadyInUse => 'Este email já está em uso';

  @override
  String get weakPassword => 'Senha demasiado fraca.';

  @override
  String get createAccount => 'Criar conta';

  @override
  String get signInSubtitle => 'Entra para aceder ao teu perfil.';

  @override
  String get passwordHint => 'Senha';

  @override
  String get forgotPassword => 'Esqueceste a senha?';

  @override
  String get orDivider => 'ou';

  @override
  String get continueWithGoogle => 'Continuar com o Google';

  @override
  String get alreadyHaveAccount => 'Já tens conta? Entrar';

  @override
  String get noAccountYet => 'Sem conta? Cria uma';

  @override
  String get profileNotSetUp => 'Perfil não configurado';

  @override
  String get chooseUsernameSubtitle =>
      'Escolhe um nome de utilizador para que outros jogadores te encontrem.';

  @override
  String get createProfile => 'Criar perfil';

  @override
  String get findUser => 'Encontrar utilizador';

  @override
  String get couldNotUpdateVisibility =>
      'Não foi possível atualizar a visibilidade';

  @override
  String get signOut => 'Sair';

  @override
  String get appearOfflineLabel => 'Aparecer offline';

  @override
  String get appearOfflineOn => 'Apareces offline';

  @override
  String get appearOfflineOff => 'Apareces online';

  @override
  String get unlinkXboxTitle => 'Desligar conta Xbox';

  @override
  String removeLabelConfirm(Object name) {
    return 'Remover $name das tuas contas ligadas?';
  }

  @override
  String get unlink => 'Desligar';

  @override
  String get unlinkJavaTitle => 'Desligar conta Java';

  @override
  String removeJavaConfirm(Object name) {
    return 'Remover $name das tuas contas ligadas?';
  }

  @override
  String get linkAccountsHint => 'Liga as tuas contas do Minecraft.';

  @override
  String get linkXbox => 'Ligar Xbox';

  @override
  String get linkJava => 'Ligar Java';

  @override
  String get profileUpdated => 'Perfil atualizado';

  @override
  String get edit => 'Editar';

  @override
  String get displayNameLabel => 'Nome de exibição';

  @override
  String get yourNameHint => 'O teu nome';

  @override
  String get bioLabel => 'Bio';

  @override
  String get bioHint => 'Fala sobre ti…';

  @override
  String get noFriendsYet => 'Ainda sem amigos';

  @override
  String get noFriendsSub => 'Adiciona amigos para os veres aqui.';

  @override
  String onlineFriendsLabel(Object count) {
    return '$count online';
  }

  @override
  String offlineFriendsLabel(Object count) {
    return '$count offline';
  }

  @override
  String get noPendingRequests => 'Sem pedidos pendentes';

  @override
  String get requestsAppearHere =>
      'Os novos pedidos de amizade aparecerão aqui.';

  @override
  String get skinsEdit => 'Editar';

  @override
  String get skinsMustBe64 => 'A skin deve ser de 64×64 pixels';

  @override
  String get skinsInvalidFile => 'Ficheiro de imagem inválido';

  @override
  String get skinsUpload => 'Carregar';

  @override
  String get skinsCreate => 'Criar';

  @override
  String get skinsDownload => 'Transferir';

  @override
  String get chooseUniqueUsername =>
      'Escolha um nome de usuário único para começar.';

  @override
  String get usernameFieldLabel => 'Nome de usuário';

  @override
  String get usernameExampleHint => 'ex. CoolPlayer123';

  @override
  String get usernameFormatHint =>
      '3–20 caracteres · letras, números e sublinhados';

  @override
  String get displayNameOptional => 'Nome de exibição (opcional)';

  @override
  String get displayNameExampleHint => 'ex. Jogador Legal';

  @override
  String get usernameRequired => 'Nome de usuário é obrigatório';

  @override
  String get usernameFormatError =>
      'O nome de usuário deve ter 3–20 caracteres e conter apenas letras, números e sublinhados';

  @override
  String get usernameTaken => 'Este nome de usuário já está em uso';

  @override
  String get noConnectionError =>
      'Sem conexão. Verifique sua internet e tente novamente.';

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

  @override
  String get paywallRestore => 'Restaurar';

  @override
  String get paywallMonthly => 'Mensal';

  @override
  String get paywallYearly => 'Anual';

  @override
  String get paywallSavePercent => 'Poupa ~17%';

  @override
  String get paywallSubtitle => 'Segue mais servidores e recebe notificações.';

  @override
  String paywallSlotLabel(Object slots) {
    return '$slots slots de servidor';
  }

  @override
  String get paywallPopular => 'Popular';

  @override
  String get paywallContinue => 'Continuar';

  @override
  String get paywallNoPkgs => 'Sem pacotes disponíveis.';

  @override
  String get paywallManaged =>
      'Gerido pela Apple/Google. Cancela quando quiseres.';

  @override
  String get paywallPurchaseSuccess => 'Compra bem-sucedida!';

  @override
  String get paywallPurchaseFailed => 'Compra falhada.';

  @override
  String get paywallPurchasesRestored => 'Compras restauradas!';

  @override
  String get paywallNoActivePurchases => 'Sem compras ativas encontradas.';

  @override
  String get paywallRestoreFailed => 'Restauração falhada.';

  @override
  String get relay => 'Relay';

  @override
  String get serversSection => 'Servidores';

  @override
  String get selectBedrockAccount => 'Selecionar conta Bedrock';

  @override
  String get infoAndLegal => 'Info & Legal';

  @override
  String get legalSection => 'Legal';

  @override
  String get privacyPolicy => 'política de privacidade';

  @override
  String get privacyPolicySubtitle => 'Como recolhemos os teus dados';

  @override
  String get termsOfService => 'termos de serviço';

  @override
  String get termsOfServiceSubtitle => 'Regras e condições de uso';

  @override
  String get dataSourcesSection => 'Fontes de dados e créditos';

  @override
  String get creditMojangTitle => 'Mojang / Microsoft';

  @override
  String get creditMojangSubtitle => 'Skins e perfis Java via API da Mojang.';

  @override
  String get creditGeyserTitle => 'GeyserMC';

  @override
  String get creditGeyserSubtitle =>
      'Renderização de skins Bedrock via GeyserMC.';

  @override
  String get creditXboxTitle => 'Xbox / Microsoft';

  @override
  String get creditXboxSubtitle => 'Ligação de contas Bedrock via Xbox Live.';

  @override
  String get aboutMCCompanionSection => 'Sobre o MCCompanion';

  @override
  String get aboutMCCompanionDisclaimer =>
      'O MCCompanion é uma app independente não afiliada à Mojang ou Microsoft.';

  @override
  String get minecraftTrademark =>
      '\"Minecraft\" é uma marca registada da Microsoft Corporation.';

  @override
  String get nldServerLabelShort => 'Servidor MCCompanion';

  @override
  String get editServer => 'Editar servidor';

  @override
  String get serverNameExampleHint => 'O Meu Servidor Incrível';

  @override
  String get serverAddressExampleHint => 'play.exemplo.pt';

  @override
  String get serverDescriptionExampleHint => 'Servidor survival com amigos';

  @override
  String get editionLabel => 'Edição';

  @override
  String get nameLabel => 'Nome';

  @override
  String get ipAddressFieldLabel => 'Endereço IP';

  @override
  String get portFieldLabel => 'Porta';

  @override
  String get platformFieldLabel => 'Plataforma';

  @override
  String get nameValidationError => 'O nome deve ter 1–50 caracteres';

  @override
  String get ipRequiredError => 'O endereço IP é obrigatório';

  @override
  String get portRangeError => 'A porta deve estar entre 1 e 65535';

  @override
  String get xboxLinkTitle => 'Ligar conta Xbox';

  @override
  String get xboxStartingLogin => 'A iniciar login Xbox…';

  @override
  String get xboxSignInWithMicrosoft => 'Entrar com Microsoft';

  @override
  String get xboxGoToLink => 'Vai ao link abaixo e introduz o código.';

  @override
  String get xboxYourCode => 'O teu código';

  @override
  String get xboxTapToCopy => 'Toca no código para copiar';

  @override
  String get xboxOpenLink => 'Abrir microsoft.com/link';

  @override
  String get xboxWaitingForLogin => 'A aguardar login…';

  @override
  String get xboxAccountLinked => 'Conta Xbox ligada!';

  @override
  String get xboxCodeCopied => 'Código copiado para a área de transferência';

  @override
  String get xboxCouldNotStart => 'Não foi possível iniciar o login Xbox.';

  @override
  String get xboxCodeExpired => 'O código expirou. Tente novamente.';

  @override
  String get xboxSomethingWrong => 'Algo correu mal.';

  @override
  String get tryAgain => 'Tentar novamente';

  @override
  String get userNotFound => 'Utilizador não encontrado';

  @override
  String get profileSectionLabel => 'Perfil';

  @override
  String get displayNameRowLabel => 'Nome de exibição';

  @override
  String get usernameRowLabel => 'Nome de utilizador';

  @override
  String get lastSeenLabel => 'Última vez visto';

  @override
  String get aboutSectionLabel => 'Sobre';

  @override
  String get xboxBedrockLabel => 'Xbox / Bedrock';

  @override
  String get friendRequestSent => 'Pedido de amizade enviado';

  @override
  String get alreadyFriendsMsg => 'Já são amigos.';

  @override
  String get requestAlreadyPendingMsg => 'Já existe um pedido pendente.';

  @override
  String get userNotFoundMsg2 => 'Utilizador não encontrado.';

  @override
  String get cannotSendRequestMsg => 'Não é possível enviar um pedido.';

  @override
  String nowFriendsWith(Object username) {
    return 'Agora amigos com @$username';
  }

  @override
  String get removeFriendButton => 'Remover amigo';

  @override
  String get requestSentButton => 'Pedido enviado';

  @override
  String get acceptRequestButton => 'Aceitar pedido';

  @override
  String get addFriendButton => 'Adicionar amigo';

  @override
  String get removeFriendDialogTitle => 'Remover amigo';

  @override
  String removeFriendDialogBody(Object username) {
    return 'Remover @$username como amigo?';
  }

  @override
  String get trackerLimitReached => 'Limite de servidores atingido';

  @override
  String get upgradeButton => 'Atualizar';

  @override
  String get javaLinkTitle => 'Ligar Java Edition';

  @override
  String get javaStartingLogin => 'A iniciar sessão Microsoft…';

  @override
  String get javaSignInWithMicrosoft => 'Entrar com Microsoft';

  @override
  String get javaGoToLink =>
      'Vai ao link abaixo e introduz o código para ligar a tua conta Minecraft Java Edition.';

  @override
  String get javaYourCode => 'O teu código';

  @override
  String get javaTapToCopy => 'Toca no código para copiar';

  @override
  String get javaOpenLink => 'Abrir microsoft.com/link';

  @override
  String get javaWaitingForLogin => 'A aguardar sessão…';

  @override
  String get javaAccountLinked => 'Java Edition ligado!';

  @override
  String get javaNoJavaTitle => 'Nenhum Java Edition encontrado';

  @override
  String get javaNoJavaBody =>
      'A conta Microsoft com que entraste não possui Minecraft Java Edition.';

  @override
  String get javaTryDifferentAccount => 'Tentar outra conta';

  @override
  String get javaCouldNotStart =>
      'Não foi possível iniciar a sessão Microsoft. Tente novamente.';

  @override
  String get javaCodeExpired => 'O código expirou. Tente novamente.';

  @override
  String get javaSomethingWrong => 'Algo correu mal. Tente novamente.';

  @override
  String get javaCodeCopied => 'Código copiado para a área de transferência';

  @override
  String get featureLabelConnector => 'Conector';

  @override
  String get featureLabelSkins => 'Skins';

  @override
  String get featureLabelPartners => 'Lista de servidores';

  @override
  String get featureLabelLookup => 'Pesquisa';

  @override
  String get featureLabelTracker => 'Rastreador de servidor';

  @override
  String get userSearchHint => 'Nome de utilizador, gamertag ou nome Java…';

  @override
  String get userSearchSub =>
      'Pesquisar por nome de utilizador, gamertag Xbox ou nome Java';

  @override
  String get upgradeWindowsHint => 'Atualização disponível na Microsoft Store';

  @override
  String get skinSaved => 'Skin salva';

  @override
  String skinSavedAs(String name) {
    return 'Salvo como \"$name\"';
  }

  @override
  String get skinExportFailed => 'Falha na exportacao';

  @override
  String get skinExported => 'Skin exportada com sucesso';

  @override
  String get accountActions => 'Conta';

  @override
  String get feedbackBugReport => 'Relatório de bug';

  @override
  String get feedbackFeatureRequest => 'Pedido de funcionalidade';

  @override
  String get feedbackTitleLabel => 'Título';

  @override
  String get feedbackTitleHintBug =>
      'ex. O app fecha ao abrir o editor de skin';

  @override
  String get feedbackTitleHintFeature =>
      'ex. Mostrar o ping do jogador na lista de servidores';

  @override
  String get feedbackWhatHappened => 'O que aconteceu?';

  @override
  String get feedbackDescribeIdea => 'Descreva sua ideia';

  @override
  String get feedbackDescHintBug =>
      'Descreva o bug: o que você fez, o que esperava e o que aconteceu em vez disso?';

  @override
  String get feedbackDescHintFeature =>
      'Explique o que você gostaria e por que seria útil.';

  @override
  String get feedbackSubmitBug => 'Enviar relatório de bug';

  @override
  String get feedbackSubmitFeature => 'Enviar pedido de funcionalidade';

  @override
  String get feedbackDisclaimer => 'Vai para nossa equipe · Não inclua senhas';

  @override
  String get feedbackSuccessTitle => 'Obrigado pelo feedback!';

  @override
  String get feedbackSuccessBody =>
      'Obrigado! Recebemos seu relato. Respondemos no aplicativo, então volte aqui para ver a resposta.';

  @override
  String get feedbackSubmitAnother => 'Enviar outro';

  @override
  String get feedbackBackToApp => 'Voltar ao app';

  @override
  String get feedbackTitleTooShort =>
      'O título deve ter pelo menos 5 caracteres.';

  @override
  String get feedbackDescTooShort =>
      'A descrição deve ter pelo menos 10 caracteres.';

  @override
  String get feedbackSubmitFailed => 'Falha ao enviar. Tente novamente.';

  @override
  String get feedbackTileTitle => 'Comentários';

  @override
  String get feedbackTileSubtitle => 'Ajude-nos a melhorar o MCCompanion';

  @override
  String get friendsHowToStep1 =>
      'Abra o aplicativo Xbox no seu telefone ou console.';

  @override
  String get friendsHowToStep2 =>
      'Adicione um dos bots abaixo como amigo no Xbox.';

  @override
  String get friendsHowToStep3 => 'Abra o Minecraft e vá para a aba Amigos.';

  @override
  String get friendsHowToStep4 => 'Procure seu servidor em Mundos LAN e entre.';

  @override
  String get friendsHowToNote =>
      '⚠️ Toda vez que quiser jogar, você precisa iniciar o modo Amigos no aplicativo MCCompanion primeiro. Você pode fechar o aplicativo após iniciar.';

  @override
  String get friendsBotLoadError =>
      '⚠️ Não foi possível carregar a lista de bots. Tente novamente mais tarde.';

  @override
  String get regionEurope => 'Europa';

  @override
  String get regionUnitedStates => 'Estados Unidos';

  @override
  String get yourRegion => 'SUA REGIÃO';

  @override
  String get botStatusOffline => 'Offline';

  @override
  String get botStatusFull => 'Cheio';

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
  String get skinSavedToDocuments => 'Skin guardado em Documentos';

  @override
  String get skinMenuExport => 'Exportar';

  @override
  String get skinMenuDelete => 'Excluir';

  @override
  String get rpScreenTitle => 'Pacote de recursos';

  @override
  String get rpWhatWorks => 'O que funciona';

  @override
  String get rpSupportedBedrockOnly =>
      'Somente Bedrock Edition (.mcpack ou .zip)';

  @override
  String get rpSupportedBedrockOnlyHint =>
      'Packs de Java não funcionam em consoles.';

  @override
  String get rpSupportedTexture => 'Packs de recursos & packs de texturas';

  @override
  String get rpSupportedTextureHint =>
      'Esses são oficialmente suportados e funcionam de forma confiável.';

  @override
  String get rpUnsupportedShaders =>
      'Shaders, packs de comportamento, packs de skins';

  @override
  String get rpUnsupportedShadersHint =>
      'Esses não serão carregados em consoles via MCCompanion.';

  @override
  String get rpUnsupportedAddons => 'Add-ons & mods de UI';

  @override
  String get rpUnsupportedAddonsHint =>
      'Podem funcionar às vezes, mas não são oficialmente suportados. Use por sua conta e risco.';

  @override
  String get rpNoDiscord =>
      'Links do Discord: sem extensão .mcpack e expiram após algumas horas';

  @override
  String get rpNoDrive =>
      'Links de compartilhamento do Google Drive / Dropbox, não são downloads diretos';

  @override
  String get rpNoEncrypted =>
      'Servidores com pacotes criptografados ou protegidos por senha';

  @override
  String get rpConsolePerformanceTitle => 'Desempenho do console';

  @override
  String get rpConsolePerformanceBody =>
      'Packs de texturas de alta resolução podem causar lag ou travamentos em consoles. Se você tiver problemas, mude para um pack de resolução menor ou selecione um subpack mais leve, se o pack suportar.';

  @override
  String get rpWarnDiscord =>
      'Links do Discord expiram e pararão de funcionar. Use um host permanente.';

  @override
  String get rpWarnHttps => 'A URL deve começar com https://';

  @override
  String get rpWarnExtension => 'A URL deve terminar em .mcpack ou .zip';

  @override
  String get rpToastSaved => 'Configurações do pacote de recursos salvas.';

  @override
  String get rpInvalidPackFormat =>
      'Este é um pack da Java Edition e não é suportado. Usa um resource pack da Bedrock Edition.';

  @override
  String get rpBehaviorContentWarning =>
      'Este pack contém dados de behavior pack que não funcionam em servidores. As texturas continuam a funcionar.';

  @override
  String get rpClearMinecraftTitle => 'Primeira vez com este pack?';

  @override
  String get rpClearStep1 =>
      'Abra o Minecraft no console e vá em Configurações → Armazenamento';

  @override
  String get rpClearStep2 =>
      'Toque em ‘Limpar’ ou ‘Redefinir’ ao lado de Pacotes de recursos, isso remove todos os packs em cache';

  @override
  String get rpClearStep3 =>
      'Reconecte pelo MCCompanion: o pack mesclado será baixado automaticamente';

  @override
  String get rpRelayTitle => 'O pack está com problema?';

  @override
  String get rpRelayBody =>
      'O relay armazena o pack mesclado por 1 hora usando sua URL de overlay como chave. Para forçar uma nova mesclagem: altere levemente a URL do pack (ex: adicione ?v=2) e salve. Depois, limpe também o cache de packs do Minecraft, o pack mesclado ainda usa o UUID do servidor, então o Minecraft mostraria a versão antiga em cache.';

  @override
  String get rpNoDiscordHint => 'Links do Discord CDN expiram após pouco tempo';

  @override
  String get rpNoDriveHint =>
      'Sem download direto: redireciona para uma página de visualização';

  @override
  String get rpNoEncryptedHint =>
      'MCCompanion não pode mesclar conteúdo de packs criptografados';

  @override
  String get rpClearWhy =>
      'O Minecraft armazena packs de recursos pelo UUID. O pack mesclado mantém o UUID original do servidor, se o Minecraft já tiver o pack do servidor em cache de uma sessão anterior (antes do MCCompanion), não baixará a nova versão mesclada. Limpe o cache para que o Minecraft carregue o pack atualizado.';

  @override
  String get rpUploadTab => 'Upload';

  @override
  String get rpUploadButton => 'Tap to select your pack';

  @override
  String get rpUploadHint => '.mcpack or .zip • max 100 MB';

  @override
  String get rpUploading => 'Uploading...';

  @override
  String get rpMergerTitle => 'Fusão de RP';

  @override
  String get rpMergerPriorityHint =>
      'O pacote do topo tem maior prioridade: seus arquivos vencem conflitos.';

  @override
  String get rpMergerTopBadge => 'TOPO';

  @override
  String get rpMergerAddPacks => 'Adicionar pacotes de recursos';

  @override
  String rpMergerAddAnother(int current) {
    return 'Adicionar outro pacote ($current/4)';
  }

  @override
  String get rpMergerFileTypes => '.zip ou .mcpack';

  @override
  String get rpMergerMerging => 'Fundindo…';

  @override
  String rpMergerButton(int count) {
    return 'Fundir $count pacotes';
  }

  @override
  String get rpMergerSetActiveToast => 'Definido como pacote de recursos ativo';

  @override
  String get rpDisabled => 'Desativado';

  @override
  String get rpNoPackSelected => 'Nenhum pacote de recursos selecionado';

  @override
  String get rpActiveOnConnect => 'Ativo: aplicado ao conectar';

  @override
  String get rpBrowseSubtitle => 'Pacotes curados, prontos para usar';

  @override
  String get rpBrowseEmpty => 'Nenhum pacote disponível ainda';

  @override
  String get rpBrowseEmptyHint => 'Volte mais tarde para pacotes curados.';

  @override
  String get rpReplaceFile => 'Substituir por outro arquivo';

  @override
  String get rpDropToUpload => 'Soltar para enviar';

  @override
  String get rpTabBrowseInfo =>
      'Explore pacotes selecionados pelo MCCompanion. Toque em Usar para ativar um pacote instantaneamente, sem upload ou link necessário.';

  @override
  String get rpTabUploadInfo =>
      'Envie seu próprio arquivo .mcpack ou .zip. O MCCompanion o armazena com segurança na nuvem e o envia para seu console toda vez que você se conecta.';

  @override
  String get rpTabMergeInfo =>
      'Combine 2 a 4 pacotes em um. O pacote mesclado é enviado para o MCCompanion Cloud e ativado automaticamente.';

  @override
  String get shareLabel => 'Compartilhar';

  @override
  String get sectionMinecraftAccounts => 'Contas Minecraft';

  @override
  String get sectionSettings => 'Configurações';

  @override
  String get avatarUpdated => 'Avatar atualizado';

  @override
  String get uploadFailed => 'Falha no upload';

  @override
  String get profileLinkCopied => 'Link do perfil copiado!';

  @override
  String get shareProfileTooltip => 'Compartilhar perfil';

  @override
  String get profileFallbackTitle => 'Perfil';

  @override
  String get noUsersFound => 'Nenhum usuário encontrado';

  @override
  String get skinLabel => 'SKIN';

  @override
  String get skinsLabel => 'SKINS';

  @override
  String get javaEditionBadge => 'Java';

  @override
  String get bedrockEditionBadge => 'Bedrock';

  @override
  String get downloadLabel => 'Baixar';

  @override
  String get justNow => 'Agora mesmo';

  @override
  String minutesAgo(int count) {
    return 'Há ${count}min';
  }

  @override
  String hoursAgo(int count) {
    return 'Há ${count}h';
  }

  @override
  String daysAgo(int count) {
    return 'Há ${count}d';
  }

  @override
  String get rpPackInfo => 'Info';

  @override
  String get rpUseThisPack => 'Usar este pack';

  @override
  String get rpViewOnWebsite => 'Ver no site →';

  @override
  String rpDownloads(int count) {
    return '$count downloads';
  }

  @override
  String get skinsSavedToMySkins => 'Salvo em Meus Skins';

  @override
  String get skinsDownloadFailed => 'Falha no download';

  @override
  String get skinsDeletedFromCloud => 'Excluído da nuvem';

  @override
  String get skinsDeleteFailed => 'Falha ao excluir';

  @override
  String get skinsLoginToUpload => 'Entre para fazer upload de skins';

  @override
  String get skinsUploading => 'Enviando…';

  @override
  String get skinUploaded => 'Skin enviado!';

  @override
  String skinUploadFailed(String error) {
    return 'Falha no upload: $error';
  }

  @override
  String get skinsEmptyLocalSkins =>
      'Nenhum skin ainda. Crie ou faça upload de um skin para começar.';

  @override
  String get skinUploadToWebsite => 'Enviar para o site';

  @override
  String get skinReuploadToWebsite => 'Reenviar para o site';

  @override
  String get skinCloudEdit => 'Editar';

  @override
  String get skinCloudSaveToDevice => 'Salvar no dispositivo';

  @override
  String get skinCloudDelete => 'Excluir da nuvem';

  @override
  String get skinsTabGallery => 'Galeria';

  @override
  String get skinsTopLabel => 'Top 30';

  @override
  String get skinsAllLabel => 'Todos os Skins';

  @override
  String get skinUploadToCloud => 'Enviar para nuvem';

  @override
  String get skinSaveDialog => 'Salvar skin';

  @override
  String get skinNameHint => 'Nome do skin';

  @override
  String get skinDefaultName => 'Meu skin';

  @override
  String get skinUpdatedInCloud => 'Skin atualizado na nuvem';

  @override
  String skinByCreator(String name) {
    return 'por $name';
  }

  @override
  String skinLikesCount(int count) {
    return '$count curtidas';
  }

  @override
  String get sectionRecentActivity => 'Atividade recente';

  @override
  String get activityNoEvents => 'Nenhuma atividade recente ainda.';

  @override
  String get activitySkinUploaded => 'Skin enviada';

  @override
  String get activitySkinLiked => 'Skin curtida';

  @override
  String get activityPackSubmitted => 'Pack enviado';

  @override
  String get activityPackApproved => 'Pack aprovado';

  @override
  String get activityPackRejected => 'Pack não aprovado';

  @override
  String get timeJustNow => 'agora mesmo';

  @override
  String timeMinutesAgo(int count) {
    return 'há $count min';
  }

  @override
  String timeHoursAgo(int count) {
    return 'há $count h';
  }

  @override
  String timeDaysAgo(int count) {
    return 'há $count dias';
  }

  @override
  String timeMonthsAgo(int count) {
    return 'há $count meses';
  }

  @override
  String get sectionNotifications => 'Notificações';

  @override
  String get sectionNotificationTypes => 'Tipos de notificação';

  @override
  String get notifMarkAllRead => 'Marcar tudo como lido';

  @override
  String get notifEmpty =>
      'Nenhuma notificação ainda. Curtidas, comentários e atividades de amigos aparecerão aqui.';

  @override
  String get notifSomeone => 'Alguém';

  @override
  String notifSkinLiked(String actor) {
    return '$actor curtiu sua skin';
  }

  @override
  String notifCommentReceived(String actor) {
    return '$actor comentou na sua skin';
  }

  @override
  String get notifPackApproved => 'Pack aprovado';

  @override
  String get notifPackRejected => 'Pack não aprovado';

  @override
  String notifFriendRequest(String actor) {
    return '$actor enviou uma solicitação de amizade';
  }

  @override
  String notifFriendAccepted(String actor) {
    return '$actor aceitou sua solicitação';
  }

  @override
  String notifMessageReceived(String actor) {
    return 'Nova mensagem de $actor';
  }

  @override
  String get notifPrefSkinLiked => 'Skin curtida';

  @override
  String get notifPrefCommentReceived => 'Comentário recebido';

  @override
  String get notifPrefPackApproved => 'Pack aprovado';

  @override
  String get notifPrefPackRejected => 'Pack rejeitado';

  @override
  String get notifPrefFriendRequest => 'Solicitação de amizade';

  @override
  String get notifPrefFriendAccepted => 'Amigo adicionado';

  @override
  String get notifPrefMessageReceived => 'Nova mensagem';

  @override
  String get commentsTitle => 'Comentários';

  @override
  String get commentsEmpty => 'Ainda sem comentários. Seja o primeiro!';

  @override
  String get commentsPlaceholder => 'Escreva um comentário…';

  @override
  String get loadMore => 'Carregar mais';

  @override
  String get skinLayerInner => 'Interior';

  @override
  String get skinLayerOuter => 'Exterior';

  @override
  String get feedbackLoginRequiredTitle => 'Inicie sessão para enviar feedback';

  @override
  String get feedbackLoginRequiredBody =>
      'O feedback está associado à sua conta MCCompanion para podermos responder diretamente na app.';

  @override
  String get feedbackLoginButton => 'Iniciar sessão';

  @override
  String get supportInboxTitle => 'Caixa de suporte';

  @override
  String get skinShareSubject => 'Skin de Minecraft';

  @override
  String get skinEditorTitle => 'Editor de skins';

  @override
  String get skinToolUndo => 'Anular';

  @override
  String get skinSaveToMySkins => 'Guardar nas minhas skins';

  @override
  String get skinUpdateInCloud => 'Atualizar na nuvem';

  @override
  String get skinExportPng => 'Exportar PNG';

  @override
  String get skinToolDraw => 'Desenhar';

  @override
  String get skinToolFill => 'Preencher';

  @override
  String get skinToolErase => 'Apagar';

  @override
  String get customColour => 'Cor personalizada';

  @override
  String get featuredServerLabel => 'SERVIDOR EM DESTAQUE';

  @override
  String get featuredServerTagline => 'Entra e começa a jogar.';

  @override
  String get featuredServerPlay => 'Jogar';

  @override
  String rpUploadFailedCode(int code) {
    return 'Falha no envio ($code)';
  }

  @override
  String rpUploadFailed(String error) {
    return 'Falha no envio: $error';
  }

  @override
  String get rpLoadFailed => 'Não foi possível carregar os packs';

  @override
  String get rpRetry => 'Tentar de novo';

  @override
  String get rpSearchHint => 'Procurar packs…';

  @override
  String rpMergeFailed(String error) {
    return 'Falha ao juntar: $error';
  }

  @override
  String get rpMergerSize => 'Tamanho';

  @override
  String get rpMergerCreated => 'Criado';

  @override
  String get rpMergerSourcePacks => 'Packs de origem';

  @override
  String get rpMergerDropToAdd => 'Larga para adicionar';

  @override
  String get rpMergerSavedMerges => 'Junções guardadas';

  @override
  String get rpMergerUse => 'Usar';

  @override
  String get supportInboxShared => 'Partilhado com todos os admins';

  @override
  String get supportInboxEmpty => 'Ainda não há conversas de suporte';

  @override
  String get supportReplyingAs => 'Estás a responder como MCCompanion Support';

  @override
  String get relayBlocked =>
      'O teu IP ou a tua conta está bloqueada pela MCCompanion. Se achas que é um erro, entra no nosso Discord.';

  @override
  String relayBlockedWithReason(String reason) {
    return 'O teu IP ou a tua conta está bloqueada pela MCCompanion.\nMotivo: $reason\nSe achas que é um erro, entra no nosso Discord.';
  }

  @override
  String relayConfigFailed(int code) {
    return 'Não foi possível configurar o relay (estado $code). Experimenta outro relay ou entra no nosso Discord.';
  }

  @override
  String relayConfigFailedDetail(int code, String detail) {
    return 'Não foi possível configurar o relay (estado $code): $detail. Experimenta outro relay ou entra no nosso Discord.';
  }

  @override
  String get relayTimeout => 'O relay não respondeu a tempo.';

  @override
  String get relayUnreachable => 'Não foi possível contactar o relay.';

  @override
  String get lookupNotFound => 'Jogador não encontrado.';

  @override
  String get lookupNetworkError => 'Erro de rede. Tenta de novo.';

  @override
  String get lookupBedrockUnavailable =>
      'A pesquisa Bedrock não está disponível de momento.';

  @override
  String get lookupFailed => 'A pesquisa falhou.';

  @override
  String get myFeedbackTitle => 'O meu feedback';

  @override
  String get myFeedbackEmpty => 'Ainda não nos enviaste nada.';

  @override
  String get myFeedbackOpenList => 'O meu feedback';

  @override
  String get fbStatusOpen => 'Aberto';

  @override
  String get fbStatusPlanned => 'Planeado';

  @override
  String get fbStatusInProgress => 'Em curso';

  @override
  String get fbStatusImplemented => 'Concluído';

  @override
  String get fbStatusNotPlanned => 'Não planeado';

  @override
  String get fbStatusDuplicate => 'Duplicado';

  @override
  String get fbNoReplies => 'Ainda sem resposta. Avisamos-te aqui.';

  @override
  String get fbReplyHint => 'Acrescenta algo a este relatório…';

  @override
  String get fbFromTeam => 'MCCompanion';

  @override
  String get fbFromYou => 'Tu';

  @override
  String get feedbackGoesToTeam => 'Vai direto para a equipa';

  @override
  String get notifFeedbackStatus => 'Novidades sobre o teu feedback';

  @override
  String get notifFeedbackReply => 'Resposta ao teu feedback';

  @override
  String get adminTicketsHeader => 'Relatórios e pedidos';

  @override
  String get adminTicketReplyHint => 'Responder sobre este ticket…';

  @override
  String get chooseServerTitle => 'Escolhe um servidor';

  @override
  String get changeLabel => 'Alterar';

  @override
  String get howToAutoShow => 'Mostrar isto ao iniciar';

  @override
  String get skinEditorLoadFailed =>
      'Não foi possível carregar essa skin. Vamos começar com a padrão.';

  @override
  String get skinToolRecolour => 'Recolorir';

  @override
  String get skinToolPick => 'Conta-gotas';

  @override
  String get skinBases => 'Bases';

  @override
  String get skinBasesTitle => 'Começar de uma base';

  @override
  String get skinBasesSubtitle =>
      'Isto substitui o que está aí. Desfazer traz de volta.';

  @override
  String get skinMirror => 'Espelho';

  @override
  String get skinSurprise => 'Surpresa';

  @override
  String get skinToolFillHint => 'Preenche a área que tocar';

  @override
  String get skinToolRecolourHint => 'Muda essa cor na skin inteira';

  @override
  String get skinToolPickHint => 'Pega a cor que tocar';

  @override
  String get skinModelClassic => 'Largo';

  @override
  String get skinModelSlim => 'Fino';

  @override
  String get shareServerLabel => 'Partilhar o teu servidor';

  @override
  String get shareServerOn => 'Os teus amigos veem em que servidor estás';

  @override
  String get shareServerOff =>
      'Os teus amigos veem que estás a jogar, não onde';

  @override
  String directHostNotFound(String host) {
    return 'Não foi possível encontrar $host. Verifique o endereço e tente novamente.';
  }

  @override
  String get directPortBusy =>
      'Não foi possível abrir a porta local. Pare primeiro a ligação atual.';

  @override
  String directAddressNotSupported(String host) {
    return '$host é um endereço IPv6. O modo proxy/direto só suporta IPv4. Use o endereço IPv4 ou o nome de anfitrião.';
  }

  @override
  String termsAgreement(String terms, String privacy) {
    return 'Concordo com os $terms e a $privacy.';
  }

  @override
  String get verifyEmailTitle => 'Verifique o seu e-mail';

  @override
  String get verifyEmailBody =>
      'Necessário antes de comentar, enviar skins ou submeter packs.';

  @override
  String get verifyEmailSent => 'Enviado, verifique a sua caixa de entrada.';

  @override
  String get verifyEmailSending => 'A enviar…';

  @override
  String get verifyEmailSend => 'Enviar link';

  @override
  String updateAvailableTitle(Object version) {
    return 'A versão $version já saiu';
  }

  @override
  String updateAvailableBody(Object current) {
    return 'Você está usando $current. Esta versão não se atualiza sozinha.';
  }

  @override
  String get updateAvailableAction => 'Baixar';

  @override
  String get updateAvailableDismiss => 'Agora não';

  @override
  String get serverListSearchHint => 'Pesquisar por nome ou endereço';

  @override
  String get serverListEditionAny => 'Java e Bedrock';

  @override
  String get serverListEditionJava => 'Apenas Java';

  @override
  String get serverListEditionBedrock => 'Apenas Bedrock';

  @override
  String get serverListSortVotes => 'Mais votos';

  @override
  String get serverListSortPlayers => 'Mais jogadores';

  @override
  String get serverListSortPeak => 'Maior pico';

  @override
  String get serverListSortNewest => 'Mais recentes';

  @override
  String get serverListSortName => 'Nome';

  @override
  String get serverListAllCategories => 'Todas';

  @override
  String get serverListLoadFailed =>
      'Não foi possível carregar a lista de servidores';

  @override
  String get serverListLoadFailedHint => 'Puxe para baixo para tentar de novo';

  @override
  String get serverListNoMatch => 'Nenhum servidor corresponde';

  @override
  String get serverListNoMatchHint => 'Tente outra pesquisa ou categoria';

  @override
  String get serverCardPlay => 'Jogar';

  @override
  String get serverCardVote => 'Votar';

  @override
  String get serverCardViewServer => 'Ver servidor';

  @override
  String get serverCopyIp => 'Copiar IP';

  @override
  String get serverCopied => 'Copiado';

  @override
  String get serverStatPlayers => 'Jogadores';

  @override
  String get serverStatPeak => 'Pico';

  @override
  String get serverStatUptime => 'Disponibilidade';

  @override
  String get serverStatVotesMonth => 'Votos este mês';

  @override
  String get serverBadgeFeatured => 'Destaque';

  @override
  String get serverEditionJava => 'Java';

  @override
  String get serverEditionBedrock => 'Bedrock';

  @override
  String get serverEditionCrossplay => 'Crossplay';

  @override
  String get serverSectionMotd => 'Mensagem do dia';

  @override
  String get serverLinkDiscord => 'Discord';

  @override
  String get serverLinkWebsite => 'Site';

  @override
  String get serverVotesThisMonth => 'Este mês';

  @override
  String get serverVotesAllTime => 'Desde o início';

  @override
  String get serverVoteSignInRequired => 'Entre para votar pelo aplicativo.';

  @override
  String serverVoteSheetTitle(String name) {
    return 'Votar em $name';
  }

  @override
  String get serverVoteSheetSubtitle =>
      'Seu nome no Minecraft, para o servidor saber quem recompensar.';

  @override
  String get serverVoteSheetHint => 'Steve';

  @override
  String get serverVoteSheetButton => 'Votar';

  @override
  String get serverVoteSheetLimit => 'Um voto por servidor por dia.';

  @override
  String get serverVoteDelivered =>
      'Voto registrado. Sua recompensa está a caminho.';

  @override
  String get serverVoteNoRewards =>
      'Voto registrado. Este servidor não tem recompensas configuradas.';

  @override
  String get serverVoteFailed => 'Não funcionou, tente novamente.';

  @override
  String get serverVoteOffline =>
      'Não foi possível contatar o servidor. Verifique sua conexão.';

  @override
  String get feedbackViewYourReport => 'Ver seu relato';

  @override
  String get showMore => 'Mais';

  @override
  String get showLess => 'Menos';
}
