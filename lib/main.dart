import 'package:flutter/material.dart';


void main() {
  runApp(new MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xffFBCB3B);
    const secondaryColor = Color(0xff0A111E);
    const bgColor = Color(0xffF2F1ED);
    // TODO: implement build
    return new MaterialApp(
      title: 'Oka List',
      theme: new ThemeData(
        primarySwatch: Colors.yellow,
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
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffFBCB3B),
    );
  }
}