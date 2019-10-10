import 'package:ciclo_helper/Model/maintenance.dart';
import 'package:ciclo_helper/app_database.dart';
import 'package:sembast/sembast.dart';

class MaintenanceDao {
  static const String MAINTENANCE_STORE_NAME = 'maintenances';
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Maintenance objects converted to Map
  final _maintenanceStore = intMapStoreFactory.store(MAINTENANCE_STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Maintenance maintenance) async {
    await _maintenanceStore.add(await _db, maintenance.toMap());
  }

  Future update(Maintenance maintenance) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(maintenance.id));
    await _maintenanceStore.update(
      await _db,
      maintenance.toMap(),
      finder: finder,
    );
  }

  Future delete(Maintenance maintenance) async {
    final finder = Finder(filter: Filter.byKey(maintenance.id));
    await _maintenanceStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<Maintenance>> getAllSortedByData() async {
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [
      SortOrder('data', false),
    ]);

    final recordSnapshots = await _maintenanceStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<Maintenance> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final maintenance = Maintenance.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      maintenance.id = snapshot.key;
      return maintenance;
    }).toList();
  }
}