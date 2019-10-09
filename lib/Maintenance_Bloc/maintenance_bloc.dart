import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ciclo_helper/Model/maintenance.dart';
import './bloc.dart';

class MaintenanceBloc extends Bloc<MaintenanceEvent, MaintenanceState> {
  @override
  MaintenanceState get initialState => MaintenanceInitial();

  @override
  Stream<MaintenanceState> mapEventToState(
    MaintenanceEvent event,
  ) async* {
    if(event is GetMaintenance){
      final maintenance = Maintenance(descricao : event.descricao, data : event.data, observacao : event.obs);
      yield MaintenanceLoaded(maintenance);
    }
  }
}
