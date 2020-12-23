import 'package:flutter/material.dart';

class RechargeScreen extends StatefulWidget {
  @override
  _RechargeScreenState createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  @override
  Widget build(BuildContext context) {
    String currentCarrier;

    List<String> carriers = [
      'Vodafone',
      'Mtn',
      'AirtelTigo',
    ];

    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Scan rechrage card',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'Select your carrier',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.only(left: 30, right: 30),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Image.asset('images/vodafone.png', width: 30),
                  SizedBox(width: 10),
                  Text(
                    currentCarrier ?? 'Select',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Spacer(),
                  DropdownButton<String>(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    elevation: 0,
                    items: carriers.map((String carrier) {
                      return DropdownMenuItem<String>(
                        value: carrier,
                        child: Text(carrier),
                      );
                    }).toList(),
                    onChanged: (newvalue) {
                      setState(() {
                        currentCarrier = newvalue;
                        print('Current carrier $currentCarrier');
                      });
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
