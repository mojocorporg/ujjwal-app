import 'package:country_code_picker/country_code_picker.dart';
import 'package:ujjwal/helper/OTPTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ujjwal/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.offNamedUntil("/pager", (route) => false);
        return;
      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Get.theme.primaryColor,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Positioned(
                      bottom: -30,
                      left: -30,
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
                      mainAxisSize: MainAxisSize.min,
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
                          'enterNo'.tr,
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 0.3,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: CountryCodePicker(
                                    onChanged: (e) => {
//                                widget.countryCode(e.dialCode)
                                      controller.countryCode = e.dialCode
                                    },
                                    initialSelection: 'IN',
                                    showCountryOnly: false,
                                    showOnlyCountryWhenClosed: false,
                                    favorite: ['+91', 'IN'],
                                    showFlag: false,
                                    boxDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        color: Colors.white),
                                  )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: TextField(
                                  controller: controller.phoneController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "enterNo".tr,
                                      counterText: ''),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'enterOtpTitle'.tr,
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 0.3,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        OTPTextField(
                          length: 6,
                          width: MediaQuery.of(context).size.width,
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldWidth: 40,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                          onCompleted: (pin) {
                            print("Completed: " + pin);
                            controller.verifyOtp(pin);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              controller.getOtp();
                            },
                            child: Text(
                              'resentOtp'.tr,
                              style: TextStyle(
                                  color: Colors.red,
                                  letterSpacing: 1.0,
                                  fontFamily: 'Roboto',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Obx(() => InkWell(
                              onTap: () {
                                if (controller.codeSend.value) {
                                } else {
                                  controller.getOtp();
                                }
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
                                      child: Text(
                                          controller.codeSend.value
                                              ? "verifyOtp".tr
                                              : "getOtp".tr,
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
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offNamedUntil("/pager", (route) => false);
                    },
                    child: Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: Colors.white,
                        )),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
