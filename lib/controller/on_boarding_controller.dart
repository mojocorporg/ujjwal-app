import 'package:carousel_slider/carousel_controller.dart';
import 'package:ujjwal/helper/config.dart';
import 'package:ujjwal/helper/strings.dart';
import 'package:ujjwal/screen/home_screen.dart';
import 'package:ujjwal/screen/setting_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get.dart';
import 'package:ujjwal/helper/shared_prefs.dart';
import 'package:ujjwal/repository/login_repo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';

class OnBoardingController extends GetxController {
  List<String> imageList = [
    "assets/images/onboarding1.jpg",
    "assets/images/onboarding2.jpg",
    "assets/images/logo.png"
  ];

  var currentCarouselIndex = 0.obs;

  CarouselController carouselController = CarouselController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
