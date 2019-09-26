import 'package:flutter/material.dart';
import 'package:flutter_listview/Repository.dart';

// This screen is used to add a new item to the list
class AddScreen extends StatefulWidget {
  @override
  AddScreenState createState() {
    return new AddScreenState();
  }
}

class AddScreenState extends State<AddScreen> {
  String _msg;
  String _title;

  // Call the addItem method to add a new item to the list
  // Returns the name just added which is displayed on the
  // screen below the button
  void addNewItem() {
    var addMsg = Repo.addItem();
    var addTex = Repo.addItem();
    setState(() {
      _msg = addMsg;
      _title = addTex;
    });
  }

  // The add button, when pressed adds an item
  // to the list
  Widget get addButton {
    return RaisedButton(
      onPressed: () => addNewItem(),
      child: Text('Adicionar Registro'),
      color: Colors.green,
      textColor: Colors.white,
    );
  }

  // The text below the button that displays
  // the item name after it is added
  Widget get displayText {
    return Text(
      '$_msg',
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget get textFields {
    return TextFormField(
      decoration: new InputDecoration(labelText: 'Registro'),
      validator: (value) =>
          value.isEmpty ? 'Registro não pode estar vazio' : null,
      onSaved: (value) => _msg = value,
    );
  }

  Widget get descriptionFields {
    return TextFormField(
      decoration: new InputDecoration(labelText: 'Descrição'),
      validator: (value) =>
          value.isEmpty ? 'Descrição não pode estar vazia' : null,
      onSaved: (value) => _title = value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Novo Registro')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            textFields,
            descriptionFields,
            addButton,
            displayText,
          ],
        ),
      ),
    );
  }
}
