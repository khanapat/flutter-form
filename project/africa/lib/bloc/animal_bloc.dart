import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:africa/bloc/common.dart';

class AnimalBloc extends Bloc<MyEvent, MyState> {
  AnimalBloc() : super(StateUnInitialized());

  @override
  Stream<MyState> mapEventToState(MyEvent event) async* {
    // TODO: implement mapEventToState
  }
}
