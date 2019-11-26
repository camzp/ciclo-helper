import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ciclo_helper/my_bike/my_bike.dart';

class MyBikeBloc extends Bloc<MyBikeEvent, MyBikeState> {
  MyBikeDao _myBikeDao = MyBikeDao();

  @override
  MyBikeState get initialState => MyBikeLoading();

  @override
  Stream<MyBikeState> mapEventToState(MyBikeEvent event,) async* {
    if (event is LoadedMyBike) {
      yield MyBikeLoading();
      yield* _reloadMyBike();
    }

    else if (event is AddedMyBike) {
      // Loading indicator shouldn't be displayed while adding/updating/deleting
      // a single MyBike from the database - we aren't yielding MyBikesLoading().
      await _myBikeDao.insert(
          event.myBike);
      yield MyBikeLoading();
      yield* _reloadMyBike();

    } else if (event is UpdatedMyBike) {
      final newMyBike = event.myBike;
      // Keeping the ID of the MyBike the same
      newMyBike.id = event.myBike.id;
      await _myBikeDao.update(newMyBike);
      yield MyBikeLoading();
      yield* _reloadMyBike();

    } else if (event is DeletedMyBike) {
      await _myBikeDao.delete(event.myBike);
      yield* _reloadMyBike();

    } else if (event is ShowedMyBike) {
      yield MyBikeLastLoaded(event.myBike);

    } else if (event is ClearedMyBike) {
      await _myBikeDao.deleteAll();
      yield* _reloadMyBike();

    }


  }

  Stream<MyBikeState> _reloadMyBike() async* {
    final myBikes = await _myBikeDao.getAllSortedByData();
    // Yielding a state bundled with the MyBikes from the database.
    yield MyBikeLoaded(myBikes);
  }
}
