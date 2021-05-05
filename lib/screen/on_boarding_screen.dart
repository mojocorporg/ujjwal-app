import 'package:carousel_slider/carousel_slider.dart';
import 'package:ujjwal/controller/on_boarding_controller.dart';
import 'package:ujjwal/helper/shared_prefs.dart';
import 'package:ujjwal/widget/CarouselImageWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  final controller = Get.find<OnBoardingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
            color: Colors.black.withOpacity(0.8),
          ),
          Obx(() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CarouselSlider(
                    carouselController: controller.carouselController,
                    items: controller.imageList.map((media) {
                      return CarouselImageWidget(
                        topLeft: 10,
                        topRight: 10,
                        bottomLeft: 10,
                        bottomRight: 10,
                        media: media,
                      );
                    }).toList(),
                    options: CarouselOptions(
                        autoPlay: false,
                        aspectRatio: 2.0,
                        height: Get.height - 300,
                        enlargeCenterPage: false,
                        enableInfiniteScroll: false,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          controller.currentCarouselIndex.value = index;
                          print("checking index --- ${index}");
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.imageList.map((url) {
                      int index = controller.imageList.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.currentCarouselIndex.value == index
                              ? Colors.red
                              : Colors.white,
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      if (controller.currentCarouselIndex ==
                          controller.imageList.length - 1) {
                        UserPreferences()
                            .saveData(UserPreferences.SHARED_ONBOARDING, "1");
                        Get.offNamedUntil("/pager", (route) => false);
                      } else {
                        controller.carouselController.nextPage();
                      }
                    },
                    child: Container(
                      width: Get.width / 2,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.red[400]),
                      child: Center(
                        child: Text(
                          'next'.tr,
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1.0,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      UserPreferences()
                          .saveData(UserPreferences.SHARED_ONBOARDING, "1");
                      Get.offNamedUntil("/pager", (route) => false);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'skip'.tr,
                        style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.0,
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
