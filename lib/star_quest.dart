import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:star_quest/highscore_manager.dart';
import 'package:star_quest/level_management/level_manager.dart';
import 'package:star_quest/main.dart';
import 'package:star_quest/util/colors.dart';

import 'actors/player.dart';
import 'overlays/hud.dart';

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
  var gameWidth = 640.0;
  var gameHeight = 360.0;
  var bannerHeight = 0.0;
  var bannerWidth = 0.0;

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'block.png',
      'alien.png',
      'ground.png',
      'heart.png',
      'heart_half.png',
      'star.png',
      'water_enemy.png',
    ]);
    debugMode = true;
    camera = CameraComponent.withFixedResolution(width: 760, height: 360)
      ..world = world;

    gameWidth = width;
    gameHeight = height;
    bannerHeight = height < 500 ? (height * 0.7) : 400;
    bannerWidth = width < 900 ? (width * 0.5) : 500;

    camera.viewfinder.anchor = Anchor.topLeft;
    levelManager = LevelManager(this);

    levelManager.loadLevel(1);
    add(Hud());

    addButtons();
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

  void moveToNextLevel() {
    // starsCollected += 1;
    levelManager.nextLevel();
    resumeEngine();
  }

  void levelComplete() {
    if (levelManager.isLastLevel()) {
      isGameOver = true;
      overlays.add('GameOver');
      return;
    }
    {
      overlays.add('LevelComplete');
      pauseEngine();
    }
  }

  void reset() {
    starsCollected = 0;
    health = 3;
    isGameOver = false;
    levelManager.resetGame();
  }

  void setBackgroundColor(Color color) {
    _backgroundColor = color;
  }

  void addButtons() {
    final buttonSize = Vector2(60, 60);
    var radius = 15.0;
    final player = children.whereType<Player>().firstOrNull;

    // Left button
    add(
      HudButtonComponent(
        button:
            CircleComponent(radius: radius, paint: BasicPalette.yellow.paint()),
        buttonDown:
            CircleComponent(radius: radius, paint: BasicPalette.yellow.paint()),
        position: Vector2(radius, gameHeight - radius),
        margin: EdgeInsets.only(left: radius, bottom: radius),
        onPressed: () {
          if (player != null) player.horizontalDirection = -1;
        },
        onReleased: () {
          if (player != null) player.horizontalDirection = 0;
        },
      ),
    );

    // Up (jump) button
    add(
      HudButtonComponent(
        button: CircleComponent(radius: radius, paint: BasicPalette.pink.paint()),
        buttonDown:
            CircleComponent(radius: radius, paint: BasicPalette.blue.paint()),
        position: Vector2(gameWidth - radius, gameHeight - radius),
        margin: EdgeInsets.only(bottom: radius * 3),
        onPressed: () {
          if (player != null) player.hasJumped = true;
        },
      ),
    );

    // Right button
    add(
      HudButtonComponent(
        button: CircleComponent(radius: radius, paint: BasicPalette.gray.paint()),
        buttonDown:
            CircleComponent(radius: radius, paint: BasicPalette.blue.paint()),
        margin: EdgeInsets.only(right: radius, bottom: radius),
        onPressed: () {
          if (player != null) player.horizontalDirection = 1;
        },
        onReleased: () {
          if (player != null) player.horizontalDirection = 0;
        },
      ),
    );
  }
}
