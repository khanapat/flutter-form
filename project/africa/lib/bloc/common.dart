abstract class MyEvent {}

abstract class MyState {}

class StateUnInitialized extends MyState {
  @override
  String toString() {
    // TODO: implement toString
    return 'UnInitialized';
  }
}

class StateLoading extends MyState {
  final String title;
  StateLoading({required this.title});

  @override
  String toString() {
    // TODO: implement toString
    return '$title Loading...';
  }
}

class StateError extends MyState {
  final String message;
  StateError({required this.message});

  @override
  String toString() {
    // TODO: implement toString
    return 'Error: $message';
  }
}
