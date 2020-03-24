import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:OkaStore/main.dart';
import 'package:OkaStore/models/rayon.model.dart';
import 'package:OkaStore/widget/rayon-element.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  var dataUrl = "http://dev.okafrancois.fr/api/categories.json";

  Future<List> _getData(url) async {
    var data = await http.get(dataUrl);
    var jsondata = json.decode(utf8.decode(data.bodyBytes));
    var items = jsondata["items"];

    List<RayonModel> rayons = [];

    for (var el in items) {
      RayonModel rayon = RayonModel(el["id"], el["title"], el["products_url"]);
      rayons.add(rayon);
    }
    return rayons;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text("Rayons"),
        centerTitle: true,
        elevation: 10.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          left: 15.0,
          right: 15.0,
        ),
        child:  Container(
          child: FutureBuilder(
            future: _getData(dataUrl),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              final data = snapshot.data;
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return RayonElement(data[index].id,data[index].title, data[index].productsUrl);
                  },
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        child: CircularProgressIndicator(
                          backgroundColor: secondaryColor,
                        ),
                        width: 60,
                        height: 60,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Chargement des rayons...'),
                      )
                    ],
                  )
                );
              }
            },
          ),
        )
      )
    );
  }
}

