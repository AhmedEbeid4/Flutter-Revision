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
  String _result = "";
  TextEditingController _firstNum = TextEditingController();
  TextEditingController _secondNum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    _result,
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
                TextFormField(
                  controller: _firstNum,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Number1', border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _secondNum,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Number2', border: OutlineInputBorder()),
                ),
                const Expanded(
                  flex: 1,
                  child: Text(""),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: const Text("GET THE RESULT"),
                    ),
                    onPressed: () {
                      String a = "";
                      if (_firstNum.text.isEmpty || _secondNum.text.isEmpty) {
                        a = "Fill The Blanks ,please";
                      } else {
                        try {
                          a = "${double.parse(_firstNum.text) + double.parse(_secondNum.text)}";
                        } catch (Exc) {
                          a = "they should be a numbers";
                        }
                      }
                      setState(() {
                        _result = a;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
