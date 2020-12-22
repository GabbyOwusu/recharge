import 'dart:ui';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: RichText(
          text: TextSpan(
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
            children: [
              TextSpan(
                text: 'Re',
                style: TextStyle(color: Colors.blue),
              ),
              TextSpan(
                text: 'charge',
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text('Hi'),
              ),
            ),
          ),
          SizedBox(height: 20),
          Flexible(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
