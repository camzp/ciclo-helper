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
          SizedBox(
            height: 32.0,
          ),
          Padding(
            padding: EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.menu, color: Colors.blueGrey),
                    Icon(Icons.settings, color: Colors.blueGrey),
                  ],
                ),
                CircleAvatar(backgroundColor: Colors.pink),
                SizedBox(height: 16.0),
                Text(
                  "Camila Camilo",
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 8.0),
                Text("E-Bike LEV",
                    style: TextStyle(fontSize: 12.0, color: Colors.grey)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Container(
              height: 6.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [Colors.lightGreen, Colors.lightGreenAccent])),
            ),
          ),
        ],
      ),
    );
  }
}
