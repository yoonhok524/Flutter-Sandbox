import 'package:flutter_sqlite/data/dogLocalDataSource.dart';
import 'package:flutter_sqlite/model/dog.dart';


void main() async {

  var dogDataSource = DogLocalDataSource();

  var fido = Dog(
    id: 0,
    name: 'Fido',
    age: 35,
  );

  await dogDataSource.insertDog(fido);

  print("inserted: ${await dogDataSource.dogs()}");

  fido = Dog(
    id: fido.id,
    name: fido.name,
    age: fido.age + 7,
  );
  await dogDataSource.updateDog(fido);

  print("updated: ${await dogDataSource.dogs()}");

  await dogDataSource.deleteDog(fido.id);

  print("deleted: ${await dogDataSource.dogs()}");
}