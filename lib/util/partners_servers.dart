class FeaturedServer {
  final String name;

  final String? slug;
  final String address;
  final int port;
  final String description;
  final String? iconUrl;
  final String? websiteUrl;
  final bool featured;

  FeaturedServer({
    required this.name,
    this.slug,
    required this.address,
    required this.port,
    required this.description,
    this.iconUrl,
    this.websiteUrl,
    required this.featured,
  });

  factory FeaturedServer.fromJson(Map<String, dynamic> json) => FeaturedServer(
    name: json['name'] as String,
    slug: json['slug'] as String?,
    address: json['address'] as String,
    port: json['port'] as int? ?? 19132,
    description: json['description'] as String? ?? '',
    iconUrl: json['iconUrl'] as String?,
    websiteUrl: json['websiteUrl'] as String?,
    featured: json['featured'] as bool? ?? false,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'slug': slug,
    'address': address,
    'port': port,
    'description': description,
    'iconUrl': iconUrl,
    'websiteUrl': websiteUrl,
    'featured': featured,
  };
}