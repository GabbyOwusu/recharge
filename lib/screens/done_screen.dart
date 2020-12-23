import 'package:flutter/material.dart';
import 'package:recharge/widgets/recharge_button.dart';

class Done extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Voucher code',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey),
              ),
              SizedBox(height: 100),
              Text(
                '8140 8131 1844 47',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 50),
              Text('Your voucher was scanned successfully'),
              SizedBox(height: 50),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: RechargeButton(
                buttonColor: Colors.green,
                borderColor: Colors.transparent,
                textColor: Colors.white,
                buttonLabel: 'Recharge',
                ontapped: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: RechargeButton(
                buttonColor: Colors.transparent,
                borderColor: Colors.green,
                textColor: Colors.green,
                buttonLabel: 'Share',
                ontapped: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
