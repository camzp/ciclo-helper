import 'package:ciclo_helper/model/bike.dart';
import 'package:ciclo_helper/model/my_bike.dart';
import 'package:ciclo_helper/my_bike/my_bike.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../keys.dart';

typedef OnSaveCallback = Function(MyBike myBike);

class MyBikeEditForm extends StatefulWidget {
  final bool isEditable;
  final bool isShowing;
  final MyBike myBike;
  final OnSaveCallback onSave;
  String wheel;

  MyBikeEditForm(
      {@required this.isEditable,
      @required this.isShowing,
      @required this.onSave,
      this.myBike});

  @override
  State<StatefulWidget> createState() => _MyBikeEditFormState();
}

class _MyBikeEditFormState extends State<MyBikeEditForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool get isEditing => widget.isEditable;
  bool get isShowing => widget.isShowing;

  Bike bike;

  @override
  initState(){
    bike = Bike();
    bike.headlight = widget?.myBike?.headlight ?? false;
    bike.wheel = widget?.myBike?.wheel ?? '26';
    bike.suspension = widget?.myBike?.suspension ?? false;
    bike.mirror = (((widget)?.myBike)?.mirror) ?? false;
    print(bike.mirror.toString() + 'Iniciando o estado');
  }

  String _reg;
  String _brand;
  String _wheel;
  String _model;
  bool _suspension = false;
  bool _headlight = false;
  bool _mirror = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: isShowing
          ? FloatingActionButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyBikeEditForm(
                            isEditable: true,
                            isShowing: false,
                            myBike: widget.myBike,
                            onSave: (newMyBike) {
                              print(newMyBike.mirror.toString() + 'Ao atualizar');
                              newMyBike.id = widget.myBike.id;
                              BlocProvider.of<MyBikeBloc>(context)
                                  .add(UpdatedMyBike(newMyBike));
                              Navigator.pop(context);
                            },
                          ))),
              child: Icon(Icons.create))
          : null,
      appBar: AppBar(
        title: Text( (){
          if (isEditing) {
            return 'Editar Minha Bike';
          }
          else if (isShowing){
            return 'Minha Bike';
          }
          else{
            return 'Adicionar Minha Bike';
          }
        }()),
      ),
      body: Padding(
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
                    key: LocalKeys.regField,
                    initialValue:
                        isShowing || isEditing ? widget.myBike.reg : '',
                    onSaved: (reg) => _reg = reg,
                    readOnly: isShowing,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.donut_large,
                        color: Colors.green[200],
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
                        key: LocalKeys.brandField,
                        initialValue:
                            isShowing || isEditing ? widget.myBike.brand : '',
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
                    child: Text('Aro:'),
                  ),
                  DropdownButton(
                    key: LocalKeys.wheelField,
                    items: wheelList
                        .map((value) => DropdownMenuItem(
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.grey),
                              ),
                              value: value,
                            ))
                        .toList(),
                    onChanged: isShowing
                        ? null
                        : (wheel) {
                            setState(() {
                              _wheel = wheel;
                            });
                          },
                    value: widget.wheel,
                    hint: isShowing || isEditing
                        ? Text(widget.myBike.wheel)
                        : Text("Selecione o aro"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 50),
                  Expanded(
                    child: TextFormField(
                      key: LocalKeys.modelField,
                      initialValue:
                          isShowing || isEditing ? widget.myBike.model : '',
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
                  key: LocalKeys.suspensionField,
                  title: Text('Suspensão'),
                  value: bike.suspension,
                  onChanged: isShowing
                      ? null
                      : (bool val) {
                          setState(() {
                            bike.suspension = val;
                          });
                        }),
              SizedBox(
                height: 3.0,
              ),
              SwitchListTile(
                  key: LocalKeys.headlightField,
                  title: Text('Farol'),
                  value:  bike.headlight,
                  onChanged: isShowing
                      ? null
                      : (bool val) {
                          setState(() {
                            bike.headlight = val;
                          });
                        }),
              SizedBox(
                height: 3.0,
              ),
              SwitchListTile(
                  key: LocalKeys.mirrorField,
                  title: Text('Retrovisor'),
                  value: bike.mirror,
                  onChanged: isShowing
                      ? null
                      : (bool val) {
                          setState(() {
                            bike.mirror = val;
                          });
                        }),
              SizedBox(
                height: 3.0,
              ),
              isShowing
                  ? Container()
                  : RaisedButton(
                      child: Text(
                        isEditing ? "Atualizar" : "Adicionar",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.greenAccent,
                      onPressed: () {
                        _formKey.currentState.save();
                        MyBike _newBike = MyBike(
                          reg: _reg ?? '',
                          brand: _brand ?? '',
                          color: "Padrão",
                          frame: "Padrão",
                          frontBrake: "Padrão",
                          headlight: bike.headlight ,
                          mirror: bike.mirror ,
                          model: _model ?? '',
                          pressure: 50,
                          rearBrake: "Padrão",
                          suspension: bike.suspension,
                          shock_absorber: "Padrão",
                          wheel: _wheel ?? (widget.myBike.wheel ?? ''),
                        );
                        widget.onSave(_newBike);
                        Navigator.pop(context);
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }

  List<String> wheelList = <String>[
    '18',
    '19',
    '20',
    '24',
    '26',
    '27.5',
    '29',
    '700C'
  ];
}
