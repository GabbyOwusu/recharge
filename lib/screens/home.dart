import 'package:flutter/material.dart';
import 'package:recharge/screens/recharge_screen.dart';
import 'package:recharge/widgets/home_card.dart';

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
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: HomeCard(
              ontapped: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RechargeScreen();
                    },
                  ),
                );
              },
              imageAsset: 'images/reload.png',
              label: 'Scan and load\nrecharge card',
            ),
          ),
          SizedBox(height: 20),
          Flexible(
            flex: 1,
            child: HomeCard(
              ontapped: () {},
              imageAsset: 'images/balance.png',
              label: 'Check your\nairtime balance',
            ),
          ),
        ],
      ),
    );
  }
}
