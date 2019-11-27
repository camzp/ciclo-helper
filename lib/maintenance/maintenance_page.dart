import 'package:ciclo_helper/maintenance/maintenance_list_bloc/bloc.dart';
import 'package:ciclo_helper/maintenance/widgets/delete_snackbar.dart';
import 'package:ciclo_helper/maintenance/widgets/maintenance_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ciclo_helper/maintenance/maintenance.dart';

class MaintenancePage extends StatelessWidget {
  MaintenancePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Manutenções'),
        ),
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: <Widget>[
            Expanded(child: MaintenanceForm()),
            Divider(
              thickness: 2,
              color: Colors.black54,
            ),
            Expanded(
              child: BlocBuilder<MaintenanceListBloc, MaintenanceListState>(
                builder: (context, state) {
                  if (state is MaintenanceListLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is MaintenanceListLoaded) {
                    final maintenances = state.maintenances;
                    return ListView.builder(
                        itemCount: maintenances.length,
                        itemBuilder: (BuildContext context, int index) {
                          final maintenance = maintenances[index];
                          return MaintenanceWidget(
                            maintenance: maintenance,
                            onDismissed: (direction) {
                              BlocProvider.of<MaintenanceBloc>(context)
                                  .add(DeletedMaintenance(maintenance));
                              Scaffold.of(context)
                                  .showSnackBar(DeleteMaintenanceSnackBar(
                                maintenance: maintenance,
                                onUndo: () =>
                                    BlocProvider.of<MaintenanceBloc>(context)
                                        .add(AddedMaintenance(maintenance)),
                              ));
                            },
                          );
                        });
                  }
                  return Container();
                },
              ),
            ),
          ],
        ));
  }
}
