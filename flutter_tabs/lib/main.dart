import 'package:flutter/material.dart';
import 'package:flutter_tabs/firstpage.dart' as firstPage;
import 'package:flutter_tabs/secondpage.dart' as secondPage;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

/*  @override
  Widget build(BuildContext context) {
    // TODO: Top Tabs build
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Tabs App'),
        backgroundColor: Colors.teal,
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.access_alarm)),
            new Tab(icon: new Icon(Icons.account_balance))
          ],
        ),
      ),
      body: new TabBarView(controller: controller, children: <Widget>[
        new firstPage.FirstPage(),
        new secondPage.SecondPage(),
      ]),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    // TODO: Bottom Tabs build
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Tabs App'),
        backgroundColor: Colors.teal,
      ),
      bottomNavigationBar: new Material(
          color: Colors.teal,
          child: new TabBar(
            controller: controller,
            tabs: <Widget>[
              new Tab(icon: new Icon(Icons.access_alarm)),
              new Tab(icon: new Icon(Icons.account_balance))
            ],
          )),
      body: new TabBarView(controller: controller, children: <Widget>[
        new firstPage.FirstPage(),
        new secondPage.SecondPage(),
      ]),
    );
  }
}
