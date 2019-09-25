import 'package:flutter/material.dart';
import 'login_page.dart';
//import 'package:login/root_page.dart';
//import 'package:login/auth.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Ciclo Helper',
      theme: new ThemeData(
        primarySwatch: Colors.green[300],
      ),
      home: new LoginPage(),
    );
  }
}