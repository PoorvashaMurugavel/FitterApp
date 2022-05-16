import 'package:firtter_app/Data.dart';
import 'package:firtter_app/Widgets/WalletPieChart.dart';
import 'package:flutter/material.dart';

class WalletExpenseSection extends StatelessWidget {
  const WalletExpenseSection({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text("Expenses", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            ),

          Row(
          children: <Widget>[
            Expanded(child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: expenses.map((e) => 
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                    children: <Widget>[
                      CircleAvatar(radius: 5, backgroundColor: pieColors[expenses.indexOf(e)],),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(e['name'], style: const TextStyle(fontSize: 18,),),
                      )
                    ],
                  ))
                ).toList(),
              ),)),


            Expanded(child: WalletPieChart(),)
          ],
        ),


      ],
    );
    
  }
}