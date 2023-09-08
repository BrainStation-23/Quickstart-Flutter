import 'package:get_it/get_it.dart';
import 'package:qs_flutter/core/base/blocs/base_bloc.dart';
import 'package:qs_flutter/core/base/blocs/base_state.dart';
import 'package:qs_flutter/features/landing/presentation/blocs/landing_bloc.dart';
import 'package:qs_flutter/features/sign_up/domain/use_cases/otp_verification_usecase.dart';

import '../../features/landing/presentation/blocs/landing_state.dart';
import '../../features/sign_in/data/datasource/sign_in_datasource.dart';
import '../../features/sign_in/data/datasource/sign_in_datasource_imp.dart';
import '../../features/sign_in/data/repository/sign_in_repo_imp.dart';
import '../../features/sign_in/domain/repositories/sign_in_repositories.dart';
import '../../features/sign_in/domain/use_cases/sign_in_use_case.dart';
import '../../features/sign_in/presentation/bloc/sign_in_bloc.dart';
import '../../features/sign_up/data/data_sources/sign_up_data_source.dart';
import '../../features/sign_up/data/data_sources/sign_up_data_source_imp.dart';
import '../../features/sign_up/data/repositories/sign_up_repository_impl.dart';
import '../../features/sign_up/domain/repositories/sign_up_repositories.dart';
import '../../features/sign_up/domain/use_cases/sign_up_use_case.dart';
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart';
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
