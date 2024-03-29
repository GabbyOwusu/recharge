import 'dart:io';

import 'package:ussd/ussd.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';

import 'package:recharge/providers/baseprovider.dart';
import 'package:recharge/services/fileservice.dart';
import 'package:recharge/services/sl.dart';

class FileProvider extends BaseProvider {
  File _image;
  File get picture => _image;

  String _extractedText;
  String get extracted => _extractedText;
  TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();

  final service = sl.get<FileService>();

  Future<File> getImage(ImageSource imagesorce) async {
    PickedFile picture = await service.cameraImage(imagesorce);
    if (picture.path != null) {
      _image = File(picture.path);
    } else {
      _image = null;
    }
    return _image;
  }

  Future processImage(File visionimage) async {
    if (visionimage != null) {
      FirebaseVisionImage image = FirebaseVisionImage.fromFile(visionimage);
      VisionText text = await textRecognizer.processImage(image);
      for (TextBlock block in text.blocks) {
        final blocknumbers = block.text.replaceAll(new RegExp(r'[^0-9]'), '');
        if (blocknumbers.length == 14) {
          _extractedText = blocknumbers;
          print('Voucher digits here .....$_extractedText');
        } else if (blocknumbers.length == 16) {
          _extractedText = blocknumbers;
          print('16 digits here .....$_extractedText');
        } else if (blocknumbers == null) {
          _extractedText = null;
          print('$blocknumbers is more  than 14 digits. $_extractedText');
        }
      }
    }
    notifyListeners();
  }

  Future<void> runUssd(String code) async {
    if (code == '')
      return;
    else
      await Ussd.runUssd('*134*$code#');
    notifyListeners();
  }
}
