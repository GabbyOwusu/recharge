import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recharge/screens/home.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/illustration.png',
              width: 250,
            ),
            SizedBox(height: 50),
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Lorem ipsum dolor sit amet, consectetur' +
                  'adipiscing \nelit, sed do eiusmod tempor' +
                  'incididunt ut labore\n et dolore magna aliqua.' +
                  'Ut enim ad minim',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      ),
      bottomSheet: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return MyHomePage();
              },
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 30, left: 40, right: 40),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              'Get Started',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
