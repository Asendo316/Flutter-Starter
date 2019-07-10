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
  String inputStr = "";
  String inputCount = "";

  String radioValue = "";

  bool enabled = false;
  bool expanded = false;
  bool checked = false;

  final TextCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Input Widget"),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(hintText: "Enter a Text"),
              onChanged: (String textInput) {
                setState(() {
                  inputStr = textInput;
                  inputCount = TextCtrl.text.length.toString();
                });
              },
              controller: TextCtrl,
            ),
            new Text(inputStr),
            new Text(inputCount),
            new Switch(
              onChanged: (bool val) {
                setState(() {
                  enabled = val;
                  print(enabled);
                });
              },
              activeColor: Colors.green,
              activeTrackColor: Colors.greenAccent[400],
              value: enabled,
            ),
            new ExpansionPanelList(
              expansionCallback: (i, bool val) {
                setState(() {
                  expanded = !val;
                });
              },
              children: [
                new ExpansionPanel(
                    headerBuilder: (BuildContext context, bool val) {
                      return new Center(
                        child: new Text(
                          "Tap On Me",
                          style: new TextStyle(fontSize: 18.0),
                        ),
                      );
                    },
                    isExpanded: expanded,
                    body: new Container(
                      padding: EdgeInsets.all(20.0),
                      child: new Column(
                        children: <Widget>[
                          new Text("Hello First Text"),
                          new Text("Hello Second Text"),
                          new Text("Hello Third Text"),
                        ],
                      ),
                    )),
              ],
            ),
            new Checkbox(
                value: checked,
                activeColor: Colors.purple,
                onChanged: (bool val) {
                  setState(() {
                    checked = val;
                  });
                }),
            new Row(
              children: <Widget>[
                new Radio(
                  value: "First",
                  groupValue: radioValue,
                  onChanged: (String val) {
                    setRadioValue(val);
                  },
                  activeColor: Colors.red,
                ),
                new Radio(
                  value: "Second",
                  groupValue: radioValue,
                  onChanged: (String val) {
                    setRadioValue(val);
                  },
                  activeColor: Colors.amber,
                ),
                new Radio(
                  value: "Third",
                  groupValue: radioValue,
                  onChanged: (String val) {
                    setRadioValue(val);
                  },
                  activeColor: Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  setRadioValue(String value) {
    setState(() {
      radioValue = value;
      print(radioValue);
    });
  }
}
