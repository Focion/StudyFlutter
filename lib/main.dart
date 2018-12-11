import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/demo16.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Shopping App',
    theme: ThemeData(
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      primaryColor: Colors.blue[800],
      accentColor: Colors.black87,
    ),
    home: new MainWidget(),
  ));
}
