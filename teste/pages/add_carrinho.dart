//import 'package:file_picker/file_picker.dart'; //ok
import 'package:flutter/material.dart'; //ok
import 'dart:typed_data'; //ok
import 'package:provider/provider.dart'; //ok
import 'package:soulcode_flutter_template/models/comprasmodel.dart';
import '/controllers/user_controller.dart'; //ok
//import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart'; //ok
// import 'package:viagem_firebase/models/diario_model.dart'; //ok

class CarrinhoCompras extends StatefulWidget {
  @override
  _CarrinhoComprasState createState() => _CarrinhoComprasState();
}

class _CarrinhoComprasState extends State<CarrinhoCompras> {
   String nome = "", preco = "", quantidade = "";
  Uint8List? file;

  late final userController = Provider.of<UserController>(
    context,
    listen: false,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho de compras'),
      ),
       body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Produto",
                ),
                onChanged: (texto) => nome = texto,
              ),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.location_on),
                  labelText: "Preço",
                ),
                onChanged: (texto) => preco = texto,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Quantidade",
                ),
                // maxLines: 2,
                onChanged: (texto) => quantidade = texto,
              ),
              const SizedBox(height: 8),
              // ElevatedButton(
              //   onPressed: () async {
              //     final result = await FilePicker.platform.pickFiles(type: FileType.image);
              //     if(result != null){
              //       setState((){
              //         final bytes = result.files.first.bytes;
              //       file = bytes;
              //       });
                    
              //     }
              //   },
                // child: Row(
                //   children: [
                //     Icon(file !=null? Icons.check :Icons.upload),
                //     Text("Adicionar imagem"),
                //   ],
                // ),
              // ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () async {
                  final user = await FirebaseFirestore.instance
                      .collection('produtos')
                      .doc(userController.user!.uid)
                      .get();

                  final data = user.data()!;

                  final novoProduto = ComprasModel(
                    ownerKey: userController.user!.uid,
                    nome: data ['nome'],
                    preco: preco,
                    quantidade: quantidade,
                    // titulo: titulo,
                    // autor: data['nome'],
                    // local: local,
                    // diario: diario,
                    // imagem: file,
                  ).toMap();

                  await FirebaseFirestore.instance
                      .collection('produtos')
                      .add(novoProduto);

                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Adicionar produtos"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}