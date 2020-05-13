import 'package:covid19/devdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19/countries.dart';
import 'dart:convert';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity/connectivity.dart';

import 'package:http/http.dart';
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  var data1 = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  List<String> keys=[];
  bool spin=true;
  Map data={};
  bool connect = false;
  void getcountry() async {
    try{
      // make the request
      Response response = await get('https://pomber.github.io/covid19/timeseries.json');
      data = jsonDecode(response.body);
      keys=[];
      data.forEach((k, v) => keys.add(k));
      print(keys);
      setState(() {
        spin=false;
      });
      //print(response);
    }
    catch (e) {
      print(e);
      //time = 'could not get time';
    }
  }
void connectivity()async{

  var connectivityResult = await (Connectivity().checkConnectivity());
  print(connectivityResult == ConnectivityResult.mobile||connectivityResult == ConnectivityResult.wifi);
  if(connectivityResult == ConnectivityResult.mobile||connectivityResult == ConnectivityResult.wifi)
    {
      setState(() {
        connect=true;
        getcountry();
      });
    }
  else{setState(() {
    connect=false;
  });
  }
}

  @override
  void initState() {
    super.initState();
  connectivity();
  }
  Material myTextItems(String text,String route) {
    return Material(
      color: Colors.cyanAccent,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: RaisedButton(

                      child: Text(text),
                      onPressed: () {
                        Navigator.pushNamed(context, route);
                      },
                    ),
                  ),
                ],
              ),

          ),
        ),

    );
  }

  Material myTextItems1(String text,String route) {
    return Material(
      color: Colors.deepOrangeAccent,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.all(8.0),
                child: RaisedButton(

                  child: Text(text),
                  onPressed: () {
                    Navigator.pushNamed(context, route,
                        arguments: {'data': data, 'keys': keys});
                  },
                ),
              ),
            ],
          ),

        ),
      ),

    );
  }


  Material mychart1Items(String title) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
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
                    padding: EdgeInsets.all(1.0),
                    child: Text(title, style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.blueAccent,
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: new Sparkline(
                      data: data1,
                      lineColor: Color(0xffff6101),
                      pointsMode: PointsMode.all,
                      pointSize: 8.0,
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
  @override
  Widget build(BuildContext context) {
    print(connect);
    if (connect && !spin) {
      return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Covid-19'),
          backgroundColor: Color(0xffff6101),
          centerTitle: true,
          elevation: 0.0,
        ),
        body:Container(
            color: Color(0xffE5E5E5),
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: mychart1Items('Covid-19 Stats'),
            ),
            Padding(
              padding: const EdgeInsets.all( 8.0),
              child: myTextItems("World stats Latest", '/worldlatest'),
            ),
            Padding(
              padding: const EdgeInsets.all( 8.0),
              child: myTextItems1('Stats by Country', '/loading'),
      ),
            Padding(
              padding: const EdgeInsets.all( 8.0),
              child: myTextItems('India Latest', '/indiastates'),
            ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(4, 200.0),
            StaggeredTile.extent(4, 100.0),
            StaggeredTile.extent(4, 100.0),
            StaggeredTile.extent(4, 100.0),
          ],
        ),
        ),
      );
    }
    else{
      if(connect && spin){
        return Scaffold(
            appBar: AppBar(
              title: Text('Covid-19'),
              backgroundColor: Color(0xffff6101),
              centerTitle: true,
              elevation: 0.0,
            ),
            backgroundColor: Colors.grey[200],
            body: Center(
                child: SpinKitRing(
                  color: Color(0xffff6101),
                  size: 50.0,
                )
            )
        );
      }
      else{
      return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
          title: Text('Covid-19'),
    backgroundColor: Color(0xffff6101),
    centerTitle: true,
    elevation: 0.0,
    ),
        body:Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('No data Connectivity',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Open Sans',
                    fontSize: 25),
              ),
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
connectivity();
getcountry();
                  });
                },
              )
            ],
          ),
          ),


      );
    }}
  }
}
