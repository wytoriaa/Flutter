//         drawer: Drawer(
//           child: ListView(
//             children: [
// //Usando Drawer "Padrão":
//               DrawerHeader(
//                 child: UserAccountsDrawerHeader(
//                   accountName: Text('Marcus Vinicius'),
//                   accountEmail: Text('marcussimoes86@gmail.com'),
//                   currentAccountPicture:
//                       CircleAvatar(child: Icon(Icons.person)),
//                   otherAccountsPictures: [
//                     CircleAvatar(child: Icon(Icons.person_outline_outlined))
//                   ],
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(colors: [
//                       Colors.blue.shade700,
//                       Colors.blue.shade100,
//                     ]),
//                   ),
//                 ),
//               ),

//               ListTile(
//                 leading: Icon(Icons.settings),
//                 title: Text('Configurações'),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SettingsPage(),
//                     ),
//                   );
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.help),
//                 title: Text('Ajuda'),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => RegistroProduto(),
//                     ),
//                   );
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.favorite),
//                 title: Text('Avalie-nos'),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => HeartPage(),
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),