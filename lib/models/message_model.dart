import 'displayable_name.dart';

class MessageModel {
  final int id;
  final String senderUid;
  final String receiverUid;
  final String content;
  final DateTime createdAt;
  final DateTime? readAt;

  bool get isRead => readAt != null;

  const MessageModel({
    required this.id,
    required this.senderUid,
    required this.receiverUid,
    required this.content,
    required this.createdAt,
    this.readAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> j) => MessageModel(
        id: j['id'] as int,
        senderUid: j['senderUid'] as String,
        receiverUid: j['receiverUid'] as String,
        content: j['content'] as String,
        createdAt: DateTime.parse(j['createdAt'] as String),
        readAt: j['readAt'] != null
            ? DateTime.parse(j['readAt'] as String)
            : null,
      );
}

class ConversationModel with DisplayableName {
  final String otherUid;
  final String username;
  final String? displayName;
  final String? avatarUrl;
  final String lastMessage;
  final DateTime lastMessageAt;
  final bool lastMessageIsMine;
  final int unreadCount;

  const ConversationModel({
    required this.otherUid,
    required this.username,
    this.displayName,
    this.avatarUrl,
    required this.lastMessage,
    required this.lastMessageAt,
    required this.lastMessageIsMine,
    required this.unreadCount,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> j) => ConversationModel(
        otherUid: j['otherUid'] as String,
        username: j['username'] as String,
        displayName: j['displayName'] as String?,
        avatarUrl: j['avatarUrl'] as String?,
        lastMessage: j['lastMessage'] as String,
        lastMessageAt: DateTime.parse(j['lastMessageAt'] as String),
        lastMessageIsMine: j['lastMessageIsMine'] as bool,
        unreadCount: j['unreadCount'] as int,
      );
}
