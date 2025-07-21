import 'dart:ui';

import 'package:flame/game.dart';

import '../managers/segment_manager.dart';

class LevelConfig {
  final Color backgroundColor;
  final List<List<TileBlock>> segments;
  final Vector2 emberStartPosition;


  LevelConfig(
      {required this.backgroundColor,
      required this.segments,
      required this.emberStartPosition});
}

final List<LevelConfig> levelConfigs = [
  LevelConfig(
    backgroundColor: const Color.fromARGB(255, 173, 223, 247),
    segments: levelOneSegments,
    emberStartPosition: Vector2(128, 640 - 128),
  ),
  LevelConfig(
    backgroundColor: const Color.fromARGB(255, 56, 79, 89),
    segments: levelTwoSegments,
    emberStartPosition: Vector2(128, 640 - 128),
  ),
  LevelConfig(
    backgroundColor: const Color.fromARGB(255, 112, 94, 94),
    segments: levelThreeSegments,
    emberStartPosition: Vector2(128, 640 - 128),
  ),
];