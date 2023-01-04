import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String? _selectedDate;

  void _datePicker() {
    DateTime? pickedDate;
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime(2100))
        .then((value) => pickedDate);

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(
          formattedDate); //formatted date output using intl package =>  2021-03-16
      setState(() {
        _selectedDate = formattedDate; //set output date to TextField value.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: MaterialButton(
              onPressed: _datePicker,
              child: Text(
                  _selectedDate != null ? "$_selectedDate" : "Date Picker"),
            ),
          ),
        ),
      ),
    );
  }
}
