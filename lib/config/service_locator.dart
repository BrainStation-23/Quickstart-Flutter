
import 'package:get_it/get_it.dart';

import '../core/app_storage.dart';

GetIt sl = GetIt.instance;

Future<void> setUpServiceLocators()async{
  sl.reset();

  sl.registerLazySingleton<AppStorage>(() => AppStorage());
}