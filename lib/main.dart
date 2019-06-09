import 'package:flutter/material.dart';
import 'views/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'My closet';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Closet',
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}