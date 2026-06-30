import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../services/notification_api_service.dart';
import 'profile_common.dart';
import 'profile_cards.dart';

class ProfileNotificationsTab extends StatefulWidget {
  final void Function(int count)? onCountChanged;
  const ProfileNotificationsTab({super.key, this.onCountChanged});

  @override
  State<ProfileNotificationsTab> createState() =>
      _ProfileNotificationsTabState();
}

class _ProfileNotificationsTabState extends State<ProfileNotificationsTab> {
  List<AppNotification> _notifications = [];
  bool _loading = true;
  bool _marking = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _loading = true);
    final result = await NotificationApiService.getNotifications(limit: 50);
    if (mounted) {
      setState(() {
        _notifications = result.notifications;
        _loading = false;
      });
      widget.onCountChanged?.call(result.unreadCount);
    }
  }

  Future<void> _markAllRead() async {
    final unread = _notifications.where((n) => !n.read).map((n) => n.id).toList();
    if (unread.isEmpty) return;
    setState(() => _marking = true);
    await NotificationApiService.markAllRead(unread);
    if (mounted) {
      setState(() {
        _notifications = _notifications
            .map((n) => n.read
                ? n
                : AppNotification(
                    id: n.id,
                    type: n.type,
                    actorUsername: n.actorUsername,
                    actorAvatar: n.actorAvatar,
                    targetType: n.targetType,
                    targetId: n.targetId,
                    targetName: n.targetName,
                    read: true,
                    createdAt: n.createdAt,
                  ))
            .toList();
        _marking = false;
      });
      widget.onCountChanged?.call(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const ProfileLoadingBody();

    final l = AppLocalizations.of(context)!;
    final hasUnread = _notifications.any((n) => !n.read);

    return RefreshIndicator(
      color: AppTheme.accent,
      backgroundColor: AppTheme.surfaceRaised,
      onRefresh: _load,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          Row(
            children: [
              Text(
                l.sectionNotifications.toUpperCase(),
                style: TextStyle(
                  color: AppTheme.textMuted,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
              const Spacer(),
              if (hasUnread)
                TextButton.icon(
                  onPressed: _marking ? null : _markAllRead,
                  icon: _marking
                      ? const SizedBox(
                          width: 12,
                          height: 12,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.done_all_rounded, size: 14),
                  label: Text(l.notifMarkAllRead),
                  style: TextButton.styleFrom(
                    foregroundColor: AppTheme.accent,
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    textStyle: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.w600),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          if (_notifications.isEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: AppTheme.surfaceRaised,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppTheme.borderGray),
              ),
              child: Text(
                l.notifEmpty,
                style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
              ),
            )
          else
            ...List.generate(_notifications.length, (i) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: _NotificationTile(notification: _notifications[i]),
            )),

          const SizedBox(height: 20),
          Text(
            l.sectionNotificationTypes.toUpperCase(),
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          const ProfileNotificationPrefsCard(),
        ],
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final AppNotification notification;
  const _NotificationTile({required this.notification});

  static const Map<String, IconData> _icons = {
    'skin_liked': Icons.favorite_rounded,
    'comment_received': Icons.comment_rounded,
    'pack_approved': Icons.check_circle_rounded,
    'pack_rejected': Icons.cancel_rounded,
    'friend_request': Icons.person_add_rounded,
    'friend_accepted': Icons.people_rounded,
    'message_received': Icons.chat_bubble_rounded,
  };

  static const Map<String, Color> _colors = {
    'skin_liked': Color(0xFFe84d8a),
    'comment_received': Color(0xFF67e404),
    'pack_approved': Color(0xFF67e404),
    'pack_rejected': Color(0xFFef4444),
    'friend_request': Color(0xFF3b82f6),
    'friend_accepted': Color(0xFF3b82f6),
    'message_received': Color(0xFF8b5cf6),
  };

  String _title(AppLocalizations l) {
    final a = notification.actorUsername ?? l.notifSomeone;
    switch (notification.type) {
      case 'skin_liked':        return l.notifSkinLiked(a);
      case 'comment_received':  return l.notifCommentReceived(a);
      case 'pack_approved':     return l.notifPackApproved;
      case 'pack_rejected':     return l.notifPackRejected;
      case 'friend_request':    return l.notifFriendRequest(a);
      case 'friend_accepted':   return l.notifFriendAccepted(a);
      case 'message_received':  return l.notifMessageReceived(a);
      default:                  return notification.type;
    }
  }

  String? _subtitle() {
    final name = notification.targetName;
    if (name == null || name.isEmpty) return null;
    switch (notification.type) {
      case 'skin_liked':
      case 'comment_received':
      case 'pack_approved':
      case 'pack_rejected':
        return '"$name"';
      case 'message_received':
        return name;
      default:
        return null;
    }
  }

  String _timeAgo(DateTime dt, AppLocalizations l) {
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 1) return l.timeJustNow;
    if (diff.inMinutes < 60) return l.timeMinutesAgo(diff.inMinutes);
    if (diff.inHours < 24) return l.timeHoursAgo(diff.inHours);
    return l.timeDaysAgo(diff.inDays);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final icon = _icons[notification.type] ?? Icons.notifications_rounded;
    final color = _colors[notification.type] ?? AppTheme.accent;
    final unread = !notification.read;
    final subtitle = _subtitle();

    return Container(
      decoration: BoxDecoration(
        color: unread
            ? AppTheme.surfaceRaised
            : AppTheme.surfaceRaised.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: unread
              ? AppTheme.accent.withValues(alpha: 0.25)
              : AppTheme.borderGray,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _title(l),
                          style: TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 13,
                            fontWeight: unread
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                      ),
                      if (unread)
                        Container(
                          width: 7,
                          height: 7,
                          margin: const EdgeInsets.only(left: 6, top: 2),
                          decoration: BoxDecoration(
                            color: AppTheme.accent,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  const SizedBox(height: 4),
                  Text(
                    _timeAgo(notification.createdAt, l),
                    style: TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
