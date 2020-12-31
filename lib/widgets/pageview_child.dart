import 'package:flutter/material.dart';

class PageViewChild extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  PageViewChild({
    this.description,
    this.image,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 250,
          ),
          SizedBox(height: 50),
          Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 50),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }
}
