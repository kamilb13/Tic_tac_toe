import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  bool player = true;
  String turn = 'O';
  List<String> board = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  var myTextStyle1 =
      const TextStyle(color: Colors.white, fontSize: 22, fontFamily: 'Poppins');
  int player_1 = 0;
  int player_2 = 0;
  int count = 0;
  final mytextStyle2 =
      const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins');

  whoseTurn() {
    setState(() {
      if(turn == "O"){
        turn = "X";
      }else{
        turn = "O";
      }
    });
  }

  whoIsWinner(int numberOfindex) {
    final winner = board[numberOfindex];
    return winner;
  }

  whoWin(int numberOfindex) {
    final winner = whoIsWinner(numberOfindex);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red[600],
          title: Center(
            child: Text(
              'Wygrał: $winner',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // resetGame();
                Navigator.of(context).pop();
              },
              child: Center(
                child: Text(
                  'Zagraj jeszcze raz',
                  style: mytextStyle2,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  resetGame() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        board[i] = '';
      }
    });
    count = 0;
  }

  resetPoints() {
    setState(() {
      player_1 = 0;
      player_2 = 0;
    });
  }

  draw() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.red[600],
          title: const Center(
            child: Text(
              'Remis',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                resetGame();
                Navigator.of(context).pop();
              },
              child: Center(
                child: Text(
                  'Zagraj jeszcze raz',
                  style: mytextStyle2,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  isWin(int index_1, int index_2, int index_3) {
    if (board[index_1] != '' &&
        board[index_1] == board[index_2] &&
        board[index_2] == board[index_3]) {
      wincount(index_1);
      whoWin(index_1);
      whoseTurn();
      resetGame();
    }
  }

  wincount(int index_1) {
    setState(() {
      if (board[index_1] == 'O') {
        player_1 += 1;
      } else {
        player_2 += 1;
      }
    });
    return player_1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 5, 39),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 10, 5, 39),
        title: const Text(
          "Kółko i krzyżyk",
          style: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
        ),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Kółko: $player_1", style: myTextStyle1),
                    Text("Krzyżyk: $player_2", style: myTextStyle1),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Ruch: $turn",
                  style: myTextStyle1,
                ),
              )
            ],
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (board[index] != '') {
                      } else {
                        if (player == true && board[index] == '') {
                          board[index] = 'O';
                          count += 1;
                        } else {
                          board[index] = 'X';
                          count += 1;
                        }
                      }
                      player = !player;

                      //row
                      isWin(0, 1, 2);
                      isWin(3, 4, 5);
                      isWin(6, 7, 8);

                      //column
                      isWin(0, 3, 6);
                      isWin(1, 4, 7);
                      isWin(2, 5, 8);

                      //diagonal
                      isWin(0, 4, 8);
                      isWin(2, 4, 6);

                      if (count == 9) {
                        draw();
                        resetGame();
                      }
                    });
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Center(
                      child: Text(board[index],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 60,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: resetGame,
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('Resetuj\nplanszę', style: mytextStyle2),
                  ),
                ),
                ElevatedButton(
                  onPressed: resetPoints,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Reset\npunktów',
                      style: mytextStyle2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
