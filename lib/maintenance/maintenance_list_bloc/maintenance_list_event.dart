import 'package:ciclo_helper/model/maintenance.dart';
import 'package:equatable/equatable.dart';

abstract class MaintenanceListEvent extends Equatable {
  const MaintenanceListEvent();
}

class UpdateList extends MaintenanceListEvent{
  final List<Maintenance> maintenances;

  const UpdateList(this.maintenances);

  @override
  List<Object> get props => [maintenances];

  @override
  String toString() => 'UpdateList: {maintenances: $maintenances}';
}
