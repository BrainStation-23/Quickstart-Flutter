import 'app_store.dart';
import 'app_store_imp.dart';

class CacheService {
  CacheService._internal();

  static final AppStorageI _appStorage = AppStorageImp();

  static AppStorageI get instance {
    return _appStorage;
  }
}
