import 'package:flutter/material.dart';
import 'package:fl_animated_linechart/fl_animated_linechart.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';


/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}

class Individual extends StatelessWidget {
  static String tag = 'individual';
  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  var data1 = [0.0,-2.0,3.5,-2.0,0.5,0.7,0.8,1.0,2.0,3.0,3.2];

  List<CircularStackEntry> circularData = <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(700.0, Color(0xff4285F4), rankKey: 'Q1'),
        new CircularSegmentEntry(1000.0, Color(0xfff3af00), rankKey: 'Q2'),
        new CircularSegmentEntry(1800.0, Color(0xffec3337), rankKey: 'Q3'),
        new CircularSegmentEntry(1000.0, Color(0xff40b24b), rankKey: 'Q4'),
      ],
      rankKey: 'Quarterly Profits',
    ),
  ];

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


  Material myCircularItems(String title, String subtitle){
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

                  Padding(
                    padding:EdgeInsets.all(8.0),
                    child:AnimatedCircularChart(
                      size: const Size(100.0, 100.0),
                      initialChartData: circularData,
                      chartType: CircularChartType.Pie,
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Material temperatureChart(String title) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(title, style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
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

  @override
  Widget build(BuildContext context) {
    Map<DateTime, double> createLineAlmostSaveValues() {
      Map<DateTime, double> data = {};
      data[DateTime.now().subtract(Duration(minutes: 40))] = 25.0;
      data[DateTime.now().subtract(Duration(minutes: 30))] = 25.0;
      data[DateTime.now().subtract(Duration(minutes: 22))] = 25.0;
      data[DateTime.now().subtract(Duration(minutes: 20))] = 24.9;
      data[DateTime.now().subtract(Duration(minutes: 15))] = 25.0;
      data[DateTime.now().subtract(Duration(minutes: 12))] = 25.0;
      data[DateTime.now().subtract(Duration(minutes: 5))] = 25.0;

      return data;
    }
    LineChart chart;
    chart = LineChart.fromDateTimeMaps([createLineAlmostSaveValues()], [Colors.orangeAccent], ['C']);
    
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
                    child:AnimatedLineChart(chart)
                  )
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
                    child:AnimatedLineChart(chart)
                  )
                ),
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