import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Maintenance extends Equatable {
  int id;
  final String descricao;
  final String data;
  final String observacao;

  Maintenance({
    @required this.descricao,
    @required this.data,
    @required this.observacao
  }) : super([descricao, data, observacao]);

  Map<String, dynamic> toMap() {
    return {
      'descricao': descricao,
      'data': data,
      'observacao': observacao
    };
  }

  static Maintenance fromMap(Map<String, dynamic> map) {
    return Maintenance(
      descricao: map['descricao'],
      data: map['data'],
      observacao: map['observacao']
    );
  }
}