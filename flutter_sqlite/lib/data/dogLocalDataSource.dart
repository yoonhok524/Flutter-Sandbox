import 'package:flutter_sqlite/model/dog.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DogLocalDataSource {

  var _db;

  DogLocalDataSource() {
    _db = _init();
  }

  Future<Database> get db async {
    if(_db != null)
      return _db;
    _db = await _init();
    return _db;
  }

  Future<void> insertDog(Dog dog) async {
    final Database dbClient = await db;
    await dbClient.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dog>> dogs() async {
    final Database dbClient = await db;
    final List<Map<String, dynamic>> maps = await dbClient.query('dogs');

    return List.generate(maps.length, (i) {
      return Dog(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

  Future<void> updateDog(Dog dog) async {
    final dbClient = await db;

    await dbClient.update(
      'dogs',
      dog.toMap(),
      where: "id = ?",
      whereArgs: [dog.id],
    );
  }

  Future<void> deleteDog(int id) async {
    final dbClient = await db;

    await dbClient.delete(
      'dogs',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<Database> _init() async {
    return openDatabase(
      join(await getDatabasesPath(), 'doggie_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
        );
      },
      version: 1,
    );
  }
}
