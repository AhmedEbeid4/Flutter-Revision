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
  String _cont = "0";
  double? _num1 = 0;
  double? _num2 = 0;
  String? _op;

  bool containsPoint(String a) {
    for (int i = 0; i < a.length; i++) {
      if (a[i] == '.') {
        return true;
      }
    }
    return false;
  }

  void addToCont(String a) {
    if (a == '.' && containsPoint(_cont)) {
      return;
    }
    if (_cont == '0') {
      _cont = "";
    }
    setState(() {
      _cont += a;
    });
  }
  void calculate(){
    print('$_num2 $_num1');
    if(_num1 == null || _op == null || _cont.isEmpty){
      return;
    }
    _num2 = double.parse(_cont);
    setState(() {
      switch(_op){
        case '+':
          _cont = "${_num1! + _num2!}";
          break;
        case '-':
          _cont = "${_num1! - _num2!}";
          break;
        case '/':
          _cont = "${_num1! / _num2!}";
          break;
        case '*':
          _cont = "${_num1! * _num2!}";
          break;
      }
    });
  }
  void setOperation(String op){
    if(_cont.isEmpty){
      return;
    }
    setState(() {
      _num1=double.parse(_cont);
      _cont="";
      _op=op;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Container(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Text(
                    _cont,
                    style: const TextStyle(
                        fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                              child: "AC",
                              onPressed: () {
                                setState(() {
                                  _op=null;
                                  _num1=null;
                                  _num2=null;
                                  _cont = "0";
                                });
                              }),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomButton(child: "+/-", onPressed: () {
                            if(_cont.isNotEmpty && double.parse(_cont) != 0.0){
                              setState(() {
                                _cont="${double.parse(_cont) * -1}";
                              });
                            }
                          }),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomButton(child: "%", onPressed: () {}),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                            child: "÷",
                            onPressed: () {
                              setOperation("/");
                            },
                            color: Colors.orangeAccent,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                              child: "7",
                              onPressed: () {
                                addToCont("7");
                              }),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                              child: "8",
                              onPressed: () {
                                addToCont("8");
                              }),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                              child: "9",
                              onPressed: () {
                                addToCont("9");
                              }),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                            child: "×",
                            onPressed: () {
                              setOperation("*");
                            },
                            color: Colors.orangeAccent,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                              child: "4",
                              onPressed: () {
                                addToCont("4");
                              }),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                              child: "5",
                              onPressed: () {
                                addToCont("5");
                              }),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                              child: "6",
                              onPressed: () {
                                addToCont("6");
                              }),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                            child: "-",
                            onPressed: () {
                              setOperation("-");
                            },
                            color: Colors.orangeAccent,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                              child: "1",
                              onPressed: () {
                                addToCont("1");
                              }),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                              child: "2",
                              onPressed: () {
                                addToCont("2");
                              }),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                              child: "3",
                              onPressed: () {
                                addToCont("3");
                              }),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                            child: "+",
                            onPressed: () {
                              setOperation("+");
                            },
                            color: Colors.orangeAccent,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomButton(
                              child: "0",
                              onPressed: () {
                                addToCont("0");
                              }),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                              child: ".",
                              onPressed: () {
                                addToCont(".");
                              }),
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomButton(
                            child: "=",
                            onPressed:calculate,
                            color: Colors.orangeAccent,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  late String child;
  Color? color;

  late VoidCallback onPressed;

  CustomButton(
      {Key? key, required this.child, required this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.blue),
        onPressed: onPressed,
        child: Container(
          width: 40,
          height: 70,
          alignment: Alignment.center,
          child: Text(
            child,
            style: const TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
