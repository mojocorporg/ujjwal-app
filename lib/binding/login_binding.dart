import 'package:ujjwal/controller/home_controller.dart';
import 'package:ujjwal/controller/login_controller.dart';
import 'package:ujjwal/controller/pager_controller.dart';
import 'package:ujjwal/controller/setting_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
