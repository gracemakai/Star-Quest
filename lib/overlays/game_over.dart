import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:star_quest/star_quest.dart';

import '../highscore_manager.dart';

class GameOver extends StatefulWidget {
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

    print('width ${widget.game.bannerHeight}');

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: widget.game.bannerHeight,
          width: widget.game.bannerWidth,
          decoration: const BoxDecoration(
              color: blackTextColor,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Game Over',
                style: TextStyle(
                  fontSize: 24.sp,
                  color: whiteTextColor,
                ),
              ),
              SizedBox(height: 0.07.sh),
              ElevatedButton(
                onPressed: () {
                  widget.game.reset();
                  widget.game.overlays.remove('GameOver');
                },
                child: Text(
                  'Restart Game',
                  style: TextStyle(
                    fontSize: 20.0.sp,
                    color: blackTextColor,
                  ),
                ),
              ),
              SizedBox(height: 0.07.sh),
              Text(
                'You collected ${widget.game.starsCollected} stars!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 0.1.sh),
              Text(
                'Current high score $_highScore stars!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
