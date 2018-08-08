import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as Net;
import 'package:shared_preferences/shared_preferences.dart';

Future<Post> fetchPost() async {
  final resp = await Net.get('https://jsonplaceholder.typicode.com/posts/1');
  if (resp.statusCode == 200) {
    return Post.fromJson(json.decode(resp.body));
  } else {
    final code = resp.statusCode;
    return throw Exception('$code');
  }
}

class OOOO {
  getCode() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('');
  }
}

class Post {
  final int userId;

  final String title;

  final String body;

  Post({this.userId, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }
}
