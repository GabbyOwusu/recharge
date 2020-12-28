import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class OCR {
  TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
  String result = '';

  Future readImage({File pickedimage}) async {
    FirebaseVisionImage image = FirebaseVisionImage.fromFile(pickedimage);
    VisionText text = await textRecognizer.processImage(image);
    print('Texts..........${text.text}');
    // for (TextBlock block in text.blocks) {
    //   for (TextLine line in block.lines) {
    //     for (TextElement word in line.elements) {
    //       print(word.text);
    //       result = word.text;
    //       print('Extracted OCR text $result');
    //       // return result;
    //     }
    //   }
    // }
  }
}
