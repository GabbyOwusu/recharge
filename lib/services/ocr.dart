// import 'dart:io';

// import 'package:firebase_ml_vision/firebase_ml_vision.dart';

// class OCR {
//   TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
//   String result = '';

//   Future readImage({File pickedimage}) async {
//     FirebaseVisionImage image = FirebaseVisionImage.fromFile(pickedimage);
//     VisionText text = await textRecognizer.processImage(image);
//     print('Texts..........${text.text}');

//   }
// }
