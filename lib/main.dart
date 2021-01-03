import 'package:desafioItau/database/dao/usuario_dao.dart';
import 'package:desafioItau/models/usuario.dart';
import 'package:desafioItau/screens/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange[900],
      ),
      home: Login(),
    );
  }
}
