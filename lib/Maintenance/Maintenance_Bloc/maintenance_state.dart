import 'package:ciclo_helper/Model/maintenance.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MaintenanceState extends Equatable {
  const MaintenanceState() ;

  @override
  List<Object> get props => [];
}

class MaintenanceInitial extends MaintenanceState {
  @override
  List<Object> get props => [];

}

class MaintenanceLoading extends MaintenanceState{
  @override
  List<Object> get props => [];

}

class MaintenanceLoaded extends MaintenanceState {
  final List<Maintenance> maintenance;

  MaintenanceLoaded(this.maintenance);

  @override
  List<Object> get props => [maintenance];
}
