import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String imageAsset;
  final String label;
  final Function ontapped;

  const HomeCard({
    @required this.imageAsset,
    @required this.label,
    @required this.ontapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapped,
      child: Container(
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.only(left: 40, right: 40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imageAsset,
                width: 100,
              ),
              Spacer(),
              Text(
                label,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
