import 'package:flutter/material.dart';

class ImageSelector extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function ontapped;

  const ImageSelector({
    @required this.label,
    @required this.icon,
    @required this.ontapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapped,
      child: Container(
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                icon,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
