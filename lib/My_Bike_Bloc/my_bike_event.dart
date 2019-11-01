import 'package:ciclo_helper/Model/my_bike.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MyBikeEvent extends Equatable {
  MyBikeEvent([List props = const []]) : super(props);
}

class GetMyBike extends MyBikeEvent{
  final int calibragem;
  final String reg;
  final String color;

  final String quadro;
  final String amortecedor;
  final String freiodiant;
  final String freiotras;

  final bool suspensao;
  final bool farol;
  final bool retrovisor;

  final String type;
  final String aro;
  final String modelo;

  GetMyBike({
    this.calibragem,
    this.reg,
    this.color,
    this.quadro,
    this.amortecedor,
    this.freiodiant,
    this.freiotras,
    this.suspensao,
    this.farol,
    this.retrovisor,
    this.type,
    this.aro,
    this.modelo
  }) : super([calibragem, reg, color, quadro, amortecedor, freiodiant, freiotras, suspensao, farol, retrovisor, type, aro, modelo]);

}

class LoadMyBike extends MyBikeEvent{

}

class DeleteMyBike extends MyBikeEvent{
  MyBike myBike;

  DeleteMyBike(this.myBike) : super([myBike]);
}

class AddMyBike extends MyBikeEvent{
  MyBike myBike;

  AddMyBike(this.myBike) : super([myBike]);
}

class UpdateMyBike extends MyBikeEvent{
  MyBike myBike;

  UpdateMyBike(this.myBike) : super([myBike]);
}

class ShowMyBike extends MyBikeEvent{
  MyBike myBike;

  ShowMyBike(this.myBike) : super([myBike]);
}

class ClearMyBike extends MyBikeEvent{

}

