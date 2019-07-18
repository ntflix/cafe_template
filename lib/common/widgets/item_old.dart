import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:cafe_template/common/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<ItemOld> items;

class ItemOld {
  int id;
  bool isLoaded = false;
  String name;
  String description;
  String imagePath;

  ItemOld({
    this.id,
    initialiseItem(),
  });
  
  Future<ItemOld> getInitializedItem() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String json = preferences.getString('itemsJSON');
    Map thisItemMap = jsonDecode(json)[this.id.toString()];

    this.name = thisItemMap['name'].toString();
    this.description = thisItemMap['description'].toString();
    this.imagePath = Strings.itemsImagesFolder + this.name + ".png";

    this.isLoaded = true;

    print(this.name + ": " + this.description);
    print(this.imagePath);
  }
}

class ItemBox extends StatefulWidget {

  bool isLoaded = false;

  final double height;
  final ItemOld item;
  final int id;

  ItemBox({
    this.height,
    this.item,
    this.id,
  });

  @override
  _ItemBoxState createState() => _ItemBoxState(height: height, item: item, id: id);
}

class _ItemBoxState extends State<ItemBox> {

  bool isLoaded = false;
  ItemOld item;
  double height;
  int id;

  _ItemBoxState({
    this.item,
    this.height,
    this.id,
  });

  Future<void> getData() async {
    final result = await item.getInitializedItem();
    if (!isLoaded) {
      setState(() {
        item = result;
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    ItemOld().getInitializedItem().then((futureItem) => this.item = futureItem);
    getData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      height: this.height,

      child : new Material(
        child : new InkWell(
            child:  Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 7.5),
                  child : this.item.isLoaded == true ? Image.asset(
                    this.item.imagePath,
                    fit: BoxFit.contain,
                  ) : Container(),
                ),
              ],
            ),

          borderRadius: new BorderRadius.all(Radius.circular(12)),
          onTap: () {},
        ),
        color: Colors.transparent,
//              borderRadius: new BorderRadius.all(Radius.circular(12)),
      ),

      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(Radius.circular(12)),
        //              border: new Border.all(color : Colors.black),
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: Colors.black,
            offset: Offset(.5, .5),
            blurRadius: 1,
          ),
        ],
      ),
    );
  }
}