import 'package:flutter/material.dart';
import 'package:cafe_template/common/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

class NavBoxItem {
  final double height;
  final String text, imagePath, navigatorPushName;
  final Alignment textAlign;

  NavBoxItem({
    this.height,
    this.text,
    this.imagePath,
    this.navigatorPushName,
    this.textAlign,
  });
}

class NavBoxBuilder extends StatelessWidget {
  final NavBoxItem navBoxItem;

  NavBoxBuilder({
    this.navBoxItem,
  });

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: Center(
        child: Ink.image(
          image: AssetImage(this.navBoxItem.imagePath),
          fit: BoxFit.fitWidth,
          height: this.navBoxItem.height,
          child: InkWell(
            onTap: () {
                Navigator.of(context).pushNamed(this.navBoxItem.navigatorPushName);
            },
            child: Align(
              alignment: this.navBoxItem.textAlign,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  this.navBoxItem.text,
                  style: Strings.imageTextStyle,
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}