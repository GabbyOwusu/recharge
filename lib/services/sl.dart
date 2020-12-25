import 'package:get_it/get_it.dart';
import 'package:recharge/services/fileservice.dart';
import 'package:recharge/services/ocr.dart';

GetIt sl = GetIt.instance;

setupServiceLocator() {
  sl.registerLazySingleton<FileService>(() => FileService());
  sl.registerLazySingleton<OCR>(() => OCR());
}
