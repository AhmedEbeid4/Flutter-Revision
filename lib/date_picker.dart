import 'package:flutter/cupertino.dart';
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
  DateTime? _selectedDate;
  void _datePicker() {
    showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime.now()
    ).then((value) {
      if(value == null){
        return;
      }else{
        setState(() {
          _selectedDate=value;
        });
      }
    })
    ;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: MaterialButton(
              onPressed:  _datePicker
              ,
              child: Text(_selectedDate != null ? "$_selectedDate" : "Date Picker"),
            ),
          ),
        ),
      ),
    );
  }
}
