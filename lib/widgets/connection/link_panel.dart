import 'package:flutter/material.dart';

import '../../design/design.dart';
import '../../util/user_servers.dart';

class LinkOption<T> {
  final T value;
  final String label;
  final IconData icon;
  final String? description;

  const LinkOption({
    required this.value,
    required this.label,
    required this.icon,
    this.description,
  });
}

enum _LinkSide { none, console, server }

class LinkPanel<T> extends StatefulWidget {
  final String consoleTitle;
  final String serverTitle;
  final String manageLabel;
  final String changeLabel;
  final String chooseLabel;
  final List<LinkOption<T>> modes;
  final T mode;
  final ValueChanged<T>? onModeChanged;
  final List<UserServer> servers;
  final String selectedAddress;
  final int? selectedPort;
  final ValueChanged<UserServer> onServerSelected;
  final VoidCallback onManageServers;
  final bool broadcasting;
  final String packTitle;
  final String packLabel;
  final String? packStatus;
  final bool packEnabled;
  final bool packConfigured;
  final bool packLoading;
  final VoidCallback? onPackChange;

  const LinkPanel({
    super.key,
    required this.consoleTitle,
    required this.serverTitle,
    required this.manageLabel,
    required this.changeLabel,
    required this.chooseLabel,
    required this.modes,
    required this.mode,
    required this.onModeChanged,
    required this.servers,
    required this.selectedAddress,
    required this.selectedPort,
    required this.onServerSelected,
    required this.onManageServers,
    required this.broadcasting,
    required this.packTitle,
    required this.packLabel,
    this.packStatus,
    this.packEnabled = false,
    this.packConfigured = false,
    this.packLoading = false,
    this.onPackChange,
  });

  @override
  State<LinkPanel<T>> createState() => _LinkPanelState<T>();
}

