import 'package:flutter/material.dart';
import 'package:tic_tac_toe/tictactoe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TicTacToe());
  }
}
