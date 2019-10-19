import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Melissa';
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
              const Text('Colméia 1'),
              Column(
               crossAxisAlignment:CrossAxisAlignment.start,
               children: <Widget>[
                const Icon(Icons.whatshot),
                const Icon(Icons.fitness_center),
                const Icon(Icons.invert_colors),
                ],
              )
              ],
            )
          ],
        ),
      ),
    );
  }
}

