import 'package:flutter/material.dart';
//import 'package:introducao/pages/home_page.dart';
import 'package:introducao/pages/home_page2.dart';
import 'package:introducao/pages/liasta_roupas.dart';
class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  get formKey => null;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    var _formKey;
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('flutter app', style: TextStyle(fontSize: 24),), //textstyle tb modifica a fonte
              decoration: BoxDecoration(
                // image: DecorationImage(
                //   image: NetworkImage('')
                //   ),
                gradient: LinearGradient(
                  colors: [
                    Colors.purple,
                    Colors.pink
                  ]
                )
              ),
              ),
            // UserAccountsDrawerHeader(
            //   accountName: Text('Wytoria Rodrigues'), 
            //   accountEmail: Text('wytoria@wytoria.com.br'),
            //   currentAccountPicture: CircleAvatar(child: Icon(Icons.person),),
            //   otherAccountsPictures: [CircleAvatar(child: Icon(Icons.person_outline),)],
            //   ),
              ListTile(
                title: Text('configurações'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                }, //deixa o negocio clicavel
                leading: Icon(Icons.settings),
              ), //são os itens da lista
              ListTile(
                title: Text('login'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage2()));
                },
                leading: Icon(Icons.login_rounded),
              ),
              ListTile(
                title: Text('download'),
                onTap: () {},
                leading: Icon(Icons.download),
              ),
              ListTile(
                title: Text('+ informações'),
                onTap: () {},
                leading: Icon(Icons.help_center_outlined),
              ),
          ],
          ),
      ),
      body: Padding(
        padding:EdgeInsets.all(24.0), 
      child:Form(
        key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('entrar', style: Theme.of(context).textTheme.headline4,),
            Text('bem-vindos de volta!', style: textStyle.subtitle1,),
            SizedBox(height: 8),
            TextField( //TextFormField tem validação
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'e-mail',
                border: OutlineInputBorder(),
              ),
            ), //campo de texto
            SizedBox(height: 8),
            TextField(
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
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16), 
                  child: Text('Login'),
                  ),
              ),
            )
          ],
        ),
        )
    ));
    }
  }