import 'package:ciclo_helper/Maintenance_Bloc/bloc.dart';
import 'package:ciclo_helper/Model/maintenance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaintenancePage extends StatefulWidget {
  @override
  _MaintenancePage createState() => _MaintenancePage();
}

class _MaintenancePage extends State<MaintenancePage> {
  MaintenanceBloc _maintenanceBloc;
  @override
  void dispose() {
    _maintenanceBloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Obtaining the FruitBloc instance through BlocProvider which is an InheritedWidget
    _maintenanceBloc = MaintenanceBloc();
    // Events can be passed into the bloc by calling dispatch.
    // We want to start loading fruits right from the start.
    _maintenanceBloc.dispatch(LoadMaintenance());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black12, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green),
      resizeToAvoidBottomPadding: false,
      body: BlocProvider(
        bloc: _maintenanceBloc,
        child: BlocBuilder(
          bloc: _maintenanceBloc,
          // ignore: missing_return
          builder: (BuildContext context, MaintenanceState state) {
            if(state is MaintenanceLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if(state is MaintenanceLoaded){
              return Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: MaintenanceInput(),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: ListView.builder(
                                        itemCount: state.maintenance.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                              return Text(state.maintenance[index].descricao, style: TextStyle(fontSize: 14,),);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: ListView.builder(
                                        itemCount: state.maintenance.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                              return Text(state.maintenance[index].data, style: TextStyle(fontSize: 14,),);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: ListView.builder(
                                        itemCount: state.maintenance.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                              return Text(state.maintenance[index].observacao, style: TextStyle(fontSize: 14,),);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class MaintenanceInput extends StatefulWidget {
  const MaintenanceInput({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MaintenanceInputState();
}

class _MaintenanceInputState extends State<MaintenanceInput> {
  final controllerDesc = TextEditingController();
  final controllerData = TextEditingController();
  final controllerObs = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          Container(
            width: 300,
            child: TextField(
              style: TextStyle(
                fontSize: 18,
              ),
              controller: controllerDesc,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Descrição"),
            ),
          ),
          Container(
            width: 300,
            child: TextField(
              controller: controllerObs,
              maxLines: 1,
              style: TextStyle(
                fontSize: 18,
              ),
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Observação"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 130,
                child: TextField(
                  keyboardType: TextInputType.datetime,
                  maxLines: 1,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  controller: controllerData,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Data",
                  ),
                ),
              ),
              IconButton(
                iconSize: 50,
                color: Color.fromRGBO(0, 100, 30, 1.0),
                icon: Icon(Icons.add_circle),
                onPressed: () {
                  submitMaintenance(controllerDesc.text, controllerData.text,
                      controllerObs.text);
                  controllerDesc.clear();
                  controllerData.clear();
                  controllerObs.clear();
                  setState(() {});
                },
              ),
            ],
          ),
        ]));
  }

  void submitMaintenance(String descricao, String data, String observacao) {
    final maintenanceBloc = BlocProvider.of<MaintenanceBloc>(context);
    Maintenance _maintenance = Maintenance(descricao: descricao, data: data, observacao: observacao);
    maintenanceBloc.dispatch(AddMaintenance(_maintenance));
  }

  @override
  void dispose() {
    controllerDesc.dispose();
    controllerData.dispose();
    controllerObs.dispose();
    super.dispose();
  }
}
