//import 'package:ciclo_helper/Model/my_bike.dart';
//import 'package:ciclo_helper/app_database.dart';
//import 'package:sembast/sembast.dart';
//
//class MyBikeDao {
//  static const String MY_BIKE_STORE_NAME = 'mybike';
//  final _myBikeStore = intMapStoreFactory.store(MY_BIKE_STORE_NAME);
//
//  Future<Database> get _db async => await AppDatabase.instance.database;
//
//  Future insert(MyBike myBike) async {
//    await _myBikeStore.add(await _db, myBike.toMap());
//  }
//
//  Future update(MyBike myBike) async {
//    // For filtering by key (ID), RegEx, greater than, and many other criteria,
//    // we use a Finder.
//    final finder = Finder(filter: Filter.byKey(myBike.id));
//    await _myBikeStore.update(
//      await _db,
//      myBike.toMap(),
//      finder: finder,
//    );
//  }
//
//  Future delete(MyBike myBike) async {
//    final finder = Finder(filter: Filter.byKey(myBike.id));
//    await _myBikeStore.delete(
//      await _db,
//      finder: finder,
//    );
//  }
//
//  Future deleteAll() async {
//    await _myBikeStore.delete(await _db);
//  }
//
//  Future<List<MyBike>> getAllSortedByData() async {
//    // Finder object can also sort data.
//    final finder = Finder(sortOrders: [
//      SortOrder('reg', false),
//    ]);
//
//    final recordSnapshots = await _myBikeStore.find(
//      await _db,
//      finder: finder,
//    );
//
//    // Making a List<MyBike> out of List<RecordSnapshot>
//    return recordSnapshots.map((snapshot) {
//      final myBike = MyBike.fromMap(snapshot.value);
//      // An ID is a key of a record from the database.
//      myBike.id = snapshot.key;
//      return myBike;
//    }).toList();
//  }
//}