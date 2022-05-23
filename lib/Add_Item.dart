import 'package:flutter/material.dart';
import 'package:project2/DataBase.dart';
import 'Constant.dart';
import 'Item.dart';

class Add_Item extends StatefulWidget {
  static const String id = 'Add Item';
  const Add_Item({Key? key}) : super(key: key);

  @override
  _Add_ItemState createState() => _Add_ItemState();
}

class _Add_ItemState extends State<Add_Item> {

  final db = item_DataBase.instance;
  final _product_Price = TextEditingController();
  final _shop = TextEditingController();
  int _price = 0;

  String _shop_Detail = "";
  String _size = "S";
  String _gender = "Male";
  String _garment = "";

  final male_Items = ["Shirts", "T-Shirts", "Lower", "Jeans"];
  final female_Items = ["Top", "Kurti", "Leggings", "Jeans"];
  final size = ["VS","S","M","L","XL","XXL"];

  _Add_ItemState()
  {
    _garment = _gender == "Male" ? male_Items.elementAt(0) : female_Items.elementAt(0);
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
                "Size : ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
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
              const SizedBox(width: 20),
              const Text(
                " Male",
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
                "Garment Type :",
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
          padding: const EdgeInsets.only(left: 15,right: 15, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Price : ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: TextField(
                  controller: _product_Price,
                  style: const TextStyle(
                      fontSize: 15
                  ),
                  keyboardType: TextInputType.number,
                  keyboardAppearance: Brightness.dark,
                  textAlign: TextAlign.center,
                  decoration: textBox.copyWith(hintText: 'Enter Product Price'),
                  onChanged: (value){
                    setState(() {
                      _price = int.parse(_product_Price.text);
                    });
                  },
                ),
              ),
              const SizedBox(width: 50),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15, top: 15, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Shop : ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: TextField(
                  controller: _shop,
                  style: const TextStyle(
                      fontSize: 15
                  ),
                  keyboardType: TextInputType.text,
                  keyboardAppearance: Brightness.dark,
                  textAlign: TextAlign.center,
                  decoration: textBox.copyWith(hintText: 'Enter Shop Name'),
                  onChanged: (value){
                    setState(() {
                      _shop_Detail = _shop.text;
                    });
                  },
                ),
              ),
              const SizedBox(width: 50),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 100, right: 100),
          child: RoundedButton(
            text: "Add Item",
            color: Colors.blue,
            textColor: Colors.white,
            onPress: (){

              if(_price <= 0) { showAlertDialogPrice(context); }
              else if(_shop_Detail.isEmpty) { showAlertDialogShop(context); }
              else{
                db.create(Item(id: item_DataBase.id, size: _size, gender: _gender, garment: _garment, price: _price, shop: _shop_Detail));
                _product_Price.clear();
                _shop.clear();
                showAlertDialogEntry(context);
              }

              },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 100, right: 100),
          child: RoundedButton(
            text: "Remove All Items",
            color: Colors.blue,
            textColor: Colors.white,
            onPress: (){
              item_DataBase.instance.delete();
              showAlertDialogDelete(context);
            },
          ),
        ),
      ],
    );
  }
}
