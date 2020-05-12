import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';

 class Graphdisp extends StatefulWidget {
   @override
   _GraphdispState createState() => _GraphdispState();
 }

 class _GraphdispState extends State<Graphdisp> {
   Map data={};
   @override
   Widget build(BuildContext context) {
     data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
     final List<ChartData> confirmedData = [];
     final List<ChartData> deathData = [];
     final List<ChartData> recoveredData = [];
     double j=0;
     print(data['deaths']);
     print(data['date'][0].runtimeType);
       for(var i=data['date'].length - 16;i<data['date'].length;i++)
       {
         confirmedData.add(ChartData(j,data['confirmed'][i]));
         j++;
         if(j==15)
           {
             break;
           }
       }
      j =0;
     for(var i=data['date'].length - 16;i<data['date'].length;i++)
     {
       deathData.add(ChartData(j,data['deaths'][i]));
       j++;
       if(j==15)
       {
         break;
       }
     }
     j =0;
     for(var i=data['date'].length - 16;i<data['date'].length;i++)
     {
       recoveredData.add(ChartData(j,data['recovered'][i]));
       j++;
       if(j==15)
       {
         break;
       }
     }
     return Scaffold(
         backgroundColor: Colors.grey[200],
         appBar: AppBar(
           title: Text(data['cname']+' last 15 days'),
           backgroundColor: Colors.red[800],
           centerTitle: true,
           elevation: 0.0,
             actions: <Widget>[
               // action button
               IconButton(
                 icon: Icon(Icons.refresh),
                 onPressed: () {
                   setState(() {
                   });
                 },
               ),
             ]
         ),
         body: Center(
             child: SfTheme(
     data: SfThemeData(
     chartThemeData: SfChartThemeData(
         brightness: Brightness.dark,
       backgroundColor: Colors.grey[900],
     )
     ),
     child:Container(
                 child: SfCartesianChart(

                     legend: Legend(isVisible: true),
                     plotAreaBorderWidth: 0,
                     tooltipBehavior: TooltipBehavior(enable: true),
                     series: <ChartSeries>[
                       LineSeries<ChartData, double>(
                         color: Colors.amberAccent,
                           dataSource: confirmedData,
                           name: 'Confirmed',
                           enableTooltip: true,
                     markerSettings: MarkerSettings(isVisible: true),
                           xValueMapper: (ChartData sales, _) => sales.x,
                           yValueMapper: (ChartData sales, _) => sales.y
                       ),
                       LineSeries<ChartData, double>(
                         color: Colors.green,
                           dataSource: recoveredData,
                           name: 'Recovered',
                           enableTooltip: true,
                           markerSettings: MarkerSettings(isVisible: true),
                           xValueMapper: (ChartData sales, _) => sales.x,
                           yValueMapper: (ChartData sales, _) => sales.y
                       ),
                       LineSeries<ChartData, double>(
                         color:Colors.red,
                           dataSource: deathData,
                           name: 'Death',
                           enableTooltip: true,
                           markerSettings: MarkerSettings(isVisible: true),
                           xValueMapper: (ChartData sales, _) => sales.x,
                           yValueMapper: (ChartData sales, _) => sales.y
                       ),
                     ]
                 )
             )
         ))
     );
   }
 }

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final int y;
}