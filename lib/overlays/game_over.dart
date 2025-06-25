
import 'package:flutter/material.dart';
import 'package:star_quest/ember_quest.dart';

class GameOver extends StatelessWidget{

  final EmberQuestGame game;
  const GameOver({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    const blackTextColor = Color.fromRGBO(0, 0, 0, 1.0);
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 200,
          width: 300,
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
                  game.reset();
                  game.overlays.remove('GameOver');
                },
                child: const Text('Restart Game',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: blackTextColor,
                  ),),
              ),
              const SizedBox(height: 20),
              Text(
                'You collected ${game.starsCollected} stars!',
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