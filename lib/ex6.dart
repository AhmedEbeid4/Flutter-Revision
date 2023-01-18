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
  final List _integers=[1,1,1,1,1,1,1,1,1];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(flex: 1,child: SizedBox()),

                  Row(
                    children: [
                      const Expanded(flex: 1,child: SizedBox()),

                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(1),
                                width: 50,
                                height: 50,
                                color: _integers[0] == 1?Colors.black:Colors.white,
                              ),
                              Container(
                                margin: const EdgeInsets.all(1),

                                width: 50,
                                height: 50,
                                color: _integers[1] == 1?Colors.black:Colors.white,
                              ),
                              Container(
                                margin: const EdgeInsets.all(1),

                                width: 50,
                                height: 50,
                                color: _integers[2] == 1?Colors.black:Colors.white,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(1),

                                width: 50,
                                height: 50,
                                color: _integers[3] == 1?Colors.black:Colors.white,
                              ),
                              Container(
                                margin: const EdgeInsets.all(1),

                                width: 50,
                                height: 50,
                                color: _integers[4] == 1?Colors.black:Colors.white,
                              ),
                              Container(
                                margin: const EdgeInsets.all(1),

                                width: 50,
                                height: 50,
                                color: _integers[5] == 1?Colors.black:Colors.white,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(1),

                                width: 50,
                                height: 50,
                                color: _integers[6] == 1?Colors.black:Colors.white,
                              ),
                              Container(
                                margin: const EdgeInsets.all(1),

                                width: 50,
                                height: 50,
                                color: _integers[7] == 1?Colors.black:Colors.white,
                              ),
                              Container(
                                margin: const EdgeInsets.all(1),

                                width: 50,
                                height: 50,
                                color: _integers[8] == 1?Colors.black:Colors.white,
                              ),
                            ],
                          )
                        ],
              ),
                      const Expanded(flex: 1,child: SizedBox()),

                    ],
                  ),
              const Expanded(flex: 1,child: SizedBox()),
              ElevatedButton(onPressed: (){
                int num =Random().nextInt(9);
                setState(() {
                  for(int i=0; i<_integers.length;i++){
                    _integers[i]=1;
                  }
                  _integers[num]=0;
                });
              },style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)), child: const Text("Change"),)
            ],
          ),
        ),
      ),
    );
  }
}
