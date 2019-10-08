import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class MaintenanceBloc extends Bloc<MaintenanceEvent, MaintenanceState> {
  @override
  MaintenanceState get initialState => MaintenanceInitial();

  @override
  Stream<MaintenanceState> mapEventToState(
    MaintenanceEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
