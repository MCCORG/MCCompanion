import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/message_model.dart';
import '../services/support_service.dart';
import '../services/feedback_service.dart';
import '../widgets/components/swipe_back.dart';
import '../widgets/profile/profile_common.dart';
import '../l10n/app_localizations.dart';

class SupportInboxScreen extends StatefulWidget {
  final bool embedded;
  const SupportInboxScreen({super.key, this.embedded = false});

  @override
  State<SupportInboxScreen> createState() => _SupportInboxScreenState();
}

class _SupportInboxScreenState extends State<SupportInboxScreen> {
  List<ConversationModel> _conversations = [];
  List<FeedbackTicket> _tickets = [];
  bool _showClosed = false;
  bool _loading = true;

  Map<String, List<FeedbackTicket>> get _byUser {
    final map = <String, List<FeedbackTicket>>{};
    for (final t in _tickets) {
      final u = t.username;
      if (u == null) continue;
      (map[u] ??= []).add(t);
    }
    return map;
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final convs = await SupportService.getConversations();
    final tickets = await SupportService.tickets(includeClosed: _showClosed);
    if (!mounted) return;
    setState(() {
      _conversations = convs;
      _tickets = tickets;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final content = Column(
        children: [
          if (!widget.embedded) Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 8,
              left: 8,
              right: 16,
              bottom: 10,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 18,
                    color: AppTheme.textSecondary,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppTheme.accent.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(
                      color: AppTheme.accent.withValues(alpha: 0.25),
                    ),
                  ),
                  child: Icon(
                    Icons.support_agent_rounded,
                    size: 18,
                    color: AppTheme.accent,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.supportInboxTitle,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.supportInboxShared,
                      style: TextStyle(fontSize: 11, color: AppTheme.textMuted),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.refresh_rounded,
                    size: 20,
                    color: AppTheme.textSecondary,
                  ),
                  onPressed: _load,
                ),
              ],
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, widget.embedded ? 12 : 0, 16, 10),
                child: Row(
                  children: [
                    for (final closed in [false, true])
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: closed ? 0 : 8),
                          child: _FilterButton(
                            label: closed ? 'All' : 'Open',
                            active: _showClosed == closed,
                            onTap: () {
                              if (_showClosed == closed) return;
                              setState(() => _showClosed = closed);
                              _load();
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: _loading
                ? Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppTheme.accent,
                    ),
                  )
                : _conversations.isEmpty
                ? Center(
                    child: Text(
                      AppLocalizations.of(context)!.supportInboxEmpty,
                      style: TextStyle(color: AppTheme.textMuted, fontSize: 13),
                    ),
                  )
                : RefreshIndicator(
                    color: AppTheme.accent,
                    backgroundColor: AppTheme.surfaceRaised,
                    onRefresh: _load,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 720),
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          itemCount: _conversations.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 8),
                          itemBuilder: (_, i) {
                            final c = _conversations[i];
                            return _SupportConvTile(
                              conv: c,
                              tickets: _byUser[c.username] ?? const [],
                              onTap: () async {
                                await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => SupportChatScreen(
                                      username: c.username,
                                      displayName: c.displayName ?? c.username,
                                    ),
                                  ),
                                );
                                _load();
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      );

    if (widget.embedded) return content;
    return SwipeBack(onBack: () => Navigator.of(context).pop(), child: content);
  }
}

class _FilterButton extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _FilterButton({required this.label, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 9),
        decoration: BoxDecoration(
          color: active ? AppTheme.accent.withValues(alpha: 0.12) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: active ? AppTheme.accent.withValues(alpha: 0.35) : AppTheme.borderGray,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: active ? AppTheme.accent : AppTheme.textSecondary,
          ),
        ),
      ),
    );
  }
}

class _SupportConvTile extends StatelessWidget {
  final ConversationModel conv;
  final List<FeedbackTicket> tickets;
  final VoidCallback onTap;
  const _SupportConvTile({
    required this.conv,
    required this.onTap,
    this.tickets = const [],
  });

