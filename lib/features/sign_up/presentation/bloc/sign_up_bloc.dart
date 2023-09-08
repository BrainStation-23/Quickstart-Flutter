import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qs_flutter/features/sign_up/domain/use_cases/otp_verification_usecase.dart';
import 'package:qs_flutter/features/sign_up/domain/use_cases/sign_up_use_case.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(
      {required this.signUpUseCase, required this.otpVerificationUseCase})
      : super(const SignUpState()) {
    on<SignUpSubmitted>(_onSignUpSubmitted);
    on<FirstNameChangeEvent>(_onFirstNameChangeEvent);
    on<LastNameChangeEvent>(_onLastNameChangeEvent);
    on<EmailChangeEvent>(_onEmailChangeEvent);
    on<PasswordChangeEvent>(_onPasswordChangeEvent);
    on<BirthDateChangeEvent>(_onBirthDateChangeEvent);
    on<PhoneNumberChangeEvent>(_onPhoneNumberChangeEvent);
    on<SignUpStatusChange>(_onSignUpStatusChange);
    on<SignUpValidateAgeEvent>(_onValidateAgeEvent);
    on<OTPChangeEvent>(_onOTPChangeEvent);
    on<VerifyOTPEvent>(_onVerifyOTPEvent);
  }

  final SignUpUseCase signUpUseCase;
  final OTPVerificationUseCase otpVerificationUseCase;

  FutureOr<void> _onFirstNameChangeEvent(
    FirstNameChangeEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(
      firstName: event.firstName,
      status: SignUpStatus.initial,
    ));
  }

  FutureOr<void> _onLastNameChangeEvent(
    LastNameChangeEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(
      lastName: event.lastName,
      status: SignUpStatus.initial,
    ));
  }

  FutureOr<void> _onEmailChangeEvent(
    EmailChangeEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(
      email: event.email,
      status: SignUpStatus.initial,
    ));
  }

  FutureOr<void> _onPasswordChangeEvent(
    PasswordChangeEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(
      password: event.password,
      status: SignUpStatus.initial,
    ));
  }

  FutureOr<void> _onBirthDateChangeEvent(
    BirthDateChangeEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(
      birthdate: event.birthdate,
      status: SignUpStatus.initial,
    ));
  }

  FutureOr<void> _onPhoneNumberChangeEvent(
    PhoneNumberChangeEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(
      phoneNumber: event.phoneNumber,
      status: SignUpStatus.initial,
    ));
  }

  FutureOr<void> _onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(status: SignUpStatus.loading));

    Map<String, dynamic> requestBody = {
      "firstName": state.firstName,
      "lastName": state.lastName,
      "email": state.email,
      "password": state.password,
      "phone": "+88${state.phoneNumber}"
    };

    await Future.delayed(const Duration(seconds: 1));

    try {
      final response = await signUpUseCase.call(requestBody: requestBody);
      print(response);
      response.fold(
        (l) {
          emit(
            state.copyWith(
              status: SignUpStatus.failure,
              errorMessage: l.toString(),
            ),
          );
        },
        (r) async {
          emit(
            state.copyWith(
              status: SignUpStatus.verify_otp,
              responseMessage: r.message,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SignUpStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onValidateAgeEvent(
    SignUpValidateAgeEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(
      isAgeValidate: event.isValidAge,
      status: SignUpStatus.initial,
    ));
  }

  FutureOr<void> _onSignUpStatusChange(
    SignUpStatusChange event,
    Emitter<SignUpState> emit,
  ) {
    emit(const SignUpState.initial());
  }

  FutureOr<void> _onOTPChangeEvent(
      OTPChangeEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      otp: event.otp,
      status: SignUpStatus.initial,
    ));
  }

  Future<FutureOr<void>> _onVerifyOTPEvent(
      VerifyOTPEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(status: SignUpStatus.loading));
    Map<String, dynamic> requestBody = {
      "email": state.email,
      "otp": int.parse(state.otp)
    };
    try {
      final response =
          await otpVerificationUseCase.call(requestBody: requestBody);
      response.fold(
        (l) {
          emit(
            state.copyWith(
              status: SignUpStatus.failure,
              errorMessage: l.toString(),
            ),
          );
        },
        (r) async {
          emit(
            state.copyWith(
              status: SignUpStatus.success,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SignUpStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
