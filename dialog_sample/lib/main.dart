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
      home: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text('AlertDialog'),
            onPressed: () {
              _alertDialogBuilder(context);
            },
          ),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton(
            child: const Text('Dialog'),
            onPressed: () {
              _dialogBuilder(context);
            },
          ),
        ],
      )),
    );
  }

  _alertDialogBuilder(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Title'),
          content: const Text('hello'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  _dialogBuilder(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(80.0),
          child: Dialog(
              child: Scaffold(
            appBar: AppBar(
              title: const Text('Title'),
            ),
            body: const Padding(
              padding: EdgeInsets.all(0.0),
              child: Text('hello'),
            ),
          )),
        );
      },
    );
  }
}
