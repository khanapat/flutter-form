import 'package:test/test.dart';
import 'package:dartapp/hello.dart';

void main() {
  test('hello', () {
    expect(hello('trust'), 'Hello trust');
  });
}