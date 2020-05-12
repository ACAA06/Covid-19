import 'package:http/http.dart';
import 'dart:convert';
class countrydetails{
  List<int> confirmed=[];
  List<int> recovered=[];
  List<int> deaths=[];
  String cname;
  List<String> date=[];
  bool resp;
  countrydetails(cname){
    this.cname=cname;
  }

  Future<void> getdetails() async {

    try{
      //print(this.cname);
      Response response = await get('https://pomber.github.io/covid19/timeseries.json');
      Map data = jsonDecode(response.body);
      //print(data[0].runtimeType);
      //print(data[this.cname].length);
      if(data[this.cname].length!=0){
        this.resp=true;
        //this.cname=data[0]['Country'];
        //print(data[this.cname][0]);
      for(var i=0;i<data[this.cname].length;i++)
        {
          this.confirmed.add(data[this.cname][i]['confirmed']);
          this.recovered.add(data[this.cname][i]['recovered']);
          this.deaths.add(data[this.cname][i]['deaths']);
          this.date.add(data[this.cname][i]['date']);
        }}
      else{
        this.resp=false;
      }
         //print(this.date);
    }
    catch (e) {
      print(e);
         }

  }

}