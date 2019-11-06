import 'package:flutter/material.dart';
import 'package:melissa_app/pages/login.dart';
import 'package:melissa_app/pages/cadastrar.dart';
import 'package:melissa_app/pages/home.dart';
import 'package:melissa_app/pages/about.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    HomePage.tag: (context) => HomePage(),
    AboutPage.tag: (context) => AboutPage(),
    Cadastrar.tag: (context) => Cadastrar(),
    LoginPage.tag: (context) => LoginPage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melissa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorDark: Colors.deepOrange,
        accentColor: Colors.grey,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          title: TextStyle(
              fontSize: 36,
              fontStyle: FontStyle.italic,
              color: Colors.blueGrey),
          body1: TextStyle(fontSize: 14),
        ),
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}
