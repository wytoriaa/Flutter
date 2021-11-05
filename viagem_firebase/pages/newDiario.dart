import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viagem_firebase/controllers/user_controller.dart';
import 'package:viagem_firebase/models/diario_model.dart';
class novosDiarios extends StatefulWidget {
  novosDiarios({Key? key}) : super(key: key);

  @override
  _novosDiariosState createState() => _novosDiariosState();
}

class _novosDiariosState extends State<novosDiarios> {
  late final userController = Provider.of<UserController>(
    context,
    listen: false,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novos diários'),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('diarios')
            // .where('ownerKey', isEqualTo: userController.user!.uid)
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
                title: Text(diario.autor),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
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

          );
          }
            );
        },
      ),

    );
  }
}