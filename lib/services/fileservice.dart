import 'package:image_picker/image_picker.dart';

class FileService {
  ImagePicker picker = ImagePicker();

  Future<PickedFile> cameraImage(ImageSource source) async {
    final pickedFile = await picker.getImage(
      source: source,
      preferredCameraDevice: CameraDevice.rear,
    );
    return pickedFile;
  }
}
