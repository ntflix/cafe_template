import 'package:flutter/material.dart';
import 'package:cafe_template/common/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

class Item {
  final String name, niceName, description, imagePath, components;

  Item({
    this.name,
    this.niceName,
    this.description,
    this.imagePath,
    this.components,
  });
}

List<ItemBoxBuilder> getItemBoxes(List<Item> items, double height) {
  List<ItemBoxBuilder> itemBoxes = new List<ItemBoxBuilder>();

  items.forEach((element) => {
    itemBoxes.add(new ItemBoxBuilder(item: element, height: height)),
  });

  return itemBoxes;
}

Future<List<Item>> getItems() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String jsonString = preferences.getString('itemsJSON');

  Map itemsMap = jsonDecode(jsonString); // works

  /// usage:
  /// print(itemsMap[indexString][propertyName].toString()
  /// eg
  /// print(itemsMap['0']['name'].toString() prints 'archetype'

  List<Item> itemsList = new List<Item>();

  for (int i = 0; i > -1; i++) {
    Map thisItemMap = itemsMap[i.toString()];

    try {
      thisItemMap['name'].toString();
    } catch (_) {
      //no item here
      break;
    }
    Item thisItem = new Item(
      components: thisItemMap['composition'].toString(),
      niceName: thisItemMap['niceName'].toString(),
      name: thisItemMap['name'].toString(), // should probably convert name given in JSON (with '_'s) to user-friendly name
      description: thisItemMap['description'].toString(),
      imagePath: Strings.itemsImagesFolder + thisItemMap['name'].toString() + ".png"
    );

    itemsList.add(thisItem);
  }

  return itemsList;
}

class ItemBoxBuilder extends StatelessWidget {
  final double height;
  final Item item;

  ItemBoxBuilder({
    this.height,
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      height: this.height,

      child : new Material(
        child : new InkWell(
          child:  Row(
            children: <Widget>[

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 7.5),
                child : Image.asset(
                  this.item.imagePath,
                  fit: BoxFit.contain,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children : <Widget> [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0,12, 0, 0),
                    child: Text(
                      this.item.niceName,
                      style: Strings.itemTextStyle,
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(this.item.components == null ? " " : this.item.components),
                  ),
                ],
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