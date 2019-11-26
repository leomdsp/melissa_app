import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:melissa_app/pages/args.dart';
import 'package:melissa_app/pages/individual.dart';

class HomeList extends StatefulWidget {
  static List<Widget> items = List<Widget>();

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
    var data;

   Future<bool> getData(String user_id) async{
    if(data != null)
      return true;

    var url = 'https://melissabeehives.000webhostapp.com/Esp8266/gethome.php?user_id=' + user_id;
    http.Response response = await http.get(url);
    var body = response.body;
    data = jsonDecode(body);

    for(var i = 0; i< data.length; i++){
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
                        data[i]['chipid']
                            ),
                          ),
                        ),
                      );
                    },
                    leading: Icon(Icons.pages),
                    trailing: Icon(Icons.more_vert),
                    title: Text("Colméia: " + data[i]['chipid']),
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
    }

    if(data!= null)
      return true;
      
    return false;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> values = List<Widget>();

    for(int i = 0; i< HomeList.items.length; i++){
      HomeList.items.removeLast();
    }

    if (HomeList.items.length == 0) {
      values.add(ListTile(
        leading: Icon(Icons.pages),
        title: Text("Nenhuma colméia ainda"),
        trailing: Icon(Icons.more_vert),
      ));
    }

    return FutureBuilder(
      future: Future.wait([
        getData("0"), //Manda o id que tu quer pegar aq
      ]),
      builder: (
        context, 
        AsyncSnapshot<List<bool>> snapshot, 
      ){
        if (data == null) { 
          return CircularProgressIndicator();
        }

        return ListView(
          shrinkWrap: true,
          children: HomeList.items.length == 0 ? values : HomeList.items
        );
      }
    );
  }
}
