import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class MyBike extends Equatable {
  int id;

  final int pressure;
  final String reg;
  final String color;

  final String frame;
  final String shock_absorber;
  final String frontBrake;
  final String rearBrake;

  final bool suspension;
  final bool headlight;
  final bool mirror;

  final String brand;
  final String wheel;
  final String model;

  MyBike({
    @required this.pressure,
    @required this.reg,
    @required this.color,
    @required this.frame,
    @required this.shock_absorber,
    @required this.frontBrake,
    @required this.rearBrake,
    @required this.suspension,
    @required this.headlight,
    @required this.mirror,
    @required this.brand,
    @required this.wheel,
    @required this.model
  });

  Map<String, dynamic> toMap(){
    return {
      'pressure' : pressure,
      'reg' : reg,
      'color' : color,
      'frame' : frame,
      'absorber' : shock_absorber,
      'frontBrake' : frontBrake,
      'rearBrake' : rearBrake,
      'supensao' : suspension,
      'headlight' : headlight,
      'mirror' : mirror,
      'brand' : brand,
      'wheel' : wheel,
      'model' : model
    };
  }
  static MyBike fromMap(Map<String, dynamic> map){
    return MyBike(
      pressure: map['pressure'],
      reg: map['reg'],
      color: map['color'],
      frame: map['frame'],
      shock_absorber: map['absorber'],
      frontBrake: map['frontBrake'],
      rearBrake: map['rearBrake'],
      suspension: map['suspension'],
      headlight: map['headlight'],
      mirror: map['mirror'],
      brand: map['brand'],
      wheel: map['wheel'],
      model: map['model']
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [pressure, reg, color, frame, shock_absorber, frontBrake, rearBrake, suspension, headlight, mirror, brand, wheel, model];

}