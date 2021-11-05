import 'package:flutter/material.dart';
class CoracaoPage extends StatefulWidget {
  CoracaoPage({Key? key}) : super(key: key);

  @override
  _CoracaoPageState createState() => _CoracaoPageState();
}

class _CoracaoPageState extends State<CoracaoPage> {

bool favorito = false;
int contador = 0;
void incrementar(){
  setState(() {
    contador++;
  });
}
//outra opçao
//void incrementa() => curtidas +=1 e chama no setState somente o incrementar()

//simulação de quantidade de curtidas 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
        child: GestureDetector( //tem a mesma função do touchbel oppacity
          onTap: (){
            setState(() {
              favorito = !favorito;
              contador +=1; //se for false, transforma em true
            });
          }, //é um toque
          child: Icon(
            Icons.favorite, 
            color: favorito ? Colors.red : Colors.grey, 
            //qnd tá cinza é false, qnt tá vermelho é true
            size: favorito? 100 : 50,
            ),
        ),
      ),
      Text('likes: $contador'),
      ]
    )
    );
     }
}