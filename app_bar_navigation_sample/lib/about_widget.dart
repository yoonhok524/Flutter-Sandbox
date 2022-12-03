import 'package:app_bar_navigation_sample/menu_drawer.dart';
import 'package:app_bar_navigation_sample/responsive.dart';
import 'package:app_bar_navigation_sample/top_bar_contents.dart';
import 'package:flutter/material.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key});

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
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
        child: Text('about'),
      ),
      drawer: MenuDrawer(),
    );
  }
}
