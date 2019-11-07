import 'package:flutter/material.dart';
import 'package:melissa_app/layout.dart';
import 'package:melissa_app/widgets/HomeList.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    return Layout.getContent(
        context, Center(child: Text('Página criada por Victor')));
  }
}
