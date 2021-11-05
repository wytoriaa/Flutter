import 'package:aula1/pages/login_teste.dart';
import 'package:flutter/material.dart';
void main(){
  //para rodar o app Flutter
  runApp(App());
}
//widget sem estado
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      //materialApp é uma classe
    return MaterialApp(
      
      title: 'Login Page',
      home: LoginExercise(), //ele puxará as informações da classe seguinte
      debugShowCheckedModeBanner: false, //tira a faixa do debug
      theme: ThemeData(primarySwatch: Colors.lightBlue, ),
    );
  }
}

