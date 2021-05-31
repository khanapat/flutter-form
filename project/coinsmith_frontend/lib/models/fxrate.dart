class FXRate {
  final int code;
  final String title;
  final Data data;

  FXRate({
    required this.code,
    required this.title,
    required this.data,
  });

  factory FXRate.fromJson(Map<String, dynamic> json) => FXRate(
        code: json['code'],
        title: json['title'],
        data: json['data'],
      );
}

class Data {
  final String thbusdt;

  Data({required this.thbusdt});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        thbusdt: json['thbusdt'],
      );
}
