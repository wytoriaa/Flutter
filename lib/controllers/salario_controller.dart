import 'package:flutter/material.dart';

final salarioController = SalarioController();

class SalarioController extends ChangeNotifier{
  int salario = 0;

  void aumentarSalario(int valor){
    salario = salario + valor;
    notifyListeners(); 
    //notifica quem está relacionado com a classe, 
    //ela manda mensagem para os liteners -> q executa a ação com base na mudança
  }
  void diminuirSalario(int valor){
    salario = salario - valor;
    notifyListeners();
  }
}