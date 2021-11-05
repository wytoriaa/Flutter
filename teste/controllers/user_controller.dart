import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soulcode_flutter_template/models/comprasmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//controla os dados do usuario que está logado

enum AuthState{signed, unsigned, loading} //aqui dentro teremos criaremos constantes

class UserController extends ChangeNotifier{
  AuthState authState = AuthState.loading;
  late ComprasModel model;
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;


  User? get user => _auth.currentUser; //se ? for nulo, o usuario nao está logado

  UserController(){
    //fluxo de dados = stream - vai tá emitindo o usuário
    //listen ouve os dados que estão sendo emitidos
    //o underline(_) serve para deixar ele inacessível fora da classe 
    //preciso de algo que fique cuidando (ouvindo) se o usuario esta logado, deslogado, para isso criamos um construtor vazio -
    // funcao de escuta, o listen recebe a funcao e vai fazer algo emitido pela funcao authchanges, esse user vai me dizer se tem
    // usuario logado ou nao, só que ele nao vai ter valor assim q inicia. Aqui dentro posso ver se o email é valido tbm..
    _auth.authStateChanges().listen((user) async{
      if(user != null){
        authState = AuthState.signed;
        final data = await _db.collection('produtos').doc(user.uid).get();
        model = ComprasModel.fromMap(data.data()!);
      } else{
        authState= AuthState.unsigned;
      }
      notifyListeners(); //notifica a interface gráfica
      }); 
  }
  //o await funciona com o async
  Future<void> login(String email, String senha) async{
    await _auth.signInWithEmailAndPassword(
      email: email, 
      password: senha,
    );
  }
  Future<void> logout() async{
    await _auth.signOut(); //isso é o necessário para deslogar o usuário
  }
  Future<void> signup(
    String email,
    String senha,
    ComprasModel payload,
  ) async {
    final credentials = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: senha,
    );
    final uid = credentials.user?.uid;
    final data = payload.toMap();
    data['nome'] = uid;

    final doc = _db.collection('produtos').doc(uid);
    await doc.set(data);
  }
}
