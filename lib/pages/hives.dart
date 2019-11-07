import 'package:flutter/material.dart';
import 'package:melissa_app/layout.dart';
import 'package:melissa_app/widgets/HomeList.dart';

class HivesPage extends StatelessWidget {
  static String tag = 'hives-page';

  @override
  Widget build(BuildContext context) {
    final content = ListView(
      shrinkWrap: true,
      children: <Widget>[
        ListTile(
            leading: Icon(Icons.pages),
            title: Text('First'),
            subtitle: Text('Subtitle'),
            trailing: Icon(Icons.settings_applications))
      ],
    );

    return Layout.getContent(context, content);
  }
}
