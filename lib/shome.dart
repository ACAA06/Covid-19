import 'package:covid19/devdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart';
import 'package:covid19/home.dart';
import 'package:time_formatter/time_formatter.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity/connectivity.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  var data1 = [0.0, -2.0, 3.5, -2.0, 0.5, 0.7, 0.8, 1.0, 2.0, 3.0, 3.2];
  Map data = {};
  bool spin = true;
  String formatted;
  bool dataavail = false,
      connect = true;

  void globallist() async {
    try {
      Response response = await get('https://corona.lmao.ninja/v2/all');
      data = jsonDecode(response.body);
      formatted = formatTime(data['updated']);
     // print(formatted);
      //print(data);
      if (data != null) {
        setState(() {
          dataavail = true;
          spin = false;
        });
      }
      else {
        setState(() {
          spin = false;
          dataavail = false;
        });
      }
    }
    catch (e) {
      print(e);
    }
  }

  void connectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    //print(connectivityResult == ConnectivityResult.mobile ||
        //connectivityResult == ConnectivityResult.wifi);
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        connect = true;
        globallist();
      });
    }
    else {
      setState(() {
        connect = false;
        spin=false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    connectivity();
  }

  Material myTextItems(String title, String subtitle) {
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
                      fontFamily: 'Patua' ,
                      color: Colors.blueAccent,
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(subtitle, style: TextStyle(
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


  Material mychart1Items(String title, String priceVal, String subtitle) {
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
                    padding: EdgeInsets.all(1.0),
                    child: Text(priceVal, style: TextStyle(
                      fontSize: 20.0,
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(title, style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Patua' ,
                      color: Colors.blueAccent,
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(subtitle, style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueGrey,
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
    if (connect) {
      if (dataavail && !spin ) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xffff6101),
            title: Text('C-19 Stats',style: TextStyle(
              fontFamily: 'Patua',
              fontSize: 20,
            ),),
            actions: <Widget>[
              IconButton(icon: Icon(
                  Icons.refresh), onPressed: () {
                setState(() {
                  spin = true;
                  dataavail = false;
                  connectivity();
                }); //
              }),
            ],
          ),
          drawer: Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: <Widget>[

                    DrawerHeader(
                      child: Text('C-19 Stats',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'sans',
                            fontSize: 40,
                          )
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffff6101))
                    ),
                    ListTile(
                      title: Text('More Stats',style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w900,
                          fontSize: 20),),
                      enabled: connect,
                      trailing: Icon(FontAwesomeIcons.chartLine),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => home()),);
                      },
                    ),
                    ListTile(
                      title: Text('About',style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w900,
                          fontSize: 20),),
                      trailing: Icon(Icons.person),
                      onTap: () {
                        //print('s');
                        Navigator.pop(context);
                        Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => devdetails()),);
                      },
                    ),
                  ]
              )
          ),
          body: Container(
            color: Color(0xffE5E5E5),
            child: StaggeredGridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: mychart1Items(
                      "World Stats", 'Updated ' + formatted.toString(),
                      data['casesPerOneMillion'].toString() +
                          ' Cases per 1 million'),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: myTextItems("Confirmed", data['cases'].toString()),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: myTextItems("Recovered", data['recovered'].toString()),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: myTextItems("Deaths", data['deaths'].toString()),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: myTextItems("Today",
                      'Cases    ' + data['todayCases'].toString() + '\n' +
                          'Deaths' + '    ' + data['todayDeaths'].toString()),
                ),


              ],
              staggeredTiles: [
                StaggeredTile.extent(4, 250.0),
                StaggeredTile.extent(2, 200.0),
                StaggeredTile.extent(2, 120.0),
                StaggeredTile.extent(2, 120.0),
                StaggeredTile.extent(4, 200.0),
              ],
            ),
          ),
        );
      }
      else {
        if (!dataavail && !spin ) {
          return Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              title: Text('C-19 Stats',style: TextStyle(
              fontFamily: 'Patua',
              fontSize: 20,)),
              backgroundColor: Color(0xffff6101),
              centerTitle: true,
              elevation: 0.0,
              actions: <Widget>[
                IconButton(icon: Icon(
                    Icons.refresh), onPressed: () {
                  setState(() {
                    spin = true;
                    dataavail = false;
                    connectivity();
                  }); //
                }),
              ],
            ),
            drawer: Drawer(
                child: ListView(
                  // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      DrawerHeader(
                        child: Text('C-19 Stats',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            )
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xffff6101),
                        ),
                      ),
                      ListTile(
                        title: Text('More Stats',style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w900,
                            fontSize: 20),),
                        enabled: connect,
                        trailing: Icon(FontAwesomeIcons.chartLine),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => home()),);
                        },
                      ),
                      ListTile(
                        title: Text('About',style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w900,
                            fontSize: 20),),
                        trailing: Icon(Icons.person),
                        enabled: connect,
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => devdetails()),);
                        },
                      ),
                    ]
                )
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('No Data Available Currently!!!',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                        fontSize: 25),
                  ),
                ],
              ),
            ),


          );
        }
        else {
          return Scaffold(
              appBar: AppBar(
                title: Text('C-19 Stats',style: TextStyle(
                  fontFamily: 'Patua',
                  fontSize: 20,)),
                backgroundColor: Color(0xffff6101),
                centerTitle: true,
                elevation: 0.0,
                actions: <Widget>[
                  IconButton(icon: Icon(
                      Icons.refresh), onPressed: () {
                    setState(() {
                      spin = true;
                      dataavail = false;
                      connectivity();
                    }); //
                  }),
                ],
              ),
              drawer: Drawer(
                  child: ListView(
                    // Important: Remove any padding from the ListView.
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        DrawerHeader(
                          child: Text('C-19 Stats',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              )
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffff6101),
                          ),
                        ),
                        ListTile(
                          title: Text('More Stats',style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w900,
                              fontSize: 20),),
                          trailing: Icon(FontAwesomeIcons.chartLine),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => home()),);
                          },
                        ),
                        ListTile(
                          title: Text('About',style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w900,
                              fontSize: 20),),
                          trailing: Icon(Icons.person),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => devdetails()),);
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
      }
    }
    else{
      return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('C-19 Stats',style: TextStyle(
            fontFamily: 'Patua',
            fontSize: 20,)),
          backgroundColor: Color(0xffff6101),
          centerTitle: true,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(icon: Icon(
                Icons.refresh), onPressed: () {
              setState(() {
                spin = true;
                dataavail = false;
                connectivity();
              }); //
            }),
          ],
        ),
        drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text('C-19 Stats',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        )
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffff6101),
                    ),
                  ),
                  ListTile(
                    title: Text('More Stats',style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w900,
                        fontSize: 20),),
                    enabled: connect,
                    trailing: Icon(FontAwesomeIcons.chartLine),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => home()),);
                    },
                  ),
                  ListTile(
                    title: Text('About',style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w900,
                        fontSize: 20),),
                    trailing: Icon(Icons.person),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => devdetails()),);
                    },
                  ),
                ]
            )
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Not Connected to Internet!!!',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Open Sans',
                    fontSize: 25),
              ),
            ],
          ),
        ),


      );
    }
  }
}