import 'dart:math';

import 'package:flutter/material.dart';
void main() {
  runApp(App());
}
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<Color> _colors= [Colors.blue,Colors.black,Colors.pink,Colors.indigo,Colors.orangeAccent,Colors.deepOrange,Colors.green,Colors.red];
  int currIndex=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(flex: 1,child: SizedBox(),),
              Container(
                color: _colors[currIndex],
                height: 200,
              ),
              const Expanded(flex: 1,child: SizedBox(),),
              ElevatedButton(onPressed: (){
                  setState(() {
                    currIndex = Random().nextInt(_colors.length);
                  });
              }, child: Container(
                  padding: EdgeInsets.all(15),
                  child: const Text("Change Color")
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
