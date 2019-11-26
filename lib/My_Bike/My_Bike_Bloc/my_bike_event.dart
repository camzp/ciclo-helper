import 'package:ciclo_helper/Model/my_bike.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MyBikeEvent extends Equatable {
  const MyBikeEvent() ;
}

class GotMyBike extends MyBikeEvent{
  final int pressure;
  final String reg;
  final String color;

  final String frame;
  final String absorber;
  final String frontBrake;
  final String rearBrake;

  final bool suspension;
  final bool headlight;
  final bool mirror;

  final String brand;
  final String wheel;
  final String model;

  GotMyBike({
    this.pressure,
    this.reg,
    this.color,
    this.frame,
    this.absorber,
    this.frontBrake,
    this.rearBrake,
    this.suspension,
    this.headlight,
    this.mirror,
    this.brand,
    this.wheel,
    this.model
  });

  @override
  List<Object> get props => [pressure, reg, color, frame, absorber, frontBrake, rearBrake, suspension, headlight, mirror, brand, wheel, model];

}

class LoadedMyBike extends MyBikeEvent{
  @override
  List<Object> get props => [];

}

class DeletedMyBike extends MyBikeEvent{
  final MyBike myBike;

  DeletedMyBike(this.myBike);

  @override
  List<Object> get props => [myBike];
}

class AddedMyBike extends MyBikeEvent{
  final MyBike myBike;

  AddedMyBike(this.myBike);

  @override
  List<Object> get props => [myBike];
}

class UpdatedMyBike extends MyBikeEvent{
  final MyBike myBike;

  UpdatedMyBike(this.myBike);

  @override
  List<Object> get props => [myBike];
}

class ShowedMyBike extends MyBikeEvent{
  final MyBike myBike;

  ShowedMyBike(this.myBike);

  @override
  List<Object> get props => [myBike];
}

class ClearedMyBike extends MyBikeEvent{
  @override
  List<Object> get props => null;

}

class AddedToDeleteList extends MyBikeEvent{
  final MyBike myBike;

  AddedToDeleteList(this.myBike);

  @override
  List<Object> get props => [myBike];
}

