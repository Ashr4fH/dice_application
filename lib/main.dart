import 'package:flutter/material.dart';
import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Twin Dice Game'),
        ),
        body: DiceGame(),
      ),
    ));

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int leftdice = 1;
  int rightdice = 2;
  AssetsAudioPlayer audio = AssetsAudioPlayer();

  rolldices() {
    setState(() {
      leftdice = Random().nextInt(6) + 1;
      rightdice = Random().nextInt(6) + 1;
    });

    audio.open(
      Audio('audios/roll.mp3'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'images/diceeLogo.png',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset('images/$leftdice.png'),
              Image.asset('images/$rightdice.png'),
            ],
          ),
          FloatingActionButton(
            onPressed: () => rolldices(),
            child: Text(
              'Roll',
              style: TextStyle(
                fontFamily: 'Lobster',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
