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