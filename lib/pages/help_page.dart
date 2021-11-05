import 'package:aula36/controllers/salario_controller.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ajuda'),
        ),
        body: AnimatedBuilder(
          animation: salarioController, 
          builder: (BuildContext context, Widget? child){
            return Container();
          }
          ),
    );
  }
}