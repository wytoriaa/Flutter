// EXERCICIO - Crie uma página de registro de produto:
// Com os campos:
// * nome
// * quantidade
// * preço
// * categoria
// * desconto
// * código
// * fornecedor
// * fabricante
// Todos dentro de uma Column, envolva ela
// em um SingleChildScrollView com bouncing.

import 'package:flutter/material.dart';

class RegistroProduto extends StatefulWidget {
  @override
  _RegistroProdutoState createState() => _RegistroProdutoState();
}

class _RegistroProdutoState extends State<RegistroProduto> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de produto'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.storefront_sharp, size: 80),
                Text('Bem vindo!',
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center),
                SizedBox(height: 10),
                Text('Preencha os campos abaixo:',
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.center),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Quantidade',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Preço',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Categoria',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Desconto',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Código',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ID',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Fornecedor',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Fabricante',
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text('Cadastrar', style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}