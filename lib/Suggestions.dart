import 'package:english_words/src/word_pair.dart';
import 'package:flutter/material.dart';

class Suggestions extends StatefulWidget{

  const Suggestions({Key? key,  required this.savedlist}) : super(key: key);

  final Set<WordPair> savedlist;

  @override
  _Suggestions createState() =>  _Suggestions();
}

class _Suggestions extends State<Suggestions> {


  @override
  Widget build(BuildContext context){

      
      final tiles = widget.savedlist.map((pair) {
        return ListTile(
          title: Text(pair.asPascalCase),
        );
      });

      final divided = tiles.isNotEmpty? ListTile.divideTiles(tiles: tiles).toList() : <Widget>[];

      return Scaffold(
        appBar: AppBar(title : const Text("Saved Items")),
        body: ListView(children: divided,),
      );
  }
}