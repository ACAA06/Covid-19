import 'package:http/http.dart';
import 'dart:convert';
class countrydetails{
  List<int> confirmed=[];
  List<int> recovered=[];
  List<int> deaths=[];
  String cname;
  List<int> active=[];
  List<String> date=[];
  bool resp;
  countrydetails(cname){
    this.cname=cname;
  }

  Future<void> getdetails() async {

    try{
      //print(this.cname);
      Response response = await get('https://api.covid19api.com/live/country/'+this.cname);
      List data = jsonDecode(response.body);
      //print(data[0].runtimeType);
      //print(data.length);
      if(data.length!=0){
        this.resp=true;
        this.cname=data[0]['Country'];
      for(var i=0;i<data.length;i++)
        {
          this.confirmed.add(data[i]['Confirmed']);
          this.recovered.add(data[i]['Recovered']);
          this.active.add(data[i]['Active']);
          this.deaths.add(data[i]['Deaths']);
          this.date.add(data[i]['Date']);
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