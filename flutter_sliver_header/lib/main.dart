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
      body: new CustomScrollView(
        slivers: <Widget>[
           SliverAppBar(
             expandedHeight: 250.0,
             pinned: true,
             title: new Text('Sliver Effect'),
             floating: true,
             leading: Icon(Icons.arrow_back),
             flexibleSpace: new FlexibleSpaceBar(
               background: Image.network("https://placeimg.com/480/320/any"),
             ),

          ),
          new SliverList(
              delegate: new SliverChildBuilderDelegate((context,index) =>
              new Card(
                child: new Container(
                  padding: EdgeInsets.all(10.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: new NetworkImage("http://i.pravatar.cc/300"),
                      ),
                      new SizedBox(width: 10.0,),
                      new Text("Card Content")
                    ],
                  ),
                ),
              )),
          )
        ],
      ),
    );
  }
}
