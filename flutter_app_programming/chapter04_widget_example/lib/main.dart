import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget {
  const WidgetApp({super.key});

  @override
  State<WidgetApp> createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<WidgetApp> {
  List _buttonList = ['Add', 'Minus', 'Multiple', 'Divide'];
  List<DropdownMenuItem<String>> _dropDownMeuItems =
      new List.empty(growable: true);
  String? _buttonText;
  String sum = '';
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    for (var item in _buttonList) {
      _dropDownMeuItems.add(DropdownMenuItem(value: item, child: Text(item)));
    }
    _buttonText = _dropDownMeuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widget Example')),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'sum: $sum',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: controller1,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: controller2,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber)),
                child: Row(
                  children: [const Icon(Icons.add), Text('$_buttonText')],
                ),
                onPressed: () {
                  var result;
                  var v1 = double.parse(controller1.text);
                  var v2 = double.parse(controller2.text);
                  switch (_buttonText) {
                    case 'Add':
                      result = v1 + v2;
                      break;
                    case 'Minus':
                      result = v1 - v2;
                      break;
                    case 'Multiple':
                      result = v1 * v2;
                      break;
                    case 'Divide':
                      result = v1 / v2;
                      break;
                    default:
                      result = v1 + v2;
                      break;
                  }
                  setState(() {
                    sum = '$result';
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: DropdownButton(
                items: _dropDownMeuItems,
                onChanged: (String? value) {
                  setState(() {
                    _buttonText = value;
                  });
                },
                value: _buttonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
