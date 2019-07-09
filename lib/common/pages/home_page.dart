import 'package:flutter/material.dart';
import 'package:cafe_template/common/platform/platform_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:cafe_template/common/strings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  void initState() {
    super.initState();
    _saveCurrentRoute("/HomePage");
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: AppBar(
        title: ListView(
          children: <Widget> [
            Container(
              height : 45,
              child : Image.asset(
                Strings.logoDark,
                fit: BoxFit.scaleDown,
              ),
            ),
            Divider(),
          ],
        ),


//        title: Text(
//          Strings.name,
//          style: TextStyle(color: Colors.black, fontSize: 20),
//        ),
        backgroundColor: Strings.colors.dark,
//        backgroundColor: Strings.colors.mainColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 6.0,
      ),
//      drawer: BasicDrawer(),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),

        child: Column(
          children: <Widget>[

            // stuff goes here like pictures and navigation

            Container(    // I should maybe change these to Inkwells if I don't use images
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal : 20, vertical : 10),
              padding: const EdgeInsets.all(0),

              decoration: new BoxDecoration(
                border: new Border.all(color: Strings.colors.dark),
              ),

              child: Text("nav item here", style: TextStyle(fontSize: 50),),
//              child : Image.asset(
//                Strings.logoDark,
//                fit: BoxFit.scaleDown,
//              ),
            ),

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal : 20, vertical : 10),
              padding: const EdgeInsets.all(0),

              decoration: new BoxDecoration(
                border: new Border.all(color: Strings.colors.dark),
              ),

              child: Text("another item here", style: TextStyle(fontSize: 50),),
//              child : Image.asset(
//                Strings.logoDark,
//                fit: BoxFit.scaleDown,
//              ),
            ),

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal : 20, vertical : 10),
              padding: const EdgeInsets.all(0),

              decoration: new BoxDecoration(
                border: new Border.all(color: Strings.colors.dark),
              ),

              child: Text("and here", style: TextStyle(fontSize: 50),),
//              child : Image.asset(
//                Strings.logoDark,
//                fit: BoxFit.scaleDown,
//              ),
            ),

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal : 20, vertical : 10),
              padding: const EdgeInsets.all(0),

              decoration: new BoxDecoration(
                border: new Border.all(color: Strings.colors.dark),
              ),

              child: Text("papapapapowww", style: TextStyle(fontSize: 50),),
//              child : Image.asset(
//                Strings.logoDark,
//                fit: BoxFit.scaleDown,
//              ),
            ),
          ],
        ),
      ),
    );
  }
}