  List<Widget> _badges() {
    final bugs = tickets.where((t) => t.isBug).length;
    final feats = tickets.length - bugs;
    Widget pill(int n, String word, Color c) => Container(
          margin: const EdgeInsets.only(left: 6),
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
          decoration: BoxDecoration(
            color: c.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: c.withValues(alpha: 0.3)),
          ),
          child: Text(
            '$n $word',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: c),
          ),
        );
    return [
      if (bugs > 0) pill(bugs, bugs == 1 ? 'bug' : 'bugs', AppTheme.error),
      if (feats > 0)
        pill(feats, feats == 1 ? 'feature request' : 'feature requests', AppTheme.accent),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: conv.unreadCount > 0
                ? AppTheme.accent.withValues(alpha: 0.4)
                : AppTheme.borderGray,
          ),
        ),
        child: Row(
          children: [
            ProfileAvatar(
              initials: (conv.username.isNotEmpty ? conv.username[0] : '?')
                  .toUpperCase(),
              size: 42,
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
                          conv.displayName ?? conv.username,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      ..._badges(),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${conv.lastMessageIsMine ? "Support: " : ""}${conv.lastMessage}',
                    style: TextStyle(fontSize: 12, color: AppTheme.textMuted),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (conv.unreadCount > 0) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: AppTheme.accent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${conv.unreadCount}',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class SupportChatScreen extends StatefulWidget {
  final String username;
  final String displayName;
  const SupportChatScreen({
    super.key,
    required this.username,
    required this.displayName,
  });

  @override
  State<SupportChatScreen> createState() => _SupportChatScreenState();
}

class _SupportChatScreenState extends State<SupportChatScreen> {
  final _ctrl = TextEditingController();
  final _scrollCtrl = ScrollController();
  List<MessageModel> _messages = [];
  Map<int, String> _sentBy = {};
  String? _supportUid;
  bool _loading = true;
  bool _sending = false;
  Timer? _pollTimer;

  List<FeedbackTicket> _tickets = [];
  int? _openTicket;
  final Map<int, List<FeedbackMessage>> _ticketThreads = {};
  final Map<int, TextEditingController> _ticketCtrls = {};
  int? _ticketSending;

  @override
  void initState() {
    super.initState();
    _load();
    _pollTimer = Timer.periodic(
      const Duration(seconds: 10),
      (_) => _load(silent: true),
    );
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    _ctrl.dispose();
    _scrollCtrl.dispose();
    for (final c in _ticketCtrls.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _load({bool silent = false}) async {
    if (!silent) setState(() => _loading = true);
    final result = await SupportService.getMessages(widget.username);
    final all = await SupportService.tickets();
    if (!mounted) return;
    setState(() {
      _messages = result.messages;
      _sentBy = result.sentBy;
      _supportUid = result.supportUid ?? _supportUid;
      _tickets = all.where((t) => t.username == widget.username).toList();
      _loading = false;
    });
  }

  Future<void> _toggleTicket(FeedbackTicket t) async {
    final next = _openTicket == t.id ? null : t.id;
    setState(() => _openTicket = next);
    if (next != null && !_ticketThreads.containsKey(t.id)) {
      final msgs = await SupportService.ticketMessages(t.id);
      if (mounted) setState(() => _ticketThreads[t.id] = msgs);
    }
  }

  Future<void> _sendTicketReply(FeedbackTicket t) async {
    final ctrl = _ticketCtrls[t.id]!;
    final text = ctrl.text.trim();
    if (text.isEmpty || _ticketSending != null) return;
    setState(() => _ticketSending = t.id);
    final msg = await SupportService.replyToTicket(t.id, text);
    if (!mounted) return;
    setState(() {
      if (msg != null) {
        _ticketThreads[t.id] = [...?_ticketThreads[t.id], msg];
        ctrl.clear();
      }
      _ticketSending = null;
    });
  }

  Future<void> _setTicketStatus(FeedbackTicket t, String status) async {
    if (status == t.status) return;
    final updated = await SupportService.setTicketStatus(t.id, status);
    if (!mounted || updated == null) return;
    setState(() {
      const closed = {'implemented', 'not_planned', 'duplicate'};
      if (closed.contains(updated.status)) {
        _tickets = _tickets.where((x) => x.id != t.id).toList();
        if (_openTicket == t.id) _openTicket = null;
      } else {
        _tickets = _tickets.map((x) => x.id == t.id ? updated : x).toList();
      }
    });
  }

  String _ticketStatusLabel(AppLocalizations l, String status) => switch (status) {
        'planned' => l.fbStatusPlanned,
        'in_progress' => l.fbStatusInProgress,
        'implemented' => l.fbStatusImplemented,
        'not_planned' => l.fbStatusNotPlanned,
        'duplicate' => l.fbStatusDuplicate,
        _ => l.fbStatusOpen,
      };

  Widget _ticketsSection(AppLocalizations l) {
    if (_tickets.isEmpty) return const SizedBox.shrink();
    return Container(
      constraints: const BoxConstraints(maxHeight: 300),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppTheme.borderDim)),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l.adminTicketsHeader.toUpperCase(),
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: AppTheme.textMuted,
              ),
            ),
            const SizedBox(height: 8),
            ..._tickets.map((t) => _adminTicketCard(l, t)),
          ],
        ),
      ),
    );
  }

  Widget _adminTicketCard(AppLocalizations l, FeedbackTicket t) {
    _ticketCtrls.putIfAbsent(t.id, () => TextEditingController());
    final expanded = _openTicket == t.id;
    final color = t.isBug ? AppTheme.error : AppTheme.accent;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppTheme.surfaceCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => _toggleTicket(t),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                children: [
                  Text(t.isBug ? '🐛' : '💡', style: const TextStyle(fontSize: 13)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      t.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                  ),
                  Text(
                    _ticketStatusLabel(l, t.status),
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: color),
                  ),
                  Icon(
                    expanded ? Icons.expand_less_rounded : Icons.expand_more_rounded,
                    size: 18,
                    color: AppTheme.textMuted,
                  ),
                ],
              ),
            ),
          ),
          if (expanded) _adminTicketBody(l, t),
        ],
      ),
    );
  }

  Widget _adminTicketBody(AppLocalizations l, FeedbackTicket t) {
    final msgs = _ticketThreads[t.id];
    final ctrl = _ticketCtrls[t.id]!;

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.description,
            style: TextStyle(fontSize: 12, color: AppTheme.textSecondary, height: 1.5),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text('Status', style: TextStyle(fontSize: 11, color: AppTheme.textMuted)),
              const SizedBox(width: 8),
              DropdownButton<String>(
                value: t.status,
                isDense: true,
                dropdownColor: AppTheme.surfaceRaisedSolid,
                underline: const SizedBox.shrink(),
                style: TextStyle(fontSize: 12, color: AppTheme.textPrimary),
                items: const ['open', 'planned', 'in_progress', 'implemented', 'not_planned', 'duplicate']
                    .map((v) => DropdownMenuItem(value: v, child: Text(_statusText(l, v))))
                    .toList(),
                onChanged: (v) => v == null ? null : _setTicketStatus(t, v),
              ),
            ],
          ),
          if (msgs == null)
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2, color: AppTheme.accent),
              ),
            )
          else
            ...msgs.map((m) => Align(
                  alignment: m.fromAdmin ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    constraints: const BoxConstraints(maxWidth: 260),
                    decoration: BoxDecoration(
                      color: m.fromAdmin
                          ? AppTheme.accent.withValues(alpha: 0.10)
                          : AppTheme.surfaceRaised,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Text(
                      m.body,
                      style: TextStyle(fontSize: 12, color: AppTheme.textPrimary, height: 1.4),
                    ),
                  ),
                )),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: ctrl,
                  style: TextStyle(fontSize: 12, color: AppTheme.textPrimary),
                  decoration: InputDecoration(
                    hintText: l.adminTicketReplyHint,
                    hintStyle: TextStyle(fontSize: 12, color: AppTheme.textMuted),
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                    filled: true,
                    fillColor: AppTheme.background,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                      borderSide: BorderSide(color: AppTheme.borderDim),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                      borderSide: BorderSide(color: AppTheme.borderDim),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: _ticketSending == t.id ? null : () => _sendTicketReply(t),
                icon: Icon(Icons.send_rounded, size: 16, color: AppTheme.accent),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static String _statusText(AppLocalizations l, String v) => switch (v) {
        'planned' => l.fbStatusPlanned,
        'in_progress' => l.fbStatusInProgress,
        'implemented' => l.fbStatusImplemented,
        'not_planned' => l.fbStatusNotPlanned,
        'duplicate' => l.fbStatusDuplicate,
        _ => l.fbStatusOpen,
      };

  Future<void> _send() async {
    final text = _ctrl.text.trim();
    if (text.isEmpty || _sending) return;
    setState(() => _sending = true);
    final ok = await SupportService.send(widget.username, text);
    if (!mounted) return;
    if (ok) {
      _ctrl.clear();
      await _load(silent: true);
    }
    setState(() => _sending = false);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 6,
              bottom: 10,
              left: 4,
              right: 16,
            ),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              border: Border(
                bottom: BorderSide(color: AppTheme.borderGray, width: 0.5),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 18,
                    color: AppTheme.textSecondary,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.displayName,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.support_agent_rounded,
                            size: 11,
                            color: AppTheme.accent,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            AppLocalizations.of(context)!.supportReplyingAs,
                            style: TextStyle(
                              fontSize: 11,
                              color: AppTheme.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (!_loading) _ticketsSection(l),
          Expanded(
            child: _loading
                ? Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppTheme.accent,
                    ),
                  )
                : Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 720),
                      child: ListView.builder(
                        controller: _scrollCtrl,
                        reverse: true,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        itemCount: _messages.length,
                        itemBuilder: (_, i) {
                          final msg = _messages[_messages.length - 1 - i];
                          final isSupport = msg.senderUid == _supportUid;
                          final author = _sentBy[msg.id];
                          return Column(
                            crossAxisAlignment: isSupport
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              if (isSupport && author != null)
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 6,
                                    top: 4,
                                  ),
                                  child: Text(
                                    author,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: AppTheme.textMuted,
                                    ),
                                  ),
                                ),
                              Align(
                                alignment: isSupport
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Container(
                                  constraints: const BoxConstraints(
                                    maxWidth: 480,
                                  ),
                                  margin: EdgeInsets.only(
                                    top: 2,
                                    bottom: 2,
                                    left: isSupport ? 60 : 0,
                                    right: isSupport ? 0 : 60,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSupport
                                        ? AppTheme.accent.withValues(
                                            alpha: 0.85,
                                          )
                                        : AppTheme.surfaceRaised,
                                    borderRadius: BorderRadius.only(
                                      topLeft: const Radius.circular(16),
                                      topRight: const Radius.circular(16),
                                      bottomLeft: Radius.circular(
                                        isSupport ? 16 : 4,
                                      ),
                                      bottomRight: Radius.circular(
                                        isSupport ? 4 : 16,
                                      ),
                                    ),
                                    border: isSupport
                                        ? null
                                        : Border.all(
                                            color: AppTheme.borderGray,
                                          ),
                                  ),
                                  child: Text(
                                    msg.content,
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: 1.4,
                                      color: isSupport
                                          ? Colors.black
                                          : AppTheme.textPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
          ),
          SafeArea(
            top: false,
            child: Container(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                border: Border(
                  top: BorderSide(color: AppTheme.borderGray, width: 0.5),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _ctrl,
                      minLines: 1,
                      maxLines: 4,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.textPrimary,
                      ),
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.supportReplyHint,
                        hintStyle: TextStyle(
                          fontSize: 13,
                          color: AppTheme.textMuted,
                        ),
                      ),
                      onSubmitted: (_) => _send(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _send,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppTheme.accent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: _sending
                          ? const Padding(
                              padding: EdgeInsets.all(10),
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.black,
                              ),
                            )
                          : const Icon(
                              Icons.send_rounded,
                              size: 18,
                              color: Colors.black,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
