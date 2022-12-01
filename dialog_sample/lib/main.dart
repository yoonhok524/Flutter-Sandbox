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

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  var _time1 = "09:00:00";
  var _time2 = "18:00:00";

  @override
  Widget build(BuildContext context) {
    return Center(
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
    ));
  }

  _alertDialogBuilder(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Title'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('time1'),
                  OutlinedButton(
                      onPressed: () {
                        _showTimePicker(context, "time_1", _time1, setState);
                      },
                      child: Text(_time1)),
                  Text('time2'),
                  OutlinedButton(onPressed: () {}, child: Text(_time2))
                ],
              ),
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

  void _showTimePicker(BuildContext context, String timeType, String time,
      StateSetter setState) {
    final timeParts = time.split(':');
    Future<TimeOfDay?> selectedTime = showTimePicker(
      context: context,
      initialTime: TimeOfDay(
          hour: int.parse(timeParts[0]), minute: int.parse(timeParts[1])),
    );
    selectedTime.then((timeOfDay) {
      if (timeType == "time_1") {
        final newTime =
            "${timeOfDay!.hour.toString().padLeft(2, '0')}:${timeOfDay.minute.toString().padLeft(2, '0')}:00";
        print('newTime: $newTime');
        setState(() {
          _time1 = newTime;
        });
      }
    });
  }
}
