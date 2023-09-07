import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:qs_flutter/core/base/blocs/base_bloc.dart';
import 'package:qs_flutter/core/base/blocs/base_event.dart';
import 'package:qs_flutter/core/base/blocs/base_state.dart';
import 'package:qs_flutter/features/landing/presentation/blocs/landing_bloc.dart';

import '../../features/landing/presentation/blocs/landing_state.dart';
import '../network/rest_client.dart';

part 'bloc.dart';
part 'data_source.dart';
part 'repository.dart';
part 'use_case.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Bloc
  await _initBlocs();

  /// UseCase
  await _initUseCases();

  /// Repository
  await _initRepositories();

  /// Datasource
  await _initDataSources();

  /// Network
  final restClient = RestClient();
  sl.registerLazySingleton(
    () => restClient,
  );
}
