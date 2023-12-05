import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String player1 = "";
  String player2 = "";
  String winnerplayer = "";
  rndmPlayer1() {
    int num = Random().nextInt(3);
    String player = "";
    if (num == 0) {
      player = "rock";
    } else if (num == 1) {
      player = "paper";
    } else {
      player = "scissors";
    }

    setState(() {
      player1 = player;
    });
  }

  rndmPlayer2() {
    int num = Random().nextInt(3);
    String player = "";
    if (num == 0) {
      player = "rock";
    } else if (num == 1) {
      player = "paper";
    } else {
      player = "scissors";
    }

    setState(() {
      player2 = player;
    });
  }

  winner() {
    String wnr = "";
    if (player1 == "rock" && player2 == "scissors") {
      wnr = "player 1 wins";
    } else if (player1 == "scissors" && player2 == "paper") {
      wnr = "player 1 wins";
    } else if (player1 == "paper" && player2 == "rock") {
      wnr = "player 1 wins";
    } else if (player1 == player2) {
      wnr = "draw";
    } else {
      wnr = "player 2 wins";
    }

    setState(() {
      winnerplayer = wnr;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 235, 202),
        appBar: AppBar(
          title: Center(
            child: Text(
              "Rock Paper Scissors",
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/$player1.png"),
                Image.asset("assets/images/$player2.png")
              ],
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "player 1",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "player 2",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Text("$winnerplayer"),
            SizedBox(
              width: 120,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  rndmPlayer1();
                  rndmPlayer2();
                  winner();
                },
                child: Text(
                  "Play ",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    backgroundColor: Colors.orangeAccent),
              ),
            )
          ],
        ));
  }
}
