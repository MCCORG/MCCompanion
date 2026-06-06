// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'MCCompanion';

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
    return 'Créé par $appCreator.\r\n\r\nComment utiliser :\r\n1. Saisissez l\'adresse et le port de votre serveur Minecraft (par défaut : 19132)\r\n   — ou sélectionnez un serveur précédemment enregistré dans la liste déroulante\r\n2. (Optionnel) Choisissez un serveur relais (EU ou US) proche de votre position\r\n3. Cliquez sur \\\"Démarrer la diffusion\\\" pour commencer\r\n4. Sur votre console/appareil : Minecraft > Jouer > Amis\r\n5. Vous devriez voir un serveur LAN appelé \\\"MCCompanion\\\"\r\n6. Cliquez dessus pour rejoindre votre serveur externe via MCCompanion\r\n\r\nNintendo Switch (mode DNS) :\r\n1. Activez \\\"Nintendo Switch\\\" dans le panneau de connexion\r\n2. Sélectionnez un serveur relais (EU ou US)\r\n3. Cliquez sur \\\"Envoyer la configuration DNS\\\" — cela envoie votre configuration au relais\r\n   (cela ne diffuse PAS de serveur LAN)\r\n4. Sur votre Switch, appliquez votre configuration DNS MCCompanion et rejoignez\r\n   en utilisant l\'entrée de serveur que vous utilisez pour MCCompanion\r\n\r\nNotes :\r\n- Pour la diffusion LAN, MCCompanion et la console doivent être sur le même réseau local.\r\n- Astuce : choisissez le serveur relais le plus proche de vous pour obtenir les meilleures performances.';
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
  String get howToJavaSubtitle => 'Se connecter aux serveurs Java Edition via MCCompanion';

  @override
  String get aternosSubtext => 'Créez votre propre serveur Minecraft gratuit';

  @override
  String get howToJavaBody => 'Mode Java — étapes rapides :\n1. Dans l\'application, sélectionnez le mode Java.\n2. Saisissez l\'adresse et le port de votre serveur Java Edition (par défaut : 25565).\n3. Appuyez sur \"Démarrer le mode Java\" — MCCompanion fera le lien entre les connexions.\n4. Ouvrez Minecraft Bedrock et allez dans l\'onglet Amis.\n5. Sélectionnez le serveur LAN nommé \"MCCompanion\" pour rejoindre le serveur Java.\n\n⚠️ Avertissements importants :\n- Un compte Java Edition valide (Microsoft) est requis.\n- Certains serveurs utilisent des systèmes anti-triche qui peuvent détecter et bannir votre compte.\n- Certains serveurs interdisent explicitement les clients Bedrock — vérifiez toujours les règles du serveur.\n- MCCompanion n\'est pas responsable des bannissements, suspensions ou autres problèmes liés au compte pouvant résulter de l\'utilisation de cette fonctionnalité.\n- Utilisation à vos risques et périls.';

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
  String get howToUseTitle => 'Comment utiliser MCCompanion';

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
  String get nldServerLabel => 'SERVEUR MCCompanion';

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
  String get vpnActive => 'Nous avons détecté que votre VPN est actif.\n\nVeuillez le désactiver avant d\'utiliser MCCompanion, sinon la diffusion LAN risque de ne pas atteindre votre console.';

  @override
  String get mobileActive => 'Détecté : données mobiles\n\nMCCompanion doit être sur le même réseau que votre console. Veuillez vous connecter à votre Wi‑Fi domestique ou à votre point d\'accès avant de continuer.';

  @override
  String get continueAnyway => 'Continuer quand même';

  @override
  String get sameWifi => 'Même réseau Wi‑Fi';

  @override
  String get needSameWifi => 'L\'appareil qui exécute MCCompanion DOIT être sur le même réseau Wi‑Fi que la console sur laquelle vous jouez à Minecraft.';

  @override
  String get subscription => 'Abonnement en ligne requis';

  @override
  String get needSubscription => 'Chaque console doit disposer de son propre abonnement en ligne actif (Xbox Live, PS Plus, NSO). Sans cela, MCCompanion n\'apparaîtra pas.';

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
  String get friendModeText => 'Ajoutez les bots amis de MCCompanion comme amis. Démarrez le mode Amis et jouez';

  @override
  String get selectedRelayCheck => 'Sélectionné';

  @override
  String relayFallbackWarning(Object name) {
    return 'Avertissement : le relais d\'origine n\'a pas répondu. Relais de secours utilisé : $name';
  }

  @override
  String get relayUnableConnect => 'Impossible de se connecter à un serveur relais MCCompanion. Réessayez plus tard ou vérifiez votre connexion internet.';

  @override
  String get howToXboxTitle => 'Xbox / PS4-5 (LAN / connexion proxy)';

  @override
  String get howToXboxSubtitle => 'Jouez via diffusion LAN ou proxy';

  @override
  String get howToXboxBody => 'Comment se connecter (Xbox / PS4 / PS5) :\r\n1. Assurez-vous que l\'appareil exécutant MCCompanion et votre console sont sur le même réseau local.\r\n2. Dans l\'application, saisissez l\'adresse et le port de votre serveur Minecraft puis appuyez sur \\\"Démarrer la diffusion\\\".\r\n3. Sur la console, ouvrez Minecraft → Jouer → recherchez Mondes LAN ou l\'onglet Amis puis actualisez la liste.\r\n4. Sélectionnez le serveur LAN nommé \\\"MCCompanion\\\" pour rejoindre.\r\nNotes :\r\n- Si le serveur n\'apparaît pas, vérifiez que les deux appareils sont sur le même sous-réseau et que l\'application diffuse toujours.\r\n- Certains modèles de console ou routeurs peuvent bloquer la détection LAN ; essayez de modifier les paramètres de l\'application ou du routeur si nécessaire.';

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
  String get howToFriendsBody => 'Mode Amis — étapes rapides :\r\n1. Ajoutez le compte ami MCCompanion (relay friend) sur votre console ou votre plateforme si nécessaire.\r\n2. Dans l\'application, activez le mode Amis et envoyez la configuration du relais (si applicable).\r\n3. Sur votre console, ouvrez Minecraft → Amis et recherchez Mondes LAN — votre serveur devrait y apparaître comme un monde LAN.\r\n4. Sélectionnez-le pour rejoindre votre serveur avec des amis.\r\nNotes :\r\n- Assurez-vous que vous et vos amis avez les mêmes paramètres NAT/réglages autorisant la présence des amis.\r\n- Le mode Amis dépend des fonctionnalités d\'amis de la plateforme et peut nécessiter l\'acceptation des demandes d\'ami.';

  @override
  String get helpMCCompanionTitle => 'MCCompanion n\'apparaît pas';

  @override
  String get helpMCCompanionSubtitle => 'Résolution des problèmes de détection LAN';

  @override
  String get helpMCCompanionBody => 'Si le serveur n\'apparaît pas sur votre console, essayez ces étapes :\r\n\r\n✅ Vérifications de base :\r\n1. Même réseau WiFi - Votre téléphone/tablette et votre console DOIVENT être sur le même WiFi\r\n2. Adresse du serveur correcte - Vérifiez à nouveau l\'IP et le port (par défaut : 19132)\r\n3. Diffusion active - Vérifiez que MCCompanion affiche l\'état \\\"En cours de diffusion\\\"\r\n\r\n🔄 Correctifs rapides :\r\n• Redémarrez l\'application : arrêtez la diffusion, fermez complètement MCCompanion, rouvrez-le et réessayez\r\n• Redémarrez votre console : parfois la console a besoin d\'un rafraîchissement pour détecter les jeux LAN\r\n• Vérifiez l\'onglet Amis/LAN : le serveur apparaît sous \\\"Amis\\\" ou \\\"Jeux LAN\\\", PAS dans la liste des serveurs\r\n• Attendez 10 à 15 secondes après avoir démarré la diffusion\r\n• Désactivez les VPN : les VPN peuvent bloquer les diffusions locales\r\n\r\n⚠️ Problèmes courants :\r\n\\\"No route found for user\\\" → Assurez-vous que les deux appareils sont sur le même Wi‑Fi (évitez les réseaux invités)\r\n\\\"Unable to connect to MCCompanion relay server\\\" → Vérifiez votre connexion internet / l\'état du relais\r\n\r\n📱 Vous avez toujours des problèmes ? Activez le mode débogage dans MCCompanion et consultez les journaux, ou essayez un autre serveur.';

  @override
  String get helpMultiplayerFailedTitle => 'Échec de la connexion multijoueur';

  @override
  String get helpMultiplayerFailedSubtitle => 'Explication de pourquoi ce n\'est pas une erreur MCCompanion';

  @override
  String get helpMultiplayerFailedBody => '⚠️ Ce n\'est pas un problème de MCCompanion !\r\n\r\nMCCompanion vous a redirigé avec succès vers le serveur demandé. Le message \\\"Échec de la connexion multijoueur\\\" indique que le serveur cible est actuellement inaccessible. Raisons possibles :\r\n\r\n• Le serveur Minecraft cible est hors ligne ou surchargé\r\n• Le serveur nécessite une version de client mise à jour ou une édition spécifique\r\n• Problèmes réseau entre le relais et le serveur cible\r\n\r\nEssayez de vous connecter à un autre serveur ou contactez le support du serveur. Si le problème persiste sur plusieurs serveurs, activez le mode débogage dans MCCompanion et consultez les journaux.';

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
  String get reportUser => 'Signaler l\'utilisateur';

  @override
  String get reportMessage => 'Signaler le message';

  @override
  String reportUserWithName(Object name) {
    return 'Signaler $name';
  }

  @override
  String get reportDisclaimer => 'Les rapports sont examinés par notre équipe.';

  @override
  String get reportReasonSpam => 'Spam';

  @override
  String get reportReasonHarassment => 'Harcèlement';

  @override
  String get reportReasonInappropriate => 'Contenu inapproprié';

  @override
  String get reportReasonOther => 'Autre';

  @override
  String get reportAdditionalDetails => 'Détails supplémentaires (optionnel)…';

  @override
  String get reportSuccess => 'Rapport soumis. Merci.';

  @override
  String get reportFailed => 'Échec de l\'envoi du rapport. Réessayez.';

  @override
  String get reportSubmit => 'Soumettre le rapport';

  @override
  String get today => 'Aujourd\'hui';

  @override
  String get yesterday => 'Hier';

  @override
  String get messagePlaceholder => 'Message…';

  @override
  String get noMessagesYet => 'Pas encore de messages.\nDites bonjour !';

  @override
  String get noConversationsYet => 'Pas encore de conversations';

  @override
  String get startChatHint => 'Trouvez un ami et commencez à chatter !';

  @override
  String get youPrefix => 'Vous';

  @override
  String get playerLookupTitle => 'Recherche de joueur';

  @override
  String get playerLookupSubtitle => 'Recherchez un joueur Java ou Bedrock';

  @override
  String get playerLookupHint => 'Entrez un nom d\'utilisateur…';

  @override
  String get playerLookupLinked => 'Comptes liés trouvés';

  @override
  String get playerLookupLabelUsername => 'Nom d\'utilisateur';

  @override
  String get playerLookupLabelTier => 'Niveau';

  @override
  String playerLookupCopied(Object value) {
    return '$value copié';
  }

  @override
  String get tabProfile => 'Profil';

  @override
  String get tabFriends => 'Amis';

  @override
  String get tabRequests => 'Demandes';

  @override
  String get tabChats => 'Chats';

  @override
  String get addFriend => 'Ajouter un ami';

  @override
  String get usernameHint => 'Nom d\'utilisateur';

  @override
  String get send => 'Envoyer';

  @override
  String friendRequestSentTo(Object name) {
    return 'Demande envoyée à $name';
  }

  @override
  String alreadyFriendsWith(Object name) {
    return 'Vous êtes déjà amis avec $name';
  }

  @override
  String requestAlreadyPending(Object name) {
    return 'Une demande à $name est déjà en attente';
  }

  @override
  String userNotFoundMsg(Object name) {
    return 'Utilisateur $name introuvable';
  }

  @override
  String cannotSendRequest(Object name) {
    return 'Impossible d\'envoyer une demande à $name';
  }

  @override
  String get somethingWentWrong => 'Une erreur s\'est produite. Réessayez.';

  @override
  String friendRequestAccepted(Object name) {
    return 'Vous êtes maintenant amis avec $name';
  }

  @override
  String requestDeclined(Object name) {
    return 'Demande de $name refusée';
  }

  @override
  String get deleteAccountTitle => 'Supprimer le compte';

  @override
  String get deleteAccountBody => 'Cela supprimera définitivement votre compte et toutes les données.';

  @override
  String get deletePermanently => 'Supprimer définitivement';

  @override
  String get couldNotDeleteAccount => 'Impossible de supprimer le compte. Réessayez.';

  @override
  String get removeFriendTitle => 'Supprimer un ami';

  @override
  String removeFriendConfirm(Object name) {
    return 'Supprimer $name de vos amis ?';
  }

  @override
  String get remove => 'Supprimer';

  @override
  String friendRemoved(Object name) {
    return '$name a été retiré de vos amis';
  }

  @override
  String get emailDifferentMethod => 'Cet e-mail est lié à une autre méthode';

  @override
  String get googleSignInFailed => 'Connexion Google échouée. Réessayez.';

  @override
  String get appleSignInFailed => 'Connexion Apple échouée. Réessayez.';

  @override
  String get resetPasswordTitle => 'Réinitialiser le mot de passe';

  @override
  String get resetPasswordBody => 'Entrez votre e-mail pour recevoir un lien de réinitialisation.';

  @override
  String get emailAddressHint => 'Adresse e-mail';

  @override
  String get sendLink => 'Envoyer le lien';

  @override
  String resetLinkSent(Object email) {
    return 'Lien envoyé à $email';
  }

  @override
  String get noAccountForEmail => 'Aucun compte trouvé pour cet e-mail';

  @override
  String get invalidEmailError => 'L\'adresse e-mail n\'est pas valide';

  @override
  String get couldNotSendResetEmail => 'Impossible d\'envoyer l\'e-mail. Réessayez.';

  @override
  String get enterEmailAndPassword => 'Entrez votre e-mail et mot de passe';

  @override
  String get incorrectEmailOrPassword => 'E-mail ou mot de passe incorrect';

  @override
  String get emailAlreadyInUse => 'Cette adresse e-mail est déjà utilisée';

  @override
  String get weakPassword => 'Mot de passe trop faible.';

  @override
  String get createAccount => 'Créer un compte';

  @override
  String get signInSubtitle => 'Connectez-vous pour accéder à votre profil.';

  @override
  String get passwordHint => 'Mot de passe';

  @override
  String get forgotPassword => 'Mot de passe oublié ?';

  @override
  String get orDivider => 'ou';

  @override
  String get continueWithGoogle => 'Continuer avec Google';

  @override
  String get alreadyHaveAccount => 'Vous avez déjà un compte ? Connectez-vous';

  @override
  String get noAccountYet => 'Pas de compte ? Créez-en un';

  @override
  String get profileNotSetUp => 'Profil non configuré';

  @override
  String get chooseUsernameSubtitle => 'Choisissez un nom d\'utilisateur pour vous connecter.';

  @override
  String get createProfile => 'Créer un profil';

  @override
  String get findUser => 'Trouver un utilisateur';

  @override
  String get couldNotUpdateVisibility => 'Impossible de mettre à jour les paramètres';

  @override
  String get signOut => 'Se déconnecter';

  @override
  String get appearOfflineLabel => 'Apparaître hors ligne';

  @override
  String get appearOfflineOn => 'Vous apparaissez hors ligne';

  @override
  String get appearOfflineOff => 'Vous apparaissez en ligne';

  @override
  String get unlinkXboxTitle => 'Délier le compte Xbox';

  @override
  String removeLabelConfirm(Object name) {
    return 'Supprimer $name de vos comptes liés ?';
  }

  @override
  String get unlink => 'Délier';

  @override
  String get unlinkJavaTitle => 'Délier le compte Java';

  @override
  String removeJavaConfirm(Object name) {
    return 'Supprimer $name de vos comptes liés ?';
  }

  @override
  String get linkedAccountsTitle => 'Comptes liés';

  @override
  String get linkAccountsHint => 'Liez vos comptes Minecraft.';

  @override
  String get linkXbox => 'Lier Xbox';

  @override
  String get linkJava => 'Lier Java';

  @override
  String get profileUpdated => 'Profil mis à jour';

  @override
  String get profileCardTitle => 'Profil';

  @override
  String get edit => 'Modifier';

  @override
  String get displayNameLabel => 'Nom d\'affichage';

  @override
  String get yourNameHint => 'Votre nom';

  @override
  String get bioLabel => 'Bio';

  @override
  String get bioHint => 'Parlez de vous…';

  @override
  String get avatarUrlLabel => 'URL de l\'avatar';

  @override
  String get usernameDisplayLabel => 'Nom d\'utilisateur';

  @override
  String get aboutMe => 'À propos de moi';

  @override
  String get noFriendsYet => 'Pas encore d\'amis';

  @override
  String get noFriendsSub => 'Ajoutez des amis pour les voir ici.';

  @override
  String onlineFriendsLabel(Object count) {
    return '$count en ligne';
  }

  @override
  String offlineFriendsLabel(Object count) {
    return '$count hors ligne';
  }

  @override
  String get noPendingRequests => 'Aucune demande en attente';

  @override
  String get requestsAppearHere => 'Les nouvelles demandes d\'amis apparaîtront ici.';

  @override
  String get skinsEdit => 'Modifier';

  @override
  String get skinsNoAccountsTitle => 'Aucun compte Minecraft lié';

  @override
  String get skinsNoAccountsSubtitle => 'Liez un compte pour voir vos skins.';

  @override
  String get skinsSignInTitle => 'Connexion pour voir vos skins';

  @override
  String get skinsSignInSubtitle => 'Connectez-vous pour voir vos skins.';

  @override
  String get skinsMustBe64 => 'Le skin doit être 64×64 pixels';

  @override
  String get skinsInvalidFile => 'Fichier image invalide';

  @override
  String get skinsUpload => 'Uploader';

  @override
  String get skinsCreate => 'Créer';

  @override
  String get skinsSectionRecent => 'SKINS RÉCENTS';

  @override
  String get skinsSectionMy => 'MES SKINS';

  @override
  String get skinsEmptyMySkins => 'Pas encore de skins. Uploadez-en un !';

  @override
  String get skinsSectionYours => 'VOS SKINS';

  @override
  String get skinsCouldNotLoad => 'Impossible de charger les skins';

  @override
  String skinsPageOf(Object page, Object total) {
    return 'Page $page sur $total';
  }

  @override
  String get skinsDownload => 'Télécharger';

  @override
  String get wikiTitle => 'Wiki';

  @override
  String get wikiMinecraftWiki => 'Wiki Minecraft';

  @override
  String get wikiSearchHint => 'Rechercher dans le wiki…';

  @override
  String get wikiCouldNotLoadPages => 'Impossible de charger les pages.';

  @override
  String get wikiCouldNotReach => 'Impossible d\'atteindre le wiki.';

  @override
  String wikiNoResults(Object query) {
    return 'Aucun résultat pour « $query »';
  }

  @override
  String get wikiNoPagesFound => 'Aucune page trouvée';

  @override
  String wikiCategories(Object count) {
    return '$count catégories';
  }

  @override
  String get wikiCouldNotLoadContent => 'Impossible de charger le contenu.';

  @override
  String get wikiOpenInBrowser => 'Ouvrir dans le navigateur';

  @override
  String get wikiCrafting => 'Artisanat';

  @override
  String get wikiReadFullArticle => 'Lire l\'article complet';

  @override
  String get wikiMobs => 'Mobs';

  @override
  String get wikiBlocks => 'Blocs';

  @override
  String get wikiItems => 'Objets';

  @override
  String get wikiBiomes => 'Biomes';

  @override
  String get wikiStructures => 'Structures';

  @override
  String get wikiEnchantments => 'Enchantements';

  @override
  String get wikiPotions => 'Potions';

  @override
  String get wikiPassive => 'Passif';

  @override
  String get wikiNeutral => 'Neutre';

  @override
  String get wikiHostile => 'Hostile';

  @override
  String get wikiBoss => 'Boss';

  @override
  String get wikiUtility => 'Utilitaire';

  @override
  String get wikiNatural => 'Naturel';

  @override
  String get wikiOres => 'Minerais';

  @override
  String get wikiWood => 'Bois';

  @override
  String get wikiStone => 'Pierre';

  @override
  String get wikiRedstone => 'Redstone';

  @override
  String get wikiPlants => 'Plantes';

  @override
  String get wikiDecoration => 'Décoration';

  @override
  String get wikiTools => 'Outils';

  @override
  String get wikiSwords => 'Épées';

  @override
  String get wikiRanged => 'À distance';

  @override
  String get wikiArmor => 'Armure';

  @override
  String get wikiFood => 'Nourriture';

  @override
  String get wikiBrewing => 'Brassage';

  @override
  String get wikiMaterials => 'Matériaux';

  @override
  String get wikiOverworld => 'Overworld';

  @override
  String get wikiNether => 'Nether';

  @override
  String get wikiTheEnd => 'The End';

  @override
  String get wikiSword => 'Épée';

  @override
  String get wikiTool => 'Outil';

  @override
  String get wikiBow => 'Arc';

  @override
  String get wikiFishing => 'Pêche';

  @override
  String get wikiStatusEffects => 'Effets de statut';

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

  @override
  String get paywallRestore => 'Restaurer';

  @override
  String get paywallMonthly => 'Mensuel';

  @override
  String get paywallYearly => 'Annuel';

  @override
  String get paywallSavePercent => 'Économisez ~17%';

  @override
  String get paywallSubtitle => 'Suivez plus de serveurs et soyez notifié.';

  @override
  String paywallSlotLabel(Object slots) {
    return '$slots emplacements';
  }

  @override
  String get paywallPopular => 'Populaire';

  @override
  String get paywallContinue => 'Continuer';

  @override
  String get paywallNoPkgs => 'Aucun forfait disponible.';

  @override
  String get paywallManaged => 'Géré par Apple/Google. Annulez à tout moment.';

  @override
  String get paywallPurchaseSuccess => 'Achat réussi !';

  @override
  String get paywallPurchaseFailed => 'Achat échoué. Réessayez.';

  @override
  String get paywallPurchasesRestored => 'Achats restaurés !';

  @override
  String get paywallNoActivePurchases => 'Aucun achat actif trouvé.';

  @override
  String get paywallRestoreFailed => 'Restauration échouée. Réessayez.';

  @override
  String get relay => 'Relais';

  @override
  String get selectModeSection => 'CHOISIR UN MODE';

  @override
  String get serversSection => 'SERVEURS';

  @override
  String get noServerSelected => 'Aucun serveur sélectionné';

  @override
  String get selectBedrockAccount => 'Choisir un compte Bedrock';

  @override
  String playersCount(Object players, Object max) {
    return '$players / $max joueurs';
  }

  @override
  String get infoAndLegal => 'Info & Juridique';

  @override
  String get legalSection => 'Juridique';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get privacyPolicySubtitle => 'Comment nous collectons vos données';

  @override
  String get termsOfService => 'Conditions d\'utilisation';

  @override
  String get termsOfServiceSubtitle => 'Règles et conditions d\'utilisation';

  @override
  String get dataSourcesSection => 'Sources de données & crédits';

  @override
  String get creditMinecraftWikiSubtitle => 'Source de données pour la fonctionnalité Wiki. Contenu sous Creative Commons.';

  @override
  String get creditMojangTitle => 'Mojang / Microsoft';

  @override
  String get creditMojangSubtitle => 'Skins Java, UUID via l\'API Mojang.';

  @override
  String get creditGeyserTitle => 'GeyserMC';

  @override
  String get creditGeyserSubtitle => 'Rendu des skins Bedrock via GeyserMC.';

  @override
  String get creditXboxTitle => 'Xbox / Microsoft';

  @override
  String get creditXboxSubtitle => 'Liaison de comptes Bedrock via Xbox Live.';

  @override
  String get aboutMCCompanionSection => 'À propos de MCCompanion';

  @override
  String get aboutMCCompanionDisclaimer => 'MCCompanion est une application indépendante non affiliée à Mojang Studios ou Microsoft Corporation.';

  @override
  String get minecraftTrademark => '« Minecraft » est une marque déposée de Microsoft Corporation.';

  @override
  String get nldServerLabelShort => 'Serveur MCCompanion';

  @override
  String get editServer => 'Modifier le serveur';

  @override
  String get serverNameExampleHint => 'Mon Super Serveur';

  @override
  String get serverAddressExampleHint => 'play.exemple.com';

  @override
  String get serverDescriptionExampleHint => 'Serveur survie avec des amis';

  @override
  String get editionLabel => 'Édition';

  @override
  String get nameLabel => 'Nom';

  @override
  String get ipAddressFieldLabel => 'Adresse IP';

  @override
  String get portFieldLabel => 'Port';

  @override
  String get platformFieldLabel => 'Plateforme';

  @override
  String get nameValidationError => 'Le nom doit comporter 1 à 50 caractères';

  @override
  String get ipRequiredError => 'L\'adresse IP est requise';

  @override
  String get portRangeError => 'Le port doit être entre 1 et 65535';

  @override
  String get partnerServersTitle => 'Serveurs partenaires';

  @override
  String get noPartnerServers => 'Pas encore de serveurs partenaires.';

  @override
  String get checkBackLater => 'Revenez plus tard.';

  @override
  String get xboxLinkTitle => 'Lier un compte Xbox';

  @override
  String get xboxStartingLogin => 'Démarrage de la connexion Xbox…';

  @override
  String get xboxSignInWithMicrosoft => 'Se connecter avec Microsoft';

  @override
  String get xboxGoToLink => 'Allez sur le lien ci-dessous et entrez le code.';

  @override
  String get xboxYourCode => 'Votre code';

  @override
  String get xboxTapToCopy => 'Appuyez sur le code pour le copier';

  @override
  String get xboxOpenLink => 'Ouvrir microsoft.com/link';

  @override
  String get xboxWaitingForLogin => 'En attente de connexion…';

  @override
  String get xboxAccountLinked => 'Compte Xbox lié !';

  @override
  String get xboxCodeCopied => 'Code copié dans le presse-papiers';

  @override
  String get xboxCouldNotStart => 'Impossible de démarrer la connexion Xbox. Réessayez.';

  @override
  String get xboxCodeExpired => 'Le code a expiré. Réessayez.';

  @override
  String get xboxSomethingWrong => 'Une erreur s\'est produite. Réessayez.';

  @override
  String get tryAgain => 'Réessayer';

  @override
  String get publicProfileTitle => 'Profil';

  @override
  String get userNotFound => 'Utilisateur introuvable';

  @override
  String get profileSectionLabel => 'Profil';

  @override
  String get displayNameRowLabel => 'Nom d\'affichage';

  @override
  String get usernameRowLabel => 'Nom d\'utilisateur';

  @override
  String get lastSeenLabel => 'Dernière connexion';

  @override
  String get aboutSectionLabel => 'À propos';

  @override
  String get xboxBedrockLabel => 'Xbox / Bedrock';

  @override
  String get friendRequestSent => 'Demande d\'ami envoyée';

  @override
  String get alreadyFriendsMsg => 'Vous êtes déjà amis.';

  @override
  String get requestAlreadyPendingMsg => 'Une demande est déjà en attente.';

  @override
  String get userNotFoundMsg2 => 'Utilisateur introuvable.';

  @override
  String get cannotSendRequestMsg => 'Impossible d\'envoyer une demande.';

  @override
  String nowFriendsWith(Object username) {
    return 'Maintenant amis avec @$username';
  }

  @override
  String get removeFriendButton => 'Supprimer l\'ami';

  @override
  String get requestSentButton => 'Demande envoyée';

  @override
  String get acceptRequestButton => 'Accepter la demande';

  @override
  String get addFriendButton => 'Ajouter un ami';

  @override
  String get removeFriendDialogTitle => 'Supprimer l\'ami';

  @override
  String removeFriendDialogBody(Object username) {
    return 'Supprimer @$username comme ami ?';
  }

  @override
  String get trackerLimitReached => 'Vous avez atteint votre limite. Mettez à niveau pour plus de serveurs.';

  @override
  String get upgradeButton => 'Mettre à niveau';

  @override
  String get javaLinkTitle => 'Lier Java Edition';

  @override
  String get javaStartingLogin => 'Démarrage de la connexion Microsoft…';

  @override
  String get javaSignInWithMicrosoft => 'Se connecter avec Microsoft';

  @override
  String get javaGoToLink => 'Allez sur le lien ci-dessous et entrez le code pour connecter votre compte Minecraft Java Edition.';

  @override
  String get javaYourCode => 'Votre code';

  @override
  String get javaTapToCopy => 'Appuyez sur le code pour le copier';

  @override
  String get javaOpenLink => 'Ouvrir microsoft.com/link';

  @override
  String get javaWaitingForLogin => 'En attente de connexion…';

  @override
  String get javaAccountLinked => 'Java Edition lié !';

  @override
  String get javaNoJavaTitle => 'Aucun Java Edition trouvé';

  @override
  String get javaNoJavaBody => 'Le compte Microsoft avec lequel vous vous êtes connecté ne possède pas Minecraft Java Edition.';

  @override
  String get javaTryDifferentAccount => 'Essayer un autre compte';

  @override
  String get javaCouldNotStart => 'Impossible de démarrer la connexion Microsoft. Réessayez.';

  @override
  String get javaCodeExpired => 'Le code a expiré. Réessayez.';

  @override
  String get javaSomethingWrong => 'Une erreur s\'est produite. Réessayez.';

  @override
  String get javaCodeCopied => 'Code copié dans le presse-papiers';

  @override
  String get splashFeatureConnect => 'Connecter';

  @override
  String get splashFeatureFriends => 'Amis';

  @override
  String get splashFeatureChat => 'Chat';

  @override
  String get splashFeatureSkins => 'Skins';

  @override
  String get featureLabelConnector => 'Connecteur';

  @override
  String get featureLabelSkins => 'Skins';

  @override
  String get featureLabelWiki => 'Wiki';

  @override
  String get featureLabelPartners => 'Partenaires';

  @override
  String get featureLabelLookup => 'Recherche';

  @override
  String get featureLabelTracker => 'Suivi de serveur';

  @override
  String get featureSubtitleConnector => 'Connecter les consoles à Minecraft';

  @override
  String get featureSubtitleSkins => 'Parcourir et gérer les skins Minecraft';

  @override
  String get featureSubtitleWiki => 'Encyclopédie Minecraft';

  @override
  String get featureSubtitlePartners => 'Serveurs en vedette';

  @override
  String get featureSubtitleLookup => 'Rechercher des profils Java et Bedrock';

  @override
  String get featureSubtitleTracker => 'Surveiller l\'état du serveur et être notifié';

  @override
  String get userSearchHint => 'Nom d’utilisateur, gamertag ou nom Java…';

  @override
  String get userSearchSub => 'Rechercher par nom d’utilisateur, gamertag Xbox ou nom Java';
}
