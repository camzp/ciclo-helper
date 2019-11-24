import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ciclo_helper/Model/my_bike.dart';

@immutable
abstract class MyBikeState extends Equatable {
  const MyBikeState();

  @override
  List<Object> get props => [];
}

class MyBikeInitial extends MyBikeState {
  @override
  List<Object> get props => [];

}

class MyBikeLoading extends MyBikeState{
  @override
  List<Object> get props => [];

}

class MyBikeLastLoaded extends MyBikeState{
  final MyBike myBike;

  const MyBikeLastLoaded(this.myBike);

  @override
  List<Object> get props => [myBike];
}

class MyBikeLoaded extends MyBikeState{
  final List<MyBike> myBike;
  final List<MyBike> deleteList;

  const MyBikeLoaded(this.myBike, this.deleteList);

  @override
  List<Object> get props => [myBike];
}
