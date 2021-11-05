import 'package:flutter/material.dart';
// import 'package:soulcode_flutter_template/pages/carrinho.dart';
import 'package:soulcode_flutter_template/pages/lojavirtualcomlogin.dart';
// import 'package:soulcode_flutter_template/pages/cadastro_page.dart';
// import 'package:soulcode_flutter_template/pages/carrinho.dart';
// import 'package:soulcode_flutter_template/puxarcompras.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carrinho de Compras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StorePage(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
    );
  }
}
