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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return new AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Align(
            alignment: Alignment.center,
            child: Container(
              child: new Center(
                child: new ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Transform(
                        transform: Matrix4.translationValues(
                            animation.value * width, 0.0, 0.0),
                        child: new Center(
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Text("Login",
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold)),
                                  new SizedBox(
                                    height: 20.0,
                                  )
                                ]),
                          ),
                        )),
                    Transform(
                        transform: Matrix4.translationValues(
                            delayedAnimation.value * width, 0.0, 0.0),
                        child: new Center(
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new TextField(
                                      decoration: new InputDecoration(
                                    hintText: "Username",
                                  )),
                                  new SizedBox(
                                    height: 20.0,
                                  ),
                                  new TextField(
                                      decoration: new InputDecoration(
                                    hintText: "Password",
                                  )),
                                  new SizedBox(
                                    height: 20.0,
                                  ),
                                ]),
                          ),
                        )),
                    Transform(
                        transform: Matrix4.translationValues(
                            muchDelayedAnimation.value * width, 0.0, 0.0),
                        child: new Center(
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new RaisedButton(
                                    onPressed: () {},
                                    color: Colors.lightBlue,
                                    child: Text(
                                      "Login",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  new SizedBox(
                                    height: 20.0,
                                  ),
                                  new Text("Don\'t have and account ?",
                                      style: TextStyle(fontSize: 20.0)),
                                  new SizedBox(
                                    height: 20.0,
                                  ),
                                  new OutlineButton(
                                    onPressed: () {},
                                    child: Text("Signup"),
                                    color: Colors.lightGreen,
                                  )
                                ]),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
