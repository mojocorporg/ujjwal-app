import 'package:dhanda/controller/home_controller.dart';
import 'package:dhanda/helper/config.dart';
import 'package:dhanda/helper/shared_prefs.dart';
import 'package:dhanda/model/payment_package_model.dart';
import 'package:dhanda/repository/home_repo.dart';
import 'package:dhanda/screen/home_screen.dart';
import 'package:dhanda/screen/setting_screen.dart';
import 'package:dhanda/widget/PaymetnPackageWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class SettingController extends GetxController {
  TextEditingController nameController = new TextEditingController().obs.value;
  TextEditingController phoneController = new TextEditingController().obs.value;

  PaymentPackageModel paymentPackageModel;

  var countryCode = "".obs;
  var packageBtnClick = false.obs;

  @override
  void onInit() {
    super.onInit();

    countryCode.value =
        UserPreferences().get(UserPreferences.SHARED_COUNTRY_CODE) ?? "";
    phoneController.text =
        UserPreferences().get(UserPreferences.SHARED_USER_NUMBER_TWO) ?? "";
    nameController.text =
        UserPreferences().get(UserPreferences.SHARED_USER_NAME) ?? "";

    getPackage();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateName() {
    Map<String, String> params = {"name": nameController.text};
    HomeRepo().updateName(params).then((value) {
      if (value.status) {
        Config().displaySnackBar(value.message, "");
        UserPreferences()
            .saveData(UserPreferences.SHARED_USER_NAME, nameController.text);
      }
    });
  }

  logoutConfirmation(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Get.back();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Logout"),
      onPressed: () {
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

  void startPayment(String orderId, int amount) {
    Razorpay _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    var options = {
      'key': Config.RAZORPAY_TEST_KEY,
      'amount': amount * 1000,
      //in the smallest currency sub-unit.
      'name': 'Dhanda',
      'order_id': orderId,
      // Generate order_id using Orders API
      'description': '',
      'timeout': 180,
      // in seconds
      'prefill': {'contact': '', 'email': ''}
    };

    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    Map<String, String> userData = {
      'razorpay_payment_id': response.paymentId,
      'razorpay_order_id': response.orderId,
      'razorpay_signature': response.signature
    };

    HomeRepo().verifyPayment(userData).then((value) {
      packageBtnClick.value = false;
      Get.back();
      if(value != null && value.status){
        Get.find<HomeController>().getLocation();
        Config().displaySnackBar(value.message, "");
      }else{
        Config().displaySnackBar(value.message, "");
      }
    });

  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    packageBtnClick.value = false;
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  void getPackage() {
    HomeRepo().getPackage().then((value) {
      if (value != null && value.data != null) {
        paymentPackageModel = value;
      }
    });
  }

  void openPaymentBS(BuildContext context) {
    if (paymentPackageModel == null) {
      return;
    }
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return PaymentPackageWidget(paymentPackageModel: paymentPackageModel,controller: this,);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
    );
  }

  void getOrderId(){

    packageBtnClick.value = true;

    HomeRepo().getOrderId().then((value){
      if(value != null && value.status){
        startPayment(value.razorpayOrderId, value.price);
      }else{
        packageBtnClick.value = false;
        Config().displaySnackBar(value.message, "");
      }
    });

  }

}
