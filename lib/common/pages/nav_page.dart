import 'package:flutter/material.dart';
import 'package:cafe_template/common/platform/platform_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cafe_template/common/strings.dart';
import 'package:cafe_template/common/widgets/navigation_box.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {

  @override
  void initState() {
    super.initState();
    _saveCurrentRoute("/NavPage");
  }

  @override
  void dispose() {
    super.dispose();
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: new AppBar(
        backgroundColor: Strings.colors.mainColor,
        title : Text(Strings.name),

        leading : new Container(),
      ),
      body: Column(
        children: <Widget>[

          new NavBoxBuilder(
            navBoxItem: new NavBoxItem(
              text: "OUR LOCATIONS",
              imagePath : "assets/blurred/1.png",
              navigatorPushName: "/Locations",
              textAlign: TextAlign.left,
            ),
          ),

          new NavBoxBuilder(
            navBoxItem: new NavBoxItem(
              text: "CATALOGUE",
              imagePath : "assets/blurred/6.jpg",
              navigatorPushName: "/Menu",
              textAlign: TextAlign.right,
            ),
          ),

          new NavBoxBuilder(
            navBoxItem: new NavBoxItem(
              text: "SPECIALS",
              imagePath : "assets/blurred/4.jpg",
              navigatorPushName: "/Specials",
              textAlign: TextAlign.left,
            ),
          ),

        ],
      ),
    );
  }
}
