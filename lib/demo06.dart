import 'package:flutter/material.dart';

class TabDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            title: Text('OK Tabs'),
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.add),
              ),
              Tab(
                icon: Icon(Icons.add),
              ),
              Tab(
                icon: Icon(Icons.add),
              ),
            ])),
        body: TabBarView(children: [
          Icon(Icons.add),
          Icon(Icons.add),
        ]),
      ),
    );
  }
}
