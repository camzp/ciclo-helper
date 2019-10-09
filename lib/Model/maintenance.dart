import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Maintenance extends Equatable {
  final String descricao;
  final String data;
  final String observacao;

  Maintenance({
    @required this.descricao,
    @required this.data,
    @required this.observacao
  }) : super([descricao, data, observacao]);
}