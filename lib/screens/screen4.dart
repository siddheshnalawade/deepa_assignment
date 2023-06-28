import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';


class Screen4 extends StatelessWidget {
  final String? selectedDay;
  final DateTime? fromDate;
  final DateTime? toDate;

  Screen4({required this.selectedDay, required this.fromDate, required this.toDate});

  
  int calculateTotalDays() {
    if (selectedDay == null || fromDate == null || toDate == null) {
      return 0;
    }

    int totalDays = 0;
    DateTime currentDate = fromDate!;
    while (currentDate.isBefore(toDate!.add(Duration(days: 1)))) {
      if (currentDate.weekday == getWeekdayIndex(selectedDay!)) {
        totalDays++;
      }
      currentDate = currentDate.add(Duration(days: 1));
    }

    return totalDays;
  }

  int getWeekdayIndex(String weekday) {
    switch (weekday) {
      case 'Monday':
        return DateTime.monday;
      case 'Tuesday':
        return DateTime.tuesday;
      case 'Wednesday':
        return DateTime.wednesday;
      case 'Thursday':
        return DateTime.thursday;
      case 'Friday':
        return DateTime.friday;
      case 'Saturday':
        return DateTime.saturday;
      case 'Sunday':
        return DateTime.sunday;
      default:
        return DateTime.monday;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 4'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selected Day: $selectedDay',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'From Date: ${DateFormat('dd-MM-yyyy').format(fromDate!).toString() ?? 'Not selected'}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'To Date: ${DateFormat('dd-MM-yyyy').format(toDate!).toString() ?? 'Not selected'}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Total Count of Days: ${calculateTotalDays()}',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}