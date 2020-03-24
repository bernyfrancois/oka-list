import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_app/routes/splash-screen.dart';

const primaryColor = Color(0xffFBCB3B);
const secondaryColor = Color(0xff0A111E);
const bgColor = Color(0xffF2F1ED);

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Oka List',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

