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
        actions: _getActions(context),
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

  static List<Widget> _getActions(BuildContext context) {
    List<Widget> items = List<Widget>();

    if (pages[currItem] != HivesPage.tag) {
      return items;
    }

    TextEditingController _c = TextEditingController();
    items.add(GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext ctx) {
              final input = TextFormField(
                controller: _c,
                decoration: InputDecoration(
                    hintText: 'None',
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32))),
              );

              return AlertDialog(
                title: Text('Identificador da coméia'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[input],
                  ),
                ),
                actions: <Widget>[
                  RaisedButton(
                    color: dark(),
                    child: Text('Cancelar',
                        style: TextStyle(color: Layout.light())),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                  ),
                  RaisedButton(
                    color: primary(),
                    child: Text('Adicionar Colméia',
                        style: TextStyle(color: Layout.light())),
                    onPressed: () {
                      HomeList.items.add(
                        Card(
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                              ListTile(
                                onTap: () {
                                   Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => IndividualPage(),
                                      settings: RouteSettings(
                                        arguments: ScreenArguments(
                                          _c.text
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                leading: Icon(Icons.pages),
                                trailing: Icon(Icons.more_vert),
                                title: Text("Colméia: " + _c.text),
                              ),
                              const ListTile(
                                leading: Icon(Icons.whatshot),
                                title: Text("Temperatura: "),
                                dense: true,
                              ),
                              const ListTile(
                                leading: Icon(Icons.cloud),
                                title: Text("Humidade: "),
                                dense: true,
                              ),
                              const ListTile(
                                leading: Icon(Icons.line_weight),
                                title: Text("Peso: "),
                                dense: true,
                              ),
                            ])),
                      );
                      Navigator.of(ctx).pop();
                    },
                  )
                ],
              );
            });
      },
      child: Icon(Icons.add),
    ));

    items.add(Padding(padding: EdgeInsets.only(right: 20)));

    return items;
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
