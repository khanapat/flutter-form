import 'dart:convert';
import 'dart:io';

import 'package:africa/models/video.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:africa/bloc/common.dart';
import 'package:http/http.dart' as http;

class VideoBloc extends Bloc<MyEvent, MyState> {
  VideoBloc() : super(StateUnInitialized());

  @override
  Stream<MyState> mapEventToState(MyEvent event) async* {
    // TODO: implement mapEventToState
    if (event is VideoGetEvent) {
      yield StateLoading(title: '');

      final response = await http.get(
        Uri.parse('https://techcoach.azurewebsites.net/africa/videos'),
        headers: {'Authorization': 'Bearer ${event.jwtToken}'},
      );

      if (response.statusCode != HttpStatus.ok) {
        yield StateError(message: response.statusCode.toString());
        return;
      }

      final json = jsonDecode(response.body) as List;
      final videos = json.map((e) => Video.fromJson(e)).toList();
      yield VideoGetStateSuccess(videos: videos);
    }
  }
}

class VideoGetEvent extends MyEvent {
  final String jwtToken;
  VideoGetEvent({required this.jwtToken});
}

class VideoGetStateSuccess extends MyState {
  final List<Video> videos;
  VideoGetStateSuccess({required this.videos});
}
