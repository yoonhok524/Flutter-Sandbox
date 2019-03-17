import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                print('Menu button');
              }),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
            ),
            IconButton(
              icon: Icon(
                Icons.tune,
                color: Colors.white,
              ),
            )
          ],
          title: Text('Todos'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          childAspectRatio: 8.0 / 9.0,
          children: _buildGridCards(10),
        ));
  }
  
  List<Card> _buildGridCards(int count) {
    return List.generate(count, (int index) => Card(
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 18.0 / 11.0,
            child: Image.asset('images/postit.jpg'),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Title ${index}'),
                SizedBox(height: 8.0),
                Text('Secondary Text'),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
