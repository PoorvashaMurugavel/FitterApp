import 'dart:math';

import 'package:firtter_app/Data.dart';
import 'package:flutter/material.dart';

class WalletPieChart extends StatelessWidget {
  const WalletPieChart({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
        child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: customShadow, color: primaryColor),
        child:   
        Stack(
          children: <Widget>[

            Center(
              child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: customShadow, color: primaryColor),
            ),
            ),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                  child: CustomPaint(
                    child: Container(),
                    foregroundPainter: PieChartPainter(),
                  ),
                ),
              ),
            
            Center(
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: customShadow, color: primaryColor),
                child: const Center(child: Text("\$1024", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),)) ,
              ),
            )
          ]
        )
      )
    );
  }
}

class PieChartPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width/2, size.height/2);
    double radius = min(size.width/2, size.height/2);

    var paint = Paint()..style=PaintingStyle.stroke..strokeWidth=50;

    double total = 0;
    expenses.forEach((element) {
      total+=element['amount'];
    });

    var startRadian = -pi/2;
    for(int i=0; i<expenses.length; i++){
      var sweepRadiant = (expenses[i]['amount']/total)*2*pi;
      paint.color = pieColors[i];
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startRadian, sweepRadiant, false, paint);
      startRadian+=sweepRadiant;
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}