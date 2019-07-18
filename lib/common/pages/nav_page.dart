import 'package:flutter/material.dart';
import 'package:cafe_template/common/platform/platform_scaffold.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cafe_template/common/strings.dart';

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

          InkWell(
            onTap: () {
              //Top Box
              Navigator.of(context).pushNamed("/Locations");
            },
            child : Container(
              height:100, // 80
              width : MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: new Border(bottom: BorderSide(color: Strings.colors.separator)),
                image: new DecorationImage(image: ExactAssetImage("assets/blurred/1.png"), fit: BoxFit.fitWidth),
                /*gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,

                  stops: [0, 1],
                  colors: [
                    Colors.greenAccent[200],
                    Colors.greenAccent[100],
                  ],
                ),*/
              ),

              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 24, 0, 0), // 100 : 24 | 80 : 14
                child: Text(
                  "OUR LOCATIONS",
                  textAlign: TextAlign.left,
                  style: Strings.imageTextStyle,
                ),
              ),
            ),
          ),

          InkWell(
            onTap: () {
              //2nd Box
              Navigator.of(context).pushNamed("/Menu");
            },
            child : Container(
              height:100,
              width : MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: new Border(bottom: BorderSide(color: Strings.colors.separator)),
                image: new DecorationImage(image: ExactAssetImage("assets/blurred/6.jpg"), fit: BoxFit.fitWidth),
                /*gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,

                  stops: [0, 1],
                  colors: [
                    Colors.lightBlueAccent[100],
                    Colors.lightBlueAccent[400],
                  ],
                ),*/
              ),

              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 24, 10, 0), // (container-textSize) * 2 // (50-38)*2
                child: Text(
                  "CATALOGUE",
                  textAlign: TextAlign.right,
                  style: Strings.imageTextStyle,
                ),
              ),
            ),
          ),

          InkWell(
            onTap: () {
              //3rd Box
              Navigator.of(context).pushNamed("/Specials");
            },
            child : Container(
              height:100,
              width : MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: new Border(bottom: BorderSide(color: Strings.colors.separator)),
                image: new DecorationImage(image: ExactAssetImage("assets/blurred/4.jpg"), fit: BoxFit.fitWidth),
                /*gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,

                  stops: [0, 1],
                  colors: [
                    Colors.pink[300],
                    Colors.pink[100],
                  ],
                ),*/
              ),

              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 24, 0, 0), // (container-textSize) * 2 // (50-38)*2
                child: Text(
                  "SPECIALS",
                  textAlign: TextAlign.left,
                  style: Strings.imageTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
