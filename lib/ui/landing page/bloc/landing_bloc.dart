import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/landing_model.dart';
part 'landing_event.dart';
part 'landing_state.dart';

/// A bloc that manages the state of a Landing according to the event that 
class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc(LandingState initialState): super(initialState) { 
    on<LandingInitialEvent>(_onInitialize);
  }

  _onInitialize( 
    LandingInitialEvent event, 
    Emitter<LandingState> emit, 
  ) async {
    Future.delayed (const Duration (milliseconds: 3000), () {
      NavigatorService.popAndPushNamed (
        AppRoutes.homeScreen,
      );
    });
  }
}