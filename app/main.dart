import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assets',
      home: HomeWidget(),
      theme: ThemeData(fontFamily: 'ReenieBeanie', brightness: Brightness.dark),
    );
  }
}

class HomeWidget extends StatelessWidget {
  Widget _buildPage(String text, String asset) {
    return Container(
      child: Container(
        child: Text(text, style: TextStyle(fontSize: 48.0)),
        alignment: Alignment.center,
        color: Colors.black26,
      ),
      decoration: BoxDecoration(
          color: Colors.black54,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(asset),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      children: [
        _buildPage("inicio de um sonho", "assets/images/study1.jpg"),
        _buildPage("trabalhando nele diariamente...", "assets/images/study3.jpg"),
        _buildPage("até conseguir realizar", "assets/images/study6.jpg"),
      ],
    )
    );
  }
}
