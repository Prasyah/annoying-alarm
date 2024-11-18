import 'package:equatable/equatable.dart';

// ignore_for_file: must_be_immutable
class MinigameselectionItemModel extends Equatable {
  final String? chipThree;
  final String? chipThree1;
  final bool? isSelected;

  MinigameselectionItemModel({
    this.chipThree = "Maze", // Default value
    this.chipThree1 = "Maze", // Default value
    this.isSelected = false, // Default value
  });

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
