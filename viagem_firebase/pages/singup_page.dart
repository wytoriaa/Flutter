//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viagem_firebase/controllers/user_controller.dart';
import 'package:viagem_firebase/models/user_model.dart';
import 'package:provider/provider.dart';
class singupPage extends StatefulWidget {
  singupPage({Key? key}) : super(key: key);

  @override
  _singupPageState createState() => _singupPageState();
}

class _singupPageState extends State<singupPage> {
  
String nome = '';
String email = '';
String senha = '';
  
late final userController = Provider.of<UserController>(
    context,
    listen: false,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar conta'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                onChanged: (texto) => nome = texto,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
                onChanged: (texto) => email = texto,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Senha'),
                onChanged: (texto) => senha = texto,
              ),
              ElevatedButton(
                onPressed: () async {
                  /// Informações que vão para o firebase
                  final user = UserModel(nome: nome);
                  await userController.signup(email, senha, user);

                  Navigator.pop(context);
                },
                child: Text("Criar conta"),
              )
            ],
          ),
          
        ),
      ),
    );
  }
}