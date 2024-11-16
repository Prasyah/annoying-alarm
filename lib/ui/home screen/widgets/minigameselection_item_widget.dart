import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/minigameselection_item_model.dart';

class MinigameselectionItemWidget extends StatelessWidget {
  MinigameselectionItemWidget(this.minigameselectionItemModelObj,
    {Key? key, this.onSelectedChipView})
    : super(key: key,
    );
  
  MinigameselectionItemModel minigameselectionItemModelObj;

  Function(bool)? onSelectedChipView;

  @override  
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 14.h,
        vertical: 8.h,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        minigameselectionItemModelObj.chipThree1!,
        style: TextStyle(
          color: theme.colorScheme.primary,
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: (minigameselectionItemModelObj.isSelected ?? false),
      backgroundColor: theme.colorScheme.primary.withOpacity(0.3),
      selectedColor: theme.colorScheme.primary.withOpacity(0.05),
      side: BorderSide.none,
      shape: (minigameselectionItemModelObj.isSelected ?? false)
        ? RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(
              6.h,
            ))
        : RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(
              6.h,
            ),
          ),
      onSelected: (value) {
        onSelectedChipView?.call(value);
      },
    );
  }
}