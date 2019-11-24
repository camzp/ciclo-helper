import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ciclo_helper/Maintenance/maintenance.dart';

class MaintenancePage extends StatelessWidget{
  MaintenancePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,),
      resizeToAvoidBottomPadding: false,
      body: BlocProvider<MaintenanceBloc>(
        builder: (context) => MaintenanceBloc()..add(LoadedMaintenance()),
        child: Column(
          children: <Widget>[
            MaintenanceForm(),
            Divider(
              thickness: 2,
              color: Colors.black54,
            ),
            BlocBuilder<MaintenanceBloc, MaintenanceState>(
              builder: (context, state){
                if (state is MaintenanceLoading){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is MaintenanceLoaded){
                  return Row(
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          height: 200.0,
                          child: ListView.builder(
                            itemCount: state.maintenance.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return Text(state.maintenance[index].description, style: TextStyle(fontSize: 14,),);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 200.0,
                          child: ListView.builder(
                            itemCount: state.maintenance.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return Text(state.maintenance[index].date, style: TextStyle(fontSize: 14,),);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 200.0,
                          child: ListView.builder(
                            itemCount: state.maintenance.length,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return Text(state.maintenance[index].obs, style: TextStyle(fontSize: 14,),);
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return Container();
                },
            ),
        ],
      )
    )
    );
  }
}

//class MaintenancePage2 extends StatefulWidget {
//  @override
//  _MaintenancePage createState() => _MaintenancePage();
//}
//
//class _MaintenancePage extends State<MaintenancePage> {
//
//
//  @override
//  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
//      statusBarColor: Colors.black12, //or set color with: Color(0xFF0000FF)
//    ));
//    return Scaffold(
//      appBar: AppBar(backgroundColor: Colors.green),
//      resizeToAvoidBottomPadding: false,
//      body: BlocProvider(
//        builder: (context) => ,
//        child: BlocBuilder(
//          bloc: _maintenanceBloc,
//          // ignore: missing_return
//          builder: (BuildContext context, MaintenanceState state) {
//            if(state is MaintenanceLoading){
//              return Center(
//                child: CircularProgressIndicator(),
//              );
//            }
//            else if(state is MaintenanceLoaded){
//              return Column(
//                children: <Widget>[
//                  Expanded(
//                    flex: 2,
//                    child: MaintenanceInput(),
//                  ),
//                  Expanded(
//                    flex: 2,
//                    child: Container(
//                        child: Row(
//                          children: <Widget>[
//                            Expanded(
//                              flex: 2,
//                              child: Column(
//                                children: <Widget>[
//                                  Expanded(
//                                    flex: 1,
//                                    child: Container(
//                                      decoration: BoxDecoration(
//                                        border: Border.all(color: Colors.black),
//                                      ),
//                                      child: ListView.builder(
//                                        itemCount: state.maintenance.length,
//                                        itemBuilder:
//                                            (BuildContext context, int index) {
//                                              return Text(state.maintenance[index].description, style: TextStyle(fontSize: 14,),);
//                                        },
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Expanded(
//                              flex: 1,
//                              child: Column(
//                                children: <Widget>[
//                                  Expanded(
//                                    flex: 1,
//                                    child: Container(
//                                      decoration: BoxDecoration(
//                                        border: Border.all(color: Colors.black),
//                                      ),
//                                      child: ListView.builder(
//                                        itemCount: state.maintenance.length,
//                                        itemBuilder:
//                                            (BuildContext context, int index) {
//                                              return Text(state.maintenance[index].date, style: TextStyle(fontSize: 14,),);
//                                        },
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                            Expanded(
//                              flex: 1,
//                              child: Column(
//                                children: <Widget>[
//                                  Expanded(
//                                    flex: 1,
//                                    child: Container(
//                                      decoration: BoxDecoration(
//                                        border: Border.all(color: Colors.black),
//                                      ),
//                                      child: ListView.builder(
//                                        itemCount: state.maintenance.length,
//                                        itemBuilder:
//                                            (BuildContext context, int index) {
//                                              return Text(state.maintenance[index].obs, style: TextStyle(fontSize: 14,),);
//                                        },
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ],
//                        )),
//                  ),
//                ],
//              );
//            }
//          },
//        ),
//      ),
//    );
//  }
//}
//
//class MaintenanceInput extends StatefulWidget {
//  const MaintenanceInput({
//    Key key,
//  }) : super(key: key);
//
//  @override
//  State<StatefulWidget> createState() => _MaintenanceInputState();
//}
//
//class _MaintenanceInputState extends State<MaintenanceInput> {
//  final controllerDesc = TextEditingController();
//  final controllerDate = TextEditingController();
//  final controllerObs = TextEditingController();
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//          Container(
//            width: 300,
//            child: TextField(
//              style: TextStyle(
//                fontSize: 18,
//              ),
//              controller: controllerDesc,
//              decoration: InputDecoration(
//                  border: OutlineInputBorder(), labelText: "Descrição"),
//            ),
//          ),
//          Container(
//            width: 300,
//            child: TextField(
//              controller: controllerObs,
//              maxLines: 1,
//              style: TextStyle(
//                fontSize: 18,
//              ),
//              decoration: InputDecoration(
//                  border: OutlineInputBorder(), labelText: "Observação"),
//            ),
//          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Container(
//                width: 130,
//                child: TextField(
//                  keyboardType: TextInputType.datetime,
//                  maxLines: 1,
//                  inputFormatters: [
//                    LengthLimitingTextInputFormatter(10),
//                  ],
//                  style: TextStyle(
//                    fontSize: 18,
//                  ),
//                  controller: controllerDate,
//                  decoration: InputDecoration(
//                    border: OutlineInputBorder(),
//                    labelText: "Data",
//                  ),
//                ),
//              ),
//              IconButton(
//                iconSize: 50,
//                color: Color.fromRGBO(0, 100, 30, 1.0),
//                icon: Icon(Icons.add_circle),
//                onPressed: () {
//                  submitMaintenance(controllerDesc.text, controllerDate.text,
//                      controllerObs.text);
//                  controllerDesc.clear();
//                  controllerDate.clear();
//                  controllerObs.clear();
//                  setState(() {});
//                },
//              ),
//            ],
//          ),
//        ]));
//  }
//
//  void submitMaintenance(String description, String data, String observacao) {
//    final maintenanceBloc = BlocProvider.of<MaintenanceBloc>(context);
//    Maintenance _maintenance = Maintenance(description: description, date: data, obs: observacao);
//    maintenanceBloc.dispatch(AddedMaintenance(_maintenance));
//  }
//
//  @override
//  void dispose() {
//    controllerDesc.dispose();
//    controllerDate.dispose();
//    controllerObs.dispose();
//    super.dispose();
//  }
//}
