import 'package:ciclo_helper/model/maintenance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'maintenance.dart';

class MaintenanceForm extends StatefulWidget{
  MaintenanceForm({Key key});

  @override
  State<StatefulWidget> createState() => _MaintenanceFormState();

}

class _MaintenanceFormState extends State<MaintenanceForm>{
  MaintenanceBloc _maintenanceBloc;

  final _controllerDesc = TextEditingController();
  final _controllerDate = TextEditingController();
  final _controllerObs = TextEditingController();

  bool get isPopulated =>
      _controllerDesc.text.isNotEmpty && _controllerDate.text.isNotEmpty;

  bool isSubmitButtonEnabled(){
    return isPopulated ;
  }

  @override
  void initState() {
    super.initState();
    _maintenanceBloc = BlocProvider.of<MaintenanceBloc>(context);
    _controllerDesc.addListener(_onDescChanged);
    _controllerDate.addListener(_onDateChanged);
    _controllerObs.addListener(_onObsChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: Form(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    controller: _controllerDesc,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Descrição"),
                    autovalidate: true,
                    autocorrect: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _controllerObs,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Observação"),
                    autovalidate: true,
                    autocorrect: false,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 130,
                      child: TextFormField(
                        keyboardType: TextInputType.datetime,
                        maxLines: 1,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        controller: _controllerDate,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Data",
                        ),
                        autovalidate: true,
                        autocorrect: false,
                      ),
                    ),
                    IconButton(
                      iconSize: 50,
                      color: Color.fromRGBO(0, 100, 30, 1.0),
                      icon: Icon(Icons.add_circle),
                      onPressed: () {
                        if (isSubmitButtonEnabled()){
                          _onFormSubmitted();
                          _controllerDesc.clear();
                          _controllerDate.clear();
                          _controllerObs.clear();
                          setState(() {});
                        }

                      },
                    ),
                  ],
                ),
              ]),
        ),
    );
  }

  @override
  void dispose() {
    _controllerDesc.dispose();
    _controllerDate.dispose();
    _controllerObs.dispose();
    super.dispose();
  }

  void _onDescChanged(){
    _maintenanceBloc.add(DescChanged(desc: _controllerDesc.text));
  }

  void _onDateChanged(){
    _maintenanceBloc.add(DateChanged(date: _controllerDate.text));
  }

  void _onObsChanged(){
    _maintenanceBloc.add(ObsChanged(obs: _controllerObs.text));
  }

  void _onFormSubmitted(){
    _maintenanceBloc.add(
        AddedMaintenance(
          Maintenance(
            description: _controllerDesc.text,
            date: _controllerDesc.text,
            obs: _controllerObs.text,
          )
        )
    );
  }
}