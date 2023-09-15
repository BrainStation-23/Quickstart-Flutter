import 'package:equatable/equatable.dart';

class ForgotPasswordEntity extends Equatable {
  final String message;

  const ForgotPasswordEntity({required this.message});

  @override
  List<Object?> get props => [
        message,
      ];
}
