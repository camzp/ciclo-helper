import 'package:ciclo_helper/authentication.dart';
import 'package:ciclo_helper/screens/infos.dart';
import 'package:flutter/material.dart';
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
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.lightGreen,
      ),

      home: new FrontPage(auth: new Auth()),


    );
  }
}
