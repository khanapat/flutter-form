class Location {
  final String id;
  final String name;
  final String image;
  final double latitude;
  final double longitude;

  Location({
    required this.id,
    required this.name,
    required this.image,
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        latitude: json['latitude'],
        longitude: json['longtitude'],
      );
}
