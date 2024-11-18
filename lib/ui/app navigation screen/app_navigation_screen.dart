import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'bloc/app_navigation_bloc.dart';
import 'models/app_navigation_model.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<AppNavigationBloc>(
      create: (context) => AppNavigationBloc(
        AppNavigationState(
          appNavigationModelObj: AppNavigationModel(),
        ),
      )..add(AppNavigationInitialEvent()),
      child: const AppNavigationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFFFFFFFF),
            body: SizedBox(
              width: 375.h,
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
                    child: const Column(
                      children: [
                        SizedBox(height: 10.0),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "App Navigation",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 20.0,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Check your app's UI from the below demo screens of your app.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF888888),
                              fontSize: 16.0, // Replace 16.fSize with standard double value
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Divider(
                          height: 1.0,
                          thickness: 1.0,
                          color: Color(0xFF000000),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
                        child: Column(
                          children: [
                            _buildScreenTitle(
                              context,
                              screenTitle: "Landing",
                              onTapScreenTitle: () => onTapScreenTitle(AppRoutes.landingScreen),
                            ),
                            _buildScreenTitle(
                              context,
                              screenTitle: "Home",
                              onTapScreenTitle: () => onTapScreenTitle(AppRoutes.homeScreen),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox (height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric (horizontal: 20.h),
              child: Text(
                screenTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(height: 5.h),
            Divider(
              height: 1.h,
              thickness: 1.h,
              color: const Color(0xFF888888),
            )
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    NavigatorService.pushNamed(routeName);
  }
}