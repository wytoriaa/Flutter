import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../cadastro_page.dart';

class DadosPage extends StatefulWidget {
  final String email;
  final String senha;

  DadosPage(this.email, this.senha);

  @override
  _DadosPageState createState() => _DadosPageState();
}

class _DadosPageState extends State<DadosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            /**HEADER USER ACCOUNT */
            UserAccountsDrawerHeader(
              accountName: Text("Leandro"),
              accountEmail: Text("leandro@lesnik.com"),
              currentAccountPicture: CircleAvatar(
                child: Image.asset("assets/images/olho01.jpg"),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  child: Icon(Icons.person),
                ),
                CircleAvatar(
                  child: Icon(Icons.person_outlined),
                ),
                CircleAvatar(
                  child: Image.asset("assets/images/olho01.jpg"),
                ),
              ],
            ),
            /**HEADER NORMAL */
            DrawerHeader(
              child: Text(
                "Dados",
                style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 24,
                    color: Colors.deepPurple.shade600),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.amber, Colors.amber.withOpacity(.3)],
                ),
              ),
            ),
            ListTile(
              title: Text("Item 1"),
              hoverColor: Colors.deepPurple,
              leading: Icon(Icons.arrow_forward),
              subtitle: Text("Sub título do meu item"),
              selectedTileColor: Colors.deepPurple,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CadastroPage(),
                  ),
                );
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Dados Page"),
        leading: null,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Seu e-mail é",
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 24,
                  color: Colors.deepPurple.shade600),
            ),
            Text(
              widget.email,
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 24,
                  color: Colors.deepPurple.shade600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Sua senha é",
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 24,
                  color: Colors.deepPurple.shade600),
            ),
            Text(
              widget.senha,
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 24,
                  color: Colors.deepPurple.shade600),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Página de Dados",
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 42,
                  color: Colors.deepPurple.shade600),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              child: Text("Cadastro"),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => CadastroPage(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text("Sair"),
              onPressed: () {
                Navigator.pop(context, "Até logo!");
              },
            ),
          ],
        ),
      ),
    );
  }
}
