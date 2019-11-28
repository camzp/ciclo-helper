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
  initState() {
    bike = Bike();
    bike.headlight = widget?.myBike?.headlight ?? false;
    bike.wheel = widget?.myBike?.wheel ?? '26';
    bike.suspension = widget?.myBike?.suspension ?? false;
    bike.mirror = (((widget)?.myBike)?.mirror) ?? false;
    bike.frontBrake = (((widget)?.myBike)?.frontBrake) ?? false;
    bike.rearBrake = (((widget)?.myBike)?.rearBrake) ?? false;
    bike.shockAbsorber = (((widget)?.myBike)?.shockAbsorber) ?? false;
  }

  String _reg;
  String _brand;
  String _wheel;
  String _model;
  String _color;
  String _frame;

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
                              newMyBike.id = widget.myBike.id;
                              BlocProvider.of<MyBikeBloc>(context)
                                  .add(UpdatedMyBike(newMyBike));
                              Navigator.pop(context);
                            },
                          ))),
              child: Icon(Icons.create))
          : null,
      appBar: AppBar(
        title: Text(() {
          if (isEditing) {
            return 'Editar Minha Bike';
          } else if (isShowing) {
            return 'Minha Bike';
          } else {
            return 'Adicionar Minha Bike';
          }
        }()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: 10),
                    Expanded(
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
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 10),
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
                            icon: Icon(
                              Icons.blur_linear,
                              color: Colors.green[200],
                            ),
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
                                bike.wheel = wheel;
                              });
                            },
                      value: bike.wheel,
                      hint: isShowing || isEditing
                          ? Text(widget.myBike.wheel)
                          : Text("Selecione o aro"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          key: LocalKeys.modelField,
                          initialValue:
                              isShowing || isEditing ? widget.myBike.model : '',
                          onSaved: (model) => _model = model,
                          readOnly: isShowing,
                          autovalidate: true,
                          autocorrect: false,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.view_module,
                              color: Colors.green[200],
                            ),
                            labelText: "Modelo",
                            fillColor: isShowing ? Colors.grey : Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          key: LocalKeys.colorField,
                          initialValue:
                              isShowing || isEditing ? widget.myBike.color : '',
                          onSaved: (color) => _color = color,
                          readOnly: isShowing,
                          autovalidate: true,
                          autocorrect: false,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.color_lens,
                              color: Colors.green[200],
                            ),
                            labelText: "Cor",
                            fillColor: isShowing ? Colors.grey : Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          key: LocalKeys.frameField,
                          initialValue:
                              isShowing || isEditing ? widget.myBike.frame : '',
                          onSaved: (frame) => _frame = frame,
                          readOnly: isShowing,
                          autovalidate: true,
                          autocorrect: false,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.filter_frames,
                              color: Colors.green[200],
                            ),
                            labelText: "Quadro",
                            fillColor: isShowing ? Colors.grey : Colors.white,
                            filled: true,
                          ),
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
                    value: bike.headlight,
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
                SwitchListTile(
                    key: LocalKeys.frontBrakeField,
                    title: Text('Freio Dianteiro'),
                    value: bike.frontBrake,
                    onChanged: isShowing
                        ? null
                        : (bool val) {
                            setState(() {
                              bike.frontBrake = val;
                            });
                          }),
                SizedBox(
                  height: 3.0,
                ),
                SwitchListTile(
                    key: LocalKeys.rearBrakeField,
                    title: Text('Freio Traseiro'),
                    value: bike.rearBrake,
                    onChanged: isShowing
                        ? null
                        : (bool val) {
                            setState(() {
                              bike.rearBrake = val;
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
                            color: _color ?? '',
                            frame: _frame ?? '',
                            frontBrake: bike.frontBrake,
                            headlight: bike.headlight,
                            mirror: bike.mirror,
                            model: _model ?? '',
                            pressure: 50,
                            rearBrake: bike.rearBrake,
                            suspension: bike.suspension,
                            shockAbsorber: bike.shockAbsorber,
                            wheel: bike.wheel,
                          );
                          widget.onSave(_newBike);
                          Navigator.pop(context);
                        },
                      )
              ],
            ),
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
