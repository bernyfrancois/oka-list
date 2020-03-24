import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_app/routes/product.dart';

class ProductElement extends StatelessWidget{
  String name;
  String description;
  String picUrl;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        margin: EdgeInsets.symmetric(
            vertical: 10.0
        ),
        elevation: 5.0,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Product(title: this.name,description: this.description,picUrl: this.picUrl,)
              ),
            );
          },
          child: Container(
            height: 100,
            child: Center(
              child: ListTile(
                dense: true,
                leading: Container(
                  width: 80.0,
                  height: 80.0,
                  child: Image.network(
                    "$picUrl",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                title: Text(
                  "$name",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                  maxLines: 2,
                ),
                subtitle: Text(
                  "$description",
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14.0
                  ),
                )
              ),
            ),
          ),
        )
    );
  }

  ProductElement(this.name, this.description, this.picUrl);
}