import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Maintenance extends Equatable {
  int id;
  final String description;
  final String date;
  final String obs;
  final int idBike;

  Maintenance({
    @required this.description,
    @required this.date,
    @required this.obs,
    @required this.idBike,
  });

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'date': date,
      'observacao': obs,
      'idBike' : idBike,
    };
  }

  static Maintenance fromMap(Map<String, dynamic> map) {
    return Maintenance(
      description: map['description'],
      date: map['date'],
      obs: map['observacao'],
      idBike: map['idBike'],
    );
  }

  @override
  List<Object> get props => [description, date, obs, idBike];

  @override
  String toString() => 'description: $description, date: $date, obs: $obs, idBike: $idBike';
}