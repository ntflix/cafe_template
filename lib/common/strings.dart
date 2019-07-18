import 'package:flutter/material.dart';

class Strings {
  static const String splashImageURL = 'https://thecoffeehopper.com/favicons/android-chrome-512x512.png';
  static const String copyrightStatement = '© Copyright Statement 2019';
  static const String name = "FLUTTER EXPERIMENTS";
  static const String itemsJSON = "assets/atkinsons/items/items.json";
  static const String itemsImagesFolder = 'assets/atkinsons/coffee/';
  static const String logo = "assets/cafe_logo.png";
  static const String logoDark = "assets/cafe_logo.png";

  static ThemeColors colors = new ThemeColors();

  static final imageTextStyle = new TextStyle(
      fontFamily: "Avenir",
      color: Colors.white,
      fontSize: 38,

      shadows: [
        Shadow( // bottomLeft
            offset: Offset(-1.5, -1.5),
            color: Colors.black
        ),
        Shadow( // bottomRight
            offset: Offset(1.5, -1.5),
            color: Colors.black
        ),
        Shadow( // topRight
            offset: Offset(1.5, 1.5),
            color: Colors.black
        ),
        Shadow( // topLeft
            offset: Offset(-1.5, 1.5),
            color: Colors.black
        ),
      ]
  );
}

class ThemeColors {
//  Color mainColor = Color.fromRGBO(154, 204, 172, 1.0);
//  Color mainColor = Color.fromRGBO(120, 80, 80, 1); // brown
  Color mainColor = Colors.green[200];
  Color dark = Color.fromRGBO(24, 26, 27, 1.0);
  Color menuTextColor = Color.fromRGBO(100, 100, 100, 1.0);
  Color separator = Colors.black;
  Color iconColor = Colors.white;
}