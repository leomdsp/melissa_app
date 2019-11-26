import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:melissa_app/pages/about.dart';
import 'pages/home.dart';
import 'pages/hives.dart';
import 'package:melissa_app/widgets/HomeList.dart';
import 'package:melissa_app/pages/individual.dart';
import 'package:melissa_app/pages/args.dart';

class Layout {
  static final pages = [HomePage.tag, HivesPage.tag, AboutPage.tag];
  static int currItem = 0;

  static Scaffold getContent(BuildContext context, content) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(
          child: Text('Melissa'),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currItem,
        fixedColor: primary(),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('Principal')),
          BottomNavigationBarItem(
              icon: Icon(Icons.pages), title: Text('Colmeias')),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), title: Text('Sobre')),
        ],
        onTap: (int i) {
          currItem = i;
          Navigator.of(context).pushReplacementNamed(pages[i]);
        },
      ),
      body: content,
    );
  }

  static Color primary({double opacity = 1}) =>
      Color.fromRGBO(255, 165, 0, opacity);
  static Color secondary({double opacity = 1}) =>
      Color.fromRGBO(247, 120, 0, opacity);
  static Color light({double opacity = 1}) =>
      Color.fromRGBO(242, 234, 228, opacity);
  static Color dark({double opacity = 1}) =>
      Color.fromRGBO(51, 51, 51, opacity);
}
