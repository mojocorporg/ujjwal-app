import 'package:dhanda/controller/business_detail_controller.dart';
import 'package:dhanda/controller/pager_controller.dart';
import 'package:get/get.dart';

class BusinessDetailBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BusinessDetailController());
  }
}