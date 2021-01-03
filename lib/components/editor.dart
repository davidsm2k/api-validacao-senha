import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditorEmail extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  EditorEmail({
    this.controlador,
    this.icone,
    this.rotulo,
    this.dica,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controlador,
      style: TextStyle(
        fontSize: 20.0,
      ),
      decoration: InputDecoration(
        icon: icone != null ? Icon(icone) : null,
        labelText: rotulo,
        hintText: dica,
      ),
      validator: (value){
        if(value.isEmpty) return "Informe um e-mail.";
        if(!RegExp("^[a-zA-z0-9+_.-]+[@][a-z.-]+[.][a-z]").hasMatch(value)) return "Email inválido";
        return null;
      },
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class EditorSenha extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  EditorSenha({
    this.controlador,
    this.icone,
    this.rotulo,
    this.dica,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      controller: controlador,
      style: TextStyle(
        fontSize: 20.0,
      ),
      decoration: InputDecoration(
        icon: icone != null ? Icon(icone) : null,
        labelText: rotulo,
        hintText: dica,
      ),
      validator: _validarSenha,
    );
  }

  String _validarSenha(String value) {

    var lista = value.split('');
    int contador = 0;
    for(int i = 0; i < lista.length; i++){
      for(int j = i+1; j < lista.length; j++){
        if(lista[i][0] == lista[j][0]){
          contador++;
        }
      }
    }
    if(contador != 0) return "Não pode conter digitos repetidos";
    if(RegExp("[ ]").hasMatch(value)) return "Não pode conter espaços em branco";
    if(value.isEmpty) return "Informe uma senha.";
    if(!RegExp("[A-Z]").hasMatch(value) || !RegExp("[a-z]").hasMatch(value)) return "Informe ao menos 1 letra maiúsculo e minuscula.";
    if(!RegExp("[!@#\$%^&*()-+]").hasMatch(value)) return "Informe ao menos 1 símbolo especial (!@#\$%^&*()-+)";
    if(value.length < 9) return "O campo precisa ter no minimo de 9 dígitos.";

    return null;
  }
}

class EditorNome extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  EditorNome({
    this.controlador,
    this.icone,
    this.rotulo,
    this.dica,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controlador,
      style: TextStyle(
        fontSize: 20.0,
      ),
      decoration: InputDecoration(
        icon: icone != null ? Icon(icone) : null,
        labelText: rotulo,
        hintText: dica,
      ),
      validator: (value){
        if(value.isEmpty) return "Informe um nome";
        return null;
      },
      keyboardType: TextInputType.name,
    );
  }
}
