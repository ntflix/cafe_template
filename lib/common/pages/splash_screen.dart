import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cafe_template/common/platform/platform_scaffold.dart';
import 'package:cafe_template/common/strings.dart';
import 'package:cafe_template/common/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int splashDuration = 3;

  startTime() async {
    return Timer(Duration(seconds: splashDuration), () {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      Navigator.of(context).pushReplacementNamed('/HomePage');
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    var drawer = Drawer();

    return PlatformScaffold(
        drawer: drawer,
        body: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    alignment: FractionalOffset(0.5, 0.3),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Image.asset(
                        Strings.logo,
                        fit: BoxFit.fill,
                      ),
                    ),
//                    child : CachedNetworkImage(
////                      placeholder: (context, url) => CircularProgressIndicator(),
//                      imageUrl: Strings.splashImageURL,
//                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50.0),
                  child: Text(
                    Strings.copyrightStatement,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )));
  }
}
