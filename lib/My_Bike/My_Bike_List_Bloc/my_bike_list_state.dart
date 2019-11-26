import 'package:ciclo_helper/Model/models.dart';
import 'package:equatable/equatable.dart';

abstract class MyBikeListState extends Equatable {
  const MyBikeListState();
}

class MyBikeListLoading extends MyBikeListState {
  @override
  List<Object> get props => [];
}

class MyBikeListLoaded extends MyBikeListState {
  final List<MyBike> myBikes;

  const MyBikeListLoaded(this.myBikes);
  @override
  List<Object> get props => [myBikes];

  @override
  String toString() {
    return 'MyBikeListLoaded { myBikes: $myBikes}';
  }
}
