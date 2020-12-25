import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class FileService {
  ImagePicker picker = ImagePicker();

  Future<PickedFile> cameraImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    return pickedFile;
  }

  Future galleryImage() async {
    final pickedfile = await picker.getImage(source: ImageSource.gallery);
    return pickedfile;
  }
}
