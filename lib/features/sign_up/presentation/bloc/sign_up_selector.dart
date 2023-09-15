import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qs_flutter/features/sign_up/presentation/bloc/sign_up_bloc.dart';

class SignUpSelector<T> extends BlocSelector<SignUpBloc, SignUpState, T> {
  SignUpSelector({
    super.key,
    required T Function(SignUpState) selector,
    required Widget Function(T) builder,
  }) : super(
    selector: selector,
    builder: (_, value) => builder(value),
  );
}

class SignUpLoadingSelector extends SignUpSelector<bool?> {
  SignUpLoadingSelector(Widget Function(bool?) builder, {super.key})
      : super(
    selector: (state) => state.status == SignUpStatus.loading,
    builder: builder,
  );
}
