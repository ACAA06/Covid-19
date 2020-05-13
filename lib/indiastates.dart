import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'dart:convert';

class States extends StatefulWidget {
  @override
  _StatesState createState() => _StatesState();
}

class _StatesState extends State<States> {
  Map data={};
  bool spin=true,dataavail=false;
  List<String> states=[];
  void statvisual(index)
  {
    Navigator.pushNamed(context,'/stategraph',arguments: {
      'data':data['data']['regional'][index],
      'sname': states[index],
    } );
  }
void statelist()async{
try {
  Response response = await get('https://api.rootnet.in/covid19-in/stats/latest');
   data = jsonDecode(response.body);
   states=[];
   for(var i =0;i<data['data']['regional'].length;i++)
     {
       states.add(data['data']['regional'][i]['loc']);
     }
   if(data['success'])
     {
       setState(() {
         dataavail=true;
         spin=false;
       });
     }
   else{
     setState(() {
       spin=false;
dataavail=false;
     });
   }
}
catch(e){
  print(e);
}
}
  @override
  void initState() {
    super.initState();
statelist();
  }
  @override
  Widget build(BuildContext context) {
    if (spin) {
      return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Color(0xffff6101),
            title: Text('Covid-19'),
            centerTitle: true,
            elevation: 0,
              actions: <Widget>[
                // action button
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    setState(() {
                      statelist();
                      spin=true;
                      dataavail=false;
                    });
                  },
                ),
              ]
          ),
          body: Center(
              child: SpinKitRing(
                color: Color(0xffff6101),
                size: 50.0,
              )
          ));
    }
    else {
      if (dataavail && !spin){
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Color(0xffff6101),
            title: Text('Choose a State'),
            centerTitle: true,
            elevation: 0,
          ),
          body: ListView.builder(
              itemCount: states.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 4.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          statvisual(index);
                          spin = true;
                          statelist();
                        });
                      },
                      title: Text(states[index]),

                    ),
                  ),
                );
              }
          ),
        );
    }
      else{
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: Text('Covid - 19'),
            backgroundColor: Color(0xffff6101),
            centerTitle: true,
            elevation: 0.0,
              actions: <Widget>[
                // action button
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    setState(() {
                      statelist();
                      spin=true;
                      dataavail=false;
                    });
                  },
                ),
              ]
          ),
          body:Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('No Data Available',
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
}
