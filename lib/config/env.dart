import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/core/intialization/initialization.dart';
import 'package:flutter_boilerplate/core/intialization/models/app_storage.dart';
import 'package:logger/logger.dart';
import 'package:common_services/common_services.dart';
import '../core/application/application.dart';
import 'env_types.dart';
import 'service_locator.dart';

abstract class Env {
  //get EnvType
  EnvType get envType;

  //provide sentry dsn for the environment
  String get sentryDsn;

  /// Whether Sentry is enabled.
  bool get enableSentry => sentryDsn.isNotEmpty;

  ///[baseUrl] provides base api url for the environment
  bool get baseUrl;

  //provide common initialization here
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setUpServiceLocators();
    await sl.allReady();

    // Override logging
    FlutterError.onError = logger.logFlutterError;
    WidgetsBinding.instance.platformDispatcher.onError =
        logger.logPlatformDispatcherError;


    // Setup bloc observer and transformer
    Bloc.observer = const AppBlocObserver();
    Bloc.transformer = sequential();
  }

  void run() {
    logger.runLogging(
      () => runZonedGuarded(
        () => initializeApp(),
        logger.logZoneError,
      ),
      const LogOptions(),
    );
  }

  Future<void> initializeApp() async {
    final Initialization initialization = Initialization(this);
    AppStorage appStorage = await initialization.initialize();
    return runApp(Application(appStorage: appStorage));
  }
}
