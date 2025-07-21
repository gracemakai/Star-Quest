
import 'package:flutter/material.dart';
import 'package:star_quest/star_quest.dart';

import '../highscore_manager.dart';

class GameOver extends StatefulWidget{

  final StarQuestGame game;
  const GameOver({super.key, required this.game});

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  int _highScore = 0;


  @override
  void initState() {
    super.initState();
    _initHighScore();
  }

  Future<void> _initHighScore() async {
    final highScore = await HighScoreManager.getHighScore();
    setState(() {
      _highScore = highScore;
    });
  }

  @override
  Widget build(BuildContext context) {
    const blackTextColor = Color.fromRGBO(0, 0, 0, 1.0);
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 400,
          width: 500,
          decoration: const BoxDecoration(
            color: blackTextColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Game Over',
                style: TextStyle(
                  fontSize: 24,
                  color: whiteTextColor,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  widget.game.reset();
                  widget.game.overlays.remove('GameOver');
                },
                child: const Text('Restart Game',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: blackTextColor,
                  ),),
              ),
              const SizedBox(height: 20),
              Text(
                'You collected ${widget.game.starsCollected} stars!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: whiteTextColor,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                'Current high score $_highScore stars!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: whiteTextColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}