import 'package:flutter/cupertino.dart';
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
  int _currentPage = 0;

  void onTapTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  List<Widget> _pages = [
    const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("a"),
        ),
      ),
    ),
    const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("b"),
        ),
      ),
    ),
    const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("c"),
        ),
      ),
    ),
    const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("d"),
        ),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_currentPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          backgroundColor: Colors.blueAccent,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          onTap: _x1,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.icecream), label: "A"),
            BottomNavigationBarItem(icon: Icon(Icons.icecream), label: "B"),
            BottomNavigationBarItem(icon: Icon(Icons.icecream), label: "C"),
            BottomNavigationBarItem(icon: Icon(Icons.icecream), label: "D"),
          ],
        ),
      ),
    );
  }
}
