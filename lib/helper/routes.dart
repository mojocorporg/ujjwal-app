import 'package:ujjwal/binding/business_detail_binding.dart';
import 'package:ujjwal/binding/on_boarding_binding.dart';
import 'package:ujjwal/binding/pager_binding.dart';
import 'package:ujjwal/binding/login_binding.dart';
import 'package:ujjwal/screen/business_details_screen.dart';
import 'package:ujjwal/screen/login_screen.dart';
import 'package:ujjwal/screen/on_boarding_screen.dart';
import 'package:ujjwal/screen/pager_screen.dart';
import 'package:ujjwal/screen/splash_screen.dart';
import 'package:ujjwal/screen/referral_screen.dart';

import 'package:get/get.dart';

class Routes {
  static final route = [
    GetPage(
      name: '/splash',
      page: () => SplashScreen(),
    ),
    GetPage(name: '/login', page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(name: '/pager', page: () => PagerScreen(), binding: PagerBinding()),
    GetPage(
      name: '/businessDetail',
      page: () => BusinessDetailScreen(),
      binding: BusinessDetailBinding(),
    ),
    GetPage(
      name: '/referral',
      page: () => ReferralScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/onBoarding',
      page: () => OnBoardingScreen(),
      binding: OnBoardingBinding(),
    ),
  ];
}
