import 'dart:async';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../models/message_model.dart';
import '../services/message_service.dart';
import 'chat_screen.dart';
import '../models/user_model.dart';

class ConversationsScreen extends StatefulWidget {
  const ConversationsScreen({super.key});

  @override
  State<ConversationsScreen> createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  List<ConversationModel> _conversations = [];
  bool _loading = true;
  StreamSubscription<dynamic>? _incomingSub;

  @override
  void initState() {
    super.initState();
    _load();
    _incomingSub = MessageService.incoming.listen((_) => _load());
  }

  @override
  void dispose() {
    _incomingSub?.cancel();
    super.dispose();
  }

  Future<void> _load() async {
    final convs = await MessageService.getConversations();
    if (!mounted) return;
    setState(() {
      _conversations = convs;
      _loading = false;
    });
  }

  Future<void> _openChat(ConversationModel conv) async {
    final friend = FriendModel(
      firebaseUid: conv.otherUid,
      username: conv.username,
      displayName: conv.displayName,
      avatarUrl: conv.avatarUrl,
      online: false,
    );
    await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => ChatScreen(friend: friend)));
    _load();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Center(
        child: CircularProgressIndicator(
          color: AppTheme.accent,
          strokeWidth: 2,
        ),
      );
    }

    if (_conversations.isEmpty) {
      final l = AppLocalizations.of(context)!;
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.chat_bubble_outline_rounded,
                color: AppTheme.textDisabled,
                size: 40,
              ),
              const SizedBox(height: 12),
              Text(
                l.noConversationsYet,
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                l.startChatHint,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppTheme.textMuted, fontSize: 12),
              ),
            ],
          ),
        ),
      );
    }

    return RefreshIndicator(
      color: AppTheme.accent,
      backgroundColor: AppTheme.surfaceRaised,
      onRefresh: _load,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: _conversations.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (_, i) => _ConvTile(
          conv: _conversations[i],
          onTap: () => _openChat(_conversations[i]),
        ),
      ),
    );
  }
}

class _ConvTile extends StatelessWidget {
  final ConversationModel conv;
  final VoidCallback onTap;
  const _ConvTile({required this.conv, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final hasUnread = conv.unreadCount > 0;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppTheme.surfaceRaised,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: hasUnread
                ? AppTheme.accent.withOpacity(0.30)
                : AppTheme.borderGray,
          ),
        ),
        child: Row(
          children: [
            _Avatar(
              initials: conv.initials,
              size: 46,
              avatarUrl: conv.avatarUrl,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    conv.displayLabel,
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontWeight: hasUnread ? FontWeight.w700 : FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    conv.lastMessageIsMine
                        ? '${AppLocalizations.of(context)!.youPrefix}: ${conv.lastMessage}'
                        : conv.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: hasUnread
                          ? AppTheme.textSecondary
                          : AppTheme.textMuted,
                      fontSize: 12,
                      fontWeight: hasUnread ? FontWeight.w500 : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _timeLabel(conv.lastMessageAt),
                  style: TextStyle(
                    color: hasUnread ? AppTheme.accent : AppTheme.textMuted,
                    fontSize: 11,
                    fontWeight: hasUnread ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
                if (hasUnread) ...[
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.accent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${conv.unreadCount}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _timeLabel(DateTime dt) {
    final now = DateTime.now();
    final local = dt.toLocal();
    if (local.year == now.year &&
        local.month == now.month &&
        local.day == now.day) {
      return '${local.hour.toString().padLeft(2, '0')}:'
          '${local.minute.toString().padLeft(2, '0')}';
    }
    return '${local.day.toString().padLeft(2, '0')}/'
        '${local.month.toString().padLeft(2, '0')}';
  }
}

class _Avatar extends StatelessWidget {
  final String initials;
  final double size;
  final String? avatarUrl;
  const _Avatar({required this.initials, required this.size, this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    final hasImage = avatarUrl != null && avatarUrl!.isNotEmpty;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppTheme.accent.withOpacity(0.15),
        shape: BoxShape.circle,
        border: Border.all(color: AppTheme.accent.withOpacity(0.30)),
      ),
      child: ClipOval(
        child: hasImage
            ? Image.network(
                avatarUrl!,
                width: size,
                height: size,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Center(
                  child: Text(
                    initials,
                    style: TextStyle(
                      color: AppTheme.accent,
                      fontSize: size * 0.33,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              )
            : Center(
                child: Text(
                  initials,
                  style: TextStyle(
                    color: AppTheme.accent,
                    fontSize: size * 0.33,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
      ),
    );
  }
}
