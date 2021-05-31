import 'package:coinsmith_frontend/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coinsmith',
      home: HomeScreen(),
    );
  }
}
