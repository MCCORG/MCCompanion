mixin DisplayableName {
  String? get username;
  String? get displayName;

  String get displayLabel => displayName?.isNotEmpty == true ? displayName! : (username ?? '?');
  String get initials {
    final label = displayLabel;
    if (label.isEmpty) return '?';
    final parts = label.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return label[0].toUpperCase();
  }
}
