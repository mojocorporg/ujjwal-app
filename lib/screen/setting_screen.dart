import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text('Setting',
            style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.0,
                fontSize: 16,
                fontWeight: FontWeight.w600
            ),
          ),
      ),
    );
  }
}
