import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../l10n/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../services/auth_service.dart';
import '../../constants/app_constants.dart';

class ActivityEvent {
  final String type;
  final String name;
  final DateTime createdAt;

  const ActivityEvent({
    required this.type,
    required this.name,
    required this.createdAt,
  });

  factory ActivityEvent.fromJson(Map<String, dynamic> j) => ActivityEvent(
        type: j['type'] as String,
        name: j['name'] as String? ?? '',
        createdAt: DateTime.parse(j['createdAt'] as String),
      );
}

Future<List<ActivityEvent>> fetchMyActivity() async {
  try {
    final token = await AuthService.getIdToken();
    final res = await http
        .get(
          Uri.parse('${AppConstants.apiBase}/api/users/me/activity'),
          headers: {
            'Content-Type': 'application/json',
            if (token != null) 'Authorization': 'Bearer $token',
          },
        )
        .timeout(const Duration(seconds: 8));
    if (res.statusCode == 200) {
      final body = jsonDecode(res.body) as Map<String, dynamic>;
      return (body['activity'] as List<dynamic>)
          .map((e) => ActivityEvent.fromJson(e as Map<String, dynamic>))
          .toList();
    }
  } catch (_) {}
  return [];
}

class ProfileActivityFeed extends StatefulWidget {
  const ProfileActivityFeed({super.key});

  @override
  State<ProfileActivityFeed> createState() => _ProfileActivityFeedState();
}

class _ProfileActivityFeedState extends State<ProfileActivityFeed> {
  List<ActivityEvent>? _events;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final events = await fetchMyActivity();
    if (mounted) setState(() => _events = events);
  }

  @override
  Widget build(BuildContext context) {
    if (_events == null) {
      return Container(
        decoration: BoxDecoration(
          color: AppTheme.surfaceRaised,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.borderGray),
        ),
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppTheme.accent,
            ),
          ),
        ),
      );
    }

    final l = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.borderGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_events!.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                l.activityNoEvents,
                style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
              ),
            )
          else
            ..._events!.asMap().entries.map((entry) {
              final i = entry.key;
              final ev = entry.value;
              return Column(
                children: [
                  _ActivityRow(event: ev),
                  if (i < _events!.length - 1)
                    const Divider(height: 1, color: AppTheme.borderDim),
                ],
              );
            }),
        ],
      ),
    );
  }
}

class _ActivityRow extends StatelessWidget {
  final ActivityEvent event;
  const _ActivityRow({required this.event});

  static const Map<String, IconData> _icons = {
    'skin_upload': Icons.upload_rounded,
    'skin_liked': Icons.favorite_rounded,
    'pack_submitted': Icons.send_rounded,
    'pack_approved': Icons.check_circle_rounded,
    'pack_rejected': Icons.cancel_rounded,
  };

  static const Map<String, Color> _colors = {
    'skin_upload': Color(0xFF67e404),
    'skin_liked': Color(0xFFe84d8a),
    'pack_submitted': Color(0xFF3b82f6),
    'pack_approved': Color(0xFF67e404),
    'pack_rejected': Color(0xFFef4444),
  };

  String _label(AppLocalizations l) {
    switch (event.type) {
      case 'skin_upload':
        return l.activitySkinUploaded;
      case 'skin_liked':
        return l.activitySkinLiked;
      case 'pack_submitted':
        return l.activityPackSubmitted;
      case 'pack_approved':
        return l.activityPackApproved;
      case 'pack_rejected':
        return l.activityPackRejected;
      default:
        return event.type;
    }
  }

  String _timeAgo(DateTime dt, AppLocalizations l) {
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 1) return l.timeJustNow;
    if (diff.inMinutes < 60) return l.timeMinutesAgo(diff.inMinutes);
    if (diff.inHours < 24) return l.timeHoursAgo(diff.inHours);
    if (diff.inDays < 30) return l.timeDaysAgo(diff.inDays);
    return l.timeMonthsAgo((diff.inDays / 30).floor());
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final icon = _icons[event.type] ?? Icons.circle_rounded;
    final color = _colors[event.type] ?? AppTheme.accent;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 15),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _label(l),
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (event.name.isNotEmpty)
                  Text(
                    '"${event.name}"',
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 11,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          Text(
            _timeAgo(event.createdAt, l),
            style: TextStyle(color: AppTheme.textMuted, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
