import 'package:image_picker/image_picker.dart';

class FileService {
  ImagePicker picker = ImagePicker();

  Future<PickedFile> cameraImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    return pickedFile;
  }
}
