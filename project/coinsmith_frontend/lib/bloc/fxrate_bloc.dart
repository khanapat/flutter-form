// import 'package:coinsmith_frontend/bloc/common.dart';

// class FXRateBloc extends Bloc<MyEvent, MyState> {
//   FXRateBloc() : super(StateUnInitialized());

//   @override
//   Stream<MyState> mapEventToState(MyEvent event) async* {
//     // TODO: implement mapEventToState
//     if (event is AnimalGetEvent) {
//       yield StateLoading(title: '');

//       final response = await http.get(
//         Uri.parse('https://techcoach.azurewebsites.net/africa/animals'),
//         headers: {'Authorization': 'Bearer ${event.jwtToken}'},
//       );

//       if (response.statusCode != HttpStatus.ok) {
//         yield StateError(message: response.statusCode.toString());
//       }

//       final json = jsonDecode(response.body) as List;
//       final animals = json.map((e) => Animal.fromJson(e)).toList();
//       yield AnimalGetStateSuccess(animals: animals);
//     }
//   }
// }

// class AnimalGetEvent extends MyEvent {
//   final String jwtToken;
//   AnimalGetEvent({required this.jwtToken});
// }

// class AnimalGetStateSuccess extends MyState {
//   final List<Animal> animals;
//   AnimalGetStateSuccess({required this.animals});
// }
