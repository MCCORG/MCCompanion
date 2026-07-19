import 'dart:async';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import '../models/message_model.dart';
import '../services/message_service.dart';
import '../services/user_service.dart';
import 'chat_screen.dart';
import 'support_inbox_screen.dart';
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
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _load();
    _incomingSub = MessageService.incoming.listen((_) => _scheduleLoad());
  }

  void _scheduleLoad() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 800), _load);
  }

  @override
  void dispose() {
    _debounce?.cancel();
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
      isAdmin: conv.otherIsAdmin,
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

    final isAdmin = UserService.isAdmin;

    if (_conversations.isEmpty && !isAdmin) {
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
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                l.startChatHint,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
              ),
            ],
          ),
        ),
      );
    }

    final extraCount = isAdmin ? 1 : 0;

    return RefreshIndicator(
      color: AppTheme.accent,
      backgroundColor: AppTheme.surfaceRaised,
      onRefresh: _load,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: _conversations.length + extraCount,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (_, i) {
              if (isAdmin && i == 0) {
                return _SupportInboxTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const SupportInboxScreen(),
                    ),
                  ),
                );
              }
              final conv = _conversations[i - extraCount];
              return _ConvTile(conv: conv, onTap: () => _openChat(conv));
            },
          ),
        ),
      ),
    );
  }
}

class _SupportInboxTile extends StatelessWidget {
  final VoidCallback onTap;
  const _SupportInboxTile({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppTheme.accent.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.accent.withValues(alpha: 0.35)),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: AppTheme.accent.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.support_agent_rounded,
                size: 22,
                color: AppTheme.accent,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.supportInboxTitle,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.accent,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    AppLocalizations.of(context)!.supportInboxSubtitle,
                    style: TextStyle(fontSize: 12, color: AppTheme.textMuted),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, size: 20, color: AppTheme.accent),
          ],
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
                ? AppTheme.accent.withValues(alpha: 0.30)
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
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          conv.displayLabel,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppTheme.textPrimary,
                            fontWeight: hasUnread
                                ? FontWeight.w700
                                : FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      if (conv.otherIsAdmin) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.accent.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: AppTheme.accent.withValues(alpha: 0.35),
                            ),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.adminBadge,
                            style: TextStyle(
                              color: AppTheme.accent,
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ),
                      ],
                    ],
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
        color: AppTheme.accent.withValues(alpha: 0.15),
        shape: BoxShape.circle,
        border: Border.all(color: AppTheme.accent.withValues(alpha: 0.30)),
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
