import 'package:desafioItau/components/editor.dart';
import 'package:desafioItau/database/dao/usuario_dao.dart';
import 'package:desafioItau/models/usuario.dart';
import 'package:desafioItau/screens/cadastro.dart';
import 'package:desafioItau/screens/principal.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final TextEditingController _controladorUsuario = TextEditingController();
  final TextEditingController _controladorSenha = TextEditingController();

  final UsuarioDAO _dao = UsuarioDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Desafio ITAÚ"),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
        ),
        child: ListView(
          children: [
            /*************** LOGO ******************/
            Container(
              height: 150,
              padding: EdgeInsets.all(0.0),
              child: Image.asset("lib/imgs/logo.png"),
            ),
            /*******************.*******************/

            /********* CAMPOS DE INTERACAO COM USUARIO ******************/
            EditorEmail(
              controlador: _controladorUsuario,
              icone: Icons.email,
              rotulo: 'E-mail',
              dica: 'Digite seu e-mail',
            ),
            EditorSenha(
              controlador: _controladorSenha,
              icone: Icons.vpn_key,
              rotulo: 'Senha',
              dica: 'Digite sua senha',
            ),
            /****************************.*******************************/
            SizedBox(
              height: 40,
            ),
            /***************** Botao de Login  ************************/
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Colors.orange[900],
                    Colors.orange[300],
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Container(
                          child: Image.asset("lib/imgs/icone-login.png"),
                          height: 28,
                          width: 28,
                        ),
                      ],
                    ),
                    onPressed: () {
                      final String email = _controladorUsuario.text;
                      final String password = _controladorSenha.text;

                      if (email.isEmpty || password.isEmpty) {
                        _AlertError(context);
                      } else {
                        _dao.findAll().then((usuarios) {
                          bool encontrado = false;

                          List<Usuario> lista = usuarios;
                          for (Usuario usuario in lista) {
                            if (usuario.email == email &&
                                usuario.password == password) {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return Principal(
                                    idUsuario: usuario.id,
                                    emailUsuario: usuario.email,
                                    nomeUsuario: usuario.name,
                                  );
                                }),
                              );
                              _controladorUsuario.clear();
                              _controladorSenha.clear();
                              encontrado = true;
                            }
                          }
                          if (encontrado == false) {
                            _AlertError(context);
                          }
                        });
                      }
                    }),
              ),
            ),
            /***************************.*****************************/

            /****************** Botao de Cadastro ********************/
            Container(
              child: FlatButton(
                child: Text(
                  'Cadastre-se',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .push(
                    MaterialPageRoute(builder: (context) => Cadastro()),
                  )
                      .then((id) {
                    _dao
                        .findAll()
                        .then((usuarios) => debugPrint(usuarios.toString()));
                  });
                },
              ),
            ),
            /**************************.*****************************/
          ],
        ),
      ),
    );
  }

  void _AlertError(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text("Erro"),
            content: Text("Login e/ou Senha inválido(s)"),
            actions: <Widget>[
              FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ]);
      },
    );
  }
}
