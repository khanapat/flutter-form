class Video {
  final String id;
  final String name;
  final String headline;

  Video({
    required this.id,
    required this.name,
    required this.headline,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json['id'],
        name: json['name'],
        headline: json['headline'],
      );
}
