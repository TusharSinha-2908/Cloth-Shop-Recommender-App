import 'package:flutter/material.dart';
import 'package:project2/DataBase.dart';
import 'package:project2/Search_Result.dart';
import 'Constant.dart';
import 'Item.dart';

class Search_Shop extends StatefulWidget {
  static const String id = 'Search Shop';
  const Search_Shop({Key? key}) : super(key: key);

  @override
  _Search_ShopState createState() => _Search_ShopState();
}

class _Search_ShopState extends State<Search_Shop> {

  String _size = "S";
  String _gender = "Male";
  String _price = "";
  String _garment = "";

  final male_Items = ["Shirts", "T-Shirts", "Lower", "Jeans", "Any Product"];
  final female_Items = ["Top", "Kurti", "Leggings", "Jeans", "Any Product"];
  final price_Range = ["Under 500", "Under 1000", "Under 1500", "Under 2000", "Any Price"];
  final size = ["VS","S","M","L","XL","XXL", "Any Size"];


  _Search_ShopState()
  {
    _garment = _gender == "Male" ? male_Items.elementAt(0) : female_Items.elementAt(0);
    _price = price_Range.elementAt(0);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15, top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Size :",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(width: 5),
              DropdownButton(
                value: _size,
                items: size.map((String items) {
                  return DropdownMenuItem<String>(
                    value: items,
                    child: Text(
                      items,
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  );
                }).toList(),

                onChanged: (newValue) {
                  setState(() {
                    _size = newValue.toString();
                  });
                },
              ),
              const SizedBox(width: 5),
              const Text(
                "  Male ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              Radio(
                value: 'Male',
                groupValue: _gender,
                onChanged: (value){
                  setState(() {
                    _gender = value.toString();
                    _garment = male_Items.elementAt(0);
                  });
                },
                activeColor: Colors.blueAccent,
              ),
              const Text(
                "Female",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              Radio(
                value: 'Female',
                groupValue: _gender,
                onChanged: (value){
                  setState(() {
                    _gender = value.toString();
                    _garment = female_Items.elementAt(0);
                  });
                },
                activeColor: Colors.blueAccent,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Garment Preference :",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(width: 15),
              DropdownButton(
                  value: _garment,
                  items: _gender == "Male" ?
                  male_Items.map((String items) {
                    return DropdownMenuItem<String>(
                      value: items,
                      child: Text(
                          items,
                          style: const TextStyle(
                            color: Colors.blue,
                          ),
                      ),
                    );
                  }).toList() : female_Items.map((String items) {
                    return DropdownMenuItem<String>(
                      value: items,
                      child: Text(
                        items,
                        style: const TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    );
                  }).toList(),

                  onChanged: (newValue) {
                    setState(() {
                      _garment = newValue.toString();
                    });
                  },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15, top: 15, bottom: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Price Range :",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(width: 15),
              DropdownButton(
                value: _price,
                items: price_Range.map((String items) {
                  return DropdownMenuItem<String>(
                    value: items,
                    child: Text(
                      items,
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  );
                }).toList(),

                onChanged: (newValue) {
                  setState(() {
                    _price = newValue.toString();
                  });
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 100, right: 100),
          child: RoundedButton(
              text: "Search",
              color: Colors.blue,
              textColor: Colors.white,
              onPress: () async{
                String rate = _price == "Any Price" ? "-1" : _price.substring(6);
                List<Item> items = await item_DataBase.instance.readAllItems(_size, _gender, _garment, int.parse(rate));
                Navigator.push(context, MaterialPageRoute(builder: (context) => Search_Result(items: items)));
                },
          ),
        ),
      ],
    );
  }
}
