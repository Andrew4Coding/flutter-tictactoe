
import 'package:flutter/material.dart';
import 'package:simple_calculator/tictactoe_tile.dart';

void main(){
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List TicTacList = [
    '', '', '',
    '', '', '',
    '', '', ''
  ];

  List WinList = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];

  var isPlayer1 = true;
  var playerWin = '';

  void checkWin(){
    for (final item in WinList){
      var f = item[0];
      var s = item[1];
      var t = item[2];

      print("${f} ${s} ${t}");
      if (TicTacList[f] != '' && TicTacList[f] == TicTacList[s] && TicTacList[s] == TicTacList[t]){
        setState(() {
          playerWin = TicTacList[f];
        });
      }
    }
  }

  void addValue(String playerValue, int index){
    if (TicTacList[index] == '' && playerWin == ''){
      setState(() {
        TicTacList[index] = playerValue;
        isPlayer1 = !isPlayer1;
      });
    }
    checkWin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Container(
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: TicTacList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return TicTacToeTile(
                          tileValue: TicTacList[index],
                          addValue: (context) => addValue(isPlayer1 ? "X" : "O",
                              index),
                        );
                      }
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isPlayer1 = true;
                        playerWin = '';
                        TicTacList = [
                          '', '', '',
                          '', '', '',
                          '', '', ''
                        ];
                      });
                    },
                    child: Text("Reset")),
              ],
            ),
          ),
          Text(playerWin != '' ? "Player ${playerWin} Win" : '',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),)
        ]
      ),
    );
  }
}
