import 'dart:io';

import 'package:recharge/providers/baseprovider.dart';
import 'package:recharge/services/fileservice.dart';
import 'package:recharge/services/sl.dart';

class FileProvider extends BaseProvider {
  File _image;
  File get image => _image;

  final service = sl.get<FileService>();

  Future getImageFromCamera() async {
    final picture = await service.cameraImage();
    if (picture != null) {
      _image = File(picture.path);
    } else {
      print('No image selector');
    }
    notifyListeners();
  }

  Future getImageFromGallery() async {
    final picture = await service.galleryImage();
    if (picture != null) {
      _image = File(picture.path);
    } else {
      print('No image selector');
    }
    notifyListeners();
  }
}
