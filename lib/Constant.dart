import 'package:flutter/material.dart';

const textBox = InputDecoration(
  hintText: '',
  hintStyle: TextStyle(
      color: Colors.black38,
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0)),),

  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),),

  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),),
);

class RoundedButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPress;
  final double? fontSize;

  RoundedButton({required this.text, required this.color, required this.textColor,required this.onPress,this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(
                fontFamily: 'Tushar',
                fontWeight: FontWeight.bold,
                color: textColor,
                fontSize: fontSize == null ? 12.0 : fontSize
            ),
          ),
        ),
      ),
    );
  }
}

showAlertDialogEntry(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: const Text(
      "OK",
      style: TextStyle(color: Colors.blue),
    ),
    onPressed: () => Navigator.pop(context),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text(
      "Find Your Fit",
      style: TextStyle(fontSize: 15, color: Colors.blue),
    ),
    content: const Text(
      "Product Details Added Successfully",
      style: TextStyle(fontSize: 12),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogPrice(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: const Text(
      "OK",
      style: TextStyle(color: Colors.blue),
    ),
    onPressed: () => Navigator.pop(context),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text(
      "Find Your Fit",
      style: TextStyle(fontSize: 15, color: Colors.blue),
    ),
    content: const Text(
      "Price Should Be Greater Than ₹0.",
      style: TextStyle(fontSize: 12),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogShop(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: const Text(
      "OK",
      style: TextStyle(color: Colors.blue),
    ),
    onPressed: () => Navigator.pop(context),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text(
      "Find Your Fit",
      style: TextStyle(fontSize: 15, color: Colors.blue),
    ),
    content: const Text(
      "Shop Name Can't Be Left Empty.",
      style: TextStyle(fontSize: 12),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogDelete(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: const Text(
        "OK"
    ),
    onPressed: () => Navigator.pop(context),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text(
      "Find Your Fit",
      style: TextStyle(
          fontSize: 15,
          color: Colors.blue,
      ),
    ),
    content: const Text(
      "All Entries Deleted Successfully.",
      style: TextStyle(fontSize: 12),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}