import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:star_quest/highscore_manager.dart';
import 'package:star_quest/level_management/level_manager.dart';
import 'package:star_quest/util/colors.dart';


class StarQuestGame extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents {
  double objectSpeed = 0.0;
  late double lastBlockXPosition = 0.0;
  late UniqueKey lastBlockKey;
  int health = 3;
  int starsCollected = 0;
  bool isGameOver = false;
  Color _backgroundColor = dayBackgroundColor;
  late LevelManager levelManager;

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'block.png',
      'ember.png',
      'ground.png',
      'heart.png',
      'heart_half.png',
      'star.png',
      'water_enemy.png',
    ]);

    camera.viewfinder.anchor = Anchor.topLeft;
    levelManager = LevelManager(this);

    levelManager.loadLevel(1);
  }

  @override
  Color backgroundColor() {
    return _backgroundColor;
  }

  @override
  Future<void> update(double dt) async {
    if (isGameOver) return;

    if (health <= 0) {
      isGameOver = true;
      overlays.add('GameOver');
      final highScore = await HighScoreManager.getHighScore();

      if (starsCollected > highScore) {
        await HighScoreManager.setHighScore(starsCollected);
      }
    }

    super.update(dt);
  }

  void onLevelComplete() {
    // starsCollected += 1;
    levelManager.nextLevel();
    // overlays.add('LevelComplete');
  }

  void reset() {
    starsCollected = 0;
    health = 3;
    isGameOver = false;
    levelManager.initializeGame(false);
  }

  void setBackgroundColor(Color color) {
    _backgroundColor = color;
  }
}
