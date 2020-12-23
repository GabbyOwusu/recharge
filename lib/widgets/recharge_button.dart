import 'package:flutter/material.dart';

class RechargeButton extends StatelessWidget {
  final Color buttonColor;
  final Color borderColor;
  final String buttonLabel;
  final Color textColor;
  final Function ontapped;

  const RechargeButton({
    @required this.ontapped,
    @required this.textColor,
    this.buttonColor,
    this.borderColor,
    this.buttonLabel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapped,
      child: Expanded(
        flex: 1,
        child: Container(
          margin: EdgeInsets.all(30),
          height: 70,
          width: 100,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: borderColor,
            ),
          ),
          child: Center(
            child: Text(
              buttonLabel,
              style: TextStyle(
                color: textColor,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
