class SavedSkin {
  final String id;
  final String name;
  final String filePath;
  final DateTime createdAt;
  final String? uploadedUrl;

  const SavedSkin({
    required this.id,
    required this.name,
    required this.filePath,
    required this.createdAt,
    this.uploadedUrl,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'createdAt': createdAt.millisecondsSinceEpoch,
    if (uploadedUrl != null) 'uploadedUrl': uploadedUrl,
  };

  factory SavedSkin.fromJson(Map<String, dynamic> json) => SavedSkin(
    id: json['id'] as String,
    name: json['name'] as String,
    filePath: json['filePath'] as String,
    createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
    uploadedUrl: json['uploadedUrl'] as String?,
  );

  SavedSkin copyWith({String? name, String? uploadedUrl}) => SavedSkin(
    id: id,
    name: name ?? this.name,
    filePath: filePath,
    createdAt: createdAt,
    uploadedUrl: uploadedUrl ?? this.uploadedUrl,
  );
}
