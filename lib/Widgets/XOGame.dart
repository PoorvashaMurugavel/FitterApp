import 'package:english_words/english_words.dart';
import 'package:firtter_app/Data.dart';
import 'package:flutter/material.dart';

// Statefull Parent
class OXGame extends StatefulWidget {
  const OXGame({Key? key}) : super(key: key);
  @override
  State<OXGame> createState() => _OXGameState();
}

// Statefull Child
class _OXGameState extends State<OXGame> {
  // Declarations
  late List<XandOBO> xandOList = [];
  static bool gameOver = false;
  static double isResetButtonVisible = 0;
  // Constructor
  _OXGameState() {
    for (int i = 0; i < 9; i++) {
      xandOList.add(
        new XandOBO(),
      );
    }
  }

  // Methods
  void onOXItemChanged(index, textValue) {

    int row = 3;
    int col = 3;
    setState(() {
      xandOList[index].textValue = textValue;
     
      if(gameOver) {
        return;
      }

      // Check Row
      for(int i = 0; i<(row*col);){
        int j = i; 
        List rowDatas = [];
        for(j = j; j < i+row;)
        {
          rowDatas.add(j);
          if(j == (i+col)-1){
            bool isGameOver = checkforwinner(rowDatas);
            gameOver = isGameOver;
            break;
          }
          else{
            j++;
          }
        }
        if(gameOver){
          break;
        }
        i = j+1;
      }

  if(!gameOver)
  {
    // Check Column
      for(int i=0; i < 3; i++){
        int j = i; 
        List colDatas = [];
        for(j; j <= (row*col);){
          colDatas.add(j);
          if(colDatas.length == row){
            bool isGameOver = checkforwinner(colDatas);
            gameOver = isGameOver;
            break;
          } 
          j = j + col;
        }
        if(gameOver){
          break;
        }
      }
  }

    if(!gameOver)
    {
      // Check X 
      for(int i=0; i < row;){
        int j = i; 
        List XDatas = [];
        for(j; j <= (row*col)-i;){
          XDatas.add(j);
          if(XDatas.length == row){
            bool isGameOver = checkforwinner(XDatas);
            gameOver = isGameOver;
            break;
          } 
          if(i==row-1){
            j = j + (col-1);
          }
          else{
            j = j + (col+1);
          }
        }
        if(gameOver){
          break;
        }
        i = i + (col-1);
      }
    }
      

    });
  }

  bool checkforwinner(List cells){
    int equalXCellCount = 0;
            int equalOCellCount = 0;
            for (var cell in cells) {
              if(xandOList[cell].textValue == "X"){
                equalXCellCount++;
              }
              if(xandOList[cell].textValue == "O"){
                equalOCellCount++;
              }
            }
            if(equalXCellCount == cells.length){
              for (var cell in cells) {
                xandOList[cell].backgroundColor = XtextColor;
              }
              isResetButtonVisible = 1;
              return true;
            }
            else if(equalOCellCount == cells.length){
              for (var cell in cells) {
              xandOList[cell].backgroundColor = OtextColor;
              }
              isResetButtonVisible = 1;
              return true;
            }
            return false;
  }


  // Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: const Text("Hey Buddy! lets Relax...", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),),
                ),

                Container(
                    child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    alignment: Alignment.center,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: xandOList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                      itemBuilder: (context, index) => XOXItem(index: index, XandOElement: xandOList[index], onChanged: onOXItemChanged)),
                )),
                  Opacity(
                  opacity: isResetButtonVisible,
                  
                  child: Container(margin: const EdgeInsets.only(top: 20), 
                    decoration: BoxDecoration(boxShadow: customShadow),
                    child: ElevatedButton(
                        style: raisedButtonStyle,
                        
                        onPressed: () { 
                          setState(() {
                            if(gameOver){
                              gameOver = false;
                              isResetButtonVisible = 0;
                              for (var item in xandOList) {
                                item.textValue = "";
                                item.backgroundColor = primaryColor;
                              }
                            }
                          });
                        },
                        child: const Text('Reset', style: TextStyle(color: Color.fromRGBO(202, 220, 237, 1), fontSize: 18, fontWeight: FontWeight.bold) ,),
                      ) 
                    ))
                
              ]), 
        ));
  }
}

class XOXItem extends StatefulWidget {
  XOXItem({Key? key, required this.index, required this.XandOElement, required this.onChanged}) : super(key: key);
  @override
  State<XOXItem> createState() => _XOXItemState();
  
  // Declarations
  XandOBO XandOElement;
  int index;
  Function onChanged;
}

class _XOXItemState extends State<XOXItem> {

  // Declarations
  static bool onfirstPersonTap = true;
  static bool onSecPersonTap = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
          child: Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: customShadow,
            color: widget.XandOElement.backgroundColor),
        child: Text(widget.XandOElement.textValue,
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                shadows: customShadow,
                color: widget.XandOElement.textValue == 'X' ? XtextColor : OtextColor)),
      )),
      onTap: () {
        setState(() {
          if(_OXGameState.gameOver && widget.XandOElement.textValue.isEmpty){
            widget.XandOElement.textValue = "";
          }
          else if (widget.XandOElement.textValue.isEmpty) {
            onfirstPersonTap && !onSecPersonTap
                ? widget.XandOElement.textValue = 'X'
                : widget.XandOElement.textValue = 'O';
            onfirstPersonTap
                ? onfirstPersonTap = false
                : onfirstPersonTap = true;
            onSecPersonTap 
                ? onSecPersonTap = false 
                : onSecPersonTap = true;
                
            widget.onChanged(widget.index, widget.XandOElement.textValue);
          }
        });
      },
    );
  }
}
