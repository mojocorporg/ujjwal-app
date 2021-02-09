
import 'package:dhanda/binding/business_detail_binding.dart';
import 'package:dhanda/binding/pager_binding.dart';
import 'package:dhanda/binding/login_binding.dart';
import 'package:dhanda/screen/business_details_screen.dart';
import 'package:dhanda/screen/login_screen.dart';
import 'package:dhanda/screen/pager_screen.dart';
import 'package:dhanda/screen/splash_screen.dart';
import 'package:dhanda/screen/referral_screen.dart';

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
      binding: LoginBinding()
    ),
    GetPage(
      name: '/pager',
      page: () => PagerScreen(),
      binding: PagerBinding()
    ),
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

  ];
}