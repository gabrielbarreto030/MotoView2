import 'package:flutter/material.dart';
import 'package:motovibe/screen/Inicio.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red[900],
        accentColor: Colors.grey[600],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.grey[600],
          textTheme: ButtonTextTheme.primary,
        ), //ButtonThemeData
      ), //ThemeData
      home: Inicio(),
    );
  }
}