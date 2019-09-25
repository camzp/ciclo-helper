import 'package:ciclo_helper/authentication.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'authentication.dart';
import 'front_page.dart';
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
        primaryColor: Color.fromRGBO(0, 100, 30, 1.0),
      ),
      home: new FrontPage(auth: new Auth()),
    );
  }
}