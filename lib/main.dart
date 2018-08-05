import 'package:flutter/material.dart';
import 'app.dart';


void main() async {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Android Metrics",
      home: TestApp()
    );
  }
}

