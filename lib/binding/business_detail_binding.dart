import 'package:ujjwal/controller/business_detail_controller.dart';
import 'package:ujjwal/controller/pager_controller.dart';
import 'package:get/get.dart';

class BusinessDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BusinessDetailController());
  }
}
