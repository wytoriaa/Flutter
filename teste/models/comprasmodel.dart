import 'dart:typed_data';
 
import 'package:cloud_firestore/cloud_firestore.dart';
 
class ComprasModel {
  final String? key;
  final String ownerKey;
  final String nome;
  final String preco;
  final String quantidade;
  // final String diario;
  // final Uint8List? imagem;
 
  ComprasModel({
    this.key,
    required this.ownerKey,
    required this.nome,
    required this.preco,
    required this.quantidade,
    // required this.diario,
    // this.imagem,
  });
 
  static ComprasModel fromMap(Map<String, dynamic> map, [String? key]) =>
      ComprasModel(
        key: key,
        ownerKey: map['ownerKey'],
        nome: map['nome'],
        preco: map['preço'],
        quantidade: map['quantidade'],
        // diario: map['diario'],
        // imagem: map['imagem']?.bytes,
      );
 
  Map<String, dynamic> toMap() => {
        'ownerKey': ownerKey,
        'nome': nome,
        'preco': preco,
        'quantidade': quantidade,
        // 'imagem': imagem != null ? Blob(imagem!) : null,
      };
}
 