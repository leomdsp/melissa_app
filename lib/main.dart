import 'package:flutter/material.dart';
import 'package:melissa_app/pages/login.dart';
import 'package:melissa_app/pages/cadastrar.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melissa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: LoginPage(),
      routes: {
        '/cadastrar' : (context) => Cadastrar(),
      },
    );
  }
}
