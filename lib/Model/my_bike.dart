import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MyBike extends Equatable {
  int id;

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

  MyBike({
    @required this.calibragem,
    @required this.reg,
    @required this.color,
    @required this.quadro,
    @required this.amortecedor,
    @required this.freiodiant,
    @required this.freiotras,
    @required this.suspensao,
    @required this.farol,
    @required this.retrovisor,
    @required this.type,
    @required this.aro,
    @required this.modelo
  }) : super([calibragem, reg, color, quadro, amortecedor, freiodiant, freiotras, suspensao, farol, retrovisor, type, aro, modelo]);

  Map<String, dynamic> toMap(){
    return {
      'calibragem' : calibragem,
      'reg' : reg,
      'color' : color,
      'quadro' : quadro,
      'amortecedor' : amortecedor,
      'freiodiant' : freiodiant,
      'freiotras' : freiotras,
      'supensao' : suspensao,
      'farol' : farol,
      'retrovisor' : retrovisor,
      'type' : type,
      'aro' : aro,
      'modelo' : modelo
    };
  }
  static MyBike fromMap(Map<String, dynamic> map){
    return MyBike(
      calibragem: map['calibragem'],
      reg: map['reg'],
      color: map['color'],
      quadro: map['quadro'],
      amortecedor: map['amortecedor'],
      freiodiant: map['freiodiant'],
      freiotras: map['freiotras'],
      suspensao: map['suspensao'],
      farol: map['farol'],
      retrovisor: map['retrovisor'],
      type: map['type'],
      aro: map['aro'],
      modelo: map['modelo']
    );
  }

}