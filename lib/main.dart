import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ContactApp());

class ContactApp extends StatelessWidget {
  const ContactApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MY App"), leading: Text("Leading")),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "flutter",
                style: TextStyle(fontSize: 30),
              ),
              Text("flutter"),
              Container(height: 100, color: Colors.green),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.home, size: 30),
                  Text("flutter"),
                  Icon(Icons.info_outline, size: 50),
                  Column(
                    children: <Widget>[
                      Text("flutter"),
                      Text("flutter"),
                    ],
                  )
                ],
              ),
              Text("flutter"),
              Text("flutter"),
              FlutterLogo(size: 200),
              Text(
                "flutter",
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ),
              Text("flutter"),
            ],
          ),
        ),
      ),
    );
  }
}
