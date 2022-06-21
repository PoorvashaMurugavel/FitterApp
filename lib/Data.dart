import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFFCADCED);
Color XtextColor = Color.fromARGB(172, 0, 108, 103);
Color OtextColor = Color.fromARGB(172, 109, 0, 24);

List<BoxShadow> customShadow = [
  BoxShadow(
    color: Colors.white.withOpacity(0.5),
    spreadRadius: -4,
    offset: const Offset(-5, -5),
    blurRadius: 30
  ),
  BoxShadow(
    color: Colors.blue[900]!.withOpacity(.2),
    spreadRadius: 2,
    offset: const Offset(7,7),
    blurRadius: 20
  )
];


List expenses = [
  {"name": "Groceries", "amount": 500.0},
  {"name": "Online Shopping", "amount": 100.0},
  {"name": "Eating Out", "amount": 80.0},
  {"name": "Bills", "amount": 50.0},
  {"name": "Subscriptions", "amount": 100.0},
  {"name": "Fees", "amount": 30.0},
];

 List pieColors = [
  Colors.indigo[400],
  Colors.blue,
  Colors.amber,
  Colors.deepOrange,
  Colors.brown,
  Colors.green,
];


class XandOBO{
  Color backgroundColor = primaryColor;
  String textValue = "";
}

final ButtonStyle raisedButtonStyle = OutlinedButton.styleFrom(
  backgroundColor: Colors.black87,
  
  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
  shape: const RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(30)),
  ),
);
 
