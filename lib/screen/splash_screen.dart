import 'package:dhanda/helper/shared_prefs.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    UserPreferences().init();

    Future.delayed(Duration(seconds: 3), () {
      if (UserPreferences().get(UserPreferences.SHARED_USER_TOKEN) != null) {
        Get.offNamedUntil("/home", (route) => false);
      } else {
        Get.offNamedUntil("/login", (route) => false);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Container(
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: 120,
                    height: 120,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
