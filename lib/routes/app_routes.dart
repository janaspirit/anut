import 'package:flutter/material.dart';
import '../presentation/personal_one_screen/personal_one_screen.dart';
import '../presentation/personal_screen/personal_screen.dart';
import '../presentation/personal_two_screen/personal_two_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String personalOneScreen = '/personal_one_screen';

  static const String personalScreen = '/personal_screen';

  static const String personalTwoScreen = '/personal_two_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    personalOneScreen: (context) => PersonalOneScreen(),
    personalScreen: (context) => PersonalScreen(),
    personalTwoScreen: (context) => PersonalTwoScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
  };
}
