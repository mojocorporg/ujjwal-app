import 'package:ujjwal/controller/home_controller.dart';
import 'package:ujjwal/controller/mylist_controller.dart';
import 'package:ujjwal/helper/config.dart';
import 'package:ujjwal/helper/shared_prefs.dart';
import 'package:ujjwal/screen/business_details_screen.dart';
import 'package:ujjwal/widget/CardDetailItemWidget.dart';
import 'package:ujjwal/widget/LoadingWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:social_share/social_share.dart';

class MyListScreen extends StatelessWidget {
  final controller = Get.find<MyListController>();

  @override
  Widget build(BuildContext context) {
    if (UserPreferences().get(UserPreferences.SHARED_USER_TOKEN) != null) {
      controller.getBusinessList();
    }
    return Container(
      color: Get.theme.primaryColor,
      child: Stack(
        children: [
          Positioned(
              bottom: -30,
              left: -40,
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
          UserPreferences().get(UserPreferences.SHARED_USER_TOKEN) != null
              ? Obx(() => controller.businessModel.value != null &&
                      controller.businessModel.value.data != null
                  ? controller.businessModel.value.data.length > 0
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 80,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  ScreenshotController sSController =
                                      new ScreenshotController();
                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed("businessDetail",
                                              arguments: controller
                                                  .businessModel
                                                  .value
                                                  .data[index])
                                          .then((value) {
                                        controller.getBusinessList();
                                      });
                                    },
                                    child: Stack(
                                      children: [
                                        //Widget with company logo
                                        Screenshot(
                                          controller: sSController,
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                15, 5, 15, 5),
                                            padding: EdgeInsets.fromLTRB(
                                                20, 20, 20, 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white),
                                            child: Column(
                                              children: [
                                                CardDetailItemWidget(
                                                  data: controller.businessModel
                                                      .value.data[index],
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        0, 10, 0, 0),
                                                    child: Container(
                                                      height: 80,
                                                      child: Image.asset(
                                                        "assets/images/logo_two.png",
                                                        width: 100,
                                                        height: 80,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),

                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(15, 5, 15, 5),
                                          padding: EdgeInsets.fromLTRB(
                                              20, 20, 20, 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.white),
                                          child: Column(
                                            children: [
                                              CardDetailItemWidget(
                                                data: controller.businessModel
                                                    .value.data[index],
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 10, 0, 0),
                                                child: Container(
                                                  height: 80,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 3,
                                                        child: InkWell(
                                                          onTap: () {
                                                            controller.openNumberOptionDialog(
                                                                controller
                                                                    .businessModel
                                                                    .value
                                                                    .data[index]
                                                                    .phones,
                                                                controller
                                                                    .businessModel
                                                                    .value
                                                                    .data[index]);
                                                          },
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(
                                                                    0, 0, 5, 0),
                                                            padding: EdgeInsets
                                                                .fromLTRB(10,
                                                                    10, 10, 10),
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                                color: Get.theme
                                                                    .primaryColor),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons.phone,
                                                                  size: 20,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  'call'.tr,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          1.0,
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: InkWell(
                                                          onTap: () {
                                                            controller.shareCard(
                                                                sSController);
                                                            controller.postShare(
                                                                controller
                                                                    .businessModel
                                                                    .value
                                                                    .data[index]
                                                                    .id
                                                                    .toString());
                                                          },
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .fromLTRB(
                                                                    5, 0, 0, 0),
                                                            padding: EdgeInsets
                                                                .fromLTRB(10,
                                                                    10, 10, 10),
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                                color:
                                                                    Colors.red),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons.share,
                                                                  size: 20,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  'share'.tr,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      letterSpacing:
                                                                          1.0,
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                itemCount:
                                    controller.businessModel.value.data.length,
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: Text(
                            'noData'.tr,
                            style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.0,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                  : LoadingWidget())
              : _buildButton('login'.tr, () {
                  Get.toNamed("login");
                }),
          Container(
            margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.location_on,
                    size: 25,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    height: 30,
                    child: TextField(
                      controller: controller.searchController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "searchLocation".tr,
                          counterText: ''),
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          height: 1,
                          fontWeight: FontWeight.normal),
                      onSubmitted: (value) {
                        controller.selectedCity = value;
                        controller.getBusinessList();

                        FocusScope.of(context).unfocus();
                      },
                      onChanged: (value) {
                        if (value.length <= 0) {
                          controller.selectedCity = controller.userCity;
                          controller.getBusinessList();
                        }
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      if (UserPreferences()
                              .get(UserPreferences.SHARED_USER_PREMIUM)
                              .toLowerCase() ==
                          "true") {
                        controller.openFilterDialog(context);
                      } else {
                        Config().displaySnackBar("buyPremium".tr, "");
                      }
                    },
                    child: Icon(
                      Icons.filter_alt,
                      size: 25,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String name, Function function) {
    return Center(
      child: InkWell(
        onTap: function,
        child: Container(
          width: Get.width,
          height: 50,
          margin: EdgeInsets.fromLTRB(50, 30, 50, 30),
          padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white),
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.black,
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
}
