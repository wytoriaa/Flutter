import 'package:flutter/material.dart';
//import 'package:introducao/pages/coracao_page.dart';
//import 'package:introducao/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introducao/pages/produtos_page.dart';
//import 'package:introducao/pages/liasta_roupas.dart';
//import 'package:introducao/pages/colum_class.dart';
//import 'package:introducao/pages/listas.dart';
//import 'package:introducao/pages/colum_class.dart';
//import 'package:introducao/pages/login_page.dart';
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
      home: produtosPage(), //ele puxará as informações da classe seguinte
      debugShowCheckedModeBanner: false, //tira a faixa do debug
      theme: ThemeData(
        primarySwatch: Colors.purple, 
        textTheme: GoogleFonts.redRoseTextTheme(),
        ),
    );
  }
}

// import 'dart:convert';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(AppBarBasico());
// }

// class AppBarBasico extends StatefulWidget {
//   @override
//   _AppBarBasicoState createState() => _AppBarBasicoState();
// }

// class _AppBarBasicoState extends State<AppBarBasico> {
//   Choice _selectedChoice = choices[0]; // o estado da app
//   void _select(Choice choice) {
//     // faz o app rebuildar com uma nova escolha
//     setState(() {
//       _selectedChoice = choice;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Scaffold Class'),
//           actions: <Widget>[
//             // botoes de acções
//             IconButton(
//               icon: Icon(choices[0].icon),
//               onPressed: () {
//                 _select(choices[0]);
//               },
//             ),
//             // action button
//             IconButton(
//               icon: Icon(choices[1].icon),
//               onPressed: () {
//                 _select(choices[1]);
//               },
//             ),
//             IconButton(
//               icon: Icon(choices[2].icon),
//               onPressed: () {
//                 _select(choices[2]);
//               },
//             ),
//             // menu
//             PopupMenuButton<Choice>(
//               onSelected: _select,
//               itemBuilder: (BuildContext context) {
//                 return choices.skip(2).map((Choice choice) {
//                   return PopupMenuItem<Choice>(
//                     value: choice,
//                     child: Text(choice.title),
//                   );
//                 }).toList();
//               },
//             ),
//           ],
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: ChoiceCard(choice: _selectedChoice),
//         ),
//       ),
//     );
//   }
// }

// class Choice {
//   const Choice({
//     required this.title,
//     required this.icon,
//   });
//   final String title;
//   final IconData icon;

//   Choice copyWith({
//     String? title,
//     IconData? icon,
//   }) {
//     return Choice(
//       title: title ?? this.title,
//       icon: icon ?? this.icon,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'title': title,
//       'icon': icon.codePoint,
//     };
//   }

//   factory Choice.fromMap(Map<String, dynamic> map) {
//     return Choice(
//       title: map['title'],
//       icon: IconData(map['icon'], fontFamily: 'MaterialIcons'),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Choice.fromJson(String source) => Choice.fromMap(json.decode(source));

//   @override
//   String toString() => 'Choice(title: $title, icon: $icon)';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is Choice && other.title == title && other.icon == icon;
//   }

//   @override
//   int get hashCode => title.hashCode ^ icon.hashCode;
// }

// const List<Choice> choices = const <Choice>[
//   const Choice(title: 'Carro', icon: Icons.directions_car),
//   const Choice(title: 'Bicicleta', icon: Icons.directions_bike),
//   const Choice(title: 'Barco', icon: Icons.directions_boat),
//   const Choice(title: 'Ônibus', icon: Icons.directions_bus),
//   const Choice(title: 'Trem', icon: Icons.directions_railway),
//   const Choice(title: 'Caminhar', icon: Icons.directions_walk),
// ];

// class ChoiceCard extends StatelessWidget {
//   const ChoiceCard({
//     Key? key,
//     required this.choice,
//   }) : super(key: key);
//   final Choice choice;
//   @override
//   Widget build(BuildContext context) {
//     final TextStyle? textStyle = Theme.of(context).textTheme.headline4;
//     return Card(
//       color: Colors.white,
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Icon(choice.icon, size: 128.0, color: textStyle!.color),
//             Text(choice.title, style: textStyle),
//           ],
//         ),
//       ),
//     );
//   }
// }