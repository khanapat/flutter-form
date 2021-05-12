import 'package:africa/screens/browse_screen.dart';
import 'package:africa/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/authen_bloc.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  final authenBloc = AuthenBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Africa',
      routes: {
        '/': (context) => BlocProvider.value(
              value: authenBloc,
              child: HomeScreen(),
            ),
        '/browse': (context) => MultiBlocProvider(
              providers: [
                BlocProvider.value(value: authenBloc),
              ],
              child: BrowseScreen(),
            ),
      },
    );
  }
}
