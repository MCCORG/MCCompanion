class SavedSkin {
  final String id;
  final String name;
  final String filePath;
  final DateTime createdAt;

  const SavedSkin({
    required this.id,
    required this.name,
    required this.filePath,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'createdAt': createdAt.millisecondsSinceEpoch,
  };

  factory SavedSkin.fromJson(Map<String, dynamic> json) => SavedSkin(
    id: json['id'] as String,
    name: json['name'] as String,
    filePath: json['filePath'] as String,
    createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
  );

  SavedSkin copyWith({String? name}) => SavedSkin(
    id: id,
    name: name ?? this.name,
    filePath: filePath,
    createdAt: createdAt,
  );
}
