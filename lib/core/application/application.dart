import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/core/application/widget/app_context.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:styles/styles.dart';
import '../intialization/models/app_storage.dart';

class Application extends StatefulWidget {
  const Application({super.key, required this.appStorage});
  final AppStorage appStorage;
  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultAssetBundle(
      bundle: SentryAssetBundle(),
      child: RepositoryProvider(
        create: (context) => widget.appStorage,
        child: ThemeScope(
          themeCubit: widget.appStorage.themeCubit,
          child:const AppContext(),
        ),
      ),
    );
  }
}
