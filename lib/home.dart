import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Navigator.pushNamed(context, '/countrylive');
            },
          ),
          SizedBox(
            width: double.infinity,
          ),
          RaisedButton(
            child: Text('World stats by Date'),
            padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}
