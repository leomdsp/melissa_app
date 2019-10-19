/*import 'package:flutter/material.dart';
import 'models/item.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  var items = new List<Item>();

  HomePage() {
    items = [];
    items.add(Item(
        title: "Colméia 1",
        temperature: 10,
        humidity: 20,
        weight: 30,
        done: false));
    items.add(Item(
        title: "Colméia 2",
        temperature: 30,
        humidity: 10,
        weight: 60,
        done: true));
    items.add(Item(
        title: "Colméia 3",
        temperature: 55,
        humidity: 67,
        weight: 12,
        done: false));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Melissa"),
        ),
        body: ListView.builder(
            itemCount: widget.items.length,
            itemBuilder: (BuildContext ctxt, int index) {
              final item = widget.items[index];
              return CheckboxListTile(
                  title: Text(item.title),
                  key: Key(item.title), //Id
                  value: item.done,
                  onChanged: (value) {
                    // setState ()
                  });
            }));
  }
}
*/
