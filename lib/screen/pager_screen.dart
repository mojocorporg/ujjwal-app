import 'dart:io';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dhanda/controller/pager_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class PagerScreen extends StatelessWidget {
  final PagerController controller = Get.find<PagerController>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Get.theme.primaryColor
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Platform.isAndroid ? Brightness.dark :  Brightness.light,
        title: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child:  Image(
              image: AssetImage('assets/images/logo_two.png'),
              height: 35,
            ),
          ),
        ),
        actions: [

        ],
      ),
      body: Container(
          child: PageView(
            physics: new NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            children: controller.screens,
            onPageChanged: (pageIndex) {},
          )),
      bottomNavigationBar: Obx(()=>BottomNavigationBar(
          onTap: (value){
            controller.changePagerScreen(value);

          }, // new
          currentIndex: controller.currentPage.value,
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.phone),
              label: "",
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "",
            ),
            new BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: ""

            )
          ],
          iconSize : 25,
          selectedLabelStyle : TextStyle(fontSize: 0),
          unselectedItemColor: Colors.grey[400],
          selectedItemColor: Get.theme.primaryColor,
      )),

    );
  }

}

class Style extends StyleHook {
  @override
  double get activeIconSize => 40;
  @override
  double get activeIconMargin => 10;
  @override
  double get iconSize => 23;
  @override
  TextStyle textStyle(Color color) {
    return TextStyle(
        fontWeight: FontWeight.w600, letterSpacing: 1, fontSize: 10 , color: color, height: 1.7);
  }
}
