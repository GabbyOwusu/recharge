import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:recharge/providers/file_provider.dart';
import 'package:recharge/screens/done_screen.dart';
import 'package:recharge/widgets/image_selector_button.dart';

class RechargeScreen extends StatefulWidget {
  @override
  _RechargeScreenState createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  String currentCarrier = 'Vodafone';

  List<String> carriers = [
    'Vodafone',
    'Mtn',
    'AirtelTigo',
  ];

  String carrierImage = 'images/vodafone.png';

  int currentIndex = 3;

  FileProvider get provider {
    return Provider.of<FileProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.all(30),
              child: Row(
                children: [
                  Icon(Icons.help),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                        'Choose your carrier and then select where to get the recharge card image to be scanned'),
                  )
                ],
              ),
            ),
            Spacer(),
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
                  Image.asset(carrierImage, width: 30),
                  SizedBox(width: 10),
                  Expanded(
                    child: DropdownButton<String>(
                      value: currentCarrier,
                      underline: SizedBox(),
                      dropdownColor: Colors.white,
                      isExpanded: true,
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
                          if (currentCarrier == 'Mtn') {
                            carrierImage = 'images/mtn.jpg';
                          } else if (currentCarrier == 'AirtelTigo') {
                            carrierImage = 'images/airteltigo.png';
                          } else if (currentCarrier == 'Vodafone') {
                            carrierImage = 'images/vodafone.png';
                          }
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            ImageSelector(
              icon: Icons.camera,
              label: 'Camera',
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
            ),
            ImageSelector(
              icon: Icons.image,
              label: 'Gallery',
              ontapped: () {
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
      ),
    );
  }
}
