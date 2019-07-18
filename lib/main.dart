import 'package:flutter/material.dart';
import 'package:cafe_template/common/pages/splash_screen.dart';
import 'package:cafe_template/common/pages/home_page.dart';
import 'package:cafe_template/common/pages/nav_page.dart';
import 'package:cafe_template/common/pages/locations.dart';
import 'package:cafe_template/common/pages/menu.dart';
import 'package:cafe_template/common/pages/specials.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cafe_template/common/strings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _loadStrings();
    return MaterialApp(
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        "/HomePage": (BuildContext context) => HomePage(),
        "/NavPage": (BuildContext context) => NavPage(),
        "/Locations" : (BuildContext context) => Menu(),
        "/Menu" : (BuildContext context) => Menu(),
        "/Specials" : (BuildContext context) => Specials()
      },
    );
  }

  _loadStrings() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('itemsJSON', await loadJson());
  }

  Future<String> loadJson() async =>
      await rootBundle.loadString(Strings.itemsJSON);
}

