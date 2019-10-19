import 'package:flutter/material.dart';

void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melissa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.account_balance)),
                Tab(icon: Icon(Icons.add_location)),
                Tab(icon: Icon(Icons.settings)),
              ],
            ),
            title: Text('Melissa'),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.account_balance),
              Icon(Icons.add_location),
              Icon(Icons.settings),
            ],
          ),
        ),
      ),
    );
  }
}
