// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../core/app_export.dart';

enum BottomBarEnum { Alarms, Games, Stats }

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgIconBarMenuAlarm,
      activeIcon: ImageConstant.imgIconBarMenuAlarm,
      title: "lbl_alarms".tr,
      type: BottomBarEnum.Alarms,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgIconBarMenuGame, 
      activeIcon: ImageConstant.imgIconBarMenuGame, 
      title: "lbl_games".tr,
      type: BottomBarEnum.Games,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgIconBarStat, 
      activeIcon: ImageConstant.imgIconBarStat, 
      title: "lbl_stats".tr,
      type: BottomBarEnum.Stats
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Color(0x1E000000),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: SizedBox(
              width: 34.h,
              child: SizedBox(
                width: 34.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: bottomMenuList[index].activeIcon,
                      height: 24.h,
                      width: 24.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 4.h), // Spacing between icon and text
                    Text(
                      bottomMenuList[index].title ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyle.bodySmallPrimary.copyWith(
                        color: Color(0XFF000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            activeIcon: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), // Shadow color
                    spreadRadius: 3, // Spread radius for the shadow
                    blurRadius: 6,   // Blur radius for smooth shadow
                    offset: Offset(0, 3), // Position of shadow (x, y)
                  ),
                ],
              ),
              child: SizedBox(
                width: 34.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: bottomMenuList[index].activeIcon,
                      height: 27.h,
                      width: 27.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 2.h), // Spacing between icon and text
                    Text(
                      bottomMenuList[index].title ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyle.bodySmallPrimary.copyWith(
                        color: Color(0XFF000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

class BottomMenuModel {
  BottomMenuModel(
    {required this.icon,
    required this.activeIcon,
    this.title,
    required this.type}
  );

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Please replace the respective widget here',
            style: TextStyle(
              fontSize: 18,
            ),)
          ],
        ),
      ),
    );
  }
}