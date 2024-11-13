part of 'app_navigation_bloc.dart';

class AppNavigationState  extends Equatable {
  AppNavigationState({this.appNavigationModelObj});

  AppNavigationModel? appNavigationModelObj;

  @override   
  List<Object?> get props => [appNavigationModelObj];
  AppNavigationState copyWith({AppNavigationModel? AppNavigationModelObj}) {
    return AppNavigationState(
      appNavigationModelObj: 
        appNavigationModelObj ?? this.appNavigationModelObj,
    );
  }
}