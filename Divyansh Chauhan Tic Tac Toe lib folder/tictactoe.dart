import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<List<String>> winlist = [
    ["0", "1", "2"],
    ["0", "3", "6"],
    ["0", "4", "8"],
    ["1", "4", "7"],
    ["2", "5", "8"],
    ["3", "4", "5"],
    ["6", "7", "8"],
  ];
  List<String> board = List.filled(9, "_");
  int i = 0;
  String winner = "";
  int btnno = 0, time = 0;
  void checkwinner() {
    if (winner == "X" || winner == "O") {
      return;
    }
    for (int i = 0; i < winlist.length; i++) {
      List<String> temp = winlist[i];
      int a = int.parse(temp[0]);
      int b = int.parse(temp[1]);
      int c = int.parse(temp[2]);
      if (board[a] != "" &&
          board[b] != "" &&
          board[c] != "" &&
          board[a] == board[b] &&
          board[b] == board[c] &&
          board[a] == "X") {
        winner = "X";
        break;
      } else if (board[a] != "" &&
          board[b] != "" &&
          board[c] != "" &&
          board[a] == board[b] &&
          board[b] == board[c] &&
          board[a] == "O") {
        winner = "O";
        break;
      } else {
        winner = "No one";
      }
    }
  }

  void clearAll() {
    time = 0;
    i = 0;
    winner = "";
    for (int i = 0; i < 9; i++) {
      setState(() {
        board[i] = "_";
      });
    }
  }

  void insertIntoBox(int index) {
    time++;
    if (board[index] != "_") return;
    setState(() {
      board[index] = (i % 2 == 0) ? "X" : "O";
      i++;
    });
    checkwinner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Tic Tac Toe",
            style: TextStyle(
              color: Color.fromARGB(255, 118, 200, 255),
              fontSize: 32,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 10, 42),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ((winner == "X" || winner == "O"))
                  ? "Winner is $winner"
                  : (time != 9)
                  ? (time % 2 == 0)
                      ? "X's turn"
                      : "O's turn"
                  : "Match Draw",
              style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 45,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(45),
                        backgroundColor: const Color.fromARGB(
                          255,
                          159,
                          183,
                          254,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => {insertIntoBox(0)},
                      child: Text(
                        board[0],
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(45),
                        backgroundColor: Color.fromARGB(255, 159, 183, 254),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => {insertIntoBox(1)},
                      child: Text(
                        board[1],
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(45),
                        backgroundColor: Color.fromARGB(255, 159, 183, 254),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => {insertIntoBox(2)},
                      child: Text(
                        board[2],
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(45),
                        backgroundColor: Color.fromARGB(255, 159, 183, 254),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => {insertIntoBox(3)},
                      child: Text(
                        board[3],
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(45),
                        backgroundColor: Color.fromARGB(255, 159, 183, 254),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => {insertIntoBox(4)},
                      child: Text(
                        board[4],
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(45),
                        backgroundColor: Color.fromARGB(255, 159, 183, 254),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => {insertIntoBox(5)},
                      child: Text(
                        board[5],
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(45),
                        backgroundColor: Color.fromARGB(255, 159, 183, 254),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => {insertIntoBox(6)},
                      child: Text(
                        board[6],
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(45),
                        backgroundColor: Color.fromARGB(255, 159, 183, 254),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => {insertIntoBox(7)},
                      child: Text(
                        board[7],
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(45),
                        backgroundColor: Color.fromARGB(255, 159, 183, 254),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => {insertIntoBox(8)},
                      child: Text(
                        board[8],
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(45),
                    backgroundColor: Color.fromARGB(255, 159, 183, 254),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => {clearAll()},
                  child: Text(
                    (winner == "X" || winner == "O") ? "Play Again" : "Reset",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
