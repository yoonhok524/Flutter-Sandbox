import 'package:app_bar_navigation_sample/menu_drawer.dart';
import 'package:app_bar_navigation_sample/responsive.dart';
import 'package:app_bar_navigation_sample/top_bar_contents.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0,
              title: const Text(
                'Sample App',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              foregroundColor: Colors.blue,
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 70),
              child: TopBarContents(),
            ),
      body: Container(
        child: Text('hello'),
      ),
      drawer: MenuDrawer(),
    );
  }
}
