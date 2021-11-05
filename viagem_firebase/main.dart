import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:viagem_firebase/controllers/user_controller.dart';
import 'package:viagem_firebase/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}
//provide auxilia na gerencia de estado, compartilha informações entre as widgets
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserController(), 
      //context = informação do widget na arvore, como se fosse um endereço
      //o create vai prover o usercontroller, tornando acessível de qualquer lugar desde q tenha o context
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diário de viagem',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: splashPage(),
      ),
    );
  }
}

