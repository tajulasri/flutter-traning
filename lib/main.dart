import 'dart:convert';

import 'package:contact_manager/pages/AboutPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _groups = ["All", "Family", "Friends", "Work", "Neighbour"];

  String selectedItem = "";
  var _contacts;

  Future<String> _getJson() async {
    return await DefaultAssetBundle.of(context).loadString("assets/contacts.json");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getJson().then((onValue) {
      setState(() {
        _contacts = jsonDecode(onValue);
      });
    });

    setState(() {
      selectedItem = _groups.first;
    });

    print("init state value ${selectedItem}");
  }

  @override
  Widget build(BuildContext context) {
    print(_contacts);

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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AboutPage(),
                  fullscreenDialog: true,
                ),
              );
            },
            child: Icon(
              Icons.search,
              color: Colors.grey,
              size: 30,
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _groups.map((item) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem = item;
                      });
                      print(selectedItem);
                    },
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 18,
                        color: item == selectedItem ? Colors.black : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            FutureBuilder(
                initialData: null,
                future: _getJson(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      height: 300,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    List<dynamic> _contact = jsonDecode(snapshot.data);
                    return Container(
                      height: 1000,
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text("sample");
                        },
                      ),
                    );
                  }
                })
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
