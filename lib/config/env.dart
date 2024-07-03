import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../core/application.dart';
import 'env_types.dart';
import 'service_locator.dart';

final LoggerBase logger = Logger();

abstract class Env {
  //get EnvType
  EnvType get envType;

  //provide common initialization here
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setUpServiceLocators();
    await sl.allReady();
  }

  void run() {
    logger.runLogging(
      () => runZonedGuarded(
        () => runApp(const Application()),
        logger.logZoneError,
      ),
      const LogOptions(),
    );
  }
}
