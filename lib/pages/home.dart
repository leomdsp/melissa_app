import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:melissa_app/layout.dart';
import 'package:melissa_app/widgets/HomeList.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

   var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  var data1 = [0.0,-2.0,3.5,-2.0,0.5,0.7,0.8,1.0,2.0,3.0,3.2];

  void _onSearchButtonPressed() {
    print("search button clicked");
  }

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
     // child: Center(
        child:
              Column(
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
                    "Colmeia 2",
                    style: TextStyle(
                        fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                  child: Text(
                    "O mel da colmeia esta pronto para ser coletado.",
                    style: TextStyle(fontSize: 11.0),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "5m",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new IconButton(
                      icon: new Icon(Icons.restore_from_trash),
                      highlightColor: Colors.pink,
                      onPressed: (){_onSearchButtonPressed();},
                    ),
                  ),
                ],
              ),
           
            ),
      ],
    ),
                                  
            ],
          ),
        );
 
  }


  Material myCircularItems(String title){
    return Material(
      color: Colors.white,
      elevation: 14.0,
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
                            33.33,
                            Colors.blue,
                            rankKey: 'completed',
                          ),
                          new CircularSegmentEntry(
                            33.33,
                            Colors.green,
                            rankKey: 'remaining',
                          ),
                           new CircularSegmentEntry(
                            33.33,
                            Colors.red,
                            rankKey: 'remaining',
                          ),
                        ],
                        rankKey: 'progress',
                      ),
                    ],
                    chartType: CircularChartType.Radial,
                    percentageValues: true,
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
    
    return Layout.getContent(
      context,
      Container(
          color:Color(0xffE5E5E5),
          child:StaggeredGridView.count(
            crossAxisCount: 4,
           crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: myCircularItems("Temperatura"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: myCircularItems("Umidade"),
          ),
           Padding(
            padding: const EdgeInsets.all(6.0),
            child: myTextItems("Notificações","a1a1"),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child:   PieChartSample2(),
          // ),
          
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 200.0),
          StaggeredTile.extent(2, 200.0),
          StaggeredTile.extent(4, 120.0),
          //StaggeredTile.extent(2, 250.0),
        ],
      ),
      ),
    );
  }
}
