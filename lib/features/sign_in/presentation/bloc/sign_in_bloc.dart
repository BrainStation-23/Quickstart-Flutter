import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/local_storage/cache_service.dart';
import '../../../../core/utils/logger.dart';
import '../../domain/use_cases/sign_in_use_case.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required this.signInUseCase}) : super(const SignInState()) {
    on<EmailChangeEvent>(_onEmailChangeEvent);
    on<PasswordChangeEvent>(_onPasswordChangeEvent);
    on<PhoneNumberChangeEvent>(_onPhoneNumberChangeEvent);
    on<SignInSubmitted>(_onSignInSubmittedEvent);
  }

  final SignInUseCase signInUseCase;

  FutureOr<void> _onEmailChangeEvent(
    EmailChangeEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(
      email: event.email,
      status: SignInStatus.initial,
    ));
  }

  FutureOr<void> _onPasswordChangeEvent(
    PasswordChangeEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(
      password: event.password,
      status: SignInStatus.initial,
    ));
  }

  FutureOr<void> _onPhoneNumberChangeEvent(
    PhoneNumberChangeEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(
      phoneNumber: event.phoneNumber,
      status: SignInStatus.initial,
    ));
  }

  Future<void> _onSignInSubmittedEvent(
      SignInSubmitted event, Emitter<SignInState> emit) async {
    {
      emit(state.copyWith(status: SignInStatus.loading));

      await Future.delayed(const Duration(seconds: 1));

      try {
        String? fcmToken;
        try {
          fcmToken ??= await CacheService.instance.retrieveFcmToken();
        } catch (_) {
          Log.error('Failed to retrieve FCM token');
        }

        Map<String, dynamic> requestBody = {
          "email": state.email.trim(),
          "password": state.password,
        };

        final response = await signInUseCase.call(requestBody: requestBody);
        response.fold(
          (l) {
            emit(
              state.copyWith(
                status: SignInStatus.failure,
                errorMessage: l,
              ),
            );
          },
          (r) async {
            CacheService.instance.storeBearerToken((r.token));
            emit(
              state.copyWith(
                status: SignInStatus.success,
                fcmToken: r.token,
              ),
            );
          },
        );
      } catch (e) {
        emit(
          state.copyWith(
            status: SignInStatus.failure,
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }
}
