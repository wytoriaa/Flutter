import 'package:aula36/pages/help_page.dart';
import 'package:flutter/material.dart';
import '../controllers/salario_controller.dart';

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('início'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HelpPage()
            ), 
            ),
            icon: Icon(Icons.help),
          )],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.monetization_on, size: 70, color: Colors.green,),
            AnimatedBuilder(
              animation: salarioController, 
              builder: (BuildContext context, Widget? child ){
                return Text(
                  'R\$ ${salarioController.salario}',
                   textAlign: TextAlign.center,
                   style: TextStyle(fontSize: 25, color: Colors.green[900]),
            );
              }
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  child: Row(
                    children: [
                      Icon(Icons.arrow_downward),
                      Icon(Icons.monetization_on)
                    ],
                  ),
                  onPressed: () => salarioController.diminuirSalario(200),
                ),

                OutlinedButton(
                  child: Row(
                    children: [
                      Icon(Icons.arrow_upward),
                      Icon(Icons.monetization_on)
                    ],
                  ),
                  onPressed: () => salarioController.aumentarSalario(100),
                )
              ],
            )
          ],
        ),
    );
  }
}