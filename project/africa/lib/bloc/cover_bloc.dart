import 'dart:convert';
import 'dart:io';

import 'package:africa/models/cover.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:africa/bloc/common.dart';
import 'package:http/http.dart' as http;

class CoverBloc extends Bloc<MyEvent, MyState> {
  CoverBloc() : super(StateUnInitialized());

  @override
  Stream<MyState> mapEventToState(MyEvent event) async* {
    // TODO: implement mapEventToState
    if (event is CoverGetEvent) {
      yield StateLoading(title: '');

      final response = await http.get(
        Uri.parse('https://techcoach.azurewebsites.net/africa/covers'),
        headers: {'Authorization': 'Bearer ${event.jwtToken}'},
      );

      if (response.statusCode != HttpStatus.ok) {
        yield StateError(message: response.statusCode.toString());
        return;
      }

      final json = jsonDecode(response.body) as List;
      final covers = json.map((e) => Cover.fromJson(e)).toList();
      yield CoverGetStateSuccess(covers: covers);
    }
  }
}

class CoverGetEvent extends MyEvent {
  final String jwtToken;
  CoverGetEvent({required this.jwtToken});
}

class CoverGetStateSuccess extends MyState {
  final List<Cover> covers;
  CoverGetStateSuccess({required this.covers});
}
