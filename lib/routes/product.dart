
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_app/main.dart';

class Product extends StatefulWidget{
  final title;
  final description;
  final picUrl;

  const Product({Key key, this.title, this.description, this.picUrl, productsUrl}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductState(title,description,picUrl);
  }
}

class _ProductState extends State<Product> {
  var picUrl;

  var description;

  var title;

  _ProductState(this.title, this.description, this.picUrl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: Text(
              "$title",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 10.0,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 300.0,
              child: Center(
                child: Image.network(
                  "$picUrl",
                  fit: BoxFit.fitWidth,
                ),
              ),
              color: bgColor,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Text(
                "Description: \n\n$description",
                style: TextStyle(
                  fontSize: 14.0
                ),
              ),
            )
          ],
        ),
    );
  }
}

