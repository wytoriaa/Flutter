import 'package:flutter/material.dart';
class UsuarioWidget extends StatelessWidget{
  final String nome;
 UsuarioWidget({required this.nome});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('My App')),
       body: Text('Olá, testando... $nome'),
      );
 }

}