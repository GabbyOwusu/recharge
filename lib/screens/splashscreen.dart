import 'package:flutter/material.dart';
import 'package:recharge/screens/home.dart';
import 'package:recharge/screens/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool visible = false;

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => MyHomePage()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Onboarding()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 500),
      () {
        setState(() => visible = true);
        Future.delayed(
          Duration(seconds: 3),
          () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Onboarding();
                },
              ),
            );
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
        opacity: visible ? 1 : 0,
        child: Center(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 50,
                fontFamily: 'Montserrat',
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
      ),
    );
  }
}
