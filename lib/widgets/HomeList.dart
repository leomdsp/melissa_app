import 'package:flutter/material.dart';

class HomeList extends StatefulWidget {
  static List<Widget> items = List<Widget>();

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: HomeList.items);
  }
}
