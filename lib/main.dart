import 'package:ciclo_helper/My_Bike_Bloc/bloc.dart';
import 'package:ciclo_helper/authentication.dart';
import 'package:ciclo_helper/maps_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication.dart';
import 'front_page.dart';
//import 'package:login/root_page.dart';
//import 'package:login/auth.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  MyBikeBloc _myBikeBloc = MyBikeBloc();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  BlocProvider(
      bloc: _myBikeBloc,
      child: MaterialApp(
        title: 'Ciclo Helper',
        debugShowCheckedModeBanner: false,
        theme:  ThemeData(
          primaryColor: Colors.lightGreen,
        ),

        home:  Maps(),//FrontPage(auth: new Auth()),


      ),
    );
  }
}
