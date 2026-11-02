enum BroadcastMode { lan, friends }

String broadcastModeToString(BroadcastMode mode) {
  switch (mode) {
    case BroadcastMode.lan:
      return "LAN";
    case BroadcastMode.friends:
      return "FRIENDS";
  }
}
