import 'package:dhanda/model/business_model.dart';
import 'package:dhanda/model/review_tag_model.dart' as reviewModel;
import 'package:dhanda/model/tag_model.dart' as tagModel;
import 'package:dhanda/repository/home_repo.dart';
import 'package:dhanda/screen/home_screen.dart';
import 'package:dhanda/screen/setting_screen.dart';
import 'package:dhanda/widget/CustomListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:social_share/social_share.dart';
import 'package:url_launcher/url_launcher.dart';


class HomeController extends GetxController {

  var businessModel = BusinessModel().obs;
  var tagList = List<tagModel.Data>().obs;



  List<String> tagStringList = [];
  List<String> selectedCountList = [];
  String filteredTagId;

  @override
  void onInit() {
    super.onInit();
    getBusinessList();
    getTags();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void shareCard(ScreenshotController screenshotController) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    screenshotController.capture(path: dir + "/shareImage.png", pixelRatio: 5)
        .then((value) {
      SocialShare.shareOptions("", imagePath: value.path);
    });
  }

  void getBusinessList() {
    Map<String,String> params = {};
    if(filteredTagId != null){
      params["tags"] = filteredTagId;
    }
    HomeRepo().getBusinessList(params).then((value) {
      if (value != null && value.data != null && value.data.length > 0) {
        businessModel.value = value;
      } else {

      }
    });
  }

  void getTags() {
    HomeRepo().getTags().then((value) {
      if (value != null && value.data != null && value.data.length > 0) {
        tagList.assignAll(value.data);

        for(int i=0;i<tagList.length;i++){
          tagStringList.add(tagList[i].name);
        }

      } else {

      }
    });
  }


  void postCall(String id) {
    HomeRepo().postCall(id).then((value) {
    });
  }

  void postShare(String id) {
    HomeRepo().postShare(id).then((value) {
    });
  }



  void openFilterDialog(BuildContext context) async {
    if(tagStringList.length <= 0){
      return;
    }
    Get.dialog(
        Container(
          width: Get.width,
          height: Get.height,
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: FilterListWidget(
            allTextList: tagStringList,
            height: 500,
            borderRadius: 10,
            width: Get.width,
            applyButonTextBackgroundColor: Get.theme.primaryColor,
            selectedTextBackgroundColor: Get.theme.primaryColor,
            hideheaderText: true,
            onApplyButtonClick: (list) {
              filteredTagId = "";
              if (list != null) {
                for(int i=0;i<tagList.length;i++){
                  for(int j=0;j<list.length;j++){
                    if(list[j] == tagList[i].name){
                      filteredTagId = filteredTagId + tagList[i].id.toString() + ",";
                    }
                  }
                }
                filteredTagId = filteredTagId.substring(0,filteredTagId.length-1);
              }
              print(filteredTagId);
              Get.back();
              getBusinessList();
            },
          ),
        )
    );
  }

  void openNumberOptionDialog(List<String> contactList,Data data) {
    Get.dialog(
        Scaffold(
          backgroundColor: Colors.transparent,
          body: InkWell(
            onTap: (){
              Get.back();
            },
            child: Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: contactList.map((e) {
                    return InkWell(
                      onTap: (){
                        launchCaller(e);
                        postCall(data.id.toString());
                        Future.delayed(Duration(seconds: 3),(){
                          Get.toNamed("businessDetail",arguments: data).then((value){
                            getBusinessList();
                          });
                        });
                      },
                      child: Container(
                          width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Get.theme.primaryColor,
                        ),
                        padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                        margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Center(
                          child: Text(e,
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        )
    );
  }

  launchCaller(String number) async {
    String url = "tel:"+number;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


}