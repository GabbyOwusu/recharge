import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:recharge/providers/file_provider.dart';
import 'package:recharge/screens/done_screen.dart';
import 'package:recharge/screens/recharge_screen.dart';
import 'package:recharge/widgets/home_card.dart';
import 'package:ussd/ussd.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isRunning = false;

  FileProvider get provider {
    return Provider.of<FileProvider>(context, listen: false);
  }

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
        actions: [
          IconButton(
            icon: Icon(Icons.wallpaper),
            color: Colors.black,
            onPressed: () {
              provider.processImage(ImageSource.gallery).then(
                (val) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Done(),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: HomeCard(
              ontapped: () {
                provider.processImage(ImageSource.camera).then(
                  (val) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Done(),
                      ),
                    );
                  },
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
              ontapped: () {
                Ussd.runUssd('*124#').then(
                  (val) {
                    print(val);
                    setState(() {
                      isRunning = false;
                    });
                  },
                );
              },
              imageAsset: 'images/balance.png',
              label: 'Check your\nairtime balance',
            ),
          ),
        ],
      ),
    );
  }
}