class _LinkPanelState<T> extends State<LinkPanel<T>>
    with SingleTickerProviderStateMixin {
  _LinkSide _open = _LinkSide.none;
  late final AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );
    if (widget.broadcasting) _pulse.repeat();
  }

  @override
  void didUpdateWidget(covariant LinkPanel<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.broadcasting && !_pulse.isAnimating) {
      _pulse.repeat();
    } else if (!widget.broadcasting && _pulse.isAnimating) {
      _pulse.stop();
      _pulse.value = 0;
    }
    if (widget.broadcasting && _open != _LinkSide.none) {
      _open = _LinkSide.none;
    }
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  UserServer? get _selected {
    for (final server in widget.servers) {
      if (server.address == widget.selectedAddress &&
          server.port == widget.selectedPort) {
        return server;
      }
    }
    return null;
  }

  void _toggle(_LinkSide side) {
    if (widget.broadcasting) return;
    setState(() => _open = _open == side ? _LinkSide.none : side);
  }

  @override
  Widget build(BuildContext context) {
    final active = widget.broadcasting;
    final current = widget.modes.firstWhere(
      (m) => m.value == widget.mode,
      orElse: () => widget.modes.first,
    );
    final selected = _selected;
    final hasAddress = widget.selectedAddress.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        color: DsColor.surface,
        borderRadius: DsRadius.cardR,
        border: Border.all(
          color: active ? DsColor.accent.withValues(alpha: 0.55) : DsColor.line,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _node(
            side: _LinkSide.console,
            label: widget.consoleTitle,
            icon: current.icon,
            title: current.label,
            subtitle: null,
            topRail: false,
            bottomRail: true,
            active: active,
          ),
          _expansionFor(_LinkSide.console, widget.consoleTitle, null),
          _node(
            side: _LinkSide.server,
            label: widget.serverTitle,
            icon: Icons.dns_rounded,
            title:
                selected?.name ??
                (hasAddress ? widget.selectedAddress : widget.chooseLabel),
            subtitle: hasAddress
                ? '${widget.selectedAddress}:${widget.selectedPort ?? 19132}'
                : null,
            topRail: true,
            bottomRail: false,
            active: active,
          ),
          _expansionFor(
            _LinkSide.server,
            widget.chooseLabel,
            widget.servers.isEmpty ? null : '${widget.servers.length}',
          ),
          const DsDivider(),
          _packNode(),
        ],
      ),
    );
  }

  Widget _packNode() {
    final enabled = !widget.broadcasting;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DsSpace.lg,
        vertical: DsSpace.md,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: Center(
              child: Container(
                width: 34,
                height: 34,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: DsColor.inset,
                  shape: BoxShape.circle,
                  border: Border.all(color: DsColor.line),
                ),
                child: Icon(
                  Icons.extension_rounded,
                  size: 16,
                  color: widget.packEnabled
                      ? DsColor.accent
                      : DsColor.textFaint,
                ),
              ),
            ),
          ),
          const SizedBox(width: DsSpace.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.packTitle, style: DsType.caption),
                const SizedBox(height: DsSpace.xxs),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.packStatus != null) ...[
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.packEnabled
                                ? DsColor.success
                                : DsColor.textFaint,
                          ),
                        ),
                      ),
                      const SizedBox(width: DsSpace.sm - 2),
                    ],
                    Expanded(
                      child: Text(widget.packLabel, style: DsType.bodyStrong),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: DsSpace.md),
          if (widget.packLoading)
            const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          else if (enabled && widget.onPackChange != null)
            GestureDetector(
              onTap: widget.onPackChange,
              child: _changeChip(false),
            ),
        ],
      ),
    );
  }

  Widget _expansionFor(_LinkSide side, String header, String? trailing) {
    final open = _open == side;
    return AnimatedSize(
      duration: DsDuration.normal,
      curve: Curves.easeOutCubic,
      alignment: Alignment.topCenter,
      child: open
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const DsDivider(),
                ColoredBox(
                  color: DsColor.inset.withValues(alpha: 0.45),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          DsSpace.lg,
                          DsSpace.md,
                          DsSpace.lg,
                          DsSpace.xs,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                header.toUpperCase(),
                                style: DsType.caption.copyWith(
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.6,
                                ),
                              ),
                            ),
                            if (trailing != null)
                              Text(trailing, style: DsType.caption),
                          ],
                        ),
                      ),
                      side == _LinkSide.console
                          ? _consoleOptions()
                          : _serverOptions(),
                      const SizedBox(height: DsSpace.xs),
                    ],
                  ),
                ),
                const DsDivider(),
              ],
            )
          : const SizedBox(width: double.infinity),
    );
  }

  Widget _node({
    required _LinkSide side,
    required String label,
    required IconData icon,
    required String title,
    required String? subtitle,
    required bool topRail,
    required bool bottomRail,
    required bool active,
  }) {
    final open = _open == side;
    final enabled = !widget.broadcasting;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? () => _toggle(side) : null,
        child: AnimatedContainer(
          duration: DsDuration.fast,
          color: open ? DsColor.accent.withValues(alpha: 0.06) : null,
          padding: const EdgeInsets.symmetric(horizontal: DsSpace.lg),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 40,
                    maxWidth: 40,
                    minHeight: 82,
                  ),
                  child: AnimatedBuilder(
                    animation: _pulse,
                    builder: (context, _) => CustomPaint(
                      painter: _RailPainter(
                        progress: _pulse.value,
                        active: active,
                        color: active ? DsColor.accent : DsColor.lineStrong,
                        top: topRail,
                        bottom: bottomRail,
                      ),
                      child: Center(
                        child: Container(
                          width: 34,
                          height: 34,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: active
                                ? DsColor.accent.withValues(alpha: 0.18)
                                : DsColor.inset,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: active
                                  ? DsColor.accent.withValues(alpha: 0.60)
                                  : DsColor.line,
                            ),
                          ),
                          child: Icon(
                            icon,
                            size: 17,
                            color: active ? DsColor.accent : DsColor.accent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: DsSpace.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(label, style: DsType.caption),
                      const SizedBox(height: DsSpace.xxs),
                      Text(title, style: DsType.bodyStrong),
                      if (subtitle != null) ...[
                        const SizedBox(height: DsSpace.xxs),
                        Text(subtitle, style: DsType.caption),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: DsSpace.md),
                if (enabled) Center(child: _changeChip(open)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _changeChip(bool open) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: DsSpace.md - 2,
        vertical: DsSpace.xs + 2,
      ),
      decoration: BoxDecoration(
        color: open ? DsColor.accent.withValues(alpha: 0.12) : null,
        borderRadius: DsRadius.pillR,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.changeLabel,
            style: DsType.caption.copyWith(
              color: open ? DsColor.accent : DsColor.textFaint,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: DsSpace.xs),
          AnimatedRotation(
            turns: open ? 0.5 : 0,
            duration: DsDuration.normal,
            child: Icon(
              Icons.expand_more_rounded,
              size: 15,
              color: open ? DsColor.accent : DsColor.textFaint,
            ),
          ),
        ],
      ),
    );
  }

  Widget _radio(bool selected) {
    return Container(
      width: 18,
      height: 18,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? DsColor.accent : Colors.transparent,
        border: Border.all(
          color: selected ? DsColor.accent : DsColor.lineStrong,
          width: 1.6,
        ),
      ),
      child: selected
          ? Icon(Icons.check_rounded, size: 12, color: DsColor.onAccent)
          : null,
    );
  }

  Widget _consoleOptions() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final option in widget.modes)
          _optionRow(
            icon: option.icon,
            title: option.label,
            subtitle: option.description,
            selected: option.value == widget.mode,
            onTap: widget.onModeChanged == null
                ? null
                : () {
                    widget.onModeChanged!(option.value);
                    setState(() => _open = _LinkSide.none);
                  },
          ),
      ],
    );
  }

  Widget _serverOptions() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final server in widget.servers)
          _optionRow(
            icon: Icons.dns_rounded,
            title: server.name,
            subtitle: '${server.address}:${server.port}',
            selected:
                server.address == widget.selectedAddress &&
                server.port == widget.selectedPort,
            onTap: () {
              widget.onServerSelected(server);
              setState(() => _open = _LinkSide.none);
            },
          ),
        const DsDivider(),
        _optionRow(
          icon: Icons.tune_rounded,
          title: widget.manageLabel,
          subtitle: null,
          selected: false,
          onTap: () {
            setState(() => _open = _LinkSide.none);
            widget.onManageServers();
          },
          chevron: true,
          choice: false,
        ),
      ],
    );
  }

  Widget _optionRow({
    required IconData icon,
    required String title,
    required String? subtitle,
    required bool selected,
    required VoidCallback? onTap,
    bool chevron = false,
    bool choice = true,
  }) {
    return Material(
      color: selected
          ? DsColor.accent.withValues(alpha: 0.08)
          : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DsSpace.lg,
            vertical: DsSpace.md + 1,
          ),
          child: Row(
            children: [
              if (choice) _radio(selected) else const SizedBox(width: 18),
              const SizedBox(width: DsSpace.md - 2),
              Icon(
                icon,
                size: 18,
                color: selected ? DsColor.accent : DsColor.textFaint,
              ),
              const SizedBox(width: DsSpace.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: DsType.body.copyWith(
                        fontWeight: selected
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: DsSpace.xxs),
                      Text(subtitle, style: DsType.caption),
                    ],
                  ],
                ),
              ),
              if (chevron)
                Icon(
                  Icons.chevron_right_rounded,
                  size: 18,
                  color: DsColor.textFaint,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RailPainter extends CustomPainter {
  final double progress;
  final bool active;
  final Color color;
  final bool top;
  final bool bottom;

  _RailPainter({
    required this.progress,
    required this.active,
    required this.color,
    required this.top,
    required this.bottom,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final x = size.width / 2;
    final paint = Paint()
      ..color = color.withValues(alpha: active ? 0.45 : 0.55)
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round;

    const dash = 4.0;
    const gap = 4.0;
    final top0 = 0.0;
    final top1 = size.height / 2 - 19;
    final bot0 = size.height / 2 + 19;
    final bot1 = size.height;

    if (top) {
      for (double y = top0; y < top1; y += dash + gap) {
        canvas.drawLine(
          Offset(x, y),
          Offset(x, (y + dash).clamp(top0, top1)),
          paint,
        );
      }
    }
    if (bottom) {
      for (double y = bot0; y < bot1; y += dash + gap) {
        canvas.drawLine(
          Offset(x, y),
          Offset(x, (y + dash).clamp(bot0, bot1)),
          paint,
        );
      }
    }

    if (!active) return;

    final dot = Paint()..color = color;
    if (bottom) {
      canvas.drawCircle(Offset(x, bot0 + (bot1 - bot0) * progress), 2.2, dot);
    }
    if (top) {
      canvas.drawCircle(Offset(x, top0 + (top1 - top0) * progress), 2.2, dot);
    }
  }

  @override
  bool shouldRepaint(covariant _RailPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.active != active ||
      oldDelegate.color != color;
}
