import 'package:flutter/material.dart';
import 'package:cafe_template/common/platform/platform_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cafe_template/common/strings.dart';
import 'package:cafe_template/common/widgets/navigation_box.dart';

class LocationsPage extends StatefulWidget {
  @override
  _LocationsPageState createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {

  @override
  void initState() {
    super.initState();
    _saveCurrentRoute("/Locations");
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

        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      body: Column(
        children: <Widget>[

          new NavBoxBuilder(
            navBoxItem: new NavBoxItem(
              height: 200,
              text: "the hall café",
              imagePath : "assets/blurred/2.jpg",
              navigatorPushName: "/Locations",
              textAlign: Alignment.centerLeft,
            ),
          ),

          new NavBoxBuilder(
            navBoxItem: new NavBoxItem(
              height: 200,
              text: "the music room",
              imagePath : "assets/blurred/4.jpg", //TODO: Have images loaded dynamically from server
              navigatorPushName: "/Menu",
              textAlign: Alignment.centerRight,
            ),
          ),

          new NavBoxBuilder(
            navBoxItem: new NavBoxItem(
              height: 200,
              text: "mackie mayor",
              imagePath : "assets/blurred/3.jpg",
              navigatorPushName: "/Specials",
              textAlign: Alignment.centerLeft,
            ),
          ),

        ],
      ),
    );
  }
}
