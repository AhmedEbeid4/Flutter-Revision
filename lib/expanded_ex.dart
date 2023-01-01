import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    color: Colors.blue,
                    child: const Text("1"),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    color: Colors.amber,
                    child: const Text("2"),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    color: Colors.red,
                    child: const Text("3"),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: const EdgeInsets.all(40),
                color: Colors.brown,
                child: const Text("4"),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    color: Colors.blue,
                    child: const Text("5"),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    color: Colors.amber,
                    child: const Text("6"),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    color: Colors.red,
                    child: const Text("7"),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
