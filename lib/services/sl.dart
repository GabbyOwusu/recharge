import 'package:get_it/get_it.dart';
import 'package:recharge/services/fileservice.dart';

GetIt sl = GetIt.instance;

setupServiceLocator() {
  sl.registerLazySingleton<FileService>(() => FileService());
}
