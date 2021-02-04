
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Config {

  static const PRIMARY_COLOR =  Color(0xFF7fdbda);
  static const PRIMARY_COLOR_2 =  Color(0xFF142850);
  static const PRIMARY_COLOR_2_600 =  Color(0xff112442);
  static const PRIMARY_COLOR_2_700 =  Color(0xff0a1a33);
  static const PRIMARY_COLOR_2_800 =  Color(0xff0d2344);
  static const PRIMARY_COLOR_2_400 =  Color(0xff1d375b);
  static const PRIMARY_COLOR_600 =  Color(0xFF5fc1be);
  static const ORANGE_COLOR =  Color(0xFFfebf63);
  static const ORANGE_COLOR_600 =  Color(0xFFcc8e44);
  static const ORANGE_COLOR_2 =  Color(0xFFf7944b);

//  static const String user_token = "Bearer fmc89GCBJZNJRVp7VR0coie5vAm2";


  List colors = [Colors.red, Colors.green, Colors.yellow];
  Random random = new Random();

  void displaySnackBar(String title,String message){
    Get.snackbar(title, message, backgroundColor: Colors.white, colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
  }


  List<Color> barColors = [
  Color.fromRGBO(193, 37, 82,1), Color.fromRGBO(255, 102, 0,1), Color.fromRGBO(245, 199, 0,1),
  Color.fromRGBO(106, 150, 31,1), Color.fromRGBO(179, 100, 53,1),Color.fromRGBO(179, 100, 53,1)
  ];

}