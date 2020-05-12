import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class worldlatest extends StatefulWidget {
  @override
  _worldlatestState createState() => _worldlatestState();
}

class _worldlatestState extends State<worldlatest> {
  bool spin=true;
  Map<String,dynamic> data={};
  List<String> keys=[];
  void worldlat() async{

  try{
  //print(this.cname);
  Response response = await get('https://pomber.github.io/covid19/timeseries.json');
   data = jsonDecode(response.body);
  data.forEach((k, v) => keys.add(k));
  print(data);
  setState(() {
    spin=false;
  });
  }
  catch (e){
print(e);
  }
}
  void radialstat(index) {
    Navigator.pushNamed(context, '/radial',
        arguments: {'data': data[keys[index]],'cname': keys[index]});

  }


  @override
  void initState() {
    super.initState();
    worldlat();
    print('yes');
  }

  @override
  Widget build(BuildContext context) {
    if(spin){
      return Scaffold(
          appBar: AppBar(
            title: Text('World Latest'),
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
    else {
      return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.red[800],
          title: Text('World Latest'),
          centerTitle: true,
          elevation: 0,
            actions: <Widget>[
              // action button
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  setState(() { spin=true;
                  worldlat();
                  });
                },
              ),
            ]
        ),
          body: ListView.builder
            (
              itemCount: keys.length,
              itemBuilder: (BuildContext ctxt, int Index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(keys[Index],
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Open Sans',
                                fontSize: 25),)
                        ],
                      ),
                      SizedBox(width: double.infinity,
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.calendar_today,
                          color: Colors.red,
                          size: 24.0,
                        ),
                          Text(data[keys[Index]][data[keys[Index]].length-1]['date'],
                            style: TextStyle(
                                color: Colors.deepPurple[600],
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Open Sans',
                                fontSize: 20),)
                        ],
                      ),
                      SizedBox(width: double.infinity,
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Confirmed ',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Open Sans',
                                fontSize: 20),),
                          Text(data[keys[Index]][data[keys[Index]].length-1]['confirmed'].toString(),
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Open Sans',
                                fontSize: 20),)
                        ],
                      ),
                      SizedBox(width: double.infinity,
                        height: 10,
                      ),
                      SizedBox(width: double.infinity,
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Recovered ',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Open Sans',
                                fontSize: 20),),
                          Text(data[keys[Index]][data[keys[Index]].length-1]['recovered'].toString(),
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Open Sans',
                                fontSize: 20),)
                        ],
                      ),
                      SizedBox(width: double.infinity,
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Deaths   ',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Open Sans',
                                fontSize: 20),),
                          Text(data[keys[Index]][data[keys[Index]].length-1]['deaths'].toString(),
                            style: TextStyle(
                                color: Colors.red[800],
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Open Sans',
                                fontSize: 20),)
                        ],
                      ),
                      SizedBox(width: double.infinity,
                      height:10),
                      IconButton(
                        icon: Icon(Icons.assessment),
                        color: Colors.amber,
                        onPressed: () {
                          radialstat(Index);
                        },
                        iconSize: 40,
                      ),
                      SizedBox(width: double.infinity,
                        height: 30,
                      ),
                    ],
                  ),
                );
              }
          )
      );
    }
  }
}
