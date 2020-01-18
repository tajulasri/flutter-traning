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
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Contacts",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Icon(
            Icons.search,
            color: Colors.grey,
            size: 30,
          ),
        ],
      ),
      body: Center(
        child: Icon(Icons.home),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
