class Cover {
  final int id;
  final String name;

  Cover({
    required this.id,
    required this.name,
  });

  factory Cover.fromJson(Map<String, dynamic> json) => Cover(
        id: json['id'],
        name: json['name'],
      );
}
