import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:star_quest/actors/ember.dart';
import 'package:star_quest/actors/water_enemy.dart';
import 'package:star_quest/managers/segment_manager.dart';
import 'package:star_quest/objects/ground_block.dart';
import 'package:star_quest/objects/platform_block.dart';

import 'objects/star.dart';

class EmberQuestGame extends FlameGame with HasCollisionDetection, HasKeyboardHandlerComponents{

  late EmberPlayer _ember;
  double objectSpeed = 0.0;
  late double lastBlockXPosition = 0.0;
  late UniqueKey lastBlockKey;

  @override
  Future<void> onLoad() async{
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

    initializeGame();
  }


  @override
  Color backgroundColor() {
    return const Color.fromARGB(255, 173, 223, 247);
  }

  void initializeGame(){
    final segmentsToLoad = (size.x / 640).ceil();
    segmentsToLoad.clamp(0, segments.length);

    for(var i = 0; i < segmentsToLoad; i++){
      loadSegments(i, (i * 640).toDouble());
    }

    _ember = EmberPlayer(position: Vector2(128, canvasSize.y - 128));

    world.add(_ember);
  }

  void loadSegments(int segmentIndex, double xPositionOffset){
    for(final block in segments[segmentIndex]){
      switch (block.blockType){
        case GroundBlock:
          add(GroundBlock(gridPosition: block.gridPosition, xOffset: xPositionOffset));
        case PlatformBlock:
          add(PlatformBlock(gridPosition: block.gridPosition, xOffset: xPositionOffset));
        case Star:
          add(Star(gridPosition: block.gridPosition, xOffset: xPositionOffset));
        case WaterEnemy:
          add(WaterEnemy(gridPosition: block.gridPosition, xOffset: xPositionOffset));
      }
    }
  }
}