import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cafe_template/common/strings.dart';
import 'package:flutter/material.dart';

class ItemFuture {
  String name, description, imagePath;
}

class FutureBuilderJson extends StatelessWidget {
  final String uri = 'https://jsonplaceholder.typicode.com/users';

  Future<List<dynamic>> _fetchStrings() async {
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<dynamic> listOfString = items.map((json) {
        return json['name'];
      }).toList();

      return listOfString;
    } else {
      throw Exception('Failed to load internet');
    }
  }

  Future<ItemFuture> _fetchItem() async {
    var returnedItem = jsonDecode(Strings.itemsJSON)[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child : Scaffold(
        body: FutureBuilder<List<dynamic>>(
          future: _fetchStrings(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView(
              children: snapshot.data.map((data) {
                return ListTile(
                  title: Text(data.toString()),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}