import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  final int idUsuario;
  final String nomeUsuario;
  final String emailUsuario;

  Principal({
    this.idUsuario,
    this.emailUsuario,
    this.nomeUsuario,
  });

  static const _titleAppBar = "Bem Vindo(a) !";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Container(
            height: 150,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: [0.1, 1],
                colors: [
                  Colors.deepOrange[900],
                  Colors.orange[300],
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "Olá $nomeUsuario, essa foi a minha solução para o desafio. \n\nEspero que tenha gostado !",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
