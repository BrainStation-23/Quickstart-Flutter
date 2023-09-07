import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qs_flutter/core/di/injection_container.dart' as di;
import 'package:qs_flutter/features/landing/presentation/blocs/landing_bloc.dart';

import '../base/blocs/base_bloc.dart';

class GlobalBlocProviders {
  dynamic providers = [
    BlocProvider(create: (_) => di.sl<BaseBloc>()),
    BlocProvider(create: (_) => di.sl<LandingBloc>()),
  ];
}
