import 'package:flutter/material.dart';
import 'package:cafe_template/common/pages/splash_screen.dart';
import 'package:cafe_template/common/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

