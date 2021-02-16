import 'package:dhanda/helper/config.dart';
import 'package:dhanda/helper/strings.dart';
import 'package:dhanda/screen/home_screen.dart';
import 'package:dhanda/screen/setting_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get.dart';
import 'package:dhanda/helper/shared_prefs.dart';
import 'package:dhanda/repository/login_repo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';

class OnBoardingController extends GetxController{

  List<String> imageList = ["assets/images/onboarding1.jpg","assets/images/onboarding2.jpg","assets/images/logo.png"];

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