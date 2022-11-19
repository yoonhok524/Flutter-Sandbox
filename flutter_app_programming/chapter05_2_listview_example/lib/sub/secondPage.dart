import 'package:flutter/material.dart';

import '../animalItem.dart';

class SecondApp extends StatefulWidget {
  final List<Animal>? list;

  const SecondApp({Key? key, this.list}) : super(key: key);

  @override
  State<SecondApp> createState() => _SecondApp();
}

class _SecondApp extends State<SecondApp> {
  final nameController = TextEditingController();
  int? _radioValue = 0;
  bool? canFly = false;
  String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          TextField(
            controller: nameController,
            keyboardType: TextInputType.text,
            maxLines: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Radio(value: 0, groupValue: _radioValue, onChanged: _radioChange),
              const Text('양서류'),
              Radio(value: 1, groupValue: _radioValue, onChanged: _radioChange),
              const Text('파충류'),
              Radio(value: 2, groupValue: _radioValue, onChanged: _radioChange),
              const Text('포유류'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Can Fly'),
              Checkbox(
                  value: canFly,
                  onChanged: ((value) {
                    setState(() {
                      canFly = value;
                    });
                  }))
            ],
          ),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  child: Image.asset(
                    'repo/images/cow.png',
                    width: 80,
                  ),
                  onTap: () {
                    _imagePath = 'repo/images/cow.png';
                  },
                ),
                GestureDetector(
                  child: Image.asset(
                    'repo/images/pig.png',
                    width: 80,
                  ),
                  onTap: () {
                    _imagePath = 'repo/images/pig.png';
                  },
                ),
                GestureDetector(
                  child: Image.asset(
                    'repo/images/bee.png',
                    width: 80,
                  ),
                  onTap: () {
                    _imagePath = 'repo/images/bee.png';
                  },
                ),
                GestureDetector(
                  child: Image.asset(
                    'repo/images/cat.png',
                    width: 80,
                  ),
                  onTap: () {
                    _imagePath = 'repo/images/cat.png';
                  },
                ),
                GestureDetector(
                  child: Image.asset(
                    'repo/images/dog.png',
                    width: 80,
                  ),
                  onTap: () {
                    _imagePath = 'repo/images/dog.png';
                  },
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                final animal = Animal(
                    imagePath: _imagePath,
                    animalName: nameController.text,
                    kind: _getKind(_radioValue));
                AlertDialog dialog = AlertDialog(
                  title: const Text('Add Animal'),
                  content: Text('${animal.animalName}, ${animal.kind}'),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          widget.list?.add(animal);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Ok')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'))
                  ],
                );
                showDialog(
                  context: context,
                  builder: (context) => dialog,
                );
              },
              child: const Text('Add')),
        ],
      )),
    );
  }

  _radioChange(int? value) {
    setState(() {
      _radioValue = value;
    });
  }

  _getKind(int? radioValue) {
    switch (radioValue) {
      case 0:
        return "양서류";
      case 1:
        return "파충류";
      case 2:
        return "포유류";
    }
  }
}
