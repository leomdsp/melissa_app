import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:melissa_app/layout.dart';
import 'package:flutter_rounded_progress_bar/flutter_icon_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  var data;
  var notificationType = new List<int>();
  var notificationIds = new List<String>();

  Future<bool> getData() async{
    if(data != null)
      return true;

    var url = 'http://192.168.11.7/Esp8266/gethome.php';
    http.Response response = await http.get(url);
    var body = response.body;
    data = jsonDecode(body);
    if(data!= null)
      return true;
    return false;
  }

  void _onSearchButtonPressed(String aux) {
    print(aux + " button clicked");
  }

  Material weightBar(){
    var count = 0;
    for(var i = 0; i < data.length; i++){
      if(double.parse(data[i]['peso']) > 5){
        count++;
        notificationType.add(0);
        notificationIds.add(data[i]['chipid']);
        print("shd");
      }
    }

    var per = (count/data.length) * 100;

    return Material(
      color: Colors.white,
      elevation: 10.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child:  Padding(
        padding: const EdgeInsets.all(6.0),
        child: IconRoundedProgressBar(
          icon: Padding(
          padding: EdgeInsets.all(8), 
          child: Icon(Icons.view_stream)),
          margin: EdgeInsets.symmetric(vertical: 16),
          borderRadius: BorderRadius.circular(24),
          percent: per,
          style: RoundedProgressBarStyle(
          colorBackgroundIcon: Colors.white,
          colorProgress: Colors.yellow[200],
          colorProgressDark: Color(0xffc0392b),
          colorBorder: Colors.white24,
          backgroundProgress: Colors.orange[200],
          borderWidth: 4,
          widthShadow: 6),
          ),
      ),
    );
  }

  Material notificationItems(){
    var notificationTitle = [];
    var notificationLabels = ['o mel da colmeia esta pronto para ser coletado', 'A temperatura da colmeia está muito elevada', 'a umidade da colmeia esta muito baixa'];
    var notificationSubtitle = [];

    for (var i = 0; i < notificationType.length; i++) {
      notificationTitle.add("Colmeia " + notificationIds[i]);
      notificationSubtitle.add(notificationLabels[notificationType[i]]);
    }

    print(notificationSubtitle);
    
    return Material(
      color: Colors.white,
      elevation: 10.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
        child: ListView.builder(
         itemBuilder: (context, position) {
            return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                        child: Text(
                          notificationTitle[position],
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                        child: Text(
                          notificationSubtitle[position],
                          style: TextStyle(fontSize: 11.0),
                        ),
                      ),
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: <Widget>[
                  //       Padding(
                  //         padding: const EdgeInsets.all(10.0),
                  //         child: new IconButton(
                  //           icon: new Icon(Icons.restore_from_trash),
                  //           highlightColor: Colors.pink,
                  //           onPressed: (){_onSearchButtonPressed(notificationTitle[position]);},
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          );
        },
        itemCount: notificationTitle.length,
      ),
    );
  }

  List<double> getPercentual(String field, List<double> thresholds){
    var list = new List<double>();
    list.add(0);
    list.add(0);
    list.add(0);
    var aux;
    for (var i = 0; i < data.length; i++) {
      aux = double.parse(data[i][field]);
      if(aux > thresholds[0]){
        list[0]++;
        
      } else{
        if(aux > thresholds[1]){
          list[1]++;
        }else{
          list[2]++;
        }
      }
    }
    return list;
  }

  Material myCircularItems(int aux, String field){
     var title;
     var datas;
    if(aux ==  0){
      List<double> thresholds = new List<double>();
      thresholds.add(40);
      thresholds.add(30);
      datas = getPercentual(field,thresholds);
      title = "Temperatura"; 
    }
    else{ 
      if(aux == 1){
        List<double> thresholds = new List<double>(); 
        thresholds.add(30);
        thresholds.add(20);
        datas = getPercentual(field,thresholds);
        title = "Umidade";
      }
    }
    return Material(
      color: Colors.white,
      elevation: 10.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child:Padding(
          padding: EdgeInsets.all(1.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Text(title,style:TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),),
                  ),
                  Padding(
                    padding:EdgeInsets.all(2.0),
                    child: new AnimatedCircularChart(
                    size: const Size(100.0, 100.0),
                    initialChartData: <CircularStackEntry>[
                      new CircularStackEntry(
                        <CircularSegmentEntry>[
                          new CircularSegmentEntry(
                            datas[2],
                            Colors.blue,
                            rankKey: 'completed',
                          ),
                          new CircularSegmentEntry(
                            datas[1],
                            Colors.green,
                            rankKey: 'remaining',
                          ),
                           new CircularSegmentEntry(
                            datas[0],
                            Colors.red,
                            rankKey: 'remaining',
                          ),
                        ],
                        rankKey: 'progress',
                      ),
                    ],
                    chartType: CircularChartType.Radial,
                    percentageValues: false,
                  )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Layout.getContent(
      context,
      
      Container(
          color:Color(0xffE5E5E5),
          child:FutureBuilder(
          future: Future.wait([
            getData(),
          ]),
          builder: (
            context, 
            AsyncSnapshot<List<bool>> snapshot, 
          ){         
            if (data == null) { 
              return CircularProgressIndicator();
            }
            return StaggeredGridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  
                    myCircularItems(0,'temperatura')
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:   myCircularItems(1,'umidade')
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: weightBar()
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: notificationItems()
                ),
              ],
        staggeredTiles: [
          StaggeredTile.extent(2, 180.0),
          StaggeredTile.extent(2, 180.0),
          StaggeredTile.extent(4, 118.0),
          StaggeredTile.extent(4, 200.0),
        ],
      );
                      }
          )
      ),
    );
  }
}
