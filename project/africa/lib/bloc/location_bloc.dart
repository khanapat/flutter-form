import 'dart:convert';
import 'dart:io';

import 'package:africa/models/location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:africa/bloc/common.dart';
import 'package:http/http.dart' as http;

class LocationBloc extends Bloc<MyEvent, MyState> {
  LocationBloc() : super(StateUnInitialized());

  @override
  Stream<MyState> mapEventToState(MyEvent event) async* {
    // TODO: implement mapEventToState
    if (event is LocationGetEvent) {
      yield StateLoading(title: '');

      final response = await http.get(
        Uri.parse('https://techcoach.azurewebsites.net/africa/locations'),
        headers: {'Authorization': 'Bearer ${event.jwtToken}'},
      );

      if (response.statusCode != HttpStatus.ok) {
        yield StateError(message: response.statusCode.toString());
        return;
      }

      final json = jsonDecode(response.body) as List;
      final locations = json.map((e) => Location.fromJson(e)).toList();
      yield LocationGetStateSuccess(locations: locations);
    }
  }
}

class LocationGetEvent extends MyEvent {
  final String jwtToken;
  LocationGetEvent({required this.jwtToken});
}

class LocationGetStateSuccess extends MyState {
  final List<Location> locations;
  LocationGetStateSuccess({required this.locations});
}
