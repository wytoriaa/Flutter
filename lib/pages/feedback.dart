import 'package:flutter/material.dart';
class feedbackPage extends StatefulWidget {
  feedbackPage({Key? key}) : super(key: key);

  @override
  _feedbackPageState createState() => _feedbackPageState();
}

class _feedbackPageState extends State<feedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dê sua opinião sobre nosso curso'),
        leading: FlutterLogo(),
      ),
      body: Padding(padding: EdgeInsets.all(25.0),),
    );
  }
}