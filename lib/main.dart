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

  var myTextStyle = const TextStyle(color: Colors.white, fontSize: 30);
  int player_1 = 0;
  int player_2 = 0;
  int count = 0;
  final textStyle =
      const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins');

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
          title: Text('Wygrał : $winner'),
          actions: [
            TextButton(
              onPressed: () {
                resetGame();
                Navigator.of(context).pop();
              },
              child: const Text('Zagraj jeszcze raz'),
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

  draw() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Remis'),
          actions: [
            TextButton(
              onPressed: () {
                resetGame();
                Navigator.of(context).pop();
              },
              child: const Text('Zagraj jeszcze raz'),
            )
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
    }
  }

  wincount(int index_1) {
    setState(() {
      if (board[index_1] == 'O') {
        player_1 += 1;
        print("Kolko zwycięstw: $player_1");
      } else {
        player_2 += 1;
      }
    });
    return player_1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 16, 7, 59),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 16, 7, 59),
        title: const Text(
          "Kółko i krzyżyk",
          style: TextStyle(fontSize: 30, fontFamily: 'Poppins'),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Liczba wygranych:", style: textStyle),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Kółko: $player_1", style: textStyle),
                      Text("Krzyżyk: $player_2", style: textStyle),
                    ],
                  ),
                )
              ],
            ),
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
                      if (player == true && board[index] == '') {
                        board[index] = 'O';
                        count += 1;
                      } else {
                        board[index] = 'X';
                        count += 1;
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
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade700)),
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
          Container(
            height: 100,
            width: 200,
            child: ElevatedButton(
              onPressed: (() {
                resetGame();
              }),
              child: const Text('Reset game'),
            ),
          )
        ],
      ),
    );
  }
}
