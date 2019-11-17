import 'package:flutter/material.dart';
import 'package:melissa_app/layout.dart';
import 'package:melissa_app/widgets/HomeList.dart';

class HivesPage extends StatelessWidget {
  static String tag = 'hives-page';

  @override
  Widget build(BuildContext context) {
    final content = HomeList();

    return Layout.getContent(context, content);
  }
}
