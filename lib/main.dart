import 'package:flutter/material.dart';
import 'package:melissa_app/layout.dart';
import 'package:melissa_app/pages/login.dart';
import 'package:melissa_app/pages/register.dart';
import 'package:melissa_app/pages/home.dart';
import 'package:melissa_app/pages/hives.dart';
import 'package:melissa_app/pages/about.dart';
import 'package:melissa_app/pages/individual.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  
  final routes = <String, WidgetBuilder>{
    HomePage.tag: (context) => HomePage(),
    AboutPage.tag: (context) => AboutPage(),
    LoginPage.tag: (context) => LoginPage(),
    Individual.tag: (context) => Individual(),
    HivesPage.tag: (context) => HivesPage(),
    RegisterPage.tag: (context) => RegisterPage(),
    LoginPage.tag: (context) => LoginPage(),
    AboutPage.tag: (context) => AboutPage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melissa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorDark: Layout.primary(),
        accentColor: Layout.secondary(),
        brightness: Brightness.light,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          title: TextStyle(
              fontSize: 36,
              fontStyle: FontStyle.italic,
              color: Colors.deepOrange),
          body1: TextStyle(fontSize: 14),
        ),
      ),
      home: HomePage(),
      routes: routes,
    );
  }
}
