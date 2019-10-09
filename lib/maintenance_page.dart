import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

class MaintenancePage extends StatefulWidget {
  @override
  _MaintenancePage createState() => _MaintenancePage();
}

class _MaintenancePage extends State<MaintenancePage> {
  //TODO: implementar a view 12:21
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black12, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green),
        body: Column(
      children: <Widget>[
        Expanded(
            child: Container(
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center,children: <Widget>[
              Container(height: 50, width: 300, color: Colors.blue),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.amber,
                    width: 70,
                    height: 50,
                  ),
                  Container(color: Colors.brown, width: 70, height: 50)
                ],
              ),
              Container(height: 40, width: 100, color: Colors.green,)
            ])),
            flex: 1),
        Expanded(
            child: Container(
              color: Colors.red,
            ),
            flex: 2)
      ],
    ));
  }
}
