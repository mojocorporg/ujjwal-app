import 'package:ujjwal/controller/home_controller.dart';
import 'package:ujjwal/controller/mylist_controller.dart';
import 'package:ujjwal/controller/pager_controller.dart';
import 'package:ujjwal/controller/setting_controller.dart';
import 'package:get/get.dart';

class PagerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PagerController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MyListController());
    Get.lazyPut(() => SettingController());
  }
}
