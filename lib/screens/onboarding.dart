import 'package:flutter/material.dart';
import 'package:recharge/screens/home.dart';
import 'package:recharge/widgets/pageview_child.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentIndex = 0;

  Widget dots() {
    final activeDot = AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 10,
      width: 20,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(5),
      ),
    );
    final inactiveDot = AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 10,
      width: 10,
      margin: EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(5),
      ),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List<Widget>.generate(2, (index) {
        if (index == _currentIndex)
          return activeDot;
        else
          return inactiveDot;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              PageViewChild(
                title: 'Welcome',
                image: 'images/illustration.png',
                description: 'An easier and more convienient way of ' +
                    'topping up \nairtimefrom recharge cards. ' +
                    'Scratch the card gently.\nTake a clear picture of ' +
                    'the section containing the\nvoucher digits for more accurate results.',
              ),
              PageViewChild(
                title: 'Get Started',
                image: 'images/card.png',
                description:
                    '''Thats it!. In a few easy steps, you can top up your \nairtime or easily share voucher code with friends and family. Get started.''',
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 120),
              child: dots(),
            ),
          )
        ],
      ),
      bottomSheet: _currentIndex == 1
          ? GestureDetector(
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
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
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
            )
          : Text(''),
    );
  }
}
