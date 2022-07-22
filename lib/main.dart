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
  // This widget is the root of your application.
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 16, 7, 59),
        title: const Text("Kółko i krzyżyk"),
      ),
      body: Column(
        children: [
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
                      if (board[0] != '' &&
                          board[0] == board[1] &&
                          board[1] == board[2]) {
                        final winner = board[0];
                        if (board[0] == 'O') {
                          player_1 += 1;
                          print(player_1);
                        }else{
                          player_2 += 1;
                          print(player_2);
                        }
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Wygrał: $winner'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        for (int i = 0; i < 9; i++) {
                                          board[i] = '';
                                        }
                                      });
                                      count = 0;
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Zagraj jeszcze raz'),
                                  )
                                ],
                              );
                            });
                      }

                      if (board[3] != '' &&
                          board[3] == board[4] &&
                          board[4] == board[5]) {
                        final winner = board[3];
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Wygrał : $winner'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        for (int i = 0; i < 9; i++) {
                                          board[i] = '';
                                        }
                                      });
                                      count = 0;
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Zagraj jeszcze raz'),
                                  )
                                ],
                              );
                            });
                      }

                      if (board[6] != '' &&
                          board[6] == board[7] &&
                          board[7] == board[8]) {
                        final winner = board[6];
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Wygrał : $winner'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        for (int i = 0; i < 9; i++) {
                                          board[i] = '';
                                        }
                                      });
                                      count = 0;
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Zagraj jeszcze raz'),
                                  )
                                ],
                              );
                            });
                      }
                      //column
                      if (board[0] != '' &&
                          board[0] == board[3] &&
                          board[3] == board[6]) {
                        final winner = board[0];
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Wygrał : $winner'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        for (int i = 0; i < 9; i++) {
                                          board[i] = '';
                                        }
                                      });
                                      count = 0;
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Zagraj jeszcze raz'),
                                  )
                                ],
                              );
                            });
                      }

                      if (board[1] != '' &&
                          board[1] == board[4] &&
                          board[4] == board[7]) {
                        final winner = board[1];
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Wygrał : $winner'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        for (int i = 0; i < 9; i++) {
                                          board[i] = '';
                                        }
                                      });
                                      count = 0;
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Zagraj jeszcze raz'),
                                  )
                                ],
                              );
                            });
                      }

                      if (board[2] != '' &&
                          board[2] == board[5] &&
                          board[5] == board[8]) {
                        final winner = board[2];
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Wygrał : $winner'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        for (int i = 0; i < 9; i++) {
                                          board[i] = '';
                                        }
                                      });
                                      count = 0;
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Zagraj jeszcze raz'),
                                  )
                                ],
                              );
                            });
                      }
                      //diagonal
                      if (board[0] != '' &&
                          board[0] == board[4] &&
                          board[4] == board[8]) {
                        final winner = board[0];
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Wygrał : $winner'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        for (int i = 0; i < 9; i++) {
                                          board[i] = '';
                                        }
                                      });
                                      count = 0;
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Zagraj jeszcze raz'),
                                  )
                                ],
                              );
                            });
                      }

                      if (board[2] != '' &&
                          board[2] == board[4] &&
                          board[4] == board[6]) {
                        final winner = board[2];
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Wygrał : $winner'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        for (int i = 0; i < 9; i++) {
                                          board[i] = '';
                                        }
                                      });
                                      count = 0;
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Zagraj jeszcze raz'),
                                  )
                                ],
                              );
                            });
                      }

                      if (count == 9) {
                        print('remis');
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade700)),
                    child: Center(
                      child: Text(board[index],
                          style: const TextStyle(
                              fontSize: 60, fontWeight: FontWeight.bold)),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: (() {
              setState(() {
                for (int i = 0; i < 9; i++) {
                  board[i] = '';
                }
              });
              count = 0;
            }),
            child: const Text('Reset game'),
          )
        ],
      ),
    );
  }
}
