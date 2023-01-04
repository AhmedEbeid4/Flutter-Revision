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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {

  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _items = [
    Item("01153180577", "Ahmed Ebeid", 18),
    Item("01153180577", "Ahmed Ebeid", 18),
    Item("01153180577", "Ahmed Ebeid", 18),
    Item("01153180577", "Ahmed Ebeid", 18),
    Item("01153180577", "Ahmed Ebeid", 18),
    Item("01153180577", "Ahmed Ebeid", 18),
    Item("01153180577", "Ahmed Ebeid", 18),
    Item("01153180577", "Ahmed Ebeid", 18),
    Item("01153180577", "Ahmed Ebeid", 18),
    Item("01153180577", "Ahmed Ebeid", 18),
    Item("01153180577", "Ahmed Ebeid", 18),
    Item("01153180577", "Ahmed Ebeid", 18),
    Item("01153180577", "Ahmed Ebeid", 18),
    Item("01153180577", "Ahmed Ebeid", 18),
    Item("01153180577", "Ahmed Ebeid", 18)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Container(child: Text("asdsa"),) ,title: Text("asda"),actions: [
        ElevatedButton.icon(onPressed: (){ }, icon: Icon(Icons.add), label: Text("asdd")),
        ElevatedButton.icon(onPressed: (){ }, icon: Icon(Icons.add), label: Text("asdd")),
      ],),
      body: ListView.builder(
          itemCount: _items.length, itemBuilder: (ctx, index) {
        return ItemWidget(item: _items[index], context1: context,);
      }),
    );
  }
}

class ItemWidget extends StatelessWidget {
  Item? item = null;
  BuildContext? context1 = null;

  ItemWidget({Key? key, required this.item, required this.context1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_){
                    return TT(item: item);
                  }
              )
          );
        },
        child: Card(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(item!.name),
                Text(item!.number),
                Text("${item?.age}")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Item {
  String name = "";
  String number = "01153810677";
  int age = 11;

  Item(this.number, this.name, this.age);
}

class TT extends StatelessWidget {
  Item? item=null;
  TT({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(item!.name),
                Text(item!.number),
                Text("${item!.age}")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
