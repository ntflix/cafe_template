import 'package:flutter/material.dart';
import 'package:cafe_template/common/platform/platform_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cafe_template/common/strings.dart';
import 'package:cafe_template/common/widgets/item.dart';
import 'package:cafe_template/common/widgets/page.dart';

bool alreadyLoaded = false;

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<ItemBoxBuilder> itemBoxes = new List<ItemBoxBuilder>();

  @override
  void initState() {
    super.initState();
    _saveCurrentRoute("/Menu");
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

    if (itemBoxes.length == 0) {
      getItems().then((val) {
        itemBoxes = getItemBoxes(val, 125);
        setState((){/*updates view after data fetched*/});
      });
    }

//    return Page(
//      body: new Container(
//        child : new ListView(children: itemBoxes),
//      ),
//    );

    return PlatformScaffold(
      backgroundColor: Colors.white,

      appBar: new AppBar(
        backgroundColor: Strings.colors.mainColor,
        title : Text(Strings.name),

        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      body: new ListView(
        children: itemBoxes,
      ),
    );
  }
}