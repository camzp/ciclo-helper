import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ciclo_helper/maintenance/maintenance.dart';
import 'package:flutter/widgets.dart';

import './bloc.dart';

class MaintenanceListBloc extends Bloc<MaintenanceListEvent, MaintenanceListState> {
  final MaintenanceBloc maintenanceBloc;
  StreamSubscription maintenanceSubscription;

  MaintenanceListBloc({@required this.maintenanceBloc}) {
    maintenanceSubscription = maintenanceBloc.listen((state) {
      if (state is MaintenanceLoaded) {
        add(UpdateList((maintenanceBloc.state as MaintenanceLoaded).maintenances));
      }
    });
  }

  @override
  MaintenanceListState get initialState {
    return maintenanceBloc.state is MaintenanceLoaded
        ? MaintenanceListLoaded(
      (maintenanceBloc.state as MaintenanceLoaded).maintenances,
    )
        : MaintenanceListLoading();
  }

  @override
  Stream<MaintenanceListState> mapEventToState(
      MaintenanceListEvent event,
      ) async* {
    if (event is UpdateList){
      yield* _mapMyBikesUpdatedToState(event);
    }
  }

  Stream<MaintenanceListState> _mapMyBikesUpdatedToState(
      UpdateList event,
      ) async* {
    yield MaintenanceListLoaded((maintenanceBloc.state as MaintenanceLoaded).maintenances,);
  }

  @override
  Future<void> close() {
    maintenanceSubscription.cancel();
    return super.close();
  }
}
