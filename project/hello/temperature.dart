class Temperature {
  // private ด้วยการ _
  double _celsius = 0;

  double get celsius => _celsius;
  set celsius(double celsius) => _celsius = celsius;

  double get farenheit => (_celsius * 1.8) + 32;
  set farenheit(double farenheit) => _celsius = (farenheit - 32) / 1.8;

  Temperature({required double celsius}) {
    this._celsius = celsius;
  }
  Temperature.celsius(this._celsius);
  Temperature.farenheit(double farenheit) {
    this._celsius = (farenheit - 32) / 1.8;
  }

  Temperature.farenheit2(double farenheit) : this._celsius = (farenheit - 32) / 1.8;
}

void main() {
  final c = Temperature(celsius: 100);
  print(c);

  final d = Temperature.celsius(100);
  print(d);

  final f = Temperature.farenheit(100);
  print(f);

  final a = Temperature.celsius(100);
  a.celsius = 10.0;

  final b = Temperature.farenheit(10);
  b.farenheit = 10;

}