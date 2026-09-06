import 'dart:async';
import '../models/tracked_server_model.dart';
import '../services/tracker_api_service.dart';

class ServerTrackerService {
  ServerTrackerService._();
  static final ServerTrackerService instance = ServerTrackerService._();

  static const Duration pollInterval = Duration(minutes: 5);

  final _controller = StreamController<List<TrackedServer>>.broadcast();
  final _slotsController = StreamController<TrackerSlots?>.broadcast();

  Stream<List<TrackedServer>> get serversStream => _controller.stream;
  Stream<TrackerSlots?> get slotsStream => _slotsController.stream;

  List<TrackedServer> _servers = [];
  TrackerSlots? _slots;

  List<TrackedServer> get servers => List.unmodifiable(_servers);
  TrackerSlots? get slots => _slots;

  Timer? _timer;
  bool _running = false;
  bool _foreground = true;

  Future<void> start() async {
    if (_running) return;
    _running = true;
    await _load();
    _timer = Timer.periodic(pollInterval, (_) {
      if (_foreground) _load();
    });
  }

  void setForeground(bool foreground) {
    final wasBackground = !_foreground;
    _foreground = foreground;
    if (foreground && wasBackground && _running) unawaited(_load());
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    _running = false;
    _foreground = true;
    _servers = [];
    _slots = null;
  }

  Future<void> refresh() => _load();

  Future<void>? _loading;

  Future<void> _load() {
    final pending = _loading;
    if (pending != null) return pending;

    final future = _fetch();
    _loading = future;
    return future.whenComplete(() {
      if (identical(_loading, future)) _loading = null;
    });
  }

  Future<void> _fetch() async {
    final data = await TrackerApiService.getServers();
    if (data == null) return;

    _slots = data.slots;
    if (!_slotsController.isClosed) _slotsController.add(_slots);

    _servers = data.servers;
    if (!_controller.isClosed) _controller.add(List.unmodifiable(_servers));
  }

  void dispose() {
    stop();
    _controller.close();
    _slotsController.close();
  }
}
