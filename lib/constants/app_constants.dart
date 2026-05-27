class AppConstants {
  static const String websiteUrl = 'https://mccompanion.net';
  static const String discordUrl = 'https://discord.gg/xvaNzE35Rs';

static const relayServers = [
  {
    'name': 'EU Server',
    'ip': '161.97.182.113',
    'base': 'https://eubackend.mccompanion.net',
  },
  {
    'name': 'US Server',
    'ip': '217.77.15.138',
    'base': 'https://usbackend.mccompanion.net',
  },
];

  static const Duration serverRotationDuration = Duration(seconds: 5);
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration progressUpdateInterval = Duration(milliseconds: 50);

  static const int maxLogEntries = 1000;
}