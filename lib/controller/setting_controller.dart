import 'package:dhanda/helper/config.dart';
import 'package:dhanda/helper/shared_prefs.dart';
import 'package:dhanda/repository/home_repo.dart';
import 'package:dhanda/screen/home_screen.dart';
import 'package:dhanda/screen/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get.dart';



class SettingController extends GetxController{

  TextEditingController nameController = new TextEditingController().obs.value;
  TextEditingController phoneController = new TextEditingController().obs.value;

  var countryCode = "".obs;

  @override
  void onInit() {
    super.onInit();

    countryCode.value = UserPreferences().get(UserPreferences.SHARED_COUNTRY_CODE) ?? "";
    phoneController.text = UserPreferences().get(UserPreferences.SHARED_USER_NUMBER_TWO) ?? "";
    nameController.text = UserPreferences().get(UserPreferences.SHARED_USER_NAME) ?? "";

  }

  @override
  void onClose() {
    super.onClose();
  }


  void updateName(){
    Map<String,String> params = {
      "name" : nameController.text
    };
    HomeRepo().updateName(params).then((value){
      if(value.status){
        Config().displaySnackBar(value.message, "");
        UserPreferences().saveData(UserPreferences.SHARED_USER_NAME, nameController.text);
      }
    });
  }


  logoutConfirmation(BuildContext context) {

    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed:  () {
        Get.back();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Logout"),
      onPressed:  () {
        UserPreferences().saveData(UserPreferences.SHARED_USER_TOKEN, null);
        UserPreferences().saveData(UserPreferences.SHARED_USER_ID, null);
        UserPreferences().saveData(UserPreferences.SHARED_USER_REFERRAL, null);

        Get.toNamed("login");

      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Logout"),
      content: Text("Are you sure you want to logout?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


}