import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:star_quest/actors/ember.dart';
import 'package:star_quest/actors/water_enemy.dart';
import 'package:star_quest/highscore_manager.dart';
import 'package:star_quest/managers/segment_manager.dart';
import 'package:star_quest/objects/ground_block.dart';
import 'package:star_quest/objects/platform_block.dart';
import 'package:star_quest/overlays/hud.dart';
import 'package:star_quest/util/colors.dart';

import 'objects/star.dart';

class StarQuestGame extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents {
  late EmberPlayer _ember;
  double objectSpeed = 0.0;
  late double lastBlockXPosition = 0.0;
  late UniqueKey lastBlockKey;
  int health = 3;
  int starsCollected = 0;
  bool isGameOver = false;
  Color _backgroundColor = dayBackgroundColor;

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

    initializeGame(true);
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

  void initializeGame(bool loadHud) {
    final segmentsToLoad = (size.x / 640).ceil();
    segmentsToLoad.clamp(0, segments.length);

    for (var i = 0; i < segmentsToLoad; i++) {
      loadSegments(i, (i * 640).toDouble());
    }

    _ember = EmberPlayer(position: Vector2(128, canvasSize.y - 128));

    world.add(_ember);
    if (loadHud) {
      add(Hud());
    }
  }

  void loadSegments(int segmentIndex, double xPositionOffset) {
    for (final block in segments[segmentIndex]) {
      switch (block.blockType) {
        case const (GroundBlock):
          add(GroundBlock(
              gridPosition: block.gridPosition, xOffset: xPositionOffset));
        case const (PlatformBlock):
          add(PlatformBlock(
              gridPosition: block.gridPosition, xOffset: xPositionOffset));
        case const (Star):
          add(Star(gridPosition: block.gridPosition, xOffset: xPositionOffset));
        case const (WaterEnemy):
          add(WaterEnemy(
              gridPosition: block.gridPosition, xOffset: xPositionOffset));
      }
    }
  }

  void reset() {
    starsCollected = 0;
    health = 3;
    isGameOver = false;
    initializeGame(false);
  }

  void setBackgroundColor(Color color) {
    _backgroundColor = color;
  }
}
