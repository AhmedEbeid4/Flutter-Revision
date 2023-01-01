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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ScreenHome(),
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  var _myPasswordVisible = false;
  TextEditingController _controller1 = TextEditingController();
  var text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 30, left: 30, top: 50),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: "Name",
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const TextField(

                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        labelText: "Phone Number",
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: _controller1,
                    obscureText: _myPasswordVisible,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        labelText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _myPasswordVisible = !_myPasswordVisible;
                              if(int.tryParse(_controller1.text) == null){
                                text="Not a number";
                              }else{
                                text=_controller1.text;
                              }
                            });
                          },
                          icon: Icon(_myPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        border: const OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const TextField(),
                  const SizedBox(
                    height: 50,
                  ),
                  const TextField(),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(text),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
