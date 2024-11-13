import 'package:flutter/material.dart';
import '../ui/app navigation screen/app_navigation_screen.dart';
import '../ui/home screen/home_screen.dart';
import '../ui/landing page/landing_page.dart';

class AppRoutes {
  static const String landingScreen = '/landing_screen';

  static const String homeScreen = '/home_screen';

  static const String homeInitialPage = '/home_intialPage';

  static const String appNavigationScreen = 'app_navgation_screen';

  static const String initialRoute = '/intialRoute';

  static Map<String, WidgetBuilder> get routes => {
    landingScreen: LandingPage.builder,
    // homeScreen: HomeScreen.builder,
    appNavigationScreen: AppNavigationScreen.builder,
    initialRoute: LandingPage.builder
  };
}