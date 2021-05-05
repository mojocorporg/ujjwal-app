import 'package:ujjwal/controller/setting_controller.dart';
import 'package:ujjwal/model/payment_package_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PaymentPackageWidget extends StatelessWidget {
  final PaymentPackageModel paymentPackageModel;
  final SettingController controller;

  const PaymentPackageWidget(
      {Key key, this.paymentPackageModel, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: Text(
              'packages'.tr,
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 1.0,
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[200]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${'price'.tr} : ${paymentPackageModel.data.price ?? ""}',
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${'newContacts'.tr} : ${paymentPackageModel.data.contactsOnPayment ?? ""}',
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Obx(
                  () => InkWell(
                    onTap: () {
                      controller.getOrderId();
                    },
                    child: Container(
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          color: controller.packageBtnClick.value
                              ? Colors.grey[400]
                              : Get.theme.primaryColor),
                      child: Align(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: !controller.packageBtnClick.value,
                            child: Text("buy".tr,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  height: 1.35,
                                  letterSpacing: 0.8,
                                )),
                          ),
                          Visibility(
                            visible: controller.packageBtnClick.value,
                            child: SizedBox(
                                height: 40,
                                width: 40,
                                child:
                                    Lottie.asset('assets/images/loader.json')),
                          ),
                        ],
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
