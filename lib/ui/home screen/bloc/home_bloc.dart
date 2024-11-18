import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import '../models/home_initial_model.dart';
import '../models/home_model.dart';
import '../models/home_one_item_model.dart';
import '../models/minigameselection_item_model.dart';
part 'home_event.dart';
part 'home_state.dart';

/// A bloc that manages the state of a Home according to the event that is dispatched to it
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(initialState) {
    on<HomeInitialEvent>(_onInitialize);
    on<UpdateChipViewEvent>(_updateChipView);
  }

   _onInitialize(
    HomeInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    // Prepare the initialized model with the lists
    final initializedModel = state.homeInitialModelObj?.copyWith(
      homeOneItemList: fillHomeOneItemList(),
      minigameselectionItemList: fillMinigameselectionItemList(),
    );

    // Debug log to verify list initialization
    print(initializedModel?.minigameselectionItemList.map((item) => item.chipThree).toList());

    // Emit the updated state with the initialized model
    emit(state.copyWith(homeInitialModelObj: initializedModel));
  }

  _updateChipView(
    UpdateChipViewEvent event,
    Emitter<HomeState> emit,
  ) {
    List<MinigameselectionItemModel> newList =
        List<MinigameselectionItemModel>.from(
            state.homeInitialModelObj!.minigameselectionItemList);
    newList[event.index] = newList[event.index].copyWith(
      isSelected: event.isSelected,
    );
    emit(
      state.copyWith(
        homeInitialModelObj: state.homeInitialModelObj
          ?.copyWith(minigameselectionItemList: newList,
        ),
      ),
    );
  }

  List<HomeOneItemModel> fillHomeOneItemList() {
    return [
      HomeOneItemModel(
        title: "Work Alarm",
        time: "Set for 9:00 AM",
        subtitle: "Repeats Mon-Fri",
      ),
      HomeOneItemModel(
        title: "Work Alarm",
        time: "Set for 9:00 AM",
        subtitle: "Repeats Mon-Fri",
      ),
    ];
  }

  List<MinigameselectionItemModel> fillMinigameselectionItemList() {
    return [
      MinigameselectionItemModel(chipThree: "Maze"),
      MinigameselectionItemModel(chipThree: "Memory Game"),
      MinigameselectionItemModel(chipThree: "Reaction Time"),
    ];
  }
}
