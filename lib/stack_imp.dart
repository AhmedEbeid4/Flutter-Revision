import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main(){
  runApp(const App());
}
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: 309,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:[ Row(
                children: [
                  Item(),
                  Item(),
                  Item(),
                  Item(),
                  Item(),
                  Item(),
                  Item(),
                  Item()
                ],
              )
              ]




            ),
          ),
        ),
      ),
    );
  }
}
class Item extends StatelessWidget {
  const Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 283,
      width: 309,
      margin: EdgeInsets.only(top: 10,left: 5,right: 5),
      child: Container(

        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 5.0,
            )
          ],
            borderRadius: BorderRadius.circular(37.0)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 283,
        width: 309,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            const Image(image: NetworkImage("https://www.travelandleisure.com/thmb/HaAgtnns6Cp6Tb08MJq8xXOHzH0=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/soneva-jani-sunset-view-maldives-SONEVA0421-74b37591d80441ce87831a41da518e49.jpg"),
              fit: BoxFit.cover
              ,
              height: 283,
              ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment(0.8, -4),
                  colors: <Color>[
                    Color.fromRGBO(0, 0, 0, 0.6),
                    Color.fromRGBO(0, 0, 0, 0.5),
                    Color.fromRGBO(0, 0, 0, 0.4),
                    Color.fromRGBO(0, 0, 0, 0.3),
                    Color.fromRGBO(0, 0, 0, 0.2),
                    Color.fromRGBO(0, 0, 0, 0.1),
                  ],
                  tileMode: TileMode.mirror,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10,bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Align(
                      alignment: Alignment.topLeft,
                      child:Text("Royal Sea Crown",style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'IBMPlexSans',
                          fontWeight: FontWeight.w100
                      ),)
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: const [
                      Icon(Icons.location_on_outlined,color: Color.fromARGB(
                          255, 188, 188, 188),
                      ),
                      Text("Egypt, Alex",style: TextStyle(
                          color:
                          Color.fromARGB(
                              255, 188, 188, 188
                          ),
                          fontWeight: FontWeight.w300,

                      ),)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    )
    ;
  }
}
