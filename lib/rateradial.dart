import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class Rateradial extends StatefulWidget {
  @override
  _RateradialState createState() => _RateradialState();
}

class _RateradialState extends State<Rateradial> {
  Map data={};
  List country;

  
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    double cp=0;
    double dp=0;
    double rp=0;
    List<int> confirmed=[];
    List<int> recovered=[];
    List<int> deaths=[];
    final List<ChartData> chartData = [];
country=data['data'];
    confirmed.add(country[country.length-1]['confirmed']);
    recovered.add(country[country.length-1]['recovered']);
    deaths.add(country[country.length-1]['deaths']);

    confirmed.add(country[country.length-11-1]['confirmed']);
    recovered.add(country[country.length-11-1]['recovered']);
    deaths.add(country[country.length-11-1]['deaths']);




    dp=((deaths[0]-deaths[1])/deaths[1])*100;
    rp=((recovered[0]-recovered[1])/recovered[1])*100;
    cp=((confirmed[0]-confirmed[1])/confirmed[1])*100;

    //print(cp);
    //print(rp);
    //print(dp);
    if(dp==1/0)
      {
        //print(dp);
        dp=0/0;
      }
    if(rp==1/0)
    {
      //print(dp);
      rp=0/0;
    }
    if(cp==1/0)
    {
      //print(cp);
      cp=0/0;
    }
    chartData.add(ChartData('Death rate',dp,Colors.red));
    chartData.add(ChartData('Recovery rate',rp,Colors.green));
    chartData.add(ChartData('Increase in cases %',cp,Colors.amberAccent));


    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
          title: Text(data['cname']+' in last 10 days',style: TextStyle(
            fontFamily: 'Patua',
            fontSize: 20,
          ),),
          backgroundColor: Color(0xffff6101),
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
            child: Container(
                child: SfCircularChart(
                    legend: Legend(isVisible: true),
                    series: <CircularSeries>[
                      // Renders radial bar chart
                      RadialBarSeries<ChartData, String>(
                          dataSource: chartData,
                        maximumValue: 200,
                        innerRadius: '30%',
                        radius: '80%',
                        gap: '2%',
                          pointColorMapper:(ChartData data,  _) => data.color,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => num.parse(data.y.toStringAsFixed(2)),
                          dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                              color: Colors.blue,
                              textStyle: ChartTextStyle(color: Colors.white),
                              labelAlignment: ChartDataLabelAlignment.top
                          ),
                      )
                    ]
                )
            )
        )
      )
    );
  }
}
class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}