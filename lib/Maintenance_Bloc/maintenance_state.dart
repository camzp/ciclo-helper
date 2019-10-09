import 'package:ciclo_helper/Model/maintenance.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MaintenanceState extends Equatable {
  MaintenanceState([List props = const []]) : super(props);
}

class MaintenanceInitial extends MaintenanceState {

}

class MaintenanceLoaded extends MaintenanceState {
  final Maintenance maintenance;

  MaintenanceLoaded(this.maintenance) : super([maintenance]);
}
