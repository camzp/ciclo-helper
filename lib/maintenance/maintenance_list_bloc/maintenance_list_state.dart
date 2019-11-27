import 'package:ciclo_helper/model/maintenance.dart';
import 'package:equatable/equatable.dart';

abstract class MaintenanceListState extends Equatable {
  const MaintenanceListState();
}

class MaintenanceListLoading extends MaintenanceListState {
  @override
  List<Object> get props => [];
}

class MaintenanceListLoaded extends MaintenanceListState {
  final List<Maintenance> maintenances;

  const MaintenanceListLoaded(this.maintenances);
  @override
  List<Object> get props => [maintenances];

  @override
  String toString() {
    return 'MaintenanceListLoaded { maintenances: $maintenances}';
  }
}