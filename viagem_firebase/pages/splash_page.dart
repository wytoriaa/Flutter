import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viagem_firebase/controllers/user_controller.dart';
import 'package:viagem_firebase/pages/home_page.dart';
import 'package:viagem_firebase/pages/login_page.dart';
import 'package:viagem_firebase/widgets/splash_loading_widget.dart';
class splashPage extends StatefulWidget {
  splashPage({Key? key}) : super(key: key);

  @override
  _splashPageState createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {
  @override
  Widget build(BuildContext context) {
    //consumer procura na arvore de widget, o controler
    return Consumer<UserController>(
      builder: (context, UserController, child){
        //um desses tres casos serão executados
        switch(UserController.authState){
          case AuthState.signed:
           return HomePage();
          case AuthState.unsigned:
           return LoginPage();
          case AuthState.loading:
            return SplashLoadingWidget();
        }
    }
  );
  }
}