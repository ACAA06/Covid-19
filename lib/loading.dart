import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Map data={};
  String transit;
  String route;
  List<int> confirmed;
  List<int> recovered;
  List<int> deaths;
  List<String> date;
  String cname,header;
  bool resp;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    route=data['route'];

    if(route=='/countrylive') {
header=data['cname'];
      confirmed=data['confirmed'];
      recovered=data['recovered'];
      deaths=data['deaths'];
      date=data['date'];
      resp=data['resp'];
      cname=data['cname'];
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context,route,arguments: {
          'date': date,
          'confirmed': confirmed,
          'recovered': recovered,
          'deaths': deaths,
          'cname': cname,
          'resp': resp,
        } );});

    }
    else{
      header='Choose a Location';
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, route,
            arguments: {'data': data['data'], 'keys': data['keys']
            });
      });
    }
    //print(data['transit']);
      return Scaffold(
          appBar: AppBar(
            title: Text(header,style: TextStyle(
              fontFamily: 'Patua',
              fontSize: 20,
            ),),
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
}