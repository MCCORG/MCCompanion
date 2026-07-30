import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/feedback_service.dart';
import '../widgets/components/swipe_back.dart';
import '../l10n/app_localizations.dart';

class MyFeedbackScreen extends StatefulWidget {
  final VoidCallback? onBack;

  final int? initialTicketId;

  const MyFeedbackScreen({super.key, this.onBack, this.initialTicketId});

  @override
  State<MyFeedbackScreen> createState() => _MyFeedbackScreenState();
}

class _MyFeedbackScreenState extends State<MyFeedbackScreen> {
  List<FeedbackTicket>? _tickets;
  int? _openId;
  final Map<int, List<FeedbackMessage>> _threads = {};
  final Map<int, TextEditingController> _controllers = {};
  int? _sending;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _load() async {
    final tickets = await FeedbackService.myTickets();
    if (!mounted) return;
    setState(() => _tickets = tickets);

    final wanted = widget.initialTicketId;
    if (wanted != null && _openId == null) {
      final match = tickets.where((t) => t.id == wanted).firstOrNull;
      if (match != null) await _toggle(match);
    }
  }

  Future<void> _toggle(FeedbackTicket t) async {
    final next = _openId == t.id ? null : t.id;
    setState(() => _openId = next);
    if (next == null) return;

    if (t.unread > 0) {
      final left = FeedbackService.unreadTickets.value - t.unread;
      FeedbackService.unreadTickets.value = left < 0 ? 0 : left;
      setState(() {
        _tickets = [
          for (final x in _tickets!)
            if (x.id == t.id) x.copyWith(unread: 0) else x,
        ];
      });
    }

    if (!_threads.containsKey(t.id)) {
      final msgs = await FeedbackService.messages(t.id);
      if (mounted) setState(() => _threads[t.id] = msgs);
    }
  }

  Future<void> _send(FeedbackTicket t) async {
    final ctrl = _controllers[t.id]!;
    final text = ctrl.text.trim();
    if (text.isEmpty) return;

    setState(() => _sending = t.id);
    final msg = await FeedbackService.reply(t.id, text);
    if (!mounted) return;
    setState(() {
      if (msg != null) {
        _threads[t.id] = [...?_threads[t.id], msg];
        ctrl.clear();
      }
      _sending = null;
    });
  }

  String _statusLabel(AppLocalizations l, String status) => switch (status) {
    'planned' => l.fbStatusPlanned,
    'in_progress' => l.fbStatusInProgress,
    'implemented' => l.fbStatusImplemented,
    'not_planned' => l.fbStatusNotPlanned,
    'duplicate' => l.fbStatusDuplicate,
    _ => l.fbStatusOpen,
  };

  Color _statusColor(String status) => switch (status) {
    'planned' => const Color(0xFF60A5FA),
    'in_progress' => const Color(0xFFFBBF24),
    'implemented' => const Color(0xFF34D399),
    'not_planned' || 'duplicate' => AppTheme.textMuted,
    _ => AppTheme.accent,
  };

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return SwipeBack(
      onBack: widget.onBack ?? () => Navigator.of(context).maybePop(),
      child: Scaffold(
        backgroundColor: AppTheme.background,
        appBar: AppBar(
          backgroundColor: AppTheme.surface,
          foregroundColor: AppTheme.textPrimary,
          elevation: 0,
          title: Text(
            l.myFeedbackTitle,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        body: _tickets == null
            ? Center(child: CircularProgressIndicator(color: AppTheme.accent))
            : _tickets!.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    l.myFeedbackEmpty,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppTheme.textMuted, fontSize: 14),
                  ),
                ),
              )
            : RefreshIndicator(
                color: AppTheme.accent,
                onRefresh: _load,
                child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(
                    14,
                    14,
                    14,
                    14 + MediaQuery.of(context).padding.bottom,
                  ),
                  itemCount: _tickets!.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (_, i) => _ticketCard(l, _tickets![i]),
                ),
              ),
      ),
    );
  }

  Widget _ticketCard(AppLocalizations l, FeedbackTicket t) {
    final expanded = _openId == t.id;
    final color = _statusColor(t.status);
    _controllers.putIfAbsent(t.id, () => TextEditingController());

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderDim),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => _toggle(t),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.isBug ? '🐛' : '💡',
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t.title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: t.unread > 0
                                ? FontWeight.w800
                                : FontWeight.w600,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: color.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: color.withValues(alpha: 0.3),
                            ),
                          ),
                          child: Text(
                            _statusLabel(l, t.status),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (t.unread > 0)
                    Container(
                      margin: const EdgeInsets.only(right: 8, top: 3),
                      constraints: const BoxConstraints(minWidth: 18),
                      height: 18,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: AppTheme.accent,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Text(
                        '${t.unread}',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  Icon(
                    expanded
                        ? Icons.expand_less_rounded
                        : Icons.expand_more_rounded,
                    size: 20,
                    color: AppTheme.textMuted,
                  ),
                ],
              ),
            ),
          ),
          if (expanded) _thread(l, t),
        ],
      ),
    );
  }

  Widget _thread(AppLocalizations l, FeedbackTicket t) {
    final msgs = _threads[t.id];
    final ctrl = _controllers[t.id]!;

    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppTheme.borderDim)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.description,
            style: TextStyle(
              fontSize: 13,
              color: AppTheme.textSecondary,
              height: 1.55,
            ),
          ),
          const SizedBox(height: 12),
          if (msgs == null)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppTheme.accent,
                  ),
                ),
              ),
            )
          else if (msgs.isEmpty)
            Text(
              l.fbNoReplies,
              style: TextStyle(fontSize: 12, color: AppTheme.textMuted),
            )
          else
            ...msgs.map((m) => _bubble(l, m)),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: ctrl,
                  minLines: 1,
                  maxLines: 4,
                  style: TextStyle(fontSize: 13, color: AppTheme.textPrimary),
                  decoration: InputDecoration(
                    hintText: l.fbReplyHint,
                    hintStyle: TextStyle(
                      fontSize: 13,
                      color: AppTheme.textMuted,
                    ),
                    filled: true,
                    fillColor: AppTheme.background,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppTheme.borderDim),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppTheme.borderDim),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppTheme.accent.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: _sending == t.id ? null : () => _send(t),
                icon: _sending == t.id
                    ? SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppTheme.accent,
                        ),
                      )
                    : Icon(
                        Icons.send_rounded,
                        size: 18,
                        color: AppTheme.accent,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bubble(AppLocalizations l, FeedbackMessage m) {
    return Align(
      alignment: m.fromAdmin ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: m.fromAdmin
              ? AppTheme.accent.withValues(alpha: 0.10)
              : AppTheme.surfaceCard,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: m.fromAdmin
                ? AppTheme.accent.withValues(alpha: 0.25)
                : AppTheme.borderDim,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              m.body,
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.textPrimary,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              m.fromAdmin ? l.fbFromTeam : l.fbFromYou,
              style: TextStyle(fontSize: 10, color: AppTheme.textMuted),
            ),
          ],
        ),
      ),
    );
  }
}
