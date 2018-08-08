import 'package:flutter/material.dart';

class ListDemo extends StatelessWidget {
  static const width = 100.0;

  final String content;

  ListDemo({@required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Demo',
      )),
      body: Container(
        height: 200.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: width,
              color: Colors.red,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context,"SBBBBBBB");
                },
                child: ListTile(
                  title: Text(content),
                ),
              ),
            ),
            Container(
              width: width,
              color: Colors.amber,
            ),
            Container(
              width: width,
              color: Colors.green,
            ),
            Container(
              width: width,
              color: Colors.orange,
            ),
            Container(
              width: width,
              color: Colors.black,
            ),
            Container(
              width: width,
              color: Colors.blue,
            ),
            Container(
              width: width,
              color: Colors.cyanAccent,
            ),
          ],
        ),
      ),
    );
  }
}
