
import 'dart:async';

import 'package:ciclo_helper/my_bike/my_bike_bloc/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import 'bloc.dart';

class MyBikeListBloc extends Bloc<MyBikeListEvent, MyBikeListState> {
  final MyBikeBloc myBikeBloc;
  StreamSubscription myBikeSubscription;

  MyBikeListBloc({@required this.myBikeBloc}) {
    myBikeSubscription = myBikeBloc.listen((state) {
      if (state is MyBikeLoaded) {
        add(UpdateList((myBikeBloc.state as MyBikeLoaded).myBikes));
      }
    });
  }

  @override
  MyBikeListState get initialState {
    return myBikeBloc.state is MyBikeLoaded
        ? MyBikeListLoaded(
      (myBikeBloc.state as MyBikeLoaded).myBikes,
    )
        : MyBikeListLoading();
  }

  @override
  Stream<MyBikeListState> mapEventToState(
    MyBikeListEvent event,
  ) async* {
    if (event is UpdateList){
      yield* _mapMyBikesUpdatedToState(event);
    }
  }

  Stream<MyBikeListState> _mapMyBikesUpdatedToState(
      UpdateList event,
      ) async* {
    yield MyBikeListLoaded((myBikeBloc.state as MyBikeLoaded).myBikes,);
  }

  @override
  Future<void> close() {
    myBikeSubscription.cancel();
    return super.close();
  }
}
