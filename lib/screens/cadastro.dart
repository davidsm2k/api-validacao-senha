import 'package:desafioItau/components/editor.dart';
import 'package:desafioItau/database/dao/usuario_dao.dart';
import 'package:desafioItau/models/usuario.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  final _cadastroKey = GlobalKey<FormState>();
  final UsuarioDAO _dao = UsuarioDAO();

  static const _titleAppBar = "CADASTRO";
  static const _nameButtonCadastrar = "Cadastrar";

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
        child: Form(
          key: _cadastroKey,
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            children: [
              EditorNome(
                controlador: _controllerNome,
                icone: Icons.account_circle,
                rotulo: "Nome",
                dica: "Digite seu nome",
              ),
              EditorEmail(
                controlador: _controllerEmail,
                icone: Icons.email,
                rotulo: "E-mail",
                dica: "Digite seu e-mail",
              ),
              EditorSenha(
                controlador: _controllerSenha,
                icone: Icons.vpn_key,
                rotulo: "Senha",
                dica: "Digite uma senha",
              ),
              SizedBox(
                height: 40,
              ),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _nameButtonCadastrar,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      if (_cadastroKey.currentState.validate()) {
                        _cadastrarUsuario(context);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _cadastrarUsuario(BuildContext context) {
    final String nome = _controllerNome.text;
    final String email = _controllerEmail.text;
    final String senha = _controllerSenha.text;
    final Usuario newUsuario = Usuario(0, nome, email, senha);
    final salvaUsuario = _dao.save(newUsuario);
    Navigator.pop(context, salvaUsuario);
  }
}
