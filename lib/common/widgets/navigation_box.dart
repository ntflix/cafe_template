import 'package:flutter/material.dart';
import 'package:cafe_template/common/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

class NavBoxItem {
  final String text, imagePath, navigatorPushName;
  final TextAlign textAlign;

  NavBoxItem({
    this.text,
    this.imagePath,
    this.navigatorPushName,
    this.textAlign,
  });
}

class NavBoxBuilder extends StatelessWidget {
  final double height;
  final NavBoxItem navBoxItem;

  NavBoxBuilder({
    this.height,
    this.navBoxItem,
  });

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () {
        //Top Box
        Navigator.of(context).pushNamed(this.navBoxItem.navigatorPushName);
      },
      child : Container(
        height:100, // 80
        width : MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: new Border(bottom: BorderSide(color: Strings.colors.separator)),
          image: new DecorationImage(image: ExactAssetImage(this.navBoxItem.imagePath), fit: BoxFit.fitWidth),
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
          padding: const EdgeInsets.fromLTRB(10, 24, 10, 0), // 100 : 24 | 80 : 14
          child: Text(
            this.navBoxItem.text,
            textAlign: this.navBoxItem.textAlign,
            style: Strings.imageTextStyle,
          ),
        ),
      ),
    );
  }
}