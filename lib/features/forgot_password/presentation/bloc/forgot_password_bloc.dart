import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qs_flutter/features/forgot_password/presentation/bloc/forgot_password_event.dart';
import 'package:qs_flutter/features/forgot_password/presentation/bloc/forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc(super.initialState) {}
}
