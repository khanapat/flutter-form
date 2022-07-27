void main() {
  for (int i = 1; i <= 15; i++) {
    if (i % 15 == 0) {
      print('fizz buzz');
    } else if (i % 5 == 0) {
      print('buzz');
    } else if (i % 3 == 0) {
      print('fizz');
    } else {
      print('${i}');
    }
  }
}