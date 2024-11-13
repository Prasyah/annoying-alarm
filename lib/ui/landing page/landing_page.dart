// ignore_for_file: prefer_const_constructors

import 'package:annoying_alarm/core/app_export.dart';
import 'package:flutter/material.dart';
import 'bloc/landing_bloc.dart';
import 'models/landing_model.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key})
      : super(key: key,
      );
  
  static Widget builder(BuildContext context) {
    return BlocProvider<LandingBloc>(
      create: (context) => LandingBloc(LandingState(
        landingModelObj: LandingModel(),
      ))
        ..add(LandingInitialEvent()),
      child: LandingPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandingBloc, LandingState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 112.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Spacer(
                    flex: 44,
                  ),
                  _buildLogoSection(context),
                  Spacer(
                    flex: 55,
                  ),
                  _buildBelieveUsSection(context)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Builds the centered logo section
  Widget _buildLogoSection(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          onTapLogoSection(context);
        },
        child: SizedBox(
          height: 214.h,
          width: 318.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgLogoLandingPage,
                height: 214.h,
                width: 317.h,
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the "Believe Us" section
  Widget _buildBelieveUsSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 26.h),
      child: Column(
        children: [
          Text(
            "Never give you up | Never let you down",
            style: CustomTextStyle.bodyMediumOnPrimary,
          )
        ],
      ),
    );
  }

  /// Simple tap handler to show a snackbar when logo is tapped
  void onTapLogoSection(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.homeScreen,
    );
  }
}
