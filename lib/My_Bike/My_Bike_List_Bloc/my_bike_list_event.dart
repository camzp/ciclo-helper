import 'package:ciclo_helper/Model/my_bike.dart';
import 'package:equatable/equatable.dart';

abstract class MyBikeListEvent extends Equatable {
  const MyBikeListEvent();
}

class UpdateList extends MyBikeListEvent {
  final List<MyBike> myBikes;

  UpdateList(this.myBikes);

  @override
  List<Object> get props => [myBikes];

  @override
  String toString() => 'UpdateList { myBikes: $myBikes }';
}