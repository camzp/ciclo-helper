import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ciclo_helper/my_bike_dao.dart';
import './bloc.dart';

class MyBikeBloc extends Bloc<MyBikeEvent, MyBikeState> {
  MyBikeDao _myBikeDao = MyBikeDao();

  @override
  MyBikeState get initialState => MyBikeLoading();

  @override
  Stream<MyBikeState> mapEventToState(MyBikeEvent event,) async* {
    if (event is LoadMyBike) {
      yield MyBikeLoading();
      yield* _reloadMyBike();
    }
    else if (event is AddMyBike) {
      // Loading indicator shouldn't be displayed while adding/updating/deleting
      // a single MyBike from the database - we aren't yielding MyBikesLoading().
      await _myBikeDao.insert(
          event.myBike);
      yield* _reloadMyBike();
    } else if (event is UpdateMyBike) {
      final newMyBike = event.myBike;
      // Keeping the ID of the MyBike the same
      newMyBike.id = event.myBike.id;
      await _myBikeDao.update(newMyBike);
      yield* _reloadMyBike();
    } else if (event is DeleteMyBike) {
      await _myBikeDao.delete(event.myBike);
      yield* _reloadMyBike();
    }
  }

  Stream<MyBikeState> _reloadMyBike() async* {
    final myBikes = await _myBikeDao.getAllSortedByData();
    // Yielding a state bundled with the MyBikes from the database.
    yield MyBikeLoaded(myBikes);
  }
}
