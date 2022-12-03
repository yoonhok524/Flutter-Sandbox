import 'package:flutter/material.dart';

class TopBarContents extends StatefulWidget {
  const TopBarContents({super.key});

  @override
  State<TopBarContents> createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
                child: Row(
              children: [
                SizedBox(
                  width: screenSize.width / 4,
                ),
                const Text('Sample App'),
                SizedBox(width: screenSize.width / 15),
                InkWell(
                  onHover: (value) {
                    setState(() {
                      _isHovering[0] = value;
                    });
                  },
                  onTap: () {
                    Navigator.of(context).pushNamed('/');
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Home',
                        style: TextStyle(
                            fontWeight: _isHovering[0]
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                      const SizedBox(height: 4),
                      Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[0],
                          child: Container(
                            height: 2,
                            width: 20,
                            color: Colors.lightBlue,
                          ))
                    ],
                  ),
                ),
                SizedBox(width: screenSize.width / 15),
                InkWell(
                  onHover: (value) {
                    setState(() {
                      _isHovering[1] = value;
                    });
                  },
                  onTap: () {
                    Navigator.of(context).pushNamed('/about');
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'About',
                        style: TextStyle(
                            fontWeight: _isHovering[1]
                                ? FontWeight.bold
                                : FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[1],
                          child: Container(
                            height: 2,
                            width: 20,
                            color: Colors.lightBlue,
                          ))
                    ],
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
