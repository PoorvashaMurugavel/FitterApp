
import 'package:firtter_app/Widgets/Suggestions.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  // Constructor
  const MyApp({Key? key}) : super(key: key);

  // Widgets
  @override
  Widget build(BuildContext context){

    return const MaterialApp(
      title: 'Welcome To Flutter',
      home: RandomWords()
    );
  }
}


class RandomWords extends StatefulWidget{
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWords> {

  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};

  final _biggerFont = const TextStyle(fontSize: 20);


  @override
  Widget build(BuildContext context){
    //final wordPair = WordPair.random();
    return Scaffold(
        appBar: AppBar(
                  title: const Text('Welcome To Flutter'),
                  actions: [IconButton(
                    icon: const Icon(Icons.list),
                    onPressed: _pushSaved, 
                    tooltip: 'Saved Suggestions',)],
                ),
        body: ListView.builder(
                padding: const EdgeInsets.all(30.0),
                itemBuilder: (context, i){

                  // Divider
                  if(i.isOdd){
                    return  const Divider(thickness: 1, color: Colors.grey, height: 30,);
                  }
                  final index = i ~/ 2;

                  // To check if the scroll limit is reaches over the exsisting suggestion count if yes, generate next set of words
                  if(index >= _suggestions.length){
                    _suggestions.addAll(generateWordPairs().take(10));
                  }

                  final alreadySaved = _saved.contains(_suggestions[index]);

                  // Return Text
                  return ListTile(
                    title :  Text(_suggestions[index].asPascalCase, style: _biggerFont),
                    trailing: Icon( 
                      alreadySaved ? Icons.favorite : Icons.favorite_border,
                      color: alreadySaved ? Colors.red : null,
                      semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',

                    ),
                    onTap: ()=>onTappingList(alreadySaved, index),
                  );
                
              },),
      );
    
    
    
  }
  
  onTappingList(bool alreadySaved, int index) {
      setState(() {
        if(alreadySaved){
        _saved.remove(_suggestions[index]);
      }
      else{
        _saved.add(_suggestions[index]);
      }
    });
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) =>  Suggestions(savedlist : _saved))
    );
  }
}
