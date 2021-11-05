import 'package:file_picker/file_picker.dart'; //ok
import 'package:flutter/material.dart'; //ok
import 'dart:typed_data'; //ok
import 'package:provider/provider.dart'; //ok
import 'package:viagem_firebase/controllers/user_controller.dart'; //ok
//import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart'; //ok
import 'package:viagem_firebase/models/diario_model.dart'; //ok

class AddDiario extends StatefulWidget {
  @override
  _AddDiarioState createState() => _AddDiarioState();
}

class _AddDiarioState extends State<AddDiario> {
   String titulo = "", autor = "", local = "", diario = "";
  Uint8List? file;

  late final userController = Provider.of<UserController>(
    context,
    listen: false,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar diário'),
      ),
       body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Título",
                ),
                onChanged: (texto) => titulo = texto,
              ),
              // TextField(
              //     decoration: InputDecoration(
              //       suffixIcon: Icon(Icons.person),
              //       labelText: "Autor",
              //     ),
              //     onChanged: (texto) => autor = texto),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.location_on),
                  labelText: "Local",
                ),
                onChanged: (texto) => local = texto,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Diário",
                ),
                maxLines: 20,
                onChanged: (texto) => diario = texto,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  final result = await FilePicker.platform.pickFiles(type: FileType.image);
                  if(result != null){
                    setState((){
                      final bytes = result.files.first.bytes;
                    file = bytes;
                    });
                    
                  }
                },
                child: Row(
                  children: [
                    Icon(file !=null? Icons.check :Icons.upload),
                    Text("Adicionar imagem"),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () async {
                  final user = await FirebaseFirestore.instance
                      .collection('usuarios')
                      .doc(userController.user!.uid)
                      .get();

                  final data = user.data()!;

                  final novoDiario = DiarioModel(
                    ownerKey: userController.user!.uid,
                    titulo: titulo,
                    autor: data['nome'],
                    local: local,
                    diario: diario,
                    imagem: file,
                  ).toMap();

                  await FirebaseFirestore.instance
                      .collection('diarios')
                      .add(novoDiario);

                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Adicionar diário"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}