import 'package:ciclo_helper/model/my_bike.dart';
import 'package:ciclo_helper/app_database.dart';
import 'package:sembast/sembast.dart';

class MyBikeDao {
  static const String MY_BIKE_STORE_NAME = 'mybike';
  final _myBikeStore = intMapStoreFactory.store(MY_BIKE_STORE_NAME);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(MyBike myBike) async {
    await _myBikeStore.add(await _db, myBike.toMap());
  }

  Future update(MyBike myBike) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(myBike.id));
    await _myBikeStore.update(
      await _db,
      myBike.toMap(),
      finder: finder,
    );
  }

  Future delete(MyBike myBike) async {
    final finder = Finder(filter: Filter.byKey(myBike.id));
    await _myBikeStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future deleteAll() async {
    await _myBikeStore.delete(await _db);
  }

  Future<List<MyBike>> getAllSortedByData() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('reg', false),
    ]);

    final recordSnapshots = await _myBikeStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<MyBike> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final myBike = MyBike.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      myBike.id = snapshot.key;
      return myBike;
    }).toList();
  }

  Future<MyBike> getById(String id) async {
    final finder = Finder(
      filter: Filter.equal('id', id)
    );

    final recordSnapshot = await _myBikeStore.findFirst(await _db, finder:
    finder);

    final myBike = MyBike(
      pressure: recordSnapshot['pressure'],
      reg: recordSnapshot['reg'],
      color: recordSnapshot['color'],
      frame: recordSnapshot['frame'],
      shockAbsorber: recordSnapshot['shock_absorber'],
      frontBrake: recordSnapshot['frontBrake'],
      rearBrake: recordSnapshot['rearBrake'],
      suspension: recordSnapshot['suspension'],
      headlight: recordSnapshot['headlight'],
      mirror: recordSnapshot['mirror'],
      brand: recordSnapshot['brand'],
      wheel: recordSnapshot['wheel'],
      model: recordSnapshot['model']
    );

    myBike.id = recordSnapshot.key;
    return myBike;
  }
}