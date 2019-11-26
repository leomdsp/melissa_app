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

    // for(int i = 0; i< HomeList.items.length; i++){
    //   HomeList.items.removeLast();
    // }
    HomeList.items = [];
    String temperatura,peso,umidade;
    for(var i = 0; i< data.length; i++){
      temperatura = "Temperatura: " + data[i]['temperatura'] + " ºC";
      umidade = "Umidade: " + data[i]['umidade'] + " %";
      peso = "Peso: " + data[i]['peso'] + " Kg";

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
                  ListTile(
                    leading: Icon(Icons.whatshot),
                    title: Text(temperatura),
                    dense: true,
                  ),
                  ListTile(
                    leading: Icon(Icons.cloud),
                    title: Text(umidade),
                    dense: true,
                  ),
                  ListTile(
                    leading: Icon(Icons.line_weight),
                    title: Text(peso),
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

        List<Widget> values = List<Widget>();

        if (HomeList.items.length == 0) {
          values.add(ListTile(
            leading: Icon(Icons.pages),
            title: Text("Nenhuma colméia ainda"),
            trailing: Icon(Icons.more_vert),
          ));
        }

        return ListView(
          shrinkWrap: true,
          children: HomeList.items.length == 0 ? values : HomeList.items
        );
      }
    );
  }
}
