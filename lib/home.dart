import 'package:covid19/devdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19/countries.dart';
import 'dart:convert';
import 'package:http/http.dart';
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List<String> keys=[];
  Map data={};
  void getcountry() async {
    try{
      // make the request
      Response response = await get('https://pomber.github.io/covid19/timeseries.json');
      data = jsonDecode(response.body);
      data.forEach((k, v) => keys.add(k));
      print(keys);
      //print(response);
    }
    catch (e) {
      print(e);
      //time = 'could not get time';
    }
  }

  @override
  void initState() {
    super.initState();
    getcountry();
  }
  @override
  Widget build(BuildContext context) {
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => devdetails()),);
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
            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            onPressed: (){
               Navigator.pushNamed(context, '/loading',arguments: {'data': data, 'keys': keys});
            },
          ),
          SizedBox(
            width: double.infinity,
          ),
          RaisedButton(
            child: Text('World stats Latest'),
            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            onPressed: (){
              Navigator.pushNamed(context, '/worldlatest');
            },
          ),
        ],
      ),
    );
  }
}
