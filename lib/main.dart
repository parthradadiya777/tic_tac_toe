import 'package:flutter/material.dart';
import 'package:tic_tac_toe/tictac.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic1_Tac_Toe',
      home: Tictaac(),
    );
  }
}
