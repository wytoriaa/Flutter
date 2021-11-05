import 'package:flutter/material.dart';

// * Crie uma tela de cadastro com os campos:
// * nome
// * sobrenome
// * email
// * cpf
// * senha
// * Todos os campos devem ter validação

class CadastroPage extends StatefulWidget {
  CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
// criando uma chave global para o estado do formulário
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página de cadastro"),
      ),
      body: Padding(
        padding: EdgeInsets.all(26),
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              //Chave global
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Linha com o título
                  Text("Cadastro",
                      style: Theme.of(context).textTheme.headline4),
                  Container(
                    // color: Colors.cyan,
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          validator: (String? texto) {
                            if (texto == null || texto.isEmpty) {
                              return "Digite seu Nome";
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Nome",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      //Espaçamento entre os inputs
                      Container(
                        width: 20,
                      ),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          validator: (String? texto) {
                            if (texto == null || texto.isEmpty) {
                              return "Digite seu Sobrenome";
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Sobrenome",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 20,
                  ),
                  // CPF
                  TextFormField(
                    validator: (String? texto) {
                      if (texto != null && texto.isNotEmpty) {
                        if (texto.length != 11) {
                          return "Digite seu CPF com os 11 dígitos usando apenas números";
                        }
                      } else {
                        return "Campo obrigatório.";
                      }
                    },
                    keyboardType: TextInputType.number,
                    //decorando o TextField
                    decoration: InputDecoration(
                      labelText: "CPF",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  //EMAIL
                  TextFormField(
                    validator: (String? texto) {
                      //Se o campo de texto nao for nulo e nao estiver vazio
                      if (texto != null && texto.isNotEmpty) {
                        //e se o campo de texto nao tiver um @ no meio dele
                        if (!texto.contains("@") || !texto.contains(".")) {
                          //Retorna esse texto
                          return "Digite um email válido.";
                        }
                      } else {
                        //Se não retorna esse texto
                        return "Campo obrigatório.";
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    //decorando o TextField
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  //SENHA
                  TextFormField(
                    validator: (String? texto) {
                      if (texto != null && texto.isNotEmpty) {
                        if (texto.length < 8) {
                          return "Digite uma senha com oito ou mais caracteres";
                        }
                      } else {
                        return "Campo obrigatório";
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  ElevatedButton(
                    // Colocando uma cor no botao.
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple, // background.
                      onPrimary: Colors.white, // foreground.
                      elevation: 4, // elevação do botão.
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        print('Cadastrado com sucesso');
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        "Enviar",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
