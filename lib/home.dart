import 'package:covid19/devdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19/countries.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity/connectivity.dart';

import 'package:http/http.dart';
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List<String> keys=[];
  bool spin=true;
  Map data={};
  bool connect = false;
  void getcountry() async {
    try{
      // make the request
      Response response = await get('https://pomber.github.io/covid19/timeseries.json');
      data = jsonDecode(response.body);
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
    getcountry();
  }
  @override
  Widget build(BuildContext context) {
    print(connect);
    if (connect && !spin) {
      return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Covid - 19'),
          backgroundColor: Colors.red[800],
          centerTitle: true,
          elevation: 0.0,
        ),
        drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text('Covid19',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        )
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                  ListTile(
                    title: Text('STATS'),
                    trailing: Icon(Icons.arrow_right),
                    onTap: () {
                      print('s');
                    },
                  ),
                  ListTile(
                    title: Text('Developer details'),
                    trailing: Icon(Icons.person),
                    onTap: () {
                      print('s');
                      Navigator.pop(context);
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => devdetails()),);
                    },
                  ),
                ]
            )
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[
            RaisedButton(
              child: Text('Stats by Country'),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              onPressed: () {
                Navigator.pushNamed(context, '/loading',
                    arguments: {'data': data, 'keys': keys});
              },
            ),
            SizedBox(
              width: double.infinity,
            ),
            RaisedButton(
              child: Text('World stats Latest'),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              onPressed: () {
                Navigator.pushNamed(context, '/worldlatest');
              },
            ),
          ],
        ),
      );
    }
    else{
      if(connect && spin){
        return Scaffold(
            appBar: AppBar(
              title: Text('World Latest'),
              backgroundColor: Colors.red[800],
              centerTitle: true,
              elevation: 0.0,
            ),
            drawer: Drawer(
                child: ListView(
                  // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      DrawerHeader(
                        child: Text('Covid19',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            )
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                      ),
                      ListTile(
                        title: Text('STATS'),
                        trailing: Icon(Icons.arrow_right),
                        onTap: () {
                          print('s');
                        },
                      ),
                      ListTile(
                        title: Text('Developer details'),
                        trailing: Icon(Icons.person),
                        onTap: () {
                          print('s');
                          Navigator.pop(context);
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => devdetails()),);
                        },
                      ),
                    ]
                )
            ),

            backgroundColor: Colors.grey[200],
            body: Center(
                child: SpinKitRing(
                  color: Colors.red,
                  size: 50.0,
                )
            )
        );
      }
      else{
      return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
          title: Text('Covid - 19'),
    backgroundColor: Colors.red[800],
    centerTitle: true,
    elevation: 0.0,
    ),
        drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text('Covid19',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        )
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                  ListTile(
                    title: Text('STATS'),
                    trailing: Icon(Icons.arrow_right),
                    onTap: () {
                      print('s');
                    },
                  ),
                  ListTile(
                    title: Text('Developer details'),
                    trailing: Icon(Icons.person),
                    onTap: () {
                      print('s');
                      Navigator.pop(context);
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => devdetails()),);
                    },
                  ),
                ]
            )
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
