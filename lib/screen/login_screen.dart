import 'package:dhanda/helper/OTPTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.theme.primaryColor,
        body: Stack(
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
              color: Colors.black.withOpacity(0.5),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                            padding: EdgeInsets.fromLTRB(0, 13, 0, 13),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/flag.png",
                                  width: 20,
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '+91',
                                  style: TextStyle(
                                      color: Colors.black,
                                      letterSpacing: 0.3,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
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
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "enterOtp".tr,
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
                    length: 5,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 50,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {},
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
                  SizedBox(height: 30,),
                  InkWell(
                    onTap: () {

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
                          color:  Colors.red[400]
                      ),
                      child: Align(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: true,
                            child: Text("login".tr,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  height: 1.35,
                                  letterSpacing: 0.8,
                                )),
                          ),
                          Visibility(
                            visible: false,
                            child: SizedBox(
                                height: 80,
                                width: 80,
                                child: Lottie.asset(
                                    'assets/images/loader.json')),
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
