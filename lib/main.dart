import 'dart:convert';

import 'package:contact_manager/pages/AboutPage.dart';
import 'package:contact_manager/pages/ContactPage.dart';
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
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<dynamic> _pages = [MyHomePage(), ContactPage(), AboutPage()];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text("Contacts"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            title: Text("About"),
          ),
        ],
      ),
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
                    return Expanded(
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        itemCount: _contact.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                ClipRRect(
                                  child: Image.network(
                                    "https://randomuser.me/api/portraits/men/23.jpg",
                                    height: 45,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        _contact[index]['full_name'],
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        _contact[index]['email'],
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        _contact[index]['position'],
                                        style: TextStyle(fontSize: 11),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
