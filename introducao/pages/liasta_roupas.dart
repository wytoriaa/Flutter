import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class Produto {
  final String nome;
  final String picture;
  final double preco;

  Produto(this.nome, this.picture, this.preco);
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageHome(),
    );
  }
}

class PageHome extends StatefulWidget {
  // PageHome({Key? key}) : super(key: key);
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  final produtos = <Produto>[
    Produto(
      "Café Comum",
      "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      15.50,
    ),
    Produto(
      "Capuccino com doce de leite",
      "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
      20.99,
    ),
    Produto(
      "Frapuccino",
      "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
      18.50,
    ),
    Produto(
      "Café com chocolate",
      "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
      16.99,
    ),
    Produto(
      "Café gelado",
      "https://cdn.pixabay.com/photo/2017/12/10/14/47/pizza-3010062_960_720.jpg",
      64,
    ),
  ];



  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (BuildContext context, int index){
          Produto produto = produtos [index];

          return Container(
            decoration: BoxDecoration(border: Border.all()),
            padding: const EdgeInsets.all(18.0),
            margin: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Image.network(produto.picture, height: 250),
                Text(produto.nome, style: textStyle.headline4,),
                Text('R\$ ${produto.preco}',
                style: textStyle.headline4?.copyWith(color: Colors.brown)
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
