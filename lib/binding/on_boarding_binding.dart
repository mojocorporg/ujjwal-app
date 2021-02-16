
import 'package:dhanda/controller/home_controller.dart';
import 'package:dhanda/controller/mylist_controller.dart';
import 'package:dhanda/controller/on_boarding_controller.dart';
import 'package:dhanda/controller/pager_controller.dart';
import 'package:dhanda/controller/setting_controller.dart';
import 'package:get/get.dart';

class OnBoardingBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingController());

  }

}