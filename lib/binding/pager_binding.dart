
import 'package:dhanda/controller/home_controller.dart';
import 'package:dhanda/controller/pager_controller.dart';
import 'package:dhanda/controller/setting_controller.dart';
import 'package:get/get.dart';

class PagerBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PagerController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => SettingController());
  }

}