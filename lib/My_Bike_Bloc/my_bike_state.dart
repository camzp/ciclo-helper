import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ciclo_helper/Model/my_bike.dart';

@immutable
abstract class MyBikeState extends Equatable {
  MyBikeState([List props = const []]) : super(props);
}

class MyBikeInitial extends MyBikeState {

}

class MyBikeLoading extends MyBikeState{

}

class MyBikeLoaded extends MyBikeState{
  final List<MyBike> myBike;

  MyBikeLoaded(this.myBike) : super([myBike]);
}
