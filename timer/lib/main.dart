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
  var time = 0;
  var isRun = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: !isRun,
              child: ElevatedButton(
                  onPressed: () {
                    isRun = true;
                    startTimer();
                  },
                  child: const Text('start')),
            ),
            Visibility(
              visible: isRun,
              child: ElevatedButton(
                  onPressed: () {
                    stopTimer();
                  },
                  child: const Text('stop')),
            ),
            const SizedBox(
              width: 8,
            ),
            Visibility(
              visible: !isRun && time > 0,
              child: ElevatedButton(
                  onPressed: () {
                    clearTimer();
                  },
                  child: const Text('clear')),
            ),
          ],
        ),
        Text(time.toString())
      ],
    );
  }

  void startTimer() {
    print('startTimer[$isRun] - $time');
    if (isRun) {
      setState(() {
        time++;
      });
      Future.delayed(const Duration(milliseconds: 1000), () {
        startTimer();
      });
    }
  }

  void stopTimer() {
    setState(() {
      isRun = false;
    });
  }

  void clearTimer() {
    setState(() {
      time = 0;
    });
  }
}
