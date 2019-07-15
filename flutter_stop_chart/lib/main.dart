import 'dart:async';

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
  Stopwatch watch = new Stopwatch();
  Timer timer;
  Color labelColor = Colors.blue;

  String elapsedTime = "";

  @override
  Widget build(BuildContext context) {
    TextStyle _labelStyle = Theme.of(context)
        .textTheme
        .title
        .merge(new TextStyle(color: labelColor));

    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Stop Watch"),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Column(
          children: <Widget>[
            new Text(
              elapsedTime,
              style: new TextStyle(
                fontSize: 25.0,
              ),
            ),

            new SizedBox(
              height: 20.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: startWatch,
                  child: new Icon(Icons.play_arrow),
                ),
                new SizedBox(
                  width: 20.0,
                ),
                new FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: stopWatch,
                  child: new Icon(Icons.stop),
                ),
                new SizedBox(
                  width: 20.0,
                ),
                new FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: restartWatch,
                  child: new Icon(Icons.refresh),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


  startWatch() {
    watch.start();
    timer = new Timer.periodic(new Duration(milliseconds: 100), updateTime);
  }

  stopWatch() {
    watch.stop();
    setTime();
  }

  updateTime(Timer timer) {
    setState(() {
      elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
    });
  }

  restartWatch() {
    watch.reset();
    setTime();
  }

  setTime() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);
    });
  }

  transformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');

    return "$minutesStr:$secondsStr:$hundredsStr";
  }
}
