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
  String get helpNetherlinkTitle => 'MCCompanion n\'apparaît pas';

  @override
  String get helpNetherlinkSubtitle => 'Résolution des problèmes de détection LAN';

  @override
  String get helpNetherlinkBody => 'Si le serveur n\'apparaît pas sur votre console, essayez ces étapes :\r\n\r\n✅ Vérifications de base :\r\n1. Même réseau WiFi - Votre téléphone/tablette et votre console DOIVENT être sur le même WiFi\r\n2. Adresse du serveur correcte - Vérifiez à nouveau l\'IP et le port (par défaut : 19132)\r\n3. Diffusion active - Vérifiez que MCCompanion affiche l\'état \\\"En cours de diffusion\\\"\r\n\r\n🔄 Correctifs rapides :\r\n• Redémarrez l\'application : arrêtez la diffusion, fermez complètement MCCompanion, rouvrez-le et réessayez\r\n• Redémarrez votre console : parfois la console a besoin d\'un rafraîchissement pour détecter les jeux LAN\r\n• Vérifiez l\'onglet Amis/LAN : le serveur apparaît sous \\\"Amis\\\" ou \\\"Jeux LAN\\\", PAS dans la liste des serveurs\r\n• Attendez 10 à 15 secondes après avoir démarré la diffusion\r\n• Désactivez les VPN : les VPN peuvent bloquer les diffusions locales\r\n\r\n⚠️ Problèmes courants :\r\n\\\"No route found for user\\\" → Assurez-vous que les deux appareils sont sur le même Wi‑Fi (évitez les réseaux invités)\r\n\\\"Unable to connect to MCCompanion relay server\\\" → Vérifiez votre connexion internet / l\'état du relais\r\n\r\n📱 Vous avez toujours des problèmes ? Activez le mode débogage dans MCCompanion et consultez les journaux, ou essayez un autre serveur.';

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
  String get reportUser => 'Signaler l\'utilisateur';
  @override
  String reportUserWithName(String username) => 'Signaler @$username';
  @override
  String get reportMessage => 'Signaler le message';
  @override
  String get reportDisclaimer => 'Notre équipe examinera ce signalement. Merci de contribuer à la sécurité de la communauté.';
  @override
  String get reportReasonSpam => 'Spam';
  @override
  String get reportReasonHarassment => 'Harcèlement ou intimidation';
  @override
  String get reportReasonInappropriate => 'Contenu inapproprié';
  @override
  String get reportReasonOther => 'Autre';
  @override
  String get reportAdditionalDetails => 'Détails supplémentaires (optionnel)';
  @override
  String get reportSubmit => 'Envoyer le signalement';
  @override
  String get reportSuccess => 'Signalement envoyé. Merci.';
  @override
  String get reportFailed => 'Impossible d\'envoyer le signalement. Veuillez réessayer.';
  @override
  String get messagePlaceholder => 'Message...';
  @override
  String get noMessagesYet => 'Aucun message pour l\'instant.\nDites bonjour !';
  @override
  String get today => 'Aujourd\'hui';
  @override
  String get yesterday => 'Hier';
  @override
  String get noConversationsYet => 'Aucune conversation pour l\'instant';
  @override
  String get startChatHint => 'Démarrez une conversation depuis votre liste d\'amis.';
  @override
  String get youPrefix => 'Vous';
  @override
  String get tabProfile => 'PROFIL';
  @override
  String get tabFriends => 'AMIS';
  @override
  String get tabRequests => 'DEMANDES';
  @override
  String get tabChats => 'CHATS';
  @override
  String get addFriend => 'Ajouter un ami';
  @override
  String get usernameHint => 'nom d\'utilisateur';
  @override
  String get send => 'Envoyer';
  @override
  String friendRequestSentTo(String username) => 'Demande d\'ami envoyée à @$username';
  @override
  String alreadyFriendsWith(String username) => 'Vous êtes déjà ami avec @$username.';
  @override
  String requestAlreadyPending(String username) => 'Il y a déjà une demande en attente avec @$username.';
  @override
  String userNotFoundMsg(String username) => 'Utilisateur @$username introuvable.';
  @override
  String cannotSendRequest(String username) => 'Vous ne pouvez pas envoyer de demande à @$username.';
  @override
  String get somethingWentWrong => 'Quelque chose s\'est mal passé. Veuillez réessayer.';
  @override
  String friendRequestAccepted(String username) => 'Demande d\'ami de @$username acceptée';
  @override
  String requestDeclined(String username) => 'Demande de @$username refusée';
  @override
  String get deleteAccountTitle => 'Supprimer le compte';
  @override
  String get deleteAccountBody => 'Cela supprimera définitivement votre compte, vos messages, vos amis et toutes les données associées. Cette action est irréversible.';
  @override
  String get deletePermanently => 'Supprimer définitivement';
  @override
  String get couldNotDeleteAccount => 'Impossible de supprimer le compte. Veuillez réessayer.';
  @override
  String get removeFriendTitle => 'Supprimer l\'ami';
  @override
  String removeFriendConfirm(String username) => 'Voulez-vous supprimer @$username de vos amis ?';
  @override
  String get remove => 'Supprimer';
  @override
  String friendRemoved(String username) => '@$username supprimé de vos amis';
  @override
  String get noFriendsYet => 'Pas encore d\'amis';
  @override
  String get noFriendsSub => 'Ajoutez quelqu\'un en utilisant le bouton en haut à droite.';
  @override
  String get noPendingRequests => 'Aucune demande en attente';
  @override
  String get requestsAppearHere => 'Les demandes d\'ami apparaîtront ici.';
  @override
  String onlineFriendsLabel(int count) => 'EN LIGNE — $count';
  @override
  String offlineFriendsLabel(int count) => 'HORS LIGNE — $count';
  @override
  String get couldNotUpdateVisibility => 'Impossible de mettre à jour la visibilité. Réessayez.';
  @override
  String get aboutMe => 'À propos de moi';
  @override
  String get linkedAccountsTitle => 'Comptes liés';
  @override
  String get linkAccountsHint => 'Liez vos comptes Minecraft pour les afficher sur votre profil.';
  @override
  String get unlinkXboxTitle => 'Délier le compte Xbox';
  @override
  String removeLabelConfirm(String label) => 'Supprimer $label de vos comptes liés ?';
  @override
  String get unlinkJavaTitle => 'Délier Java Edition';
  @override
  String removeJavaConfirm(String username) => 'Supprimer $username de vos comptes liés ?';
  @override
  String get unlink => 'Délier';
  @override
  String get linkXbox => 'Lier Xbox';
  @override
  String get linkJava => 'Lier Java';
  @override
  String get appearOfflineLabel => 'Apparaître hors ligne';
  @override
  String get appearOfflineOn => 'Les amis vous voient comme hors ligne';
  @override
  String get appearOfflineOff => 'Les amis peuvent voir quand vous êtes en ligne';
  @override
  String get signOut => 'Se déconnecter';
  @override
  String get profileCardTitle => 'Profil';
  @override
  String get edit => 'Modifier';
  @override
  String get displayNameLabel => 'Nom d\'affichage';
  @override
  String get bioLabel => 'Bio';
  @override
  String get yourNameHint => 'Votre nom';
  @override
  String get bioHint => 'Parlez un peu de vous';
  @override
  String get avatarUrlLabel => 'URL de l\'avatar';
  @override
  String get usernameDisplayLabel => 'Nom d\'utilisateur';
  @override
  String get profileUpdated => 'Profil mis à jour';
  @override
  String get findUser => 'Trouver un utilisateur';
  @override
  String get signIn => 'Se connecter';
  @override
  String get createAccount => 'Créer un compte';
  @override
  String get signInSubtitle => 'Connectez-vous pour ajouter des amis et partager vos sessions.';
  @override
  String get emailAddressHint => 'Adresse e-mail';
  @override
  String get passwordHint => 'Mot de passe';
  @override
  String get forgotPassword => 'Mot de passe oublié ?';
  @override
  String get continueWithGoogle => 'Continuer avec Google';
  @override
  String get alreadyHaveAccount => 'Vous avez déjà un compte ? Connectez-vous';
  @override
  String get noAccountYet => 'Pas encore de compte ? Inscrivez-vous';
  @override
  String get orDivider => 'ou';
  @override
  String get resetPasswordTitle => 'Réinitialiser le mot de passe';
  @override
  String get resetPasswordBody => 'Entrez votre adresse e-mail et nous vous enverrons un lien pour réinitialiser votre mot de passe.';
  @override
  String get sendLink => 'Envoyer le lien';
  @override
  String resetLinkSent(String email) => 'Lien de réinitialisation envoyé à $email';
  @override
  String get noAccountForEmail => 'Aucun compte trouvé pour cette adresse e-mail.';
  @override
  String get invalidEmailError => 'Adresse e-mail invalide.';
  @override
  String get couldNotSendResetEmail => 'Impossible d\'envoyer l\'e-mail de réinitialisation. Veuillez réessayer.';
  @override
  String get incorrectEmailOrPassword => 'E-mail ou mot de passe incorrect.';
  @override
  String get emailAlreadyInUse => 'Cette adresse e-mail est déjà utilisée.';
  @override
  String get weakPassword => 'Le mot de passe doit contenir au moins 6 caractères.';
  @override
  String get googleSignInFailed => 'Échec de la connexion Google. Veuillez réessayer.';
  @override
  String get appleSignInFailed => 'Échec de la connexion Apple. Veuillez réessayer.';
  @override
  String get emailDifferentMethod => 'Un compte existe déjà avec cet e-mail via une autre méthode de connexion.';
  @override
  String get enterEmailAndPassword => 'Veuillez entrer votre e-mail et votre mot de passe.';
  @override
  String get profileNotSetUp => 'Profil pas encore configuré';
  @override
  String get chooseUsernameSubtitle => 'Choisissez un nom d\'utilisateur pour ajouter des amis et partager vos sessions.';
  @override
  String get createProfile => 'Créer un profil';
  @override
  String get chooseUniqueUsername => 'Choisissez un nom d\'utilisateur unique pour ajouter des amis.';
  @override
  String get usernameFieldLabel => 'Nom d\'utilisateur *';
  @override
  String get usernameFormatHint => '3–20 caractères · uniquement a-z, 0-9 et _';
  @override
  String get displayNameOptional => 'Nom d\'affichage (optionnel)';
  @override
  String get usernameRequired => 'Veuillez entrer un nom d\'utilisateur.';
  @override
  String get usernameFormatError => '3–20 caractères, uniquement lettres minuscules, chiffres et _';
  @override
  String get usernameTaken => 'Ce nom d\'utilisateur est déjà pris.';
  @override
  String get noConnectionError => 'Pas de connexion. Veuillez réessayer.';
  @override
  String get usernameExampleHint => 'ex. jens_mc';
  @override
  String get displayNameExampleHint => 'ex. Jens';
  @override
  String get home => 'Accueil';
  @override
  String get info => 'Info';
  @override
  String get consoleConnect => 'Console Connect';
  @override
  String get consoleConnectSubtitle => 'Se connecter aux serveurs Minecraft';
  @override
  String get minecraftSkins => 'Skins Minecraft';
  @override
  String get minecraftSkinsSubtitle => 'Voir et modifier les skins Java et Bedrock';
  @override
  String get minecraftWiki => 'Wiki Minecraft';
  @override
  String get minecraftWikiSubtitle => 'Mobs, blocs, recettes et plus';
  @override
  String get partnerServersLabel => 'Serveurs partenaires';
  @override
  String get partnerServersSubtitle => 'Serveurs Minecraft mis en avant';
  @override
  String get userLookup => 'Recherche d\'utilisateur Minecraft';
  @override
  String get userLookupSubtitle => 'Rechercher des profils Java et Bedrock';

  @override
  String get navSkins => 'Skins';
  @override
  String get navWiki => 'Wiki';
  @override
  String get navProfile => 'Profil';

  @override
  String get skinsUpload => 'Téléverser';
  @override
  String get skinsCreate => 'Créer';
  @override
  String get skinsSubtitle => 'Voir et télécharger des skins Minecraft.';
  @override
  String get skinsSectionRecent => 'SKINS RÉCENTS';
  @override
  String get skinsSectionMy => 'MES SKINS';
  @override
  String get skinsSectionYours => 'VOS SKINS';
  @override
  String get skinsEmptyMySkins => 'Aucun skin sauvegardé. Créez ou téléversez un skin pour commencer.';
  @override
  String get skinsCouldNotLoad => 'Impossible de charger les skins';
  @override
  String skinsPageOf(int page, int total) => 'Page $page / $total';
  @override
  String get skinsMustBe64 => 'Le skin doit être de 64×64 pixels';
  @override
  String get skinsInvalidFile => 'Fichier image invalide';
  @override
  String get skinsDownload => 'Télécharger';
  @override
  String get skinsEdit => 'Modifier';
  @override
  String get skinsNoAccountsTitle => 'Aucun compte lié';
  @override
  String get skinsNoAccountsSubtitle => 'Liez Java ou Bedrock dans Profil pour voir votre skin.';
  @override
  String get skinsSignInTitle => 'Connectez-vous pour voir votre skin';
  @override
  String get skinsSignInSubtitle => 'Créez un compte et liez Java ou Bedrock dans Profil.';
}
