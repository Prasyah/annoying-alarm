import 'package:annoying_alarm/ui/home%20screen/widgets/home_one_item_widget.dart';
import 'package:annoying_alarm/ui/home%20screen/widgets/minigameselection_item_widget.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import 'bloc/home_bloc.dart';
import 'models/home_initial_model.dart';
import 'models/home_one_item_model.dart';
import 'models/minigameselection_item_model.dart';
import 'widgets/home_one_item_widget.dart';
import 'widgets/minigameselection_item_widget.dart';

class HomeInitialPage extends StatefulWidget {
  const HomeInitialPage({Key? key}) : super(key: key);

  @override
  HomeInitialPageState createState() => HomeInitialPageState();

  static Widget builder(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(
        HomeState(homeInitialModelObj: HomeInitialModel()),
      )..add(HomeInitialEvent()),
      child: const HomeInitialPage(),
    );
  }
}

class HomeInitialPageState extends State<HomeInitialPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(color: appTheme.whiteA700),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: _buildAppBar(context),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAvatarSection(context),
                    SizedBox(height: 14.h),
                    Text(
                      "Choose some minigames to wake you up!",
                      style: theme.textTheme.titleSmall,
                    ),
                    SizedBox(height: 2.h),
                    _buildMinigameSelection(context),
                    SizedBox(height: 22.h),
                    _buildRecommendedMinigameList(context),
                    SizedBox(height: 36.h),
                    _buildAlarmList(context),
                    SizedBox(height: 26.h),
                    _buildButtonSection(context),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// App Bar Section
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "Your Annoying ALARM",
        margin: EdgeInsets.only(left: 24.h),
      ),
      styleType: Style.bgShadowPrimary,
    );
  }

  /// Avatar Section
  Widget _buildAvatarSection(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.maxFinite,
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.thumbProfile,
            height: 40.h,
            width: 40.h,
            radius: BorderRadius.circular(20.h),
          ),
          SizedBox(width: 12.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 176.h,
                  child: Text(
                    "Ardy Pratama Syahputra",
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                SizedBox(
                  width: 92.h,
                  child: Text(
                    "Slightly Annoyed",
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Minigame Selection Section
  Widget _buildMinigameSelection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: BlocSelector<HomeBloc, HomeState, HomeInitialModel?>(
        selector: (state) => state.homeInitialModelObj,
        builder: (context, homeInitialModelObj) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              runSpacing: 8.h,
              spacing: 8.h,
              children: List<Widget>.generate(
                homeInitialModelObj?.minigameselectionItemList.length ?? 0,
                (index) {
                  MinigameselectionItemModel model = 
                    homeInitialModelObj?.minigameselectionItemList[index] ??
                        MinigameselectionItemModel();
                  return MinigameselectionItemWidget(
                    model,
                    onSelectedChipView: (value) {
                      context.read<HomeBloc>().add(
                            UpdateChipViewEvent(index: index, isSelected: value),
                          );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  /// Recommended Minigame List Section
  Widget _buildRecommendedMinigameList(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recommended minigame",
            style: CustomTextStyle.titleMedium18,
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                width: 1.h,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.thumbImgMazeGame,
                  height: 336.h,
                  width: 336.h,
                  margin: EdgeInsets.only(left: 14.h),
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Text(
                    "Maze Challenge",
                    style: CustomTextStyle.bodySmallPrimary_1,
                  ),
                ),
                SizedBox(height: 4.h),
                Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Text(
                    "Recommended For Allertness",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: 6.h),
                CustomImageView(
                  imagePath: ImageConstant.imgIconBarMenuGame,
                  height: 22.h,
                  width: 20.h,
                  margin: EdgeInsets.only(left: 14.h),
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Alarm List Section
  Widget _buildAlarmList(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Alarms",
            style: CustomTextStyle.titleMedium18,
          ),
          SizedBox(height: 12.h),
          BlocSelector<HomeBloc, HomeState, HomeInitialModel?>(
            selector: (state) => state.homeInitialModelObj,
            builder: (context, homeInitialModelObj) {
              return ListView.separated(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: Divider(
                    height: 1.h,
                    thickness: 1.h,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
                itemCount: homeInitialModelObj?.homeOneItemList.length ?? 0,
                itemBuilder: (context, index) {
                  HomeOneItemModel model =
                      homeInitialModelObj?.homeOneItemList[index] ??
                          HomeOneItemModel();
                  return HomeOneItemWidget(model);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  /// Button Section
  Widget _buildButtonSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          CustomElevatedButton(
            text: "Add Alarm",
          ),
          SizedBox(height: 8.h),
          CustomOutlinedButton(
            text: "Help",
          ),
          SizedBox(height: 8.h),
          CustomOutlinedButton(
            text: "Feedback",
          ),
        ],
      ),
    );
  }
}
