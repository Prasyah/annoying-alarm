part of 'landing_bloc.dart';

class LandingState extends Equatable {
  LandingState({this.landingModelObj});

  LandingModel? landingModelObj;

  @override 
  List<Object?> get props => [landingModelObj];
  LandingState copyWith({LandingModel? landingModelObj}) {
    return LandingState(
      landingModelObj: landingModelObj ?? this.landingModelObj,
    );
  }
}
