import 'package:flutter/material.dart';
import 'package:cafe_template/common/platform/platform_scaffold.dart';
import 'package:cafe_template/common/strings.dart';

class Page extends StatefulWidget {

  final Widget body;

  Page({
    Widget body
  }): this.body = body;

  @override
  _PageState createState() => _PageState(body);
}

class _PageState extends State<Page> {

  final Widget body;
  _PageState(this.body);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: Colors.white,

      appBar: new AppBar(
        backgroundColor: Strings.colors.mainColor,
        title : Text(Strings.name),

        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Strings.colors.iconColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      body: this.body,
    );
  }
}