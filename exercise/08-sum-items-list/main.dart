void main() {
  var list = <int>[1, 3, 5, 7, 9];
  int sum = 0;
  for (var i = 0; i < list.length; i++) {
    sum += list[i];
  }
  print(sum);
}
