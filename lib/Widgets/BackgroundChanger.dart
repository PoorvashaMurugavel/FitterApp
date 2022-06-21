import 'dart:math';

import 'package:flutter/material.dart';

// class BackgroundChanger extends StatelessWidget {
//   BackgroundChanger({ Key? key }) : super(key: key);

//   Color backgroundColor = Colors.white;

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       backgroundColor: backgroundColor,
//       body: Center(
//           child : Container(
            
//             child: TextButton(onPressed: () {
//                backgroundColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
//             }, child: Center(child: const Text("change Color", style: TextStyle(fontSize: 16, color: Colors.black),),) ),
//           )
       
//       ),
//     );
//   }
// }


class BackGroundChanger extends StatefulWidget {
  const BackGroundChanger({ Key? key }) : super(key: key);

  @override
  State<BackGroundChanger> createState() => _BackGroundChangerState();
}

class _BackGroundChangerState extends State<BackGroundChanger> {

  Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
          child : Container(
            
            child: TextButton(onPressed: onPressed, child: Center(child: const Text("change Color", style: TextStyle(fontSize: 16, color: Colors.black),),) ),
          )
       
      ),
    );
  }

  void onPressed() {

    setState(() {
        backgroundColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    });
              
            
  }
}


