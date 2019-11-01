import 'package:ciclo_helper/Model/maintenance.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MaintenanceEvent extends Equatable {
  MaintenanceEvent([List props = const[]]) : super(props);
}

class GetMaintenance extends MaintenanceEvent{
  final String descricao;
  final String data;
  final String obs;

  GetMaintenance(this.descricao, this.data, this.obs) : super([descricao,data,obs]);
}

class LoadMaintenance extends MaintenanceEvent{

}

class DeleteMaintenance extends MaintenanceEvent{
  Maintenance maintenance;

  DeleteMaintenance(this.maintenance) : super([maintenance]);
}

class AddMaintenance extends MaintenanceEvent{
  Maintenance maintenance;

  AddMaintenance(this.maintenance) : super([maintenance]);
}

class UpdateMaintenance extends MaintenanceEvent{
  Maintenance maintenance;

  UpdateMaintenance(this.maintenance) : super([maintenance]);
}

