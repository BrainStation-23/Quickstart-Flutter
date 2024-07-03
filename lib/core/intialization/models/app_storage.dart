import 'package:styles/styles.dart';
import 'package:tracking_manager/tracking_manager.dart';
///[AppStorage] holds [ThemeCubit] and [errorTrackingManager] to use in everywhere
///It can also be used to feed dependencies across the application
///If there are need for any other dependencies to be need. Please incorporate it in [AppStorage]
class AppStorage {
  AppStorage({required this.themeCubit, required this.errorTrackingManager});


  final ThemeCubit themeCubit;
  final ErrorTrackingManager errorTrackingManager;
}
