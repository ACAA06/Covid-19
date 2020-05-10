import 'package:flutter/material.dart';
import 'package:covid19/home.dart';
import 'package:covid19/Country_Live.dart';
import 'package:covid19/countries.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => home(),
    '/countrylive': (context) => Countrylive(),
    '/countries': (context) => country(),
  },
));

