import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ContactApp());

class ContactApp extends StatelessWidget {
  const ContactApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  MyHomepage({Key key}) : super(key: key);

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  List<String> _groups = ["All", "Family", "Friends", "Work", "Neighbour"];

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
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _groups.map((item) {
            return GestureDetector(
              onTap: () {
                print(item.toString());
              },
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
