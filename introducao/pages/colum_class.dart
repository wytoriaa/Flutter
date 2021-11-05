import 'package:flutter/material.dart';

class ScrollviewPage extends StatefulWidget {
  @override
  _ScrollviewState createState() => _ScrollviewState();
}

class _ScrollviewState extends State<ScrollviewPage> {
  Widget criaContainer(Color color) => Container(
        height: 128,
        width: 56,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
      );

    final frutas = <String>[
    'Maçã',
    'Laranja',
    'Tomate',
    'Uva',
    'Melão', 
    'Mamão',
    'Kiwi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SoulCode Template"),
      ),
      body: ListView.builder(
          itemCount: frutas.length, //vai renderizar o numero de itens da lista
          itemBuilder: (BuildContext context, int index){ //é uma funcão que recebe parametros
            return Text(frutas[index]);
          }
      ),
      );
  }
}



// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
 
//  Widget criaContainer(Color color) => Container(
//    color: color,
//    height: 60,
//    width: 80,
//  );
 
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Explicando as colunas'),
//       ),
//       body: Container(
//         color: Colors.black,
//         width: 300,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             criaContainer(Colors.orange),
//             criaContainer(Colors.green),
//             criaContainer(Colors.red),
//             // Container(
//             //   color: Colors.white,
//             //   child:  Row(
//             //   mainAxisAlignment: MainAxisAlignment.end,
//             //   //crossAxisAlignment: CrossAxisAlignment.stretch,
//             //   children: [
//             //     criaContainer(Colors.pink),
//             //     criaContainer(Colors.purple),
//             //   ],
//             // )
//             // )],
//             Expanded(
//               child: Container(
//                 color: Colors.yellow,
//                 child:  Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 criaContainer(Colors.pink),
//                 Expanded(child: Container(color: Colors.lime))
//               ])
//               )
//         ),
//         Expanded(
//           child: Container(
//           color: Colors.blueGrey,
//         )),
//         Text('A', style: TextStyle(color: Colors.white),)
//         ] 
//         ),
//       )
//     );
//   }
// }