
import 'package:ciclo_helper/authentication.dart';
import 'package:ciclo_helper/login_page.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatefulWidget{
  FrontPage({this.auth});
  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _FrontPageState();
}

enum AuthStatus{
  notSigned,
  signed
}

class _FrontPageState extends State<FrontPage> {
  AuthStatus status = AuthStatus.notSigned;

  @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
      setState((){
        //status = userId == null ? AuthStatus.notSigned : AuthStatus.signed;
      });
    });
  }

  void _signedIn(){
    setState(() {
      status = AuthStatus.signed;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(status){
      case AuthStatus.notSigned:
        return new LoginPage(auth: widget.auth);
      case AuthStatus.signed:
        return new Scaffold(
          body: new Container(
            child: new Text('Seja bem-vindo!')
          )
        ); 
    }
    return new LoginPage(
      auth: widget.auth,
      onSignedIn: _signedIn,
    );
  }
}