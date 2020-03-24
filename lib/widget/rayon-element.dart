import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_app/routes/products-list.dart';

class RayonElement extends StatelessWidget{
  String id;
  String title;
  String productsUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 10.0
      ),
      elevation: 5.0,
      child: Container(
        height: 60.0,
        child: ListTile(
          title: Text(
              "$title",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductsList(productsUrl: this.productsUrl,rayonTitle: this.title,)
              ),
            );
          },
        ),
      )
    );
  }

  RayonElement( this.id, this.title, this.productsUrl);
}