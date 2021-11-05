//import 'dart:js';
import 'package:flutter/material.dart'; //ok
import 'package:provider/provider.dart'; //ok
import 'package:viagem_firebase/models/diario_model.dart';//ok
import 'package:viagem_firebase/pages/add_diario.dart';//ok
import 'package:viagem_firebase/pages/edit_diario_page.dart';//ok
import 'package:viagem_firebase/pages/newDiario.dart';
import 'package:viagem_firebase/pages/usuariologado.dart';
import '../controllers/user_controller.dart';//ok
import 'package:cloud_firestore/cloud_firestore.dart';//ok

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final userController = Provider.of<UserController>(
    context,
    listen: false,
  );
/// Exercício 01
/// Crie um Drawer na Home e nele coloque um menu(ListView com ListTile),
/// Um ListTile para navegar para Diários, uma página que apresenta TODOS
/// os diários do banco, o layout dessa página fica a seu critério.
/// Exercício 02- 
/// Crie uma tela separada para listar os usuários.
/// -----> USANDO FUTURE BUILDER <-----
/// Destacar o usuário que está logado.

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
      drawer: Drawer(
        child: ListView(
          children: [
            // FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            //   future: FirebaseFirestore.instance
            //       .collection('usuarios')
            //       .doc(userController.user!.uid)
            //       .get(),
            //       builder: (context, snapshot) {
            //       if (!snapshot.hasData) {
            //       return DrawerHeader(
            //         child: Center(child: CircularProgressIndicator()),
            //       );
            //     }

            //     final user = UserModel.fromMap(snapshot.data!.data()!);
            UserAccountsDrawerHeader(
              accountName: Text(userController.model.nome), 
              accountEmail: Text(userController.user!.email!),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade900,
                    Colors.white
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                )
              ),
            ),
            ListTile(
              title: Text('Diários'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => novosDiarios()));
              },
            ),
            ListTile(
              title: Text('Lista de Usuários'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => UsuarioLogado()));
              },
            )
          ],
        ),
      ),
       body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('diarios')
            .where('ownerKey', isEqualTo: userController.user!.uid)
            //.orderBy('titulo', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final diarios = snapshot.data!.docs.map((map) {
            final data = map.data();
            return DiarioModel.fromMap(data, map.id);
          }).toList();

          return ListView.builder(
            itemCount: diarios.length,
            itemBuilder: (context, index){
              final diario = diarios[index];
              return ListTile(
                title: Text(diario.titulo),
                subtitle: Row(
                  children: [
                    Icon(Icons.location_on),
                    Text(diario.local)
                  ],
                ),
                leading: diario.imagem != null ?
                Image.memory(
                  diario.imagem!,
                  fit: BoxFit.cover,
                  width: 72,
                )
              :Container(
                child: Icon(Icons.location_on),
                width: 72,
                height: double.maxFinite,
                color: Colors.blueAccent,
              ),
              onTap: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => EditDiarioPage(
                      diario: diario
              ),
              
                )
              );
              },
          );
          }
            );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDiario(),
            ),
          );
        },
      ),
    );
  }
}