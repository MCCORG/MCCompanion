import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../l10n/app_localizations.dart';
import '../../design/design.dart';
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
  static const int _previewCount = 5;

  List<ActivityEvent>? _events;
  bool _expanded = false;

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
    final l = AppLocalizations.of(context)!;

    if (_events == null) {
      return DsCard(
        child: Center(
          child: SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              strokeWidth: 1.8,
              color: DsColor.textFaint,
            ),
          ),
        ),
      );
    }

    final events = _events!;
    final visible = _expanded ? events : events.take(_previewCount).toList();
    final hidden = events.length - visible.length;

    return Container(
      decoration: BoxDecoration(
        color: DsColor.surface,
        borderRadius: DsRadius.cardR,
        border: Border.all(color: DsColor.line),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (events.isEmpty)
            Padding(
              padding: const EdgeInsets.all(DsSpace.lg),
              child: Text(l.activityNoEvents, style: DsType.caption),
            )
          else ...[
            for (var i = 0; i < visible.length; i++) ...[
              _ActivityRow(event: visible[i]),
              if (i < visible.length - 1)
                Divider(height: 1, color: DsColor.line),
            ],
            if (hidden > 0) ...[
              Divider(height: 1, color: DsColor.line),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => setState(() => _expanded = true),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: DsSpace.lg,
                      vertical: DsSpace.md,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${l.seeAll}  ($hidden)',
                          style: DsType.label.copyWith(
                            color: DsColor.accent,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: DsSpace.xs),
                        Icon(
                          Icons.expand_more_rounded,
                          size: 18,
                          color: DsColor.accent,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ],
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

  static Map<String, Color> get _colors => {
    'skin_upload': DsColor.accent,
    'skin_liked': DsColor.accent,
    'pack_submitted': DsColor.info,
    'pack_approved': DsColor.success,
    'pack_rejected': DsColor.danger,
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
    final color = _colors[event.type] ?? DsColor.accent;

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
                    color: DsColor.text,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (event.name.isNotEmpty)
                  Text(
                    '"${event.name}"',
                    style: TextStyle(color: DsColor.textSoft, fontSize: 11),
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          Text(
            _timeAgo(event.createdAt, l),
            style: TextStyle(color: DsColor.textFaint, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
