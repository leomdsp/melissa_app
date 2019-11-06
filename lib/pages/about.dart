import 'package:flutter/material.dart';
import 'package:melissa_app/layout.dart';

class AboutPage extends StatelessWidget {
  static String tag = 'about-page';

  @override
  Widget build(BuildContext context) {
    return Layout.getContent(context, Center(child: Text('Teste')));
  }
}
