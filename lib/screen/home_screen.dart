import 'package:dhanda/controller/home_controller.dart';
import 'package:dhanda/screen/business_details_screen.dart';
import 'package:dhanda/widget/CardDetailItemWidget.dart';
import 'package:dhanda/widget/LoadingWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class HomeScreen extends StatelessWidget {

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {

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

          Obx(()=>

          controller.businessModel.value != null && controller.businessModel.value.data != null && controller.businessModel.value.data.length > 0 ?

          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(15, 10, 15, 15),
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex : 1,
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
                        flex :7,
                        child: Text(
                          'selectLocation'.tr,
                          style: TextStyle(
                              color: Colors.grey[400],
                              letterSpacing: 1.0,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Expanded(
                        flex : 1,
                        child: InkWell(
                          onTap: (){
                          controller.openFilterDialog(context);
                          },
                          child: Icon(
                            Icons.filter,
                            size: 25,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    ScreenshotController sSController = new ScreenshotController();
                    return InkWell(
                      onTap: (){
                        Get.toNamed("businessDetail",arguments: controller.businessModel.value.data[index]).then((value){
                          controller.getBusinessList();
                        });
                      },
                      child: Stack(
                        children: [
                          //Widget with company logo
                          Screenshot(
                            controller: sSController,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white),
                              child: Column(
                                children: [

                                  CardDetailItemWidget(data: controller.businessModel.value.data[index],),

                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Container(
                                        height: 80,
                                        child: Image.asset("assets/images/logo_two.png",width: 100,height: 80,),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: Column(
                              children: [

                                CardDetailItemWidget(data: controller.businessModel.value.data[index],),

                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child:  Container(
                                    height: 80,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: InkWell(
                                            onTap: (){
                                              controller.openNumberOptionDialog(controller.businessModel.value.data[index].phones,controller.businessModel.value.data[index]);

                                            },
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.all(Radius.circular(10)),
                                                  color: Get.theme.primaryColor),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center ,
                                                children: [
                                                  Icon(
                                                    Icons.phone,
                                                    size: 20,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Text(
                                                    'call'.tr,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        letterSpacing: 1.0,
                                                        fontFamily: 'Roboto',
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: InkWell(
                                            onTap: (){
                                              controller.shareCard(sSController);
                                              controller.postShare(controller.businessModel.value.data[index].id.toString());
                                            },
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.all(Radius.circular(10)),
                                                  color: Colors.red),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center ,
                                                children: [
                                                  Icon(
                                                    Icons.share,
                                                    size: 20,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Text(
                                                    'share'.tr,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        letterSpacing: 1.0,
                                                        fontFamily: 'Roboto',
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w600),
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
                  itemCount: controller.businessModel.value.data.length,
                ),
              ],
            ),
          )
              :
          LoadingWidget()

          )

        ],
      ),
    );
  }
}
