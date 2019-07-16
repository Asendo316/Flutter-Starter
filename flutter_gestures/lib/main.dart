import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Gestures"),
      ),
      body: new Center(
        child: GestureDetector(
          onTap: (){
            print("Clicked");
          },
          onDoubleTap: (){
            print("double Tapped");
          },
          child: Container(
            height: 50.0,
            width: 100.0,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(17.0),
            ),
            child: Text("Click Me"),
          ),
        ),
      ),
    );
  }
}
