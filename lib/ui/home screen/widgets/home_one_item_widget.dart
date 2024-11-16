// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/home_one_item_model.dart';

class HomeOneItemWidget extends StatelessWidget {
  HomeOneItemWidget(this.homeOneItemModelObj, {Key? key}) : super(key: key);

  final HomeOneItemModel homeOneItemModelObj;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Use theme directly in the widget
    return Padding(
      padding: EdgeInsets.only(right: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 32.h,
            width: 32.h,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16), // Circle border
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgIconBarMenuAlarm,
                  height: 26.h,
                  width: 24.h,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    homeOneItemModelObj.title ?? "",
                    style: theme.textTheme.bodyMedium,
                  ),
                  Text(
                    homeOneItemModelObj.time ?? "",
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: 8.h,
                bottom: 6.h,
              ),
              child: Text(
                homeOneItemModelObj.subtitle ?? "",
                style: theme.textTheme.titleSmall,
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgIconResumePause,
            height: 22.h,
            width: 18.h,
            margin: EdgeInsets.only(left: 10.h),
          ),
        ],
      ),
    );
  }
}
