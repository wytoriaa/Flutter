import 'package:flutter/material.dart';
class HomePage2 extends StatefulWidget {
 // HomePage2({Key? key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final textController = TextEditingController();
  String valor = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Scaffold Class'),
          centerTitle: true,
          leading: FlutterLogo(),
        ),
        drawer: Drawer(),
        body: Center(
          child: Container(
            width: 250,
            child: TextField(
              obscureText: true,
              controller: textController,
              keyboardType: TextInputType.number,
              onSubmitted: (texto){
                  print(texto);
              },
              onChanged: (texto){
                valor = texto;
              },
              style: styleCreate, 
              decoration: InputDecoration(
                hintText: 'password', 
                labelText: 'password', 
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.visibility),
                ),
            ),
        ),),
         floatingActionButton: FloatingActionButton(child: Icon(Icons.navigation),onPressed: (){},),
    );
  }
}

const styleCreate = TextStyle(fontWeight: FontWeight.w300,
  fontStyle: FontStyle.normal,
  fontSize: 25,
  fontFamily: 'monospace',
  color: Colors.grey,
  decoration: TextDecoration.none,);