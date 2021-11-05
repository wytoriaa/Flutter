import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  //HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
  //createState cria um estado para o _HomePageState
}

//é nessa classe que vamos desenvolver
class _HomePageState extends State<HomePage> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    //print('Apertou, acrescentou!');
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      appBar: AppBar(
        title: Text('my first flutter app'),
        centerTitle: true,
        leading: Icon(Icons.favorite_border_rounded)
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add_alarm),onPressed: (){},),
    );
  }
}