abstract class Event {}

abstract class State {}

class StateUnInitialized extends State {
  @override
  String toString() {
    // TODO: implement toString
    return 'UnInitialized';
  }
}

class StateLoading extends State {
  final String title;
  StateLoading({required this.title});

  @override
  String toString() {
    // TODO: implement toString
    return '$title Loading...';
  }
}

class StateError extends State {
  final String message;
  StateError({required this.message});

  @override
  String toString() {
    // TODO: implement toString
    return 'Error: $message';
  }
}
