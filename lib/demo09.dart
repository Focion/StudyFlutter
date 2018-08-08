import 'package:flutter/material.dart';
import 'package:flutter_app/demo08.dart';

class LongListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final List<ListItem> items = List.generate(1000,
        (i) => i % 13 == 0 ? TitleItem('Title $i') : ContentItem('Item $i'));
    return Scaffold(
        appBar: AppBar(
          title: Text('LongItem'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final ListItem item = items[index];
            if (item is TitleItem) {
              return ListTile(
                leading: Icon(Icons.access_alarm),
                title: Text(item.title),
              );
            } else if (item is ContentItem) {
              return Dismissible(
                key: Key(item.content),
                background: Container(color: Colors.blue),
                onDismissed: (direction) {
                  items.removeAt(index);
                  Scaffold
                      .of(context)
                      .showSnackBar(SnackBar(content: Text("1111")));
                },
                child: InkWell(
                  onTap: () {
                    _activityForResult(context, item);
                  },
                  onLongPress: () {
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    title: Text(item.content),
                  ),
                ),
              );
            }
          },
        ));
  }

  _activityForResult(BuildContext context, ContentItem item) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ListDemo(
                  content: item.content,
                )));
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(result)));
  }
}

abstract class ListItem {}

class TitleItem extends ListItem {
  final String title;

  TitleItem(this.title);
}

class ContentItem extends ListItem {
  final String content;

  ContentItem(this.content);
}
