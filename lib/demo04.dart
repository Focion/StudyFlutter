import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _CounterState();
  }
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      children: <Widget>[
        new CounterIncrementor(
          onPress: _increment,
        ),
        new CounterDisplay(
          count: _counter,
        )
      ],
    );
  }

  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }
}

class CounterDisplay extends StatelessWidget {
  final int count;

  CounterDisplay({this.count});

  @override
  Widget build(BuildContext context) {
    return new Text('Count:$count');
  }
}

class CounterIncrementor extends StatelessWidget {
  final VoidCallback onPress;

  CounterIncrementor({this.onPress});

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPress,
      child: new Text('Increment'),
    );
  }
}
