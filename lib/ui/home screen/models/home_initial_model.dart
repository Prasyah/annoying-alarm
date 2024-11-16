import 'package:equatable/equatable.dart';
import 'home_one_item_model.dart';
import 'minigameselection_item_model.dart';

/// This class is used in the [home_initial_page] screen.
// ignore_for_file: must_be_immutable
class HomeInitialModel extends Equatable {
  HomeInitialModel({
    this.minigameselectionItemList = const [],
    this.homeOneItemList = const [],
  });

  List<MinigameselectionItemModel> minigameselectionItemList;
  List<HomeOneItemModel> homeOneItemList;

  HomeInitialModel copyWith({
    List<MinigameselectionItemModel>? minigameselectionItemList,
    List<HomeOneItemModel>? homeOneItemList,
  }) {
    return HomeInitialModel(
      minigameselectionItemList:
          minigameselectionItemList ?? this.minigameselectionItemList,
      homeOneItemList: homeOneItemList ?? this.homeOneItemList,
    );
  }

  @override
  List<Object?> get props => [minigameselectionItemList, homeOneItemList];
}
