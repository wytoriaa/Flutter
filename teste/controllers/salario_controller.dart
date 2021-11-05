import 'package:flutter/material.dart';

final salarioController = SalarioController();

class SalarioController extends ChangeNotifier {
  int salario = 0;

  void aumentarSalario(int valor) {
    salario += valor;
    notifyListeners();
  }

  void diminuirSalario(int valor) {
    salario -= valor;
    notifyListeners();
  }
}
