import 'package:desafioItau/screens/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.orange[900],
        accentColor: Colors.orangeAccent[700],
      ),
      home: Login(),
    );
  }
}
