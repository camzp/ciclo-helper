import 'package:ciclo_helper/authentication.dart';
import 'package:ciclo_helper/maintenance_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({this.auth, this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  void _signOut() async {
    try {
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          new BarraStatus(),
          SizedBox(height: 16),
          new Menu(),
        ],
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            ListTile(
              title: Text("Mapa"),
              subtitle: Text("Ver meus percursos"),
              trailing: ClipOval(
                child: Container(
                    color: Colors.green,
                    child: IconButton(
                      icon: Icon(Icons.map),
                      color: Colors.white,
                      onPressed: () {},
                    )),
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            ListTile(
              title: Text("Minha Bike"),
              subtitle: Text("Informações da minha Bike"),
              trailing: ClipOval(
                child: Container(
                    color: Colors.green,
                    child: IconButton(
                      icon: Icon(Icons.directions_bike),
                      color: Colors.white,
                      onPressed: () {},
                    )),
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            ListTile(
              title: Text("Manutenções"),
              subtitle: Text("Cuidados e Reparos com a Bike"),
              trailing: ClipOval(
                child: Container(
                  color: Colors.green,
                  child: IconButton(
                    icon: Icon(Icons.settings),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) => MaintenancePage()));
                    },
                  ),
                ),
              ),
            )
          ],
        ),
        Column(
          children: <Widget>[
            ListTile(
              title: Text("Manuais e Dicas"),
              subtitle: Text("Precisa de Ajuda? :)"),
              trailing: ClipOval(
                child: Container(
                    color: Colors.green,
                    child: IconButton(
                      icon: Icon(Icons.book),
                      color: Colors.white,
                      onPressed: () {},
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BarraStatus extends StatelessWidget {
  const BarraStatus({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    new HomePage();
    return Column(
      children: <Widget>[
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.menu, color: Colors.blueGrey),
                  IconButton(
                    icon: Icon(Icons.exit_to_app),
                    color: Colors.blueGrey,
                    onPressed: HomePage()._signOut, //TODO: Conferir
                  ),
                ],
              ),
              CircleAvatar(backgroundColor: Colors.pink),
              SizedBox(height: 16.0),
              Text(
                "Camila Camilo",
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 8.0),
              Text(
                "E-Bike LEV",
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 6.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [Colors.lightGreen, Colors.lightGreenAccent],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  '20',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  'Pneu',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'psi',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  '10',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Dias',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'Atrás',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  '50',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  'KM',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'Rodados',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
