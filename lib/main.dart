import 'package:flutter/material.dart';
import 'package:covid19/home.dart';
import 'package:covid19/Country_Live.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => home(),
    '/countrylive': (context) => countrylive(),
  },
));

