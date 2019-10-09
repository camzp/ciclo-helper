import 'package:flutter/material.dart';
import 'front_page.dart';
import 'authentication.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  FormType _formType = FormType.login;

  //verifica se os campos do formulário não estão vazios, de acordo com os validators dos campos
  bool validateForm() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  //sobe o formulário válido para autenticação do firebase
  void validateAndSubmit() async {
    if (validateForm()) {
      try {
        if (_formType == FormType.login) {
          String userId =
              await widget.auth.signEmailPassword(_email, _password);
          print('Entrou: $userId');
        } else {
          String userId =
              await widget.auth.createUserEmailPassword(_email, _password);
          print('Conta criada: $userId');
        }
        widget.onSignedIn();
      } catch (e) {
        print("Erro: $e");
      }
    }
  }

  //Troca o tipo de formulario para registrar uma conta
  void setAsRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  //Troca o tipo de formulário para logar em uma conta
  void setAsLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 128,
              child: CircleAvatar(
                backgroundColor: Colors.cyan,
              ),
            ),
            SizedBox(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: buildTextFields()),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  "Recuperar Senha",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: buildSubmitButtons(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Criando os campos de texto e os botões da página de login

  List<Widget> buildTextFields() {
    return [
      TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: new InputDecoration(
          labelText: "e-mail",
          labelStyle: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        style: TextStyle(
          fontSize: 20,
        ),
        validator: (value) => value.isEmpty ? 'Email não pode ser vazio' : null,
        onSaved: (value) => _email = value,
      ),
      new TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: new InputDecoration(
          labelText: "senha",
          labelStyle: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        style: TextStyle(
          fontSize: 20,
        ),
        validator: (value) => value.isEmpty ? 'Senha não pode ser vazia' : null,
        onSaved: (value) => _password = value,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        Container(
          height: 60,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [
                  0.3,
                  1
                ],
                colors: [
                  Colors.lightGreen,
                  Colors.lightGreenAccent,
                ]),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: SizedBox.expand(
            child: RaisedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Entrar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    child: SizedBox(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: validateAndSubmit,
            ),
          ),
        ),
        FlatButton(
          child: Text('Criar uma conta', style: TextStyle(fontSize: 20.0)),
          onPressed: setAsRegister,
        ),
      ];
    } else {
      return [
        RaisedButton(
          child: Text('Criar conta', style: TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        FlatButton(
          child: Text('Ja possui conta? Clique para entrar',
              style: TextStyle(fontSize: 20.0)),
          onPressed: setAsLogin,
        ),
      ];
    }
  }
}
