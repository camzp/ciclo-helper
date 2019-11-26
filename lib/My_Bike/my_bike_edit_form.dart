import 'package:ciclo_helper/Model/my_bike.dart';
import 'package:ciclo_helper/My_Bike/my_bike.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef OnSaveCallback = Function(MyBike myBike);

class MyBikeEditForm extends StatefulWidget{
  final bool isEditable;
  final bool isShowing;
  final MyBike myBike;
  final OnSaveCallback onSave;

  MyBikeEditForm({@required this.isEditable, @required this.isShowing, @required this.onSave, this.myBike}) : super(key: UniqueKey());

  @override
  State<StatefulWidget> createState() => _MyBikeEditFormState();
}

class _MyBikeEditFormState extends State<MyBikeEditForm>{
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool get isEditing => widget.isEditable;
  bool get isShowing => widget.isShowing;


  String _reg;
  String _brand;
  String _wheel;
  String _model;
  bool _suspension = false;
  bool _headlight = false;
  bool _mirror = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      initialValue: isEditing ? '' : (isShowing ? widget.myBike.reg : '') ,
                      onSaved: (reg) => _reg = reg,
                      readOnly: isShowing,
                      decoration: InputDecoration(
                        icon: Icon(Icons.donut_large, color: Colors.green[200],
                        ),
                        hintText: 'Código de Registro',
                        labelText: 'Registro',
                        fillColor: isShowing ? Colors.grey : Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 50),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          initialValue: isEditing ? '' : (isShowing ? widget.myBike.brand : ''),
                          onSaved: (brand) => _brand = brand,
                          readOnly: isShowing,
                          autovalidate: true,
                          autocorrect: false,
                          decoration: InputDecoration(
                            labelText: 'Fabricante',
                            fillColor: isShowing ? Colors.grey : Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                    )
                  ],

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        width: 50,
                      child: Text('Aro:'),),
                    DropdownButton(
                      items: wheelList.map((value) =>DropdownMenuItem(
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.grey),
                        ),
                        value:value,
                      )
                      ).toList(),
                      onChanged: isShowing ? null : (wheel){
                        setState(() {
                          _wheel = wheel;
                        });
                      },
                      value: _wheel,
                      hint: isShowing ? Text(widget.myBike.wheel) : Text("Selecione o aro"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 50),
                    Expanded(
                      child: TextFormField(
                        initialValue: isEditing ? '' : (isShowing ? widget.myBike.model : ''),
                        onSaved: (model) => _model = model,
                        readOnly: isShowing,
                        autovalidate: true,
                        autocorrect: false,
                        decoration: InputDecoration(
                          labelText: "Modelo",
                          fillColor: isShowing ? Colors.grey : Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(

                  child: Text('Adicionais'),
                ),
                SwitchListTile(
                    title:Text ('Suspensão'),
                    value:  _suspension,
                    onChanged: isShowing ? null : (bool val){
                      setState(() {
                        _suspension = val;
                      });
                    }
                ),
                SizedBox(height: 3.0,),
                SwitchListTile(
                    title:Text ('Farol'),
                    value:  _headlight,
                    onChanged: isShowing ? null :
                        (bool val){
                        setState(() {
                        _headlight = val;
                      });
                    }
                ),
                SizedBox(height: 3.0,),
                SwitchListTile(
                    title:Text ('Retrovisor'),
                    value: _mirror,
                    onChanged: isShowing ? null :  (bool val){
                      setState(() { _mirror = val; });
                    }
                ),
                SizedBox(height: 3.0,),
                isShowing ? Container() :
                RaisedButton(
                  child: Text(
                    isEditing ? "Atualizar" : "Adicionar",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.greenAccent,
                  onPressed: () {
                    _formKey.currentState.save();
                    MyBike _newBike = MyBike(
                      reg: _reg,
                      brand: _brand,
                      color: "Padrão",
                      frame: "Padrão",
                      frontBrake: "Padrão",
                      headlight: _headlight,
                      mirror: _mirror,
                      model: _model,
                      pressure: 50,
                      rearBrake: "Padrão",
                      suspension: _suspension,
                      shock_absorber: "Padrão",
                      wheel: _wheel,
                    );
                    widget.onSave(_newBike);
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );

  }

  List<String> wheelList=<String>[
    '12',
    '16',
    '20',
    '24',
    '26',
    '27',
    '29',
  ];

}