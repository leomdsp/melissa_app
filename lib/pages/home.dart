import 'package:flutter/material.dart';
import 'package:melissa_app/layout.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final content = Center(child: Text('Hello World'));
    return Layout.getContent(context, content);
  }
}
