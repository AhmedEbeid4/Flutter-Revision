import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(App());
}
class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var colors = [Colors.pinkAccent,Colors.green,Colors.amber,Colors.red,Colors.blue,Colors.orange,Colors.teal];
  List<Container> getList(){
    int j=0;
    List<Container> list = [];
    for(int i=0 ;i<1000;i++){
      list.add(Container(padding: const EdgeInsets.all(20),color:colors[j++],child: const Text("text1",textAlign: TextAlign.center,),));
      if(j == colors.length){
        j=0;
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(top: 15),
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              childAspectRatio: 3,
              children: getList()
            ),
          ),
        ),
      ),
    );
  }
}
