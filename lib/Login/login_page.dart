import 'package:ciclo_helper/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login.dart';

class LoginPage extends StatelessWidget {
  final UserRepository _userRepository;
  LoginPage({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocProvider<LoginBloc>(
        builder: (context) => LoginBloc(userRepository: _userRepository),
        child: LoginForm(userRepository: _userRepository),
      ),
    );
  }
}

//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      body: Container(
//        padding: EdgeInsets.only(
//          top: 60,
//          left: 40,
//          right: 40,
//        ),
//        child: ListView(
//          children: <Widget>[
//            SizedBox(
//              width: 128,
//              height: 128,
//              child: CircleAvatar(
//                backgroundColor: Colors.cyan,
//              ),
//            ),
//            SizedBox(
//              child: Form(
//                key: formKey,
//                child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.stretch,
//                    children: buildTextFields() + buildSubmitButtons()),
//              ),
//            ),
//            SizedBox(
//              height: 80,
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  //Criando os campos de texto e os botões da página de login
//
//  List<Widget> buildTextFields() {
//    return [
//      TextFormField(
//        keyboardType: TextInputType.emailAddress,
//        decoration: new InputDecoration(
//          labelText: "e-mail",
//          labelStyle: TextStyle(
//            color: Colors.black38,
//            fontWeight: FontWeight.w400,
//            fontSize: 20,
//          ),
//        ),
//        style: TextStyle(
//          fontSize: 20,
//        ),
//        validator: (value) => value.isEmpty ? 'Email não pode ser vazio' : null,
//        onSaved: (value) => _email = value,
//      ),
//      SizedBox(height: 10),
//      new TextFormField(
//        keyboardType: TextInputType.visiblePassword,
//        obscureText: true,
//        decoration: new InputDecoration(
//          labelText: "senha",
//          labelStyle: TextStyle(
//            color: Colors.black38,
//            fontWeight: FontWeight.w400,
//            fontSize: 20,
//          ),
//        ),
//        style: TextStyle(
//          fontSize: 20,
//        ),
//        validator: (value) => value.isEmpty ? 'Senha não pode ser vazia' : null,
//        onSaved: (value) => _password = value,
//      ),
//      SizedBox(height: 30),
//    ];
//  }
//
//  List<Widget> buildSubmitButtons() {
//    if (_formType == FormType.login) {
//      return [
//        Container(
//          height: 60,
//          alignment: Alignment.centerLeft,
//          decoration: BoxDecoration(
//            gradient: LinearGradient(
//                begin: Alignment.topLeft,
//                end: Alignment.bottomRight,
//                stops: [
//                  0.3,
//                  1
//                ],
//                colors: [
//                  Colors.lightGreen,
//                  Colors.lightGreenAccent,
//                ]),
//            borderRadius: BorderRadius.all(
//              Radius.circular(5),
//            ),
//          ),
//          child: SizedBox.expand(
//            child: FlatButton(
//              onPressed: validateAndSubmit,
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Text(
//                    "Entrar",
//                    style: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      color: Colors.white,
//                      fontSize: 20,
//                    ),
//                    textAlign: TextAlign.left,
//                  ),
//                  Container(
//                    child: SizedBox(
//                      child: Icon(
//                        Icons.favorite,
//                        color: Colors.white,
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ),
//        Container(
//          height: 60,
//          alignment: Alignment.centerLeft,
//          child: SizedBox.expand(
//            child: FlatButton(
//              onPressed: setAsRegister,
//              child: Text(
//                "Criar uma conta",
//                style: TextStyle(
//                  color: Colors.grey,
//                ),
//              ),
//            ),
//          ),
//        ),
//      ];
//    } else {
//      return [
//        Container(
//          height: 60,
//          alignment: Alignment.centerLeft,
//          decoration: BoxDecoration(
//            gradient: LinearGradient(
//                begin: Alignment.topLeft,
//                end: Alignment.bottomRight,
//                stops: [
//                  0.3,
//                  1
//                ],
//                colors: [
//                  Colors.lightGreen,
//                  Colors.lightGreenAccent,
//                ]),
//            borderRadius: BorderRadius.all(
//              Radius.circular(5),
//            ),
//          ),
//          child: SizedBox.expand(
//            child: FlatButton(
//              onPressed: validateAndSubmit,
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  Text(
//                    "Registrar",
//                    style: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      color: Colors.white,
//                      fontSize: 20,
//                    ),
//                    textAlign: TextAlign.left,
//                  ),
//                  Container(
//                    child: SizedBox(
//                      child: Icon(
//                        Icons.local_pizza,
//                        color: Colors.white,
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ),
//        Container(
//          height: 60,
//          alignment: Alignment.centerLeft,
//          child: SizedBox.expand(
//            child: FlatButton(
//              onPressed: setAsLogin,
//              child: Text("Já possui uma conta?\n Clique para Entrar",
//                  style: TextStyle(
//                    color: Colors.grey,
//                  )),
//            ),
//          ),
//        ),
//      ];
//    }
//  }
//}
