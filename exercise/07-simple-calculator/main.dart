import '../../project/hello/main.dart';

enum Operation { plus, minus, multiply, divide }

void main() {
  const a = 4;
  const b = 2;
  const op = Operation.plus;
  // TODO: implement calculator

  switch (op) {
    case Operation.plus:
      print(cal(a, b, plus));
      break;
    case Operation.minus:
      print(cal(a, b, minus));
      break;
    case Operation.multiply:
      print(cal(a, b, multiply));
      break;
    case Operation.divide:
      print(cal(a, b, divide));
      break;
    default:
  }
}

int plus(int a, int b) => a + b;
int minus(int a, int b) => a - b;
int multiply(int a, int b) => a * b;
int divide(int a, int b) => (a / b).round();
int cal(int a, int b, MathFunc func) => func(a, b);
