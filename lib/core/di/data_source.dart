
part of 'injection_container.dart';


Future<void> _initDataSources() async {
  sl.registerLazySingleton<SignInDataSource>(
        () => SignInDataSourceImp(
      restClient: sl.call(),
    ),
  );

  sl.registerLazySingleton<SignUpDataSource>(
        () => SignUpDataSourceImp(
      restClient: sl.call(),
    ),
  );
}
