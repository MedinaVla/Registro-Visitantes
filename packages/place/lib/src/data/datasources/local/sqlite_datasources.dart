// import 'package:sqflite/sqflite.dart';

import 'dart:io';

import 'package:place/place.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  DatabaseHandler._privateConstructor();
  static final DatabaseHandler instance = DatabaseHandler._privateConstructor();

  // Only allow a single open connection to the database.
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    sqfliteFfiInit();

    var databaseFactory = databaseFactoryFfi;
    String path = Directory.current.path;
    return databaseFactory.openDatabase(join(path, 'qr.db'),
        options: OpenDatabaseOptions(
          onCreate: (database, version) async {
            await database.execute(
              "CREATE TABLE visitantes(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, spell Text, ci INTEGER, credentialNumber INTEGER, placeToGo TEXT, workerName TEXT,dateOfVisit TEXT, timeOfVisit TEXT, timeEnd TEXT)",
            );
            await database.execute(
              "CREATE TABLE places(id INTEGER PRIMARY KEY AUTOINCREMENT, namePlace TEXT, workerName Text)",
            );
          },
          version: 1,
        ));
  }

  Future<int> insertPlaceToGo(PlaceToGo place) async {
    int result = 0;

    final Database? db = await database;
    result = await db!.insert(
      'places',
      place.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return result;
  }

  Future<List<PlaceToGo>> getAllPlaces() async {
    final Database? db = await database;
    final List<Map<String, Object?>> queryResult = await db!.query('places');
    return queryResult.map((e) => PlaceToGo.fromMap(e)).toList();
  }

  Future<void> deleteAllPlaces() async {
    final Database? db = await database;
    await db!.delete('places');
  }
}
