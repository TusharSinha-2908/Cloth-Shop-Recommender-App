import 'package:flutter/material.dart';
import 'package:project2/Add_Item.dart';
import 'package:project2/Search_Shop.dart';

class Main_Screen extends StatefulWidget {
  static const String id = 'Main Screen';
  const Main_Screen({Key? key}) : super(key: key);

  @override
  _Main_ScreenState createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: AppBar(
        title: Title(
            color: Colors.red,
            child: const Center(child: Text("Project #2 : Find Your Fit")),
        ),
        bottom: const TabBar(
            tabs: [
              Tab(text: "Add Item", icon: Icon(Icons.add_box_rounded),),
              Tab(text: "Search Shop", icon: Icon(Icons.home_work_sharp),),
            ],
        ),
      ),
      body: const TabBarView(
          children: [
            Add_Item(),
            Search_Shop(),
          ]
      ),
     ),
    );
  }
}

