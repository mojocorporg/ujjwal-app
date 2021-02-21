import 'package:dhanda/controller/setting_controller.dart';
import 'package:dhanda/helper/shared_prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Stack(
        children: [
          Positioned(
              bottom: -30,
              left: -40,
              child: Image.asset(
                "assets/images/dlogo2.png",
                width: 180,
                height: 180,
              )),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
            color: Colors.white.withOpacity(0.5),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'setting'.tr,
                style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.0,
                    fontSize: 26,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          UserPreferences().get(UserPreferences.SHARED_USER_ID) == null
              ? _buildButton('login'.tr,(){Get.toNamed("login");})
              : Obx(()=>_basicDetailField(context))
        ],
      ),
    );
  }

  Widget _buildButton(String name,Function function) {
    return Center(
      child: InkWell(
        onTap: function,
        child: Container(
          width: Get.width,
          height: 50,
          margin: EdgeInsets.fromLTRB(30, 30, 30, 30),
          padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Get.theme.primaryColor),
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.0,
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }

  Widget _basicDetailField(context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.person,
                        size: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          child: TextField(
                            controller: controller.nameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "userName".tr,
                                counterText: ''),
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            onSubmitted: (val){
                              controller.updateName();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Card(
                      elevation: 10,

                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 18, 0, 18),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            controller.countryCode.value,
                            style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 1.0,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 6,
                    child: Card(
                      elevation: 10,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: AbsorbPointer(
                          absorbing: true,
                          child: TextField(
                            controller: controller.phoneController,
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
                      ),
                    ),
                  )
                ],
              ),
            ),

            _buildContainer(Icons.person,'trialAccount'.tr),

            _buildContainer(Icons.payment,'pay'.tr),

            _buildContainer(Icons.verified_user,'privacyPolicy'.tr),

            _buildContainer(Icons.insert_drive_file,'tos'.tr),

            _buildButton('logout'.tr,(){
              controller.logoutConfirmation(context);
              })
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(IconData icon,String fieldName){
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                icon,
                size: 30,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: 30,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(fieldName,
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1.0,
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
