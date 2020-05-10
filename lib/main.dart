import 'package:flutter/material.dart';
import 'package:covid19/home.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => home(),
  },
));

