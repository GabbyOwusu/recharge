import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:recharge/providers/baseprovider.dart';
import 'package:recharge/services/fileservice.dart';
import 'package:recharge/services/ocr.dart';
import 'package:recharge/services/sl.dart';

class FileProvider extends BaseProvider {
  File _image;

  String _extractedText = '';
  String get extracted => _extractedText;

  final service = sl.get<FileService>();
  final ocr = sl.get<OCR>();

  Future getImage(ImageSource imagesorce) async {
    final picture = await service.cameraImage(imagesorce);
    if (picture != null) {
      _image = File(picture.path);
      return _image;
    } else {
      print('No image selected');
    }
    notifyListeners();
  }

  Future processImage() async {}
}
