import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ujjwal/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ReferralScreen extends StatelessWidget {
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.theme.primaryColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 180,
                    height: 180,
                  )),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Get.theme.primaryColor.withOpacity(0.5),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(40, 80, 40, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/logo_one.png",
                          width: 230,
                          height: 230,
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'enterReferral'.tr,
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 0.3,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: TextField(
                        controller: controller.referralController,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.characters,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[A-Z0-9]')),
                        ],
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "enterReferral".tr,
                            counterText: ''),
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Obx(() => InkWell(
                          onTap: () {
                            controller.loginUser(false);
                          },
                          child: Container(
                            height: 45,
                            width: Get.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                color: Colors.red[400]),
                            child: Align(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Visibility(
                                  visible: controller.loginClicked.value
                                      ? false
                                      : true,
                                  child: Text("submit".tr,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        height: 1.35,
                                        letterSpacing: 0.8,
                                      )),
                                ),
                                Visibility(
                                  visible: controller.loginClicked.value
                                      ? true
                                      : false,
                                  child: SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: Lottie.asset(
                                          'assets/images/loader.json')),
                                ),
                              ],
                            )),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          controller.loginUser(true);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("skip".tr,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.8,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
