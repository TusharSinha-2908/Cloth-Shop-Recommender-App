import 'package:flutter/material.dart';
import 'package:project2/Add_Item.dart';
import 'package:project2/Main_Screen.dart';
import 'package:project2/Search_Shop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Main_Screen(),
      initialRoute: Main_Screen.id,
      routes: {
        Main_Screen.id : (context) => const Main_Screen(),
        Add_Item.id : (context) => const Add_Item(),
        Search_Shop.id : (context) => const Search_Shop(),
      },
    );
  }
}

