import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

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
    return new Scaffold(
      body: new Center(
        child: new RaisedButton(
            child: new Text("Make Request"),
            onPressed: makeRequest),
      )
    );
  }

  String url = 'https://randomuser.me/api/';
  // ignore: missing_return
  Future<String> makeRequest() async {
    var response =
    await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    print(response.body);

    List data;
    var extractdata = jsonDecode( response.body);
    data =  extractdata["results"];
    print(data[0]["name"]["first"]);
  }
}
