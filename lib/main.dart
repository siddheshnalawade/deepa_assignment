import 'package:api_test/screens/screen1.dart';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

void main() async {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Screen1(),
    );
  }
}
