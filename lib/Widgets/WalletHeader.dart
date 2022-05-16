import 'package:firtter_app/Data.dart';
import 'package:flutter/material.dart';

class WalletHeader extends StatelessWidget {
  const WalletHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text("Poorvasha's Wallet", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(boxShadow: customShadow, color: primaryColor, shape: BoxShape.circle,  border: Border.all(color: Colors.deepOrange, width: 6, style: BorderStyle.solid),),
            child: const Center(
              child: Icon(Icons.notifications)
            ),
          )
      ]),
    );
  }
}
