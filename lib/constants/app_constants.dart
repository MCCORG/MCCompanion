class AppConstants {
  static const String websiteUrl = 'https://mccompanion.net';
  static const String discordUrl = 'https://discord.gg/xvaNzE35Rs';

  static const String apiBase = 'https://api.mccompanion.net';

  static const String routedToHeader = 'x-routed-to';

  static const String regionHeader = 'X-Region';

static const relayServers = [
  {
    'name': 'EU Server',
    'ip': '152.53.93.178',
    'base': 'https://eubackend.mccompanion.net',
    'region': 'eu',
  },
  {
    'name': 'US Server',
    'ip': '217.77.15.138',
    'base': 'https://usbackend.mccompanion.net',
    'region': 'us',
  },
];

  static const Duration serverRotationDuration = Duration(seconds: 5);
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration progressUpdateInterval = Duration(milliseconds: 50);

  static const int maxLogEntries = 1000;
}