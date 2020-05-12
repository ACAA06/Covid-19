import 'package:covid19/Worldlatest.dart';
import 'package:flutter/material.dart';
import 'package:covid19/home.dart';
import 'package:covid19/Country_Live.dart';
import 'package:covid19/countries.dart';
import 'package:covid19/loading.dart';
import 'package:covid19/devdetails.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => home(),
    '/countrylive': (context) => Countrylive(),
    '/countries': (context) => country(),
    '/loading': (context) => Loading(),
    '/worldlatest': (context) => worldlatest(),
    '/developerdetails': (context) => devdetails(),
  },
));

