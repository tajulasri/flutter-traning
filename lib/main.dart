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
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text(
            "sample",
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
