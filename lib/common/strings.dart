import 'package:flutter/material.dart';

class Strings {
  static const String splashImageURL = 'https://thecoffeehopper.com/favicons/android-chrome-512x512.png';
  static const String copyrightStatement = '© Copyright Statement 2019';
  static const String name = "CAFÉ";

  static const String logo = "assets/cafe_logo.png";
  static const String logoDark = "assets/cafe_logo.png";

  static ThemeColors colors = new ThemeColors();
}

class ThemeColors {
//  Color mainColor = Color.fromRGBO(154, 204, 172, 1.0);
//  Color mainColor = Color.fromRGBO(120, 80, 80, 1); // brown
  Color mainColor = Colors.green[200];
  Color dark = Color.fromRGBO(24, 26, 27, 1.0);
  Color menuTextColor = Color.fromRGBO(100, 100, 100, 1.0);
  Color separator = Colors.black;
}