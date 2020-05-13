import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
class Stategraph extends StatefulWidget {
  @override
  _StategraphState createState() => _StategraphState();
}

class _StategraphState extends State<Stategraph> {
  Map data={};
  String sname;

  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
sname=data['sname'];
    int confirmedCasesIndian,discharged,deaths,confirmedCasesForeign,totalConfirmed;
    totalConfirmed=data['data']['totalConfirmed'];
    confirmedCasesIndian=data['data']['confirmedCasesIndian'];
    discharged=data['data']['discharged'];
    deaths=data['data']['deaths'];
    confirmedCasesForeign=data['data']['confirmedCasesForeign'];
    print(data['data']);
    print(confirmedCasesForeign);
    @override
    final List<StateData> chartData = [
    StateData('totalConfirmed', totalConfirmed,Colors.teal),
    StateData('discharged',discharged,Colors.green),
    StateData('deaths', deaths,Colors.red),
    ];
    return Scaffold(
        appBar: AppBar(
            title: Text(sname,
            style: TextStyle(
              fontSize: 20
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
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(

                    ),
                    legend: Legend(isVisible: true),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <CartesianSeries>[
                      // Renders column chart
                      ColumnSeries<StateData, String>(
                        name: 'Stats till Today',
                          dataSource: chartData,
                          markerSettings: MarkerSettings(isVisible: true),
                          xValueMapper: (StateData sales, _) => sales.label,
                          yValueMapper: (StateData sales, _) => sales.sales,
                        pointColorMapper: (StateData sales, _) => sales.color,
                        animationDuration: 1200
                      )
                    ]
                )
            )
        )
    )
    );
  }
}
class StateData {
  StateData(this.label, this.sales,[this.color]);
  final String label;
  final int sales;
  final Color color;
}