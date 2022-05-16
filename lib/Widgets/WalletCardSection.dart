import 'package:firtter_app/Data.dart';
import 'package:firtter_app/Widgets/WalletCardDetails.dart';
import 'package:flutter/material.dart';


class WalletCardSection extends StatelessWidget {
  const WalletCardSection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:  <Widget>[
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: const Text("Selected Card", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), ),
      ),
       
      
      Expanded( child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: ((context, i) {
          return Container(
            
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            height: 20,
            decoration: BoxDecoration(color: primaryColor, boxShadow: customShadow, borderRadius: BorderRadius.circular(20)),

            child: Stack(children: <Widget>[

              Positioned.fill(
                top: 150, 
                bottom: -200, 
                child: Container(decoration: BoxDecoration(
                  boxShadow: customShadow,
                  shape: BoxShape.circle, color: Colors.white38, ),
                )
              ),

              Positioned.fill(
                left: -300, 
                top: -100, 
                bottom: -100, 
                child: Container(decoration: BoxDecoration(
                  boxShadow: customShadow,
                  shape: BoxShape.circle, color: Colors.white38, ),
                )
              ),
              const WalletCardDetails(),
            ]),
          );
        })
        )
      )
          
       
      ],
    );
  }
}