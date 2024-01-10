import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:qs_flutter/core/routes/routes.dart';
import 'package:qs_flutter/core/values/app_assets_path.dart';

import '../blocs/landing_bloc.dart';
import '../blocs/landing_event.dart';
import '../blocs/landing_state.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late AppLocalizations? _appLocalizations;

  @override
  void initState() {
    context.read<LandingBloc>().add(CountDown());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _appLocalizations = AppLocalizations.of(context);
    return Scaffold(
      body: BlocConsumer<LandingBloc, LandingState>(listener: (context, state) {
        if (state.landingStatus == LandingStatus.initial) {
          context.read<LandingBloc>().add(CountDown());
        } else {
          if (state.token == null) {
            context.goNamed(Routes.signIn);
          } else {
            context.goNamed(Routes.home);
          }
        }
      }, builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(width: 150, child: Image.asset(AppAssets.appLogo)),
            ],
          ),
        );
      }),
    );
  }
}
