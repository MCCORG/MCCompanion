// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'NetherLink';

  @override
  String get console => 'Console';

  @override
  String get consoleOutput => 'Sortie de la console';

  @override
  String get noLogsYet => 'Aucun journal pour le moment';

  @override
  String get startBroadcastingToSeeOutput => 'Démarrez la diffusion pour voir la sortie';

  @override
  String get close => 'Fermer';

  @override
  String get ok => 'OK';

  @override
  String get joinUs => 'Rejoignez-nous';

  @override
  String get more => 'Plus';

  @override
  String get website => 'Site web';

  @override
  String get howToUseMenu => 'Comment utiliser';

  @override
  String get support => 'Assistance';

  @override
  String helpText(Object appCreator) {
    return 'Créé par $appCreator.\r\n\r\nComment utiliser :\r\n1. Saisissez l\'adresse et le port de votre serveur Minecraft (par défaut : 19132)\r\n   — ou sélectionnez un serveur précédemment enregistré dans la liste déroulante\r\n2. (Optionnel) Choisissez un serveur relais (EU ou US) proche de votre position\r\n3. Cliquez sur \\\"Démarrer la diffusion\\\" pour commencer\r\n4. Sur votre console/appareil : Minecraft > Jouer > Amis\r\n5. Vous devriez voir un serveur LAN appelé \\\"NetherLink\\\"\r\n6. Cliquez dessus pour rejoindre votre serveur externe via NetherLink\r\n\r\nNintendo Switch (mode DNS) :\r\n1. Activez \\\"Nintendo Switch\\\" dans le panneau de connexion\r\n2. Sélectionnez un serveur relais (EU ou US)\r\n3. Cliquez sur \\\"Envoyer la configuration DNS\\\" — cela envoie votre configuration au relais\r\n   (cela ne diffuse PAS de serveur LAN)\r\n4. Sur votre Switch, appliquez votre configuration DNS NetherLink et rejoignez\r\n   en utilisant l\'entrée de serveur que vous utilisez pour NetherLink\r\n\r\nNotes :\r\n- Pour la diffusion LAN, NetherLink et la console doivent être sur le même réseau local.\r\n- Astuce : choisissez le serveur relais le plus proche de vous pour obtenir les meilleures performances.';
  }

  @override
  String get serverDetailsLabel => 'Détails du serveur';

  @override
  String get start => 'Démarrer';

  @override
  String get stop => 'Arrêter';

  @override
  String get labelJava => 'Java';

  @override
  String get startJavaMode => 'Démarrer le mode Java';

  @override
  String get javaInfoTitle => 'Mode Java';

  @override
  String get javaInfoText => 'Se connecter aux serveurs Java Edition';

  @override
  String get howToJavaTitle => 'Mode Java';

  @override
  String get howToJavaSubtitle => 'Se connecter aux serveurs Java Edition via NetherLink';

  @override
  String get aternosSubtext => 'Créez votre propre serveur Minecraft gratuit';

  @override
  String get howToJavaBody => 'Mode Java — étapes rapides :\n1. Dans l\'application, sélectionnez le mode Java.\n2. Saisissez l\'adresse et le port de votre serveur Java Edition (par défaut : 25565).\n3. Appuyez sur \"Démarrer le mode Java\" — NetherLink fera le lien entre les connexions.\n4. Ouvrez Minecraft Bedrock et allez dans l\'onglet Amis.\n5. Sélectionnez le serveur LAN nommé \"NetherLink\" pour rejoindre le serveur Java.\n\n⚠️ Avertissements importants :\n- Un compte Java Edition valide (Microsoft) est requis.\n- Certains serveurs utilisent des systèmes anti-triche qui peuvent détecter et bannir votre compte.\n- Certains serveurs interdisent explicitement les clients Bedrock — vérifiez toujours les règles du serveur.\n- NetherLink n\'est pas responsable des bannissements, suspensions ou autres problèmes liés au compte pouvant résulter de l\'utilisation de cette fonctionnalité.\n- Utilisation à vos risques et périls.';

  @override
  String get language => 'Français';

  @override
  String get discord => 'Discord';

  @override
  String get toggleDebug => 'Activer/désactiver le débogage';

  @override
  String get copyLogs => 'Copier les journaux';

  @override
  String get clear => 'Effacer';

  @override
  String get cancel => 'Annuler';

  @override
  String get deleteServer => 'Supprimer le serveur';

  @override
  String get delete => 'Supprimer';

  @override
  String get myServers => 'Mes serveurs';

  @override
  String get quickAccessServers => 'Serveurs d\'accès rapide';

  @override
  String get addServer => 'Ajouter un serveur';

  @override
  String get addServersHint => 'Ajoutez des serveurs pour vous connecter rapidement plus tard';

  @override
  String get serverNameLabel => 'Nom du serveur *';

  @override
  String get addressLabel => 'Adresse *';

  @override
  String get portLabel => 'Port *';

  @override
  String get descriptionLabel => 'Description (optionnelle)';

  @override
  String get save => 'Enregistrer';

  @override
  String get initializing => 'Initialisation...';

  @override
  String get createdBy => 'Créé par NetherDev';

  @override
  String get bedrockBridge => 'Pont Bedrock';

  @override
  String get clientDisconnected => 'Client déconnecté — diffusion arrêtée';

  @override
  String get pleaseEnterServer => '⚠️ Veuillez saisir une adresse de serveur';

  @override
  String get invalidPort => '⚠️ Numéro de port invalide (1-65535)';

  @override
  String get dnsConfigSent => '✅ Configuration DNS envoyée au relais';

  @override
  String get broadcastingStarted => 'Diffusion démarrée';

  @override
  String get broadcastStopped => 'Diffusion arrêtée';

  @override
  String selectedServer(Object name) {
    return '📋 Sélectionné : $name';
  }

  @override
  String selectedFeaturedServer(Object name) {
    return 'Sélectionné : $name';
  }

  @override
  String get noLogsToCopy => 'Aucun journal à copier';

  @override
  String copiedLogs(Object count) {
    return '$count entrées de journal copiées dans le presse-papiers';
  }

  @override
  String get debugEnabled => 'Journaux de débogage activés';

  @override
  String get debugDisabled => 'Journaux de débogage désactivés';

  @override
  String get howToUseTitle => 'Comment utiliser NetherLink';

  @override
  String get iUnderstand => 'Je comprends';

  @override
  String get playOnSwitchTitle => 'Jouer sur Nintendo Switch';

  @override
  String get playWithFriendsTitle => 'Jouer avec des amis';

  @override
  String playInstructionsSwitch(Object relayName, Object relayIp) {
    return 'Sélectionné : $relayName\r\n\r\nComment se connecter :\r\n1. Allez dans les paramètres de votre Switch et changez le DNS en : $relayIp\r\n2. Ouvrez Minecraft et sélectionnez un serveur dans la liste (comme Cubecraft ou Hive).\r\n3. Vous serez maintenant redirigé automatiquement vers votre propre serveur.';
  }

  @override
  String playInstructionsFriends(Object friend) {
    return 'Comment se connecter :\r\n1. Sur votre console, ajoutez $friend comme ami.\r\n2. Ouvrez Minecraft et allez dans l\'onglet Amis.\r\n3. Recherchez votre serveur dans Mondes LAN et sélectionnez-le pour le rejoindre.';
  }

  @override
  String get nldServerLabel => 'SERVEUR NETHERLINK';

  @override
  String selectRelayLabel(Object name) {
    return 'Sélectionner le relais $name';
  }

  @override
  String get noSavedServers => 'Aucun serveur enregistré';

  @override
  String get savedServers => 'Serveurs enregistrés';

  @override
  String get serverAddressHint => 'Adresse du serveur';

  @override
  String get portHint => 'Port';

  @override
  String get manageServers => 'Gérer les serveurs';

  @override
  String get manageServersTooltip => 'Gérer les serveurs';

  @override
  String get noServerYet => 'Aucun serveur enregistré pour le moment.\nAppuyez sur Gérer pour en ajouter un.';

  @override
  String get serverNotSelected => 'Aucun serveur sélectionné';

  @override
  String get ready => 'Prêt';

  @override
  String get active => 'Actif';

  @override
  String get vpnDetected => 'VPN détecté';

  @override
  String get noWifi => 'Pas en Wi‑Fi';

  @override
  String get vpnActive => 'Nous avons détecté que votre VPN est actif.\n\nVeuillez le désactiver avant d\'utiliser NetherLink, sinon la diffusion LAN risque de ne pas atteindre votre console.';

  @override
  String get mobileActive => 'Détecté : données mobiles\n\nNetherLink doit être sur le même réseau que votre console. Veuillez vous connecter à votre Wi‑Fi domestique ou à votre point d\'accès avant de continuer.';

  @override
  String get continueAnyway => 'Continuer quand même';

  @override
  String get sameWifi => 'Même réseau Wi‑Fi';

  @override
  String get needSameWifi => 'L\'appareil qui exécute NetherLink DOIT être sur le même réseau Wi‑Fi que la console sur laquelle vous jouez à Minecraft.';

  @override
  String get subscription => 'Abonnement en ligne requis';

  @override
  String get needSubscription => 'Chaque console doit disposer de son propre abonnement en ligne actif (Xbox Live, PS Plus, NSO). Sans cela, NetherLink n\'apparaîtra pas.';

  @override
  String get updateAvailable => 'Mise à jour disponible';

  @override
  String get newVersion => 'Une nouvelle version de l\'application est disponible.\nMettez à jour maintenant pour profiter des dernières fonctionnalités et corrections.';

  @override
  String get later => 'Plus tard';

  @override
  String get updateNow => 'Mettre à jour';

  @override
  String get beforeYouStart => 'AVANT DE COMMENCER';

  @override
  String get stopBroadcasting => 'Arrêter la diffusion';

  @override
  String get startNintendoMode => 'Démarrer le mode Nintendo';

  @override
  String get startFriendsMode => 'Démarrer le mode Amis';

  @override
  String get startBroadcasting => 'Démarrer la diffusion';

  @override
  String get modeLabel => 'Mode';

  @override
  String get labelXbox => 'Xbox/PS4-5';

  @override
  String get labelNintendo => 'Nintendo';

  @override
  String get labelFriends => 'Amis';

  @override
  String get nintendoInfoTitle => 'Mode DNS Nintendo Switch';

  @override
  String get nintendoInfoText => 'Démarrez en mode Nintendo, configurez votre DNS et rejoignez un serveur mis en avant.';

  @override
  String get friendModeTitle => 'Mode Amis';

  @override
  String get friendModeText => 'Ajoutez les bots amis de NetherLink comme amis. Démarrez le mode Amis et jouez';

  @override
  String get selectedRelayCheck => 'Sélectionné';

  @override
  String relayFallbackWarning(Object name) {
    return 'Avertissement : le relais d\'origine n\'a pas répondu. Relais de secours utilisé : $name';
  }

  @override
  String get relayUnableConnect => 'Impossible de se connecter à un serveur relais NetherLink. Réessayez plus tard ou vérifiez votre connexion internet.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / connexion proxy)';

  @override
  String get howToXboxSubtitle => 'Jouez via diffusion LAN ou proxy';

  @override
  String get howToXboxBody => 'Comment se connecter (Xbox / PS4 / PS5) :\r\n1. Assurez-vous que l\'appareil exécutant NetherLink et votre console sont sur le même réseau local.\r\n2. Dans l\'application, saisissez l\'adresse et le port de votre serveur Minecraft puis appuyez sur \\\"Démarrer la diffusion\\\".\r\n3. Sur la console, ouvrez Minecraft → Jouer → recherchez Mondes LAN ou l\'onglet Amis puis actualisez la liste.\r\n4. Sélectionnez le serveur LAN nommé \\\"NetherLink\\\" pour rejoindre.\r\nNotes :\r\n- Si le serveur n\'apparaît pas, vérifiez que les deux appareils sont sur le même sous-réseau et que l\'application diffuse toujours.\r\n- Certains modèles de console ou routeurs peuvent bloquer la détection LAN ; essayez de modifier les paramètres de l\'application ou du routeur si nécessaire.';

  @override
  String get howToNintendoTitle => 'Nintendo Switch (mode DNS)';

  @override
  String get howToNintendoSubtitle => 'Instructions du relais DNS pour Switch';

  @override
  String get howToNintendoBody => 'Nintendo Switch — mode DNS (étape par étape) :\r\n1. Dans l\'application, activez le mode \\\"Nintendo\\\" et sélectionnez un serveur relais (EU ou US).\r\n2. Appuyez sur \\\"Envoyer la configuration DNS\\\" pour envoyer l\'IP DNS au relais.\r\n3. Sur votre Nintendo Switch, allez dans Paramètres de la console → Internet → Paramètres Internet → (votre réseau) → Modifier les paramètres → DNS et définissez le DNS primaire sur l\'IP du relais.\r\n4. Ouvrez Minecraft et rejoignez un serveur public ; vous serez redirigé vers votre serveur en utilisant le DNS du relais.\r\nNotes :\r\n- Le mode DNS ne diffuse pas de serveur LAN ; il achemine le trafic du jeu via le relais.\r\n- Réinitialisez votre DNS lorsque vous avez terminé si vous avez besoin d\'un comportement réseau normal.';

  @override
  String get howToFriendsTitle => 'Mode Amis';

  @override
  String get howToFriendsSubtitle => 'Invitez des amis et rejoignez via LAN';

  @override
  String get howToFriendsBody => 'Mode Amis — étapes rapides :\r\n1. Ajoutez le compte ami NetherLink (relay friend) sur votre console ou votre plateforme si nécessaire.\r\n2. Dans l\'application, activez le mode Amis et envoyez la configuration du relais (si applicable).\r\n3. Sur votre console, ouvrez Minecraft → Amis et recherchez Mondes LAN — votre serveur devrait y apparaître comme un monde LAN.\r\n4. Sélectionnez-le pour rejoindre votre serveur avec des amis.\r\nNotes :\r\n- Assurez-vous que vous et vos amis avez les mêmes paramètres NAT/réglages autorisant la présence des amis.\r\n- Le mode Amis dépend des fonctionnalités d\'amis de la plateforme et peut nécessiter l\'acceptation des demandes d\'ami.';

  @override
  String get helpNetherlinkTitle => 'NetherLink n\'apparaît pas';

  @override
  String get helpNetherlinkSubtitle => 'Résolution des problèmes de détection LAN';

  @override
  String get helpNetherlinkBody => 'Si le serveur n\'apparaît pas sur votre console, essayez ces étapes :\r\n\r\n✅ Vérifications de base :\r\n1. Même réseau WiFi - Votre téléphone/tablette et votre console DOIVENT être sur le même WiFi\r\n2. Adresse du serveur correcte - Vérifiez à nouveau l\'IP et le port (par défaut : 19132)\r\n3. Diffusion active - Vérifiez que NetherLink affiche l\'état \\\"En cours de diffusion\\\"\r\n\r\n🔄 Correctifs rapides :\r\n• Redémarrez l\'application : arrêtez la diffusion, fermez complètement NetherLink, rouvrez-le et réessayez\r\n• Redémarrez votre console : parfois la console a besoin d\'un rafraîchissement pour détecter les jeux LAN\r\n• Vérifiez l\'onglet Amis/LAN : le serveur apparaît sous \\\"Amis\\\" ou \\\"Jeux LAN\\\", PAS dans la liste des serveurs\r\n• Attendez 10 à 15 secondes après avoir démarré la diffusion\r\n• Désactivez les VPN : les VPN peuvent bloquer les diffusions locales\r\n\r\n⚠️ Problèmes courants :\r\n\\\"No route found for user\\\" → Assurez-vous que les deux appareils sont sur le même Wi‑Fi (évitez les réseaux invités)\r\n\\\"Unable to connect to NetherLink relay server\\\" → Vérifiez votre connexion internet / l\'état du relais\r\n\r\n📱 Vous avez toujours des problèmes ? Activez le mode débogage dans NetherLink et consultez les journaux, ou essayez un autre serveur.';

  @override
  String get helpMultiplayerFailedTitle => 'Échec de la connexion multijoueur';

  @override
  String get helpMultiplayerFailedSubtitle => 'Explication de pourquoi ce n\'est pas une erreur NetherLink';

  @override
  String get helpMultiplayerFailedBody => '⚠️ Ce n\'est pas un problème de NetherLink !\r\n\r\nNetherLink vous a redirigé avec succès vers le serveur demandé. Le message \\\"Échec de la connexion multijoueur\\\" indique que le serveur cible est actuellement inaccessible. Raisons possibles :\r\n\r\n• Le serveur Minecraft cible est hors ligne ou surchargé\r\n• Le serveur nécessite une version de client mise à jour ou une édition spécifique\r\n• Problèmes réseau entre le relais et le serveur cible\r\n\r\nEssayez de vous connecter à un autre serveur ou contactez le support du serveur. Si le problème persiste sur plusieurs serveurs, activez le mode débogage dans NetherLink et consultez les journaux.';

  @override
  String get helpNintendoDnsTitle => 'Le DNS Nintendo ne fonctionne pas';

  @override
  String get helpNintendoDnsSubtitle => 'Problèmes courants de DNS / relais';

  @override
  String get helpNintendoDnsBody => 'Si le mode DNS Nintendo ne fonctionne pas, vérifiez les points suivants :\r\n\r\n1. Confirmez que vous avez envoyé la configuration DNS depuis l\'application (Envoyer la configuration DNS).\r\n2. Vérifiez que vous avez appliqué l\'IP du relais comme DNS primaire sur la Switch.\r\n3. Assurez-vous que le serveur relais sélectionné (EU/US) est en ligne et non surchargé.\r\n4. Certains réseaux (par exemple, les portails captifs) empêchent l\'utilisation d\'un DNS personnalisé — testez sur un autre réseau.\r\n\r\nSi les problèmes persistent, activez le mode débogage et consultez les journaux ou essayez l\'alternative du mode Amis.';

  @override
  String get helpFriendsModeTitle => 'Le mode Amis ne fonctionne pas';

  @override
  String get helpFriendsModeSubtitle => 'Problèmes courants liés aux amis';

  @override
  String get helpFriendsModeBody => 'Conseils de dépannage pour le mode Amis :\r\n\r\n1. Assurez-vous que le compte ami du relais est ajouté/accepté sur la console (si nécessaire).\r\n2. Essayez de redémarrer le jeu et d\'actualiser l\'onglet Amis/LAN après avoir activé le mode Amis.\r\n\r\nSi le serveur n\'apparaît toujours pas pour vos amis, activez le mode débogage et consultez les journaux pour identifier les erreurs.';

  @override
  String get changeLanguageTitle => 'Changer la langue';

  @override
  String get changeLanguage => 'Langue';

  @override
  String get useSystemLanguage => 'Utiliser la langue du système';

  @override
  String get couldNotOpenUrl => 'Impossible d\'ouvrir l\'URL';

  @override
  String get serverTrackerTitle => 'Suivi des serveurs';

  @override
  String get removeServerTitle => 'Supprimer le serveur';

  @override
  String removeServerConfirm(Object name) {
    return 'Supprimer \"$name\" de votre suivi ?';
  }

  @override
  String get removeServerFailed => 'Échec de la suppression du serveur';

  @override
  String get refreshStatus => 'Actualiser le statut';

  @override
  String get trackerSignInRequired => 'Connexion requise';

  @override
  String get trackerSignInSubtitle => 'Connectez-vous pour suivre les serveurs et recevoir des notifications hors ligne.';

  @override
  String get signIn => 'Se connecter';

  @override
  String get noServersTracked => 'Aucun serveur suivi';

  @override
  String get trackerEmptySubtitle => 'Ajoutez un serveur Minecraft pour surveiller son état et recevoir des notifications.';

  @override
  String get fillAllFields => 'Veuillez remplir tous les champs correctement';

  @override
  String get slotUsedUpgrade => 'Votre emplacement gratuit est utilisé. Passez à la version supérieure pour plus de serveurs.';

  @override
  String get addServerFailed => 'Échec de l\'ajout du serveur. Vérifiez vos informations.';

  @override
  String get ipAddressLabel => 'Adresse IP';

  @override
  String get platformLabel => 'Plateforme';

  @override
  String get bedrockLabel => 'Bedrock';

  @override
  String get addLabel => 'Ajouter';

  @override
  String get statusOnline => 'En ligne';

  @override
  String get statusOffline => 'Hors ligne';

  @override
  String get statusChecking => 'Vérification...';

  @override
  String get notificationsOn => 'Notifications activées';

  @override
  String get notificationsOff => 'Notifications désactivées';

  @override
  String get failedUpdateNotifications => 'Échec de la mise à jour des notifications';

  @override
  String get editServerTitle => 'Modifier le serveur';

  @override
  String get serverNameHint => 'Nom du serveur';

  @override
  String get failedSave => 'Échec de l\'enregistrement. Réessayez.';

  @override
  String get serverRenamed => 'Serveur renommé';

  @override
  String get customizeLabel => 'Personnaliser';

  @override
  String get customizeSubtitle => 'Réorganiser les tuiles et personnaliser la navigation';

  @override
  String get resetLabel => 'Réinitialiser';

  @override
  String get tilesSection => 'TUILES';

  @override
  String get dragToReorder => 'Faites glisser pour réorganiser';

  @override
  String get navigationSection => 'NAVIGATION';

  @override
  String get navFixed => 'Accueil, Connecteur et Profil sont toujours fixés';

  @override
  String get leftSlot => 'Emplacement gauche (à côté d\'Accueil)';

  @override
  String get rightSlot => 'Emplacement droit (à côté du Profil)';

  @override
  String get accentColorSection => 'COULEUR D\'ACCENTUATION';

  @override
  String get opacityLabel => 'Opacité';

  @override
  String get backgroundSection => 'ARRIÈRE-PLAN';

  @override
  String get cardsSection => 'CARTES';

  @override
  String get editLabel => 'Modifier';

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
  String get chooseUniqueUsername => 'Choisissez un nom d\'utilisateur unique pour commencer.';

  @override
  String get usernameFieldLabel => 'Nom d\'utilisateur';

  @override
  String get usernameExampleHint => 'ex. CoolPlayer123';

  @override
  String get usernameFormatHint => '3–20 caractères · lettres, chiffres et tirets bas';

  @override
  String get displayNameOptional => 'Nom affiché (optionnel)';

  @override
  String get displayNameExampleHint => 'ex. Joueur Cool';

  @override
  String get usernameRequired => 'Le nom d\'utilisateur est requis';

  @override
  String get usernameFormatError => 'Le nom d\'utilisateur doit comporter 3–20 caractères et ne contenir que des lettres, chiffres et tirets bas';

  @override
  String get usernameTaken => 'Ce nom d\'utilisateur est déjà pris';

  @override
  String get noConnectionError => 'Pas de connexion. Vérifiez votre internet et réessayez.';

  @override
  String get home => 'Accueil';

  @override
  String get info => 'Info';

  @override
  String get navProfile => 'Profil';

  @override
  String serverRemoved(Object name) {
    return '$name supprimé';
  }

  @override
  String serverAdded(Object name) {
    return '$name ajouté';
  }
}
