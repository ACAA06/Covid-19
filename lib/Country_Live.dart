import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Countrylive extends StatefulWidget {
  @override
  _CountryliveState createState() => _CountryliveState();
}

class _CountryliveState extends State<Countrylive> {
  Map data={};

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<int> confirmed;
    List<int> recovered;
    List<int> deaths;
    List<int> active;
    List<String> date;
    bool resp;
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    confirmed=data['confirmed'];
    recovered=data['recovered'];
    deaths=data['deaths'];
    active=data['active'];
    date=data['date'];
    resp=data['resp'];
    if(resp){
      return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.red[800],
            title: Text(data['cname']),
            centerTitle: true,
            elevation: 0,
          ),
          body: ListView.builder
            (
              itemCount: date.length,
              itemBuilder: (BuildContext ctxt, int Index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('On  ',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Open Sans',
                            fontSize: 15),),
                        Text(date[Index].substring(0,10),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Confirmed ',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Open Sans',
                              fontSize: 20),),
                        Text(confirmed[Index].toString(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Active   ',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Open Sans',
                              fontSize: 20),),
                        Text(active[Index].toString(),
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
                        Text('Recovered ',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Open Sans',
                              fontSize: 20),),
                        Text(recovered[Index].toString(),
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
                        Text(deaths[Index].toString(),
                          style: TextStyle(
                              color: Colors.red[800],
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Open Sans',
                              fontSize: 20),)
                      ],
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
    else{
      return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.red[800],
          title: Text(data['cname']),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: Text('No data Available!!!'),
        ),
      );
    }
    //print(data);


  }
}
