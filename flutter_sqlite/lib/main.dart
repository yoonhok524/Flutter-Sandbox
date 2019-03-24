import 'package:flutter_sqlite/model/dog.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

var database;

void main() async {
  database = openDatabase(
    join(await getDatabasesPath(), 'doggie_database.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
      );
    },
    version: 1,
  );

  var fido = Dog(
    id: 0,
    name: 'Fido',
    age: 35,
  );

  await insertDog(fido);

  print("inserted: ${await dogs()}");

  fido = Dog(
    id: fido.id,
    name: fido.name,
    age: fido.age + 7,
  );
  await updateDog(fido);

  print("updated: ${await dogs()}");

  await deleteDog(fido.id);

  print("deleted: ${await dogs()}");
}

Future<void> insertDog(Dog dog) async {
  final Database db = await database;
  await db.insert(
    'dogs',
    dog.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Dog>> dogs() async {
  final Database db = await database;
  final List<Map<String, dynamic>> maps = await db.query('dogs');

  return List.generate(maps.length, (i) {
    return Dog(
      id: maps[i]['id'],
      name: maps[i]['name'],
      age: maps[i]['age'],
    );
  });
}

Future<void> updateDog(Dog dog) async {
  final db = await database;

  await db.update(
    'dogs',
    dog.toMap(),
    where: "id = ?",
    whereArgs: [dog.id],
  );
}

Future<void> deleteDog(int id) async {
  final db = await database;

  await db.delete(
    'dogs',
    where: "id = ?",
    whereArgs: [id],
  );
}