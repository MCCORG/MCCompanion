class UserServer {
  final String name;
  final String address;
  final int port;
  final String? description;
  final bool isJava;

  UserServer({
    required this.name,
    required this.address,
    required this.port,
    this.description,
    this.isJava = false,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'address': address,
    'port': port,
    'description': description,
    'isJava': isJava,
  };

  factory UserServer.fromJson(Map<String, dynamic> json) => UserServer(
    name: json['name'] as String,
    address: json['address'] as String,
    port: json['port'] as int,
    description: json['description'] as String?,
    isJava: json['isJava'] as bool? ?? false,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserServer &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          address == other.address &&
          port == other.port;

  @override
  int get hashCode => name.hashCode ^ address.hashCode ^ port.hashCode;

  @override
  String toString() => '$name ($address:$port)';
}
