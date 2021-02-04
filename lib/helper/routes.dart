
import 'package:dhanda/screen/login_screen.dart';
import 'package:dhanda/screen/splash_screen.dart';

import 'package:get/get.dart';

class Routes {
  static final route = [
    GetPage(
      name: '/splash',
      page: () => SplashScreen(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
    ),

  ];
}