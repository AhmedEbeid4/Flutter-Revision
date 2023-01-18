import 'dart:math';

import 'package:flutter/material.dart';
void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var _currText='.';
  void roll(){
    String s="";
    int num =Random().nextInt(6)+1;
    for(int i=0; i<num;i++){
      if(i%2==0 && i!=0){
        s+='\n';
      }
      s+='. ';

    }
    setState(() {
      _currText=s;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Dice Roller'),),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
              const Expanded(flex: 1,child: SizedBox(),),
              Center(
                child: Container(
                  color: Colors.blue,
                  width: 300,
                  height: 300,
                  child: Center(child: Text(_currText,style: const TextStyle(fontSize: 60,color: Colors.white),)),
                ),
              ),
              const Expanded(flex: 1,child: SizedBox(),),
              ElevatedButton(onPressed: (){
                roll();
              },style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)), child: const Text("Roll"),)
            ],
          ),
        ),
      ),
    );
  }
}
