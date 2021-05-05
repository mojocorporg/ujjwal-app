import 'package:ujjwal/controller/business_detail_controller.dart';
import 'package:ujjwal/helper/shared_prefs.dart';
import 'package:ujjwal/widget/CardDetailItemWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class BusinessDetailScreen extends StatelessWidget {
  final controller = Get.find<BusinessDetailController>();

  @override
  Widget build(BuildContext context) {
    controller.cardData = Get.arguments;
    controller.getReviewTags();

    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'businessDetails'.tr,
          style: TextStyle(
              color: Colors.black,
              letterSpacing: 1.0,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
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
          Container(
            width: Get.width,
            margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
            padding: EdgeInsets.fromLTRB(10, 25, 10, 25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Screenshot(
                      controller: controller.screenshotController,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CardDetailItemWidget(
                              data: controller.cardData,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                                child: Container(
                                  height: 50,
                                  child: Image.asset(
                                    "assets/images/logo_two.png",
                                    width: 100,
                                    height: 50,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CardDetailItemWidget(
                            data: controller.cardData,
                          ),
                          Container(
                            height: 50,
                            width: Get.width,
                            color: Colors.white,
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                'tags'.tr,
                                style: TextStyle(
                                    color: Colors.black,
                                    letterSpacing: 1.0,
                                    fontFamily: 'Roboto',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Obx(
                  () => controller.reviewList != null &&
                          controller.reviewList.length > 0
                      ? Container(
                          child: Wrap(
                            children: controller.reviewList.map((e) {
                              return InkWell(
                                onTap: () {
                                  if (UserPreferences().get(
                                          UserPreferences.SHARED_USER_TOKEN) !=
                                      null) {
                                    controller.selectReviewTag(e);
                                  } else {
                                    Get.toNamed("login");
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
                                  decoration: BoxDecoration(
                                      color: e.isSelected == 1
                                          ? Colors.red[400]
                                          : Get.theme.primaryColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    '${e.name}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      : Container(),
                ),
                InkWell(
                  onTap: () {
                    controller.shareCard();
                  },
                  child: Container(
                    width: Get.width,
                    margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.red[400]),
                    child: Center(
                      child: Text(
                        'exportVcard'.tr,
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          if (UserPreferences()
                                  .get(UserPreferences.SHARED_USER_TOKEN) !=
                              null) {
                            controller.addRemoveCard("0");
                          } else {
                            Get.toNamed("login");
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                          padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Get.theme.primaryColor),
                          child: Center(
                            child: Text(
                              'no'.tr,
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
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          if (UserPreferences()
                                  .get(UserPreferences.SHARED_USER_TOKEN) !=
                              null) {
                            controller.addRemoveCard("1");
                          } else {
                            Get.toNamed("login");
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                          padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Get.theme.primaryColor),
                          child: Center(
                            child: Text(
                              'yes'.tr,
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
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
