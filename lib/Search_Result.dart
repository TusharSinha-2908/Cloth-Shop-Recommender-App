import 'package:flutter/material.dart';
import 'package:project2/Item.dart';

class Search_Result extends StatefulWidget {

  late List<Item> items;
  Search_Result({Key? key, required this.items}) : super(key: key);

  @override
  _Search_ResultState createState() => _Search_ResultState();
}

class _Search_ResultState extends State<Search_Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.red,
          child: const Center(child: Text("Search Results          ")),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(
                  Icons.home_work_sharp,
                  color: Colors.blue,
              ),
              title: Text(widget.items.elementAt(index).shop!),
            );
          },
          separatorBuilder: (context,index) => const Divider(color: Colors.blue, thickness: 1,),
          itemCount: widget.items.length,
      ),
    );
  }
}

