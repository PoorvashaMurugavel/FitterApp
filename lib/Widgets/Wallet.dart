import 'package:firtter_app/Data.dart';
import 'package:firtter_app/Widgets/WalletCardSection.dart';
import 'package:firtter_app/Widgets/WalletExpenseSection.dart';
import 'package:flutter/material.dart';

import 'WalletHeader.dart';


class WalletApp extends StatelessWidget {
  const WalletApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Welcome to Wallet App",
      home: const HomePage(),
      theme: ThemeData(fontFamily: 'Roboto'),
    );
  }
}

class HomePage extends StatelessWidget {
 const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: <Widget>[
           Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 120,
            child: const WalletHeader(),
          ),
          Expanded(child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20,),
            child: const WalletCardSection(),
          )),
          Expanded(child: Container(
            child: const WalletExpenseSection(),
          )),
      ]),
    );
  }
}