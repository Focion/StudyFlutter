import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ImageWidget(),
          TitleWidget(),
          ButtonsWidget(),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '''Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.''',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeInImage.memoryNetwork(
      fit: BoxFit.fitWidth,
      image:
          'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true',
      placeholder: kTransparentImage,
    );
  }
}

class TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Text(
                'Oeschinen Lake Campground',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 16.0,
                ),
              )
            ],
          )),
          StarWidget(),
        ],
      ),
    );
  }
}

class StarWidget extends StatefulWidget {
  @override
  StarStateWidget createState() => StarStateWidget();
}

class StarStateWidget extends State<StarWidget> {
  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          onPressed: () {
            setState(() {
              isSelect = !isSelect;
            });
          },
          icon: Icon(isSelect ? Icons.star : Icons.star_border),
          color: Colors.red,
        ),
        Text(
          '11',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ButtonWidget(data: Icons.call, text: "CALL"),
          ),
          Expanded(
            child: ButtonWidget(data: Icons.router, text: "ROUTE"),
          ),
          Expanded(
            child: ButtonWidget(data: Icons.share, text: "SHARE"),
          ),
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final IconData data;
  final String text;

  const ButtonWidget({@required this.data, @required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
      },
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(
                data,
                color: Colors.blue,
              )),
          Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 16.0, color: Colors.blue),
              )),
        ],
      ),
    );
  }
}
