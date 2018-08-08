import 'package:flutter/material.dart';
import 'package:flutter_app/demo12.dart' as HTTP;

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('HHHHH'),
      ),
      body: GestureDetector(
        onTap: () {},
        child: FutureBuilder<HTTP.Post>(
          future: HTTP.fetchPost(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Text(
                    '${snapshot.data.userId}',
                    style: TextStyle(color: Colors.blue),
                  ),
                  Text(
                    snapshot.data.title,
                    style: TextStyle(color: Colors.orange),
                  ),
                  Text(
                    snapshot.data.body,
                    style: TextStyle(color: Colors.green),
                  )
                ],
              );
            } else {
              return Text('${snapshot.error}');
            }
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Hero(
            tag: 'HHH',
            child: Center(
              child: Image.network(
                  'https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/lakes/images/lake.jpg'),
            )),
      ),
    );
  }
}
