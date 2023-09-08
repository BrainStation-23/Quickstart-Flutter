part of 'injection_container.dart';

Future<void> _initUseCases() async {
  sl.registerLazySingleton(
        () => SignInUseCase(
      signInRepository: sl.call(),
    ),
  );

  sl.registerLazySingleton(
        () => SignUpUseCase(
      signUpRepository: sl.call(),
    ),
  );
  sl.registerLazySingleton(
        () => OTPVerificationUseCase(
      signUpRepository: sl.call(),
    ),
  );
}
