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
  List data;
  void getcountry() async {
    try{
      // make the request
      Response response = await get('https://api.covid19api.com/countries');
      data = jsonDecode(response.body);
      print(response);
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget>[
          RaisedButton(
            child: Text('Live status by Country'),
            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            onPressed: (){
               Navigator.pushNamed(context, '/loading',arguments: {'data': data, 'transit': '/countries'});
            },
          ),
          SizedBox(
            width: double.infinity,
          ),
          RaisedButton(
            child: Text('World stats by Date'),
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
