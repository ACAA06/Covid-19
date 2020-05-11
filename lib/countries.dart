import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:covid19/countrydetails.dart';
import 'package:http/http.dart';
class country extends StatefulWidget {
  @override
  _countryState createState() => _countryState();
}

class _countryState extends State<country> {
  Map data={};
  List locations;

  void updatedetails(index) async {
    countrydetails instance = countrydetails(locations[index]['Slug']);
    await instance.getdetails();
    //print(instance.date);
    Navigator.pushNamed(context,'/countrylive',arguments: {
      'date': instance.date,
      'confirmed': instance.confirmed,
      'recovered': instance.recovered,
      'active': instance.active,
      'deaths': instance.deaths,
      'cname': instance.cname,
      'resp': instance.resp,
    } );
  }
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    locations=data['data'];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updatedetails(index);
                  },
                  title: Text(locations[index]['Slug']),

                ),
              ),
            );
          }
      ),
    );
  }
}




