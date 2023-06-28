import 'package:api_test/screens/screen4.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  String? selectedDay;
  DateTime? fromDate;
  DateTime? toDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton<String>(
                value: selectedDay,
                hint: Text('Select a day'),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDay = newValue;
                  });
                },
                items: <String>['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              Text(
                'From Date: ${fromDate?.toString() ?? 'Not selected'}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: fromDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      fromDate = pickedDate;
                    });
                  }
                },
                child: Text('Select From Date'),
              ),
              SizedBox(height: 20.0),
              Text(
                'To Date: ${toDate?.toString() ?? 'Not selected'}',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: toDate ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      toDate = pickedDate;
                    });
                  }
                },
                child: Text('Select To Date'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen4(
                        selectedDay: selectedDay,
                        fromDate: fromDate,
                        toDate: toDate,
                      ),
                    ),
                  );
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
