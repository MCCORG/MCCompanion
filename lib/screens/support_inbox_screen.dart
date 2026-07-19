import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/message_model.dart';
import '../services/support_service.dart';
import '../widgets/components/swipe_back.dart';
import '../widgets/profile/profile_common.dart';
import '../l10n/app_localizations.dart';

class SupportInboxScreen extends StatefulWidget {
  const SupportInboxScreen({super.key});

  @override
  State<SupportInboxScreen> createState() => _SupportInboxScreenState();
}

class _SupportInboxScreenState extends State<SupportInboxScreen> {
  List<ConversationModel> _conversations = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final convs = await SupportService.getConversations();
    if (!mounted) return;
    setState(() {
      _conversations = convs;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SwipeBack(
      onBack: () => Navigator.of(context).pop(),
      child: Column(
        children: [
          Padding(
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
      ),
    );
  }
}

class _SupportConvTile extends StatelessWidget {
  final ConversationModel conv;
  final VoidCallback onTap;
  const _SupportConvTile({required this.conv, required this.onTap});

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
                  Text(
                    conv.displayName ?? conv.username,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
    super.dispose();
  }

  Future<void> _load({bool silent = false}) async {
    if (!silent) setState(() => _loading = true);
    final result = await SupportService.getMessages(widget.username);
    if (!mounted) return;
    setState(() {
      _messages = result.messages;
      _sentBy = result.sentBy;
      _supportUid = result.supportUid ?? _supportUid;
      _loading = false;
    });
  }

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
