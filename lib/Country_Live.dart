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
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    confirmed=data['confirmed'];
    recovered=data['recovered'];
    deaths=data['deaths'];
    active=data['active'];
    date=data['date'];
    //print(data);
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
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('Date '),
                            Text(date[Index])
                          ],
                        ),
                        SizedBox(width: double.infinity,
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Text('Confirmed '),
                            Text(confirmed[Index].toString())
                          ],
                        ),
                        SizedBox(width: double.infinity,
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Text('Active '),
                            Text(active[Index].toString())
                          ],
                        ),
                        SizedBox(width: double.infinity,
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Text('Recovered '),
                            Text(recovered[Index].toString())
                          ],
                        ),
                        SizedBox(width: double.infinity,
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Text('Deaths '),
                            Text(deaths[Index].toString())
                          ],
                        ),
                        SizedBox(width: double.infinity,
                          height: 30,
                        ),
                      ],
                    );
                  }
              )
          );

  }
}
