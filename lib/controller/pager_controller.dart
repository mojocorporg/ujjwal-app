import 'package:dhanda/screen/home_screen.dart';
import 'package:dhanda/screen/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get.dart';



class PagerController extends GetxController{

  PageController pageController = PageController(initialPage: 0);
  List<Widget> screens = [HomeScreen(),HomeScreen(),SettingScreen()];
  var currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void changePagerScreen(int value){
    currentPage.value = value;
    pageController.jumpToPage(value);
  }

  @override
  void onClose() {
    super.onClose();
  }


}