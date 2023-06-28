import 'package:api_test/screens/screen3.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Screen2 extends StatelessWidget {
  final File? image;
  final String name;

  Screen2({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: image != null ? FileImage(image!) : null,
            ),
            SizedBox(height: 20.0),
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Screen3()),
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}