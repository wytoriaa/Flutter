import 'package:flutter/material.dart';
class LoginExercise extends StatefulWidget {
  LoginExercise({Key? key}) : super(key: key);

  @override
  _LoginExerciseState createState() => _LoginExerciseState();
}

class _LoginExerciseState extends State<LoginExercise> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    var _formKey = GlobalKey<FormState>();
   // String valor = '';
    //final textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('flutter class, cadastre-se'),
        leading: FlutterLogo(), //logo marca do flutter
      ),
      body: Padding(
        padding:EdgeInsets.all(24.0), 
      child:Form(
        key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Image.asset(
                "assets/imagens/login.png",
                height: 30,
                width: 10,
                fit: BoxFit.fill,
              ),
            ),
            Text('entrar', style: Theme.of(context).textTheme.headline4,),
            Text('cadastre-se para participar do nosso curso de flutter', style: textStyle.subtitle1,),
            
            SizedBox(height: 8),
            TextFormField( //TextFormField tem validação
                validator: (String? texto){
                if (texto != null && texto.isNotEmpty){
                  if (texto.length < 3){
                    return 'digite seu nome corretamente';
                  } 
                }
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'nome',
                border: OutlineInputBorder(),
              ),
            ), 

            SizedBox(height: 8), //dá um espaço entre as caixas
            TextFormField( //TextFormField tem validação
                validator: (String? texto){
                if (texto != null && texto.isNotEmpty){
                  if (texto.length < 3){
                    return 'digite seu sobrenome corretamente';
                  }
                }
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'sobrenome',
                border: OutlineInputBorder(),
              ),
            ), 

            SizedBox(height: 8),
            TextFormField( //TextFormField tem validação
                validator: (String? texto){
                if (texto != null && texto.isNotEmpty){
                  if (texto.length < 10){
                    return 'digite seu cpf corretamente';
                  } 
                }
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'CPF',
                border: OutlineInputBorder(),
              ),
            ), 

            SizedBox(height: 8),
          TextFormField( //TextFormField tem validação
              validator: (String? texto){
                if(texto != null && texto.isNotEmpty){
                  if(!texto.contains('@') || texto.length < 8){
                  return 'digite um e-mail válido';
                }
                } else {
                  return 'atenção: campo obrigatório!';
                }
              },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
            labelText: 'e-mail',
            border: OutlineInputBorder(),
              ),
            ), //campo de texto
            
            SizedBox(height: 8),
            TextFormField(
              validator: (String? texto){
                if (texto != null && texto.isNotEmpty){
                  if (texto.length < 8){
                    return 'a sua senha precisa ter 8 ou mais caracteres';
                  }
                }
              },
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'senha',
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false){
                    print('login efetuado com sucesso!');
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16), 
                  child: Text('Login'),
                  ),
              ),
            )
          ],
        ),
        )
    ),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.login),onPressed: (){},)
    );
    }
  }