import 'package:flutter/material.dart';
import 'authentication.dart';

class LoginPage extends StatefulWidget{
  LoginPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType{
  login,
  register
}

class _LoginPageState extends State<LoginPage>{
  
  final formKey = new GlobalKey<FormState>();


  String _email;
  String _password;
  FormType _formType = FormType.login;
  
  //verifica se os campos do formulário não estão vazios, de acordo com os validators dos campos
  bool validateForm(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    return false;
  }

  //sobe o formulário válido para autenticação do firebase
  void validateAndSubmit() async{
    if(validateForm()){
      try{
        if(_formType == FormType.login){
          String userId = await widget.auth.signEmailPassword(_email, _password);
          print('Entrou: $userId');
        }else{
          String userId = await widget.auth.createUserEmailPassword(_email, _password);
          print('Conta criada: $userId');
        }
        widget.onSignedIn();
      }catch (e){
        print("Erro: $e");
      }
    }
  }

 //Troca o tipo de formulario para registrar uma conta
  void setAsRegister(){
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  //Troca o tipo de formulário para logar em uma conta
  void setAsLogin(){
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar( 
        title: new Text('Login'),
      ),
      
      body: new Container(
        
        padding: EdgeInsets.all(16.0),
        
        child: new Form(
          key: formKey,
          
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildTextFields() + buildSubmitButtons()
          ),
        
        )
      
      ),
    
    );
  
  }

  //Criando os campos de texto e os botões da página de login

  List<Widget> buildTextFields() {
    return [
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Email'),
        validator: (value) => value.isEmpty ? 'Email não pode ser vazio' : null,
        onSaved: (value) => _email = value,
      ),
              
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Senha'),
        validator: (value) => value.isEmpty ? 'Senha não pode ser vazia' : null,
        onSaved: (value) => _password = value,
        obscureText: true,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if(_formType == FormType.login){
      return [
        new RaisedButton(
          child: new Text('Entrar', style: new TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),

        new FlatButton(
          child: new Text('Criar uma conta', style: new TextStyle(fontSize: 20.0)),
          onPressed: setAsRegister,
        ),
      ];
    }
    else{
      return [
        new RaisedButton(
          child: new Text('Criar conta', style: new TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),

        new FlatButton(
          child: new Text('Ja possui conta? Clique para entrar', style: new TextStyle(fontSize: 20.0)),
          onPressed: setAsLogin,
        ),
      ];      
    }
  }
}