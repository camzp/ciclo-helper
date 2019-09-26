import 'package:ciclo_helper/authentication.dart';
import 'package:ciclo_helper/maintenance_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  HomePage({this.auth, this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;


  void _signOut() async{
    try{
      await auth.signOut();
      onSignedOut();
    }catch (e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Ciclo Helper'),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Logout', style: new TextStyle(fontSize: 17.0, color: Color.fromRGBO(255, 255, 255, 1.0))),
            onPressed: _signOut,
          )
        ],
      ),
      body: new Container(
//        child: new Text('Este é o Ciclo Helper', style: new TextStyle(fontSize: 25.0))
        child: new RaisedButton(child:new Text('Maintenance Page'), onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder:(context) => MaintenancePage()));
        }),
      ),
      
    );
  }
}