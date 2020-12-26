import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class OCR {
  TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
  VisionText visionText;

  Future readImage({File pickedimage}) async {
    try {
      String value = '';
      FirebaseVisionImage image = FirebaseVisionImage.fromFile(pickedimage);
      VisionText text = await textRecognizer.processImage(image);
      for (TextBlock block in text.blocks) {
        for (TextLine line in block.lines) {
          for (TextElement word in line.elements) {
            value = word.text;
            print('Extracted OCR text $value');
            return value;
          }
        }
      }
    } catch (e) {
      print('Ocr failed because $e');
    }
  }
}
