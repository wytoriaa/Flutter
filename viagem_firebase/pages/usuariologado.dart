import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:viagem_firebase/controllers/user_controller.dart';
import 'package:provider/provider.dart';
import 'package:viagem_firebase/models/user_model.dart';
class UsuarioLogado extends StatefulWidget {
  UsuarioLogado({Key? key}) : super(key: key);

  @override
  _UsuarioLogadoState createState() => _UsuarioLogadoState();
}

class _UsuarioLogadoState extends State<UsuarioLogado> {
    late final userController = Provider.of<UserController>(
    context,
    listen: false,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () async {
              await userController.logout();
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
 body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance.collection('usuarios').get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          final usuarios = snapshot.data!.docs.map((map) {
            final data = map.data();
            return UserModel.fromMap(data);
          }).toList();
          return ListView.builder(
            itemCount: usuarios.length,
            itemBuilder: (context, index) {
              final usuario = usuarios[index];
              if (usuario.nome == userController.model.nome) {
                return Container(
                  color: Colors.red,
                  child: Column(
                    children: [
                      Text(userController.model.nome),
                      Text(userController.user!.email!),
                    ],
                  ),
                );
              }
              return Container(
                color: Colors.blue,
                child: Column(
                  children: [
                    Text(usuario.nome),
                    Text(userController.user!.email!),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:viagem_firebase/models/user_model.dart';
// import '../controllers/user_controller.dart';

// class ListaPage extends StatefulWidget {
//   @override
//   _ListaPageState createState() => _ListaPageState();
// }

// class _ListaPageState extends State<ListaPage> {
//   late final userController = Provider.of<UserController>(
//     context,
//     listen: false,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Lista de Usuários"),
//         actions: [
//           IconButton(
//             onPressed: () async {
//               await userController.logout();
//             },
//             icon: Icon(Icons.exit_to_app),
//           )
//         ],
//       ),
//       body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
//         future: FirebaseFirestore.instance.collection('usuarios').get(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Container(
//               child: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }
//           final usuarios = snapshot.data!.docs.map((map) {
//             final data = map.data();
//             return UserModel.fromMap(data);
//           }).toList();
//           return ListView.builder(
//             itemCount: usuarios.length,
//             itemBuilder: (context, index) {
//               final usuario = usuarios[index];
//               if (usuario.nome == userController.model.nome) {
//                 return Container(
//                   color: Colors.red,
//                   child: Column(
//                     children: [
//                       Text(userController.model.nome),
//                       Text(userController.user!.email!),
//                     ],
//                   ),
//                 );
//               }
//               return Container(
//                 color: Colors.blue,
//                 child: Column(
//                   children: [
//                     Text(usuario.nome),
//                     Text(userController.user!.email!),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }