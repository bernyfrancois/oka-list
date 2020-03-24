import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:list_app/main.dart';
import 'package:list_app/models/product.model.dart';
import 'package:http/http.dart' as http;
import 'package:list_app/widget/product-element.dart';

class ProductsList extends StatefulWidget{
  final productsUrl;
  final rayonTitle;

  const ProductsList({Key key, this.productsUrl, this.rayonTitle}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductsListState(productsUrl, rayonTitle);
  }
}

class _ProductsListState extends State<ProductsList> {
  String productsUrl;
  String rayonTitle;

  _ProductsListState(productsUrl, rayonTitle){
    this.productsUrl = productsUrl;
    this.rayonTitle = rayonTitle;
  }

  Future<List> _getData(url) async {
    var data = await http.get(url);
    var jsondata = json.decode(utf8.decode(data.bodyBytes));
    var items = jsondata["items"];
    print(items[0]["name"]);

    List<ProductModel> products = [];

    for(var el in items){
     ProductModel product = ProductModel(el["name"], el["description"], el["picture_url"]);
      products.add(product);
    }
    print(products);
    return products;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: Text("$rayonTitle"),
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
                future: _getData(this.productsUrl),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  final data = snapshot.data;
                  if(snapshot.hasData){
                    print(data.length);
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index){
                        return ProductElement(data[index].name, data[index].description, data[index].picUrl);
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
                              child: Text('Chargement des produits...'),
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

