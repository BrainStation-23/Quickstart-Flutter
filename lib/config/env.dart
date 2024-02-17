import 'package:flutter/material.dart';

import '../core/application.dart';
import 'env_types.dart';
import 'service_locator.dart';

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
    runApp(const Application());
  }
}
