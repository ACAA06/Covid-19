import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid - 19'),
        backgroundColor: Colors.red[800],
        centerTitle: true,
        elevation: 0.0,
      ),
      
    );
  }
}
