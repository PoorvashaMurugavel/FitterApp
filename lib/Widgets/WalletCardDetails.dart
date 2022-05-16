import 'package:firtter_app/Data.dart';
import 'package:flutter/material.dart';

class WalletCardDetails extends StatelessWidget {
  const WalletCardDetails({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(alignment: Alignment.topLeft, child: Container(
          margin: const EdgeInsets.all(20.0),
          width: 60,
          child: Image.asset('images/mastercard.png'),
        ),),

        Align(alignment: Alignment.bottomRight, 
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 50,
            width: 70,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(boxShadow: customShadow, color: primaryColor, borderRadius: BorderRadius.circular(15)),
         ),)
        ),

        Align(alignment: Alignment.bottomLeft, 
        child:  Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                  Row(
                    children: const <Widget>[
                      Text("**** **** **** ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),),
                      Text('1930', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  const Text("PLATINUM CARD", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                ]           
          ),
        )
        )
      ],
    );
  }
}