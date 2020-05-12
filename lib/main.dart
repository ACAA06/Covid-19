import 'package:covid19/Worldlatest.dart';
import 'package:flutter/material.dart';
import 'package:covid19/home.dart';
import 'package:covid19/Country_Live.dart';
import 'package:covid19/countries.dart';
import 'package:covid19/loading.dart';
import 'package:covid19/devdetails.dart';
import 'package:covid19/graphdisp.dart';
import 'package:covid19/rateradial.dart';
import 'package:syncfusion_flutter_core/core.dart';

void main() {
  SyncfusionLicense.registerLicense("NT8mJyc2IWhia31ifWN9Z2toYmF8YGJ8ampqanNiYmlmamlmanMDHmgwPzY+Nj0nOTw2amoTND4yOj99MDw+");
  return runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => home(),
    '/countrylive': (context) => Countrylive(),
    '/countries': (context) => country(),
    '/loading': (context) => Loading(),
    '/worldlatest': (context) => worldlatest(),
    '/developerdetails': (context) => devdetails(),
    '/gd':(context)=>Graphdisp(),
    '/radial':(context)=>Rateradial(),
  },
));}

