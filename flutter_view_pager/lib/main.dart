import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageWidget(),
    );
  }
}

class PageWidget extends StatefulWidget {
  @override
  _PageWidgetState createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  PageController pageController;
  int currentPage = 0;

  @override
  initState() {
    super.initState();
    pageController = PageController(
        initialPage: currentPage, keepPage: false, viewportFraction: 0.8);
  }

  @override
  dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: PageView(
            controller: pageController,
            children: <Widget>[
              _build("hello 1", Colors.red),
              _build("hello 2", Colors.green),
              _build("hello 3", Colors.blue),
            ],
          ),
        ),
      ),
    );
  }

  _build(String title, MaterialColor color) {
    return Center(
        child: SizedBox(
            child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(color: color),
                child: Center(child: Text("Hello1")))));
  }
}
