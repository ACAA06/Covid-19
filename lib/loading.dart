import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'dart:async';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Map data={};
  String transit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    Future.delayed(Duration(seconds: 4),(){
      Navigator.pushReplacementNamed(context,data['transit'] , arguments: {'data': data['data']
      });
    });

    //print(data['transit']);
    return Scaffold(
        appBar: AppBar(
          title: Text('Covid - 19'),
          backgroundColor: Colors.red[800],
          centerTitle: true,
          elevation: 0.0,
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