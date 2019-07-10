import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

String url = 'https://randomuser.me/api/?results=15';
List data;

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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Contact List"),
      ),
      body: new ListView.builder(
        //if data = null itemCount = 0 else itemCount == data.length
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, position) {
          return new ListTile(
            title: new Text(data[position]["name"]["first"]),
            subtitle: new Text(data[position]["phone"]),
            leading: new CircleAvatar(
              backgroundImage:
                  new NetworkImage(data[position]["picture"]["thumbnail"]),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new SecondPage(data[position])));
            },
          );
        },
      ),
    );
  }

  @override
  void initState() {
    this.makeRequest();
  }

  // ignore: missing_return
  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    print(response.body);

    setState(() {
      var extractdata = jsonDecode(response.body);
      data = extractdata["results"];
    });
  }
}

class SecondPage extends StatelessWidget {
  SecondPage(this.data);

  final data;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Second Page"),
      ),
      body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150.0,
                height: 150.0,
                decoration: new BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: new DecorationImage(
                      image: new NetworkImage(data["picture"]["large"]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: new BorderRadius.all(new Radius.circular(75.0)),
                    border: new Border.all(
                      color: Colors.red,
                      width: 4.0,
                    )),
              ),
              new Text((data["name"]["first"])),
              new Text(data["phone"])
            ],
          )),
    );
  }
}
