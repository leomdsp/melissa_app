import 'package:flutter/material.dart';
import 'package:fl_animated_linechart/fl_animated_linechart.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Individual extends StatelessWidget {
  static String tag = 'individual';
  var data;

  Future<bool> getData() async{
    var url = 'http://192.168.11.7/Esp8266/getdatos.php';
    http.Response response = await http.get(url);
    var body = response.body;
    data = jsonDecode(body);
    print(data[2]['temperatura']);
    if(data!= null)
      return true;
    return false;
  }

  // Individual(){
  //   getData();
  // }

  Material myTextItems(String title, String subtitle){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
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
                    padding: EdgeInsets.all(8.0),
                    child:Text(subtitle,style:TextStyle(
                      fontSize: 30.0,
                    ),),
                  ),
               ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedLineChart getChart(String field) {
     //getData();
    Map<DateTime, double> createLineAlmostSaveValues(){
    Map<DateTime, double> dataChart = {};

    for (var i = 0; i < data.length; i++) {
      dataChart[DateTime.now().subtract(Duration(minutes: i*-10))] = double.parse(data[i][field]);
    }

      return dataChart;
    }
    LineChart chart;
    chart = LineChart.fromDateTimeMaps([createLineAlmostSaveValues()], [Colors.orangeAccent], ['']);
    return AnimatedLineChart(chart);
  }

  @override
  Widget build(BuildContext context) {

    //getData();

   
    return Scaffold(
      appBar: AppBar(title: Text('Colmeia'), backgroundColor: Color(0xFFF58524)),
      body:Container(
          color:Color(0xffE5E5E5),
          child:StaggeredGridView.count(
            crossAxisCount: 4,
           crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: myTextItems("ID","a1a1"),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: myTextItems("Peso","52 KG"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:  Material(
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              color: Colors.white,
              elevation: 14.0,
  
              child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              
              children: <Widget>[
                 Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center( 
                      child: Text("Temperatura (ºC)", style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),),),
                  ),
                Padding(padding: EdgeInsets.all(10.0)),

                Flexible( 
                  flex: 3, 
                  fit: FlexFit.tight, 
                  child: Container( 
                    padding: EdgeInsets.all(8.0), 
                    child:  FutureBuilder(
                      future: Future.wait([
                        getData(),
                      ]),
                      builder: (
                        context, 
                          // List of booleans(results of all futures above)
                          AsyncSnapshot<List<bool>> snapshot, 
                      ){  
                        if (data == null) { 
                           return CircularProgressIndicator();
                        }
                        return getChart('temperatura');
                      }
                  )
                ),
                ),
              ])
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              color: Colors.white,
              elevation: 14.0,
  
              child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              
              children: <Widget>[
                 Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center( 
                      child: Text("Umidade (%)", style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),),),
                  ),
                Padding(padding: EdgeInsets.all(10.0)),
                 Flexible( 
                  flex: 3, 
                  fit: FlexFit.tight, 
                  child: Container( 
                    padding: EdgeInsets.all(8.0), 
                    child:  FutureBuilder(
                      future: Future.wait([
                        getData(),
                      ]),
                      builder: (
                        context, 
                          // List of booleans(results of all futures above)
                          AsyncSnapshot<List<bool>> snapshot, 
                      ){  
                        if (data == null) { 
                           return CircularProgressIndicator();
                        }
                        return getChart('umidade');
                      }
                  )
                ),
                ),
                // Flexible( 
                //   flex: 3, 
                //   fit: FlexFit.tight, 
                //   child: Container( 
                //     padding: EdgeInsets.all(8.0), 
                //     child: getChart(),
                //   )
                // ),
              ])
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: myCircularItems("Quarterly Profits","68.7M"),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: mychart2Items("Conversion","0.9M","+19% of target"),
          // ),

        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 120.0),
          StaggeredTile.extent(2, 120.0),
          StaggeredTile.extent(10, 300.0),
          StaggeredTile.extent(4, 300.0),
          //StaggeredTile.extent(2, 250.0),
          //StaggeredTile.extent(4, 250.0),
        ],
      ),
      ),
    );
  }
}