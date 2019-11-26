import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ciclo_helper/maintenance/maintenance.dart';

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

