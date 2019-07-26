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

  final _usernameBoxController = new TextEditingController();
  final _passwordBoxController = new TextEditingController();
  FocusNode focusNode;

  void login(String username, String password) {
    debugPrint("Username: " + username + ", password: " + password);
    Navigator.of(context).pushNamed("/NavPage");
  }

  void initState() {
    super.initState();
    _saveCurrentRoute("/NavPage");

    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              Colors.white,
              Strings.colors.mainColor.withAlpha(100),
            ],
            stops: [0,1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.fromLTRB(0, 100, 0, 0),

        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal : 0, vertical : 0),
              padding: const EdgeInsets.all(0),

//              decoration: new BoxDecoration(
//                border: new Border.all(color: Strings.colors.dark),
//              ),

              child: Image.asset(
                Strings.logo,
                fit: BoxFit.fill,
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              alignment: Alignment.center,
              height: 45,
              width : 240,

              decoration: new BoxDecoration(
                border: new Border.all(color: Strings.colors.menuTextColor),
                borderRadius: new BorderRadius.all(Radius.circular(9)),
              ),

              child: InkWell(
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _usernameBoxController,
                  autocorrect: false,
                  decoration: new InputDecoration.collapsed(
                    hintText: 'username',
                    border: InputBorder.none,
                  ),

                  onSubmitted: (_) => FocusScope.of(context).requestFocus(focusNode),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: InkWell(
                onTap: () => {},
//                splashColor: Colors.transparent,
                borderRadius: new BorderRadius.all(Radius.circular(9)),
                //              customBorder: new Border.all(color: Strings.colors.menuTextColor),

                child : new Container(
                  alignment: Alignment.center,
                  height: 45,
                  width : 240,

                  decoration: new BoxDecoration(
                    border: new Border.all(color: Strings.colors.menuTextColor),
                    borderRadius: new BorderRadius.all(Radius.circular(9)),
                  ),

                  child: TextField(
                    focusNode: focusNode,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    controller: _passwordBoxController,
                    autocorrect: false,

                    decoration: new InputDecoration.collapsed(
                      hintText: 'password',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: InkWell(
                onTap: () => { login(_usernameBoxController.text, _passwordBoxController.text) },
//                splashColor: Colors.transparent,
                borderRadius: new BorderRadius.all(Radius.circular(9)),
  //              customBorder: new Border.all(color: Strings.colors.menuTextColor),

                child : new Container(
                  alignment: Alignment.center,
                  height: 40,
                  width : 90,

                  decoration: new BoxDecoration(
                    border: new Border.all(color: Strings.colors.menuTextColor),
                    borderRadius: new BorderRadius.all(Radius.circular(9)),
                  ),

                  child: Text("go", style: TextStyle(color: Strings.colors.menuTextColor),),
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              alignment: Alignment.center,

              child: InkWell(
                onTap: () => {},
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text("more options",
                    style: TextStyle(color: Strings.colors.menuTextColor),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
