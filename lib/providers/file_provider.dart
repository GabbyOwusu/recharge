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

  Future<File> getImage(ImageSource imagesorce) async {
    PickedFile picture = await service.cameraImage(imagesorce);
    if (picture != null) {
      _image = File(picture.path);
    } else {
      print('No image selected');
    }
    return _image;
  }

  notifyListeners();

  Future processImage(ImageSource source) async {
    File visionimage = await getImage(source);
    final text = await ocr.readImage(
      pickedimage: File(visionimage.path),
    );
    if (text != null) {
      _extractedText = text;
    } else {
      _extractedText = '';
      print('Sorry no text was obtained');
    }
    notifyListeners();
  }
}
