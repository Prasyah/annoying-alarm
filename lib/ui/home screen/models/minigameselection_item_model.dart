import 'package:equatable/equatable.dart';

// ignore_for_file: must_be_immutable
class MinigameselectionItemModel extends Equatable {
  MinigameselectionItemModel(
        {this.chipThree, this.chipThree1, this.isSelected}) {  
      chipThree = chipThree ?? "Maze";
      chipThree1 = chipThree1 ?? "Maze";
      isSelected = isSelected ?? false;
    }

  String? chipThree;
  String? chipThree1;
  bool? isSelected;

  MinigameselectionItemModel copyWith({
    String? chipThree,
    String? chipThree1,
    bool? isSelected,
  }) {
    return MinigameselectionItemModel(
      chipThree: chipThree ?? this.chipThree,
      chipThree1: chipThree1 ?? this.chipThree1,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [chipThree, chipThree1, isSelected];
}
