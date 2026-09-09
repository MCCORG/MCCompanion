import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:pointycastle/export.dart' as pc;

class NetherNetProtocol {
  static const int discoveryPort = 7551;
  static const int applicationId = 0xDEADBEEF;

  static const int idDiscoveryRequest = 0x00;
  static const int idDiscoveryResponse = 0x01;
  static const int idDiscoveryMessage = 0x02;

  static const String signalConnectRequest = 'CONNECTREQUEST';
  static const String signalConnectResponse = 'CONNECTRESPONSE';
  static const String signalCandidateAdd = 'CANDIDATEADD';
  static const String signalConnectError = 'CONNECTERROR';

  static final Uint8List keyBytes = _deriveKey();

  static pc.PaddedBlockCipher _cipher(bool forEncryption) {
    final cipher = pc.PaddedBlockCipherImpl(
      pc.PKCS7Padding(),
      pc.ECBBlockCipher(pc.AESEngine()),
    );
    cipher.init(
      forEncryption,
      pc.PaddedBlockCipherParameters<pc.KeyParameter, Null>(
        pc.KeyParameter(keyBytes),
        null,
      ),
    );
    return cipher;
  }

  static Uint8List _deriveKey() {
    final input = Uint8List(8);
    ByteData.view(input.buffer).setUint64(0, applicationId, Endian.little);
    return Uint8List.fromList(sha256.convert(input).bytes);
  }

  static Uint8List encryptPacket(Uint8List body) {
    final payload = Uint8List(body.length + 2);
    ByteData.view(payload.buffer).setUint16(0, body.length + 2, Endian.little);
    payload.setRange(2, payload.length, body);

    final encrypted = _cipher(true).process(payload);
    final signature = Hmac(sha256, keyBytes).convert(payload).bytes;

    final out = Uint8List(signature.length + encrypted.length);
    out.setRange(0, signature.length, signature);
    out.setRange(signature.length, out.length, encrypted);
    return out;
  }

  static Uint8List? decryptPacket(Uint8List input) {
    if (input.length < 48) return null;

    final signature = Uint8List.sublistView(input, 0, 32);
    final encrypted = Uint8List.sublistView(input, 32);

    Uint8List payload;
    try {
      payload = _cipher(false).process(Uint8List.fromList(encrypted));
    } catch (_) {
      return null;
    }

    final expected = Hmac(sha256, keyBytes).convert(payload).bytes;
    if (expected.length != signature.length) return null;
    var diff = 0;
    for (var i = 0; i < expected.length; i++) {
      diff |= expected[i] ^ signature[i];
    }
    if (diff != 0) return null;

    if (payload.length < 2) return null;
    return Uint8List.sublistView(payload, 2);
  }

  static Uint8List buildDiscoveryPacket({
    required int packetId,
    required int networkId,
    int recipientId = 0,
    Uint8List? tail,
  }) {
    final length = 18 + (tail?.length ?? 0);
    final body = Uint8List(length);
    final view = ByteData.view(body.buffer);
    view.setUint16(0, packetId, Endian.little);
    view.setUint64(2, networkId, Endian.little);
    view.setUint64(10, recipientId, Endian.little);
    if (tail != null) body.setRange(18, length, tail);
    return body;
  }

  static Uint8List buildMessageTail({
    required int recipientId,
    required String message,
  }) {
    final data = utf8.encode(message);
    final tail = Uint8List(12 + data.length);
    final view = ByteData.view(tail.buffer);
    view.setUint64(0, recipientId, Endian.little);
    view.setUint32(8, data.length, Endian.little);
    tail.setRange(12, tail.length, data);
    return tail;
  }

  static const int serverDataVersion = 6;

  static String randomNonce() {
    final rng = Random.secure();
    return List.generate(
      16,
      (_) => rng.nextInt(256).toRadixString(16).padLeft(2, '0'),
    ).join();
  }

  static Uint8List buildPongData({
    required String serverName,
    required String levelName,
    int gameType = 0,
    int playerCount = 0,
    int maxPlayerCount = 10,
    bool isEditorWorld = false,
    bool isHardcore = false,
    bool acceptsOnlineAuth = true,
    bool acceptsSelfSignedAuth = true,
    String? nonce,
    int transportLayer = 2,
    int connectionType = 4,
    int version = serverDataVersion,
  }) {
    final builder = BytesBuilder();
    builder.addByte(version);
    _writeString(builder, serverName);
    _writeString(builder, levelName);
    _writeVarInt32(builder, gameType);
    builder.add(_int32le(playerCount));
    builder.add(_int32le(maxPlayerCount));
    builder.addByte(isEditorWorld ? 1 : 0);
    builder.addByte(isHardcore ? 1 : 0);
    builder.addByte(acceptsOnlineAuth ? 1 : 0);
    builder.addByte(acceptsSelfSignedAuth ? 1 : 0);
    _writeString(builder, nonce ?? randomNonce());
    _writeVarInt32(builder, transportLayer);
    _writeVarInt32(builder, connectionType);

    final binary = builder.toBytes();
    final hex = binary.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
    final hexBytes = utf8.encode(hex);

    final out = Uint8List(4 + hexBytes.length);
    ByteData.view(out.buffer).setUint32(0, hexBytes.length, Endian.little);
    out.setRange(4, out.length, hexBytes);
    return out;
  }

  static Uint8List _int32le(int value) {
    final b = Uint8List(4);
    ByteData.view(b.buffer).setUint32(0, value, Endian.little);
    return b;
  }

  static void _writeVarInt32(BytesBuilder builder, int value) {
    var u = (value << 1) & 0xffffffff;
    if (value < 0) u = (~u) & 0xffffffff;
    _writeVarUint32(builder, u);
  }

  static void _writeVarUint32(BytesBuilder builder, int value) {
    var v = value;
    while (v >= 0x80) {
      builder.addByte((v & 0x7f) | 0x80);
      v >>= 7;
    }
    builder.addByte(v);
  }

  static void _writeString(BytesBuilder builder, String value) {
    final bytes = utf8.encode(value);
    var length = bytes.length;
    while (length >= 0x80) {
      builder.addByte((length & 0x7f) | 0x80);
      length >>= 7;
    }
    builder.addByte(length);
    builder.add(bytes);
  }
}
