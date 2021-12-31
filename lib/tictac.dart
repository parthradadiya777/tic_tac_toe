// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Tictaac extends StatefulWidget {
  @override
  State<Tictaac> createState() => _TictaacState();
}

class _TictaacState extends State<Tictaac> {
  List<String> displayox = [
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

  bool turn = true;
  int fillbox = 0;
  int x = 0;
  int o = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(

                  //   style: TextStyle(fontSize: 30, color: Colors.white),
                  // ),
                  SizedBox(
                    // width: 200.0,
                    // height: 100.0,
                    child: Shimmer.fromColors(
                      baseColor: Colors.red.shade200,
                      highlightColor: Colors.yellow,
                      child: Text(
                        'Player 1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    // width: 200.0,
                    // height: 100.0,
                    child: Shimmer.fromColors(
                      baseColor: Colors.red.shade200,
                      highlightColor: Colors.yellow,
                      child: Text(
                        '$x',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    // width: 200.0,
                    // height: 100.0,
                    child: Shimmer.fromColors(
                      baseColor: Colors.red.shade200,
                      highlightColor: Colors.yellow,
                      child: Text(
                        'Player 2',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    // width: 200.0,
                    // height: 100.0,
                    child: Shimmer.fromColors(
                      baseColor: Colors.red.shade200,
                      highlightColor: Colors.yellow,
                      child: Text(
                        '$o',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemBuilder: (contex, index) {
                  return GestureDetector(
                    onTap: () {
                      tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          displayox[index],
                          // index.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  void tapped(int index) {
    setState(() {
      if (turn && displayox[index] == '') {
        displayox[index] = 'x';
        fillbox += 1;
      } else if (!turn && displayox[index] == '') {
        displayox[index] = 'o';
        fillbox += 1;
      }
      turn = !turn;
      winner();
    });
  }

  void winner() {
    // Row wise
    if (displayox[0] == displayox[1] &&
        displayox[0] == displayox[2] &&
        displayox[0] != '') {
      showAlerelDialog(displayox[0]);
    }
    if (displayox[3] == displayox[4] &&
        displayox[3] == displayox[5] &&
        displayox[3] != '') {
      showAlerelDialog(displayox[3]);
    }
    if (displayox[6] == displayox[7] &&
        displayox[6] == displayox[8] &&
        displayox[6] != '') {
      showAlerelDialog(displayox[6]);
    }
    // Column Wise
    if (displayox[0] == displayox[3] &&
        displayox[0] == displayox[6] &&
        displayox[0] != '') {
      showAlerelDialog(displayox[0]);
    }
    if (displayox[1] == displayox[4] &&
        displayox[1] == displayox[7] &&
        displayox[1] != '') {
      showAlerelDialog(displayox[1]);
    }
    if (displayox[2] == displayox[5] &&
        displayox[2] == displayox[8] &&
        displayox[2] != '') {
      showAlerelDialog(displayox[2]);
    }
    // Cross
    if (displayox[0] == displayox[4] &&
        displayox[0] == displayox[8] &&
        displayox[0] != '') {
      showAlerelDialog(displayox[0]);
    }
    if (displayox[2] == displayox[4] &&
        displayox[2] == displayox[6] &&
        displayox[2] != '') {
      showAlerelDialog(displayox[2]);
    } else if (fillbox == 9) {
      showDrawialog();
    }
  }

  void showDrawialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (contex) {
          return AlertDialog(title: Text('Draw'), actions: [
            TextButton(
                onPressed: () {
                  clearboaard();
                  Navigator.of(context).pop();
                },
                child: Text('Play Again'))
          ]);
        });
  }

  void showAlerelDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (contex) {
          return AlertDialog(title: Text('Winner : ' + winner), actions: [
            TextButton(
                onPressed: () {
                  clearboaard();
                  Navigator.of(context).pop();
                },
                child: Text('Play Again'))
          ]);
        });
    if (winner == 'o') {
      o += 1;
    } else if (winner == 'x') {
      x += 1;
    }
  }

  void clearboaard() {
    setState(
      () {
        for (var i = 0; i < 9; i++) {
          displayox[i] = '';
        }
      },
    );
    fillbox = 0;
  }
}
