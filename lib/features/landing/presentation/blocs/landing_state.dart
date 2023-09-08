import 'package:equatable/equatable.dart';

enum LandingStatus { initial, navigate}

class LandingState extends Equatable {
  final LandingStatus landingStatus;
  final String? token;

  const LandingState({required this.landingStatus,this.token});

  LandingState copyWith({required LandingStatus? landingStatus,String? token}) {
    return LandingState(landingStatus: landingStatus ?? this.landingStatus,token: token??this.token);
  }

  @override
  List<Object?> get props => [landingStatus];
}
