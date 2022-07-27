import 'package:bloc/bloc.dart';

void main() {
  final cubit = CounterCubit();
  cubit.stream.listen((value) {
    print(value);
  });
  cubit.increment();

  cubit.close();
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  // ใช้ได้ทั้ง 2 ท่า
  void increment() {
    emit(state + 1);
  }

  void decrement() => emit(state - 1);
}