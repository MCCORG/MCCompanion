import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class JavaPingResult {
  final bool isOnline;
  final int? players;
  final int? maxPlayers;
  final String? version;

  const JavaPingResult({
    required this.isOnline,
    this.players,
    this.maxPlayers,
    this.version,
  });

  static const JavaPingResult offline = JavaPingResult(isOnline: false);
}

class JavaServerPing {
  static Future<JavaPingResult> ping(
    String host,
    int port, {
    Duration timeout = const Duration(seconds: 5),
  }) async {
    Socket? socket;
    StreamSubscription<Uint8List>? sub;
    final completer = Completer<JavaPingResult>();

    try {
      socket = await Socket.connect(host, port, timeout: timeout);
      socket.setOption(SocketOption.tcpNoDelay, true);

      final packet = _buildPackets(host, port);
      socket.add(packet);
      await socket.flush();

      final buffer = <int>[];

      sub = socket.listen(
        (Uint8List chunk) {
          if (completer.isCompleted) return;
          buffer.addAll(chunk);
          final result = _tryParse(buffer);
          if (result != null) {
            completer.complete(result);
          }
        },
        onError: (Object e) {
          if (!completer.isCompleted)
            completer.complete(JavaPingResult.offline);
        },
        onDone: () {
          if (!completer.isCompleted) {
            final result = buffer.isNotEmpty ? _tryParse(buffer) : null;
            completer.complete(result ?? JavaPingResult.offline);
          }
        },
        cancelOnError: true,
      );

      return await completer.future.timeout(
        timeout,
        onTimeout: () => JavaPingResult.offline,
      );
    } catch (_) {
      return JavaPingResult.offline;
    } finally {
      await sub?.cancel();
      socket?.destroy();
    }
  }

  static Uint8List _buildPackets(String host, int port) {
    final hostBytes = utf8.encode(host);
    final out = BytesBuilder();

    final handshakeBody = BytesBuilder();
    handshakeBody.add(_varInt(0x00));
    handshakeBody.add(_varInt(47));
    handshakeBody.add(_varInt(hostBytes.length));
    handshakeBody.add(hostBytes);
    handshakeBody.add(_uShort(port));
    handshakeBody.add(_varInt(1));
    final handshakeBodyBytes = handshakeBody.toBytes();

    out.add(_varInt(handshakeBodyBytes.length));
    out.add(handshakeBodyBytes);

    out.add(_varInt(1));
    out.add(_varInt(0x00));

    return out.toBytes();
  }

  static JavaPingResult? _tryParse(List<int> bytes) {
    if (bytes.length < 2) return null;

    int offset = 0;

    final (packetLen, lenBytes) = _readVarInt(bytes, offset);
    if (lenBytes == 0) return null;
    offset += lenBytes;

    if (bytes.length < offset + packetLen) return null;

    final (packetId, idBytes) = _readVarInt(bytes, offset);
    if (idBytes == 0 || packetId != 0x00) return null;
    offset += idBytes;

    final (jsonLen, jsonLenBytes) = _readVarInt(bytes, offset);
    if (jsonLenBytes == 0 || jsonLen <= 0) return null;
    offset += jsonLenBytes;

    if (bytes.length < offset + jsonLen) return null;

    try {
      final jsonStr = utf8.decode(bytes.sublist(offset, offset + jsonLen));
      return _parseJson(jsonStr);
    } catch (_) {
      return null;
    }
  }

  static JavaPingResult _parseJson(String jsonStr) {
    final data = jsonDecode(jsonStr) as Map<String, dynamic>;

    final playersRaw = data['players'];
    final versionRaw = data['version'];

    int? online;
    int? max;
    String? versionName;

    if (playersRaw is Map<String, dynamic>) {
      online = _toInt(playersRaw['online']);
      max = _toInt(playersRaw['max']);
    }

    if (versionRaw is Map<String, dynamic>) {
      versionName = versionRaw['name'] as String?;
    }

    return JavaPingResult(
      isOnline: true,
      players: online,
      maxPlayers: max,
      version: versionName,
    );
  }

  static int? _toInt(dynamic value) {
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }

  static List<int> _varInt(int value) {
    final bytes = <int>[];
    var v = value < 0 ? value + 0x100000000 : value;
    do {
      int part = v & 0x7F;
      v >>>= 7;
      if (v != 0) part |= 0x80;
      bytes.add(part);
    } while (v != 0);
    return bytes;
  }

  static List<int> _uShort(int value) => [(value >> 8) & 0xFF, value & 0xFF];

  static (int value, int bytesRead) _readVarInt(List<int> bytes, int offset) {
    int value = 0;
    int read = 0;
    int shift = 0;
    while (offset + read < bytes.length) {
      final b = bytes[offset + read];
      read++;
      value |= (b & 0x7F) << shift;
      shift += 7;
      if ((b & 0x80) == 0) return (value, read);
      if (read >= 5) return (0, 0);
    }
    return (0, 0);
  }
}
