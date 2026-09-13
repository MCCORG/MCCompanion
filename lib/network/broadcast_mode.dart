enum BroadcastMode { lan, nintendo, friends }

String broadcastModeToString(BroadcastMode mode) {
  switch (mode) {
    case BroadcastMode.lan:
      return "LAN";
    case BroadcastMode.nintendo:
      return "NINTENDO";
    case BroadcastMode.friends:
      return "FRIENDS";
  }
}
