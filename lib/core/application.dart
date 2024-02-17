import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/navigations/route_generator.dart';

import '../config/service_locator.dart';
import 'app_storage.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late final AppStorage appStorage;

  @override
  void initState() {
    super.initState();
    appStorage = sl<AppStorage>();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AppStorage(),
      child: MaterialApp.router(
        routerConfig: RouteGenerator.router,
      ),
    );
  }
}
