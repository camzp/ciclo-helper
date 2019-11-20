//import 'package:ciclo_helper/Model/my_bike.dart';
//import 'package:ciclo_helper/My_Bike_Bloc/bloc.dart';
//import 'package:ciclo_helper/screens/my_bike_list_page.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import '../Model/bike.dart';
//
//
//class MyBikeEdit extends StatefulWidget {
//  @override
//  _MyBikeState createState() => _MyBikeState();
//}
//
//class _MyBikeState extends State<MyBikeEdit>{
//  var selectedType;
//  var wheelType;
//  var modelType;
//  bool _headlight = false;
//  bool _suspension = false;
//  bool _mirror = false;
//  final _bike = Bike();
//  final regController = TextEditingController();
//  final _formKey = GlobalKey<FormState>();
//
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Container(
//          alignment: Alignment.center,
//          child: Text("Minha Bike", style: TextStyle(color: Colors.white)),
//        ),
//      ),
//      body: BlocProvider(
//        bloc: _myBikeBloc,
//        child: BlocBuilder(
//          bloc: _myBikeBloc,
//          builder: (BuildContext context, MyBikeState state){
//            if(state is MyBikeLoading){
//              return Center(
//                child: CircularProgressIndicator(),
//              );
//            }
//            else{
//              return Container(
//                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
//                child: Builder(
//                  builder: (context) => Form(
//                    key: _formKey,
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.stretch,
//                      children: <Widget>[
//                        TextField(
//                          controller: regController,
//                          decoration: InputDecoration(
//                            icon: Icon(Icons.donut_large, color: Colors.green[200],
//                            ),
//                            hintText: 'Código de Registro',
//                            labelText: 'Registro',
//                          ),
//
//                        ),
//                        Row(
//
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[
//                            SizedBox(width: 50),
//                            DropdownButton(
//                              items: _bike.types.map((value) =>DropdownMenuItem(
//                                child: Text(
//                                  value,
//                                  style: TextStyle(color: Colors.grey),
//                                ),
//                                value:value,
//                              )
//                              ).toList(),
//                              onChanged: (selectedBikeType){
//                                setState(() {
//                                  selectedType = selectedBikeType;
//                                });
//                              },
//                              value: selectedType,
//                              hint: Text("Selecione o Tipo"),
//                            ),
//                          ],
//
//                        ),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[
//                            SizedBox(width: 50),
//                            DropdownButton(
//                              items: _bike.wheel.map((value) =>DropdownMenuItem(
//                                child: Text(
//                                  value,
//                                  style: TextStyle(color: Colors.grey),
//                                ),
//                                value:value,
//                              )
//                              ).toList(),
//                              onChanged: (wheel){
//                                setState(() {
//                                  wheelType = wheel;
//                                });
//                              },
//                              value: wheelType,
//                              hint: Text("Selecione o wheel"),
//                            ),
//                          ],
//                        ),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[
//                            SizedBox(width: 50),
//                            DropdownButton(
//                              items: _bike.model.map((value) =>DropdownMenuItem(
//                                child: Text(
//                                  value,
//                                  style: TextStyle(color: Colors.grey),
//                                ),
//                                value:value,
//                              )
//                              ).toList(),
//                              onChanged: (selectedModel){
//                                setState(() {
//                                  modelType = selectedModel;
//                                });
//                              },
//                              value: modelType,
//                              //TODO: Mudar model para fabricante
//                              hint: Text("Selecione o Fabricante"),
//                            ),
//                          ],
//                        ),
//                        SizedBox(height: 20),
//                        Container(
//
//                          child: Text('Adicionais'),
//                        ),
//                        SwitchListTile(
//                            title:Text ('Suspensão'),
//                            value: _suspension,
//                            onChanged: (bool val){
//                              setState(() {
//                                _suspension = val;
//                              });
//                            }
//                        ),
//                        SizedBox(height: 3.0,),
//                        SwitchListTile(
//                            title:Text ('headlight'),
//                            value: _headlight,
//                            onChanged: (bool val){
//                              setState(() {
//                                _headlight = val;
//                              });
//                            }
//                        ),
//                        SizedBox(height: 3.0,),
//                        SwitchListTile(
//                            title:Text ('mirror'),
//                            value: _mirror,
//                            onChanged: (bool val){
//                              setState(() { _mirror = val; });
//                            }
//                        ),
//                        SizedBox(height: 3.0,),
//                        RaisedButton(
//                          child: Text(
//                            "Atualizar",
//                            style: TextStyle(color: Colors.white),
//                          ),
//                          color: Colors.greenAccent,
//                          onPressed: () => submitMyBike(),
//                        )
//                      ],
//                    ),
//                  ),
//                ),
//              );
//            }
//          },
//        ),
//      ),
//    );
//  }
//  void submitMyBike(){
//    //TODO: Ver isso
//    MyBike _myBike = MyBike(reg: regController.text, pressure: 50, color: '50', frame: '50',
//    absorber: '50', frontBrake: '50', rearBrake: '50', suspension: _suspension,
//    headlight: _headlight, mirror:_mirror, wheel: "25", type: "praiana",  model: "Nsei");
//    _myBikeBloc.dispatch(AddMyBike(_myBike));
//    regController.clear();
//    Navigator.push(context, MaterialPageRoute(builder: (context) => MyBikeListPage()));
//  }
//}