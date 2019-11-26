import 'package:ciclo_helper/model/maintenance.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class MaintenanceEvent extends Equatable {
  const MaintenanceEvent();

  @override
  List<Object> get props => [];
}

class GotMaintenance extends MaintenanceEvent{
  final String description;
  final String date;
  final String obs;

  const GotMaintenance(this.description, this.date, this.obs);

  @override
  List<Object> get props => [description,date,obs];

  @override
  String toString() => 'GotMaitenance{ description: $description, date: $date, obs: $obs }';
}

class LoadedMaintenance extends MaintenanceEvent{

  @override
  String toString() => 'LoadedMaintenance';

}

class DeletedMaintenance extends MaintenanceEvent{
  final Maintenance maintenance;

  const DeletedMaintenance(this.maintenance);

  @override
  List<Object> get props => [maintenance];

  @override
  String toString() => 'DeletedMaintenance { maintenance: $maintenance';
}

class AddedMaintenance extends MaintenanceEvent{
  final Maintenance maintenance;

  const AddedMaintenance(this.maintenance);

  @override
  List<Object> get props => [maintenance];

  @override
  String toString() => 'AddedMaintenance { maintenance: $maintenance';
}

class UpdatedMaintenance extends MaintenanceEvent{
  final Maintenance maintenance;

  const UpdatedMaintenance(this.maintenance);

  @override
  List<Object> get props => [maintenance];

  @override
  String toString() => 'UpdatedMaintenance { maintenance: $maintenance';
}

class DescChanged extends MaintenanceEvent{
  final String desc;

  const DescChanged({@required this.desc});

  @override
  List<Object> get props => [desc];

  @override
  String toString() => 'DescChanged { desc: $desc }';
}

class DateChanged extends MaintenanceEvent{
  final String date;

  const DateChanged({@required this.date});

  @override
  List<Object> get props => [date];

  @override
  String toString() => 'DateChanged { date: $date }';
}

class ObsChanged extends MaintenanceEvent{
  final String obs;

  const ObsChanged({@required this.obs});

  @override
  List<Object> get props => [obs];

  @override
  String toString() => 'ObsChanged { obs: $obs }';
}

