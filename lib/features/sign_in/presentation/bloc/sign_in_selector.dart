import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qs_flutter/features/sign_in/presentation/bloc/sign_in_bloc.dart';

class SignInSelector<T> extends BlocSelector<SignInBloc, SignInState, T> {
  SignInSelector({
    super.key,
    required T Function(SignInState) selector,
    required Widget Function(T) builder,
  }) : super(
          selector: selector,
          builder: (_, value) => builder(value),
        );
}

class SignInLoadingSelector extends SignInSelector<bool?> {
  SignInLoadingSelector(Widget Function(bool?) builder, {super.key})
      : super(
          selector: (state) => state.status == SignInStatus.loading,
          builder: builder,
        );
}
