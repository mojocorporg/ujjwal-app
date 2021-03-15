import 'package:dhanda/helper/config.dart';
import 'package:dhanda/helper/strings.dart';
import 'package:dhanda/screen/home_screen.dart';
import 'package:dhanda/screen/setting_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get.dart';
import 'package:dhanda/helper/shared_prefs.dart';
import 'package:dhanda/repository/login_repo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';

class LoginController extends GetxController{

  TextEditingController phoneController = new TextEditingController();
  TextEditingController referralController = new TextEditingController();
  var loginClicked = false.obs;
  var codeSend = false.obs;
  String verificationId,smsCode;
  String phoneNo;
  String countryCode="+91";


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }


  Future<void> getOtp() async{

    if(phoneController.text.length != 10){
      Config().displaySnackBar("enterValidMobile".tr, "");
      return;
    }
    loginClicked.value = true;

    phoneNo = countryCode + phoneController.text;

    print("Checking phone number -- ${phoneNo}");

    final PhoneVerificationCompleted verificationCompleted = (AuthCredential authResult){
      loginClicked.value = false;
      print("Number Verified ${authResult.providerId}");
      UserPreferences().saveData(UserPreferences.SHARED_USER_NUMBER, phoneNo);
      UserPreferences().saveData(UserPreferences.SHARED_USER_NUMBER_TWO, phoneController.text);
      UserPreferences().saveData(UserPreferences.SHARED_COUNTRY_CODE, countryCode);
        Get.toNamed("/referral");
    };

    final PhoneVerificationFailed verificationFailed = (Exception authException){
      print("Phone verification failed ${authException.toString()}");
      codeSend.value = false;
      loginClicked.value = false;
//      displaySnackBar(Strings.otp_verification_failed, "");
      Config().displaySnackBar(authException.toString(), "");
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]){
      Config().displaySnackBar("otpSent".tr, "");
      verificationId = verId;
      codeSend.value = true;
      loginClicked.value = false;
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeOut = (String verId){
      verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(phoneNumber: phoneNo,
        timeout: const Duration(seconds: 10),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeOut);
  }

  void verifyOtp(String otp)async{

    if(otp.length != 6){
      Config().displaySnackBar("enterValidOtp".tr, "");
      return;
    }

    loginClicked.value = true;

    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
    final User user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;

    print("Verification id -- ${user.uid}");
    if(user.uid != null){
      UserPreferences().saveData(UserPreferences.SHARED_USER_NUMBER, phoneNo);
      Get.toNamed("/referral");
      loginClicked.value = false;
    }else{
      loginClicked.value = false;
      Config().displaySnackBar("invalidOtp".tr, "");
    }

  }

  void loginUser(bool isSkip)async{

    loginClicked.value = true;

    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    await _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      Map<String,String> params = {
        "phone_number" : phoneNo,
        "os_type" : Platform.isAndroid ? "andorid" : "ios",
        "notification_token" : token,
      };

      print("Checking token --- ${token}");

      if(!isSkip){
        if(referralController.text.length > 0){
          if(referralController.text.length == 6){
            params["referral_code"] = referralController.text;
          }else{
            Config().displaySnackBar("enterValidReferral".tr, "");
          }
        }
      }

      LoginRepo().loginUser(params).then((value){

        if(value != null){

          if(value.status){
            UserPreferences().saveData(UserPreferences.SHARED_USER_TOKEN, value.token);
            UserPreferences().saveData(UserPreferences.SHARED_USER_ID, value.userId.toString());
            UserPreferences().saveData(UserPreferences.SHARED_USER_REFERRAL, value.referralCode.toString());

            Get.offNamedUntil("pager", (route) => false);

          }else{
            Config().displaySnackBar(value.message, "");
          }

        }else{

        }

      });

    });

  }

}