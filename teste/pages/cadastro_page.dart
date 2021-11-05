//Crie uma tela de cadastro com os campos:
// nome
// sobrenome
// email
// cpf
// senha
// Todos os campos devem ter validação

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soulcode_flutter_template/pages/home_page.dart';
import 'package:validadores/validador.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          title: Text('GAME CODE',
              style: GoogleFonts.pressStart2p(
                  textStyle: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                      letterSpacing: -1.5))),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            color: Colors.white,
            width: 550,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      color: Colors.transparent,
                      child: (Image.asset(
                        'assets/images/dartflutter.png',
                        height: 180,
                        // width: 180,
                        alignment: Alignment.center,
                      ))),
                  SizedBox(height: 12),
                  Container(
                      // color: Colors.blueGrey,
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key: _formkey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text('Cadastre-se', style: textStyles.headline5),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: TextFormField(
                                      validator: (String? texto) {
                                        if (texto != null && texto.isNotEmpty) {
                                          if (texto.length < 2)
                                            return 'Digite seu nome';
                                        } else {
                                          return 'Campo Obrigatório';
                                        }
                                      },
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        labelText: 'Nome',
                                        border: OutlineInputBorder(),
                                        errorStyle: TextStyle(
                                            color: Colors.red.shade700),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8, width: 8),
                                  Expanded(
                                    flex: 1,
                                    child: TextFormField(
                                      validator: (String? texto) {
                                        if (texto != null && texto.isNotEmpty) {
                                          if (texto.length < 2)
                                            return 'Digite seu sobrenome';
                                        } else {
                                          return 'Campo Obrigatório';
                                        }
                                      },
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        labelText: 'Sobrenome',
                                        border: OutlineInputBorder(),
                                        errorStyle: TextStyle(
                                            color: Colors.red.shade700),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                validator: (String? texto) {
                                  if (texto != null && texto.isNotEmpty) {
                                    if (!texto.contains('@') ||
                                        texto.length < 8 ||
                                        !texto.contains('.com'))
                                      return 'Digite um e-mail válido.';
                                  } else {
                                    return 'Campo Obrigatório';
                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(),
                                  errorStyle:
                                      TextStyle(color: Colors.red.shade700),
                                ),
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                validator: (value) {
                                  // Aqui entram as validações
                                  return Validador()
                                      .add(Validar.CPF, msg: 'CPF Inválido')
                                      .add(Validar.OBRIGATORIO,
                                          msg: 'Campo obrigatório')
                                      .minLength(11)
                                      .maxLength(11)
                                      .valido(value, clearNoNumber: true);
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    errorStyle:
                                        TextStyle(color: Colors.red.shade700),
                                    hintText: '123.456.789-10',
                                    labelText: 'Informe seu CPF'),
                              ),
                              SizedBox(height: 8),
                              TextFormField(
                                validator: (String? texto) {
                                  if (texto != null && texto.isNotEmpty) {
                                    if (texto.length < 8)
                                      return 'Digite uma senha com 8 caracteres ou mais';
                                  } else {
                                    return 'Campo obrigatório';
                                  }
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Senha',
                                  border: OutlineInputBorder(),
                                  errorStyle:
                                      TextStyle(color: Colors.red.shade700),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 18),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if (_formkey.currentState?.validate() ??
                                            false) {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage()));
                                          // print('Login feito!');
                                        }
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16.0),
                                        child: Text(
                                          'Login',
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      )))
                            ]),
                      ))
                ]),
          ),
        ));
  }
}
