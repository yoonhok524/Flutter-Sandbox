import 'package:flutter/material.dart';

import '../animalItem.dart';

class FirstApp extends StatelessWidget {
  final List<Animal>? list;

  const FirstApp({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
        itemBuilder: (context, position) {
          return GestureDetector(
            child: Card(
              child: Row(children: [
                Image.asset(
                  list![position].imagePath!,
                  height: 100,
                  width: 100,
                ),
                Text(list![position].animalName!)
              ]),
            ),
            onTap: () {
              AlertDialog dialog = AlertDialog(
                content: Text(
                  'this is ${list![position].kind}',
                  style: const TextStyle(fontSize: 30.0),
                ),
              );
              showDialog(
                  context: context, builder: (BuildContext context) => dialog);
            },
          );
        },
        itemCount: list?.length,
      )),
    );
  }
}
