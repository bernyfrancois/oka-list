import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(new MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Oka List',
      theme: new ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xffFBCB3B);
    const secondaryColor = Color(0xff0A111E);
    const bgColor = Color(0xffF2F1ED);
    // TODO: implement build
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: new AppBar(
        title: new Text("Oka List"),
        centerTitle: true,
        elevation: 20.0,
        leading: new Icon(Icons.home),
      ),
      body: new Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            new Card(
              color: bgColor,
              elevation: 10.0,
              child: new Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: 150.0,
                child: Center(
                    child: new Text(
                      "Hello from card",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                        fontSize: 20,
                      ),
                    )
                ),
              ),
            ),
            new Container(
              height: 150.0,
              width: 150.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
              child: new Image.asset(
                  'assets/img/avatr.png',
                  fit: BoxFit.cover,
              ),
            ),
            new Container(
              width: 150.0,
              height: 150.0,
              child: new Image.asset("assets/img/icon.png")
            )
          ],
        )
      ),
    );
  }
}