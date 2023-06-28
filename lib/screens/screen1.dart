import 'package:api_test/screens/screen2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  File? _image;
  final picker = ImagePicker();
  TextEditingController _nameController = TextEditingController();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: _image != null ? FileImage(_image!) : null,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: getImage,
              child: Text('Select Image'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Screen2(
                      image: _image,
                      name: _nameController.text,
                    ),
                  ),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}