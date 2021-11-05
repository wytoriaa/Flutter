import 'package:flutter/material.dart';
import 'package:introducao/data.dart';

class produtosPage extends StatefulWidget {
  produtosPage({Key? key}) : super(key: key);

  @override
  _produtosPageState createState() => _produtosPageState();
}

class _produtosPageState extends State<produtosPage> {
  
  List<Product> produtos = products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder( //tb tem função de scrollview
        itemCount: produtos.length,
        itemBuilder: (BuildContext context, int posicao){
          final produto = produtos[posicao];
          return ListTile(
            title: Text(produto.title),
            subtitle: Row(
              children: [
                Text('R\$ ${produto.price}'),
                Container(
                  height: 4,
                  width: 4,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                   ),
                ),
                Text(produto.category),
              ],
            ),//Text(produto.description)
            trailing: IconButton( //tralling é o icone q fica no final
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  produtos.removeAt(posicao); //pelo posição ou indice
                //produtos.remove(value)
                });
              },
            ),
            leading: IconButton( //tralling é o icone q fica no final
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  produtos.add(produto); //pelo posição ou indice
                //produtos.remove(value)
                });
              },
            ),
            
            tileColor: posicao.isEven ? Colors.blue[200] : Colors.blue,
          );
        },
      ),
    );
  }
}