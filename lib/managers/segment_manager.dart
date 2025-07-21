import 'package:flame/components.dart';
import 'package:star_quest/actors/water_enemy.dart';
import 'package:star_quest/objects/platform_block.dart';

import '../objects/ground_block.dart';
import '../objects/star.dart';

class TileBlock{
  final Vector2 gridPosition;
  final Type blockType;
  final bool last;

  TileBlock(this.gridPosition, this.blockType, {this.last = false});
}

final levelOneSegments = [
  segment0,
  segment1,
  segment2,
  segment3,
  segment4,
];

final levelTwoSegments = [
  segment5,
  segment6,
  segment7,
  segment8,
  segment9,
];

final levelThreeSegments = [
  segment10,
  segment11,
  segment12,
  segment13,
  segment14,
];

final segment0 = [
  TileBlock(Vector2(0, 0), GroundBlock),
  TileBlock(Vector2(1, 0), GroundBlock),
  TileBlock(Vector2(2, 0), GroundBlock),
  TileBlock(Vector2(3, 0), GroundBlock),
  TileBlock(Vector2(4, 0), GroundBlock),
  TileBlock(Vector2(5, 0), GroundBlock),
  TileBlock(Vector2(5, 1), WaterEnemy),
  TileBlock(Vector2(5, 3), PlatformBlock),
  TileBlock(Vector2(6, 0), GroundBlock),
  TileBlock(Vector2(6, 3), PlatformBlock),
  TileBlock(Vector2(7, 0), GroundBlock),
  TileBlock(Vector2(7, 3), PlatformBlock),
  TileBlock(Vector2(8, 0), GroundBlock),
  TileBlock(Vector2(8, 3), PlatformBlock),
  TileBlock(Vector2(9, 0), GroundBlock, last: true),
];

final segment1 = [
  TileBlock(Vector2(0, 0), GroundBlock),
  TileBlock(Vector2(1, 0), GroundBlock),
  TileBlock(Vector2(1, 1), PlatformBlock),
  TileBlock(Vector2(1, 2), PlatformBlock),
  TileBlock(Vector2(1, 3), PlatformBlock),
  TileBlock(Vector2(2, 6), PlatformBlock),
  TileBlock(Vector2(3, 6), PlatformBlock),
  TileBlock(Vector2(6, 5), PlatformBlock),
  TileBlock(Vector2(7, 5), PlatformBlock),
  TileBlock(Vector2(7, 7), Star),
  TileBlock(Vector2(8, 0), GroundBlock),
  TileBlock(Vector2(8, 1), PlatformBlock),
  TileBlock(Vector2(8, 5), PlatformBlock),
  TileBlock(Vector2(8, 6), WaterEnemy),
  TileBlock(Vector2(9, 0), GroundBlock, last: true),
];

final segment2 = [
  TileBlock(Vector2(0, 0), GroundBlock),
  TileBlock(Vector2(1, 0), GroundBlock),
  TileBlock(Vector2(2, 0), GroundBlock),
  TileBlock(Vector2(3, 0), GroundBlock),
  TileBlock(Vector2(3, 3), PlatformBlock),
  TileBlock(Vector2(4, 0), GroundBlock),
  TileBlock(Vector2(4, 3), PlatformBlock),
  TileBlock(Vector2(5, 0), GroundBlock),
  TileBlock(Vector2(5, 3), PlatformBlock),
  TileBlock(Vector2(5, 4), WaterEnemy),
  TileBlock(Vector2(6, 0), GroundBlock),
  TileBlock(Vector2(6, 3), PlatformBlock),
  TileBlock(Vector2(6, 4), PlatformBlock),
  TileBlock(Vector2(6, 5), PlatformBlock),
  TileBlock(Vector2(6, 7), Star),
  TileBlock(Vector2(7, 0), GroundBlock),
  TileBlock(Vector2(8, 0), GroundBlock),
  TileBlock(Vector2(9, 0), GroundBlock, last: true),
];

final segment3 = [
  TileBlock(Vector2(0, 0), GroundBlock),
  TileBlock(Vector2(1, 0), GroundBlock),
  TileBlock(Vector2(1, 1), WaterEnemy),
  TileBlock(Vector2(2, 0), GroundBlock),
  TileBlock(Vector2(2, 1), PlatformBlock),
  TileBlock(Vector2(2, 2), PlatformBlock),
  TileBlock(Vector2(4, 4), PlatformBlock),
  TileBlock(Vector2(6, 6), PlatformBlock),
  TileBlock(Vector2(7, 0), GroundBlock),
  TileBlock(Vector2(7, 1), PlatformBlock),
  TileBlock(Vector2(8, 0), GroundBlock),
  TileBlock(Vector2(8, 8), Star),
  TileBlock(Vector2(9, 0), GroundBlock, last: true),
];

final segment4 = [
  TileBlock(Vector2(0, 0), GroundBlock),
  TileBlock(Vector2(1, 0), GroundBlock),
  TileBlock(Vector2(2, 0), GroundBlock),
  TileBlock(Vector2(2, 3), PlatformBlock),
  TileBlock(Vector2(3, 0), GroundBlock),
  TileBlock(Vector2(3, 1), WaterEnemy),
  TileBlock(Vector2(3, 3), PlatformBlock),
  TileBlock(Vector2(4, 0), GroundBlock),
  TileBlock(Vector2(5, 0), GroundBlock),
  TileBlock(Vector2(5, 5), PlatformBlock),
  TileBlock(Vector2(6, 0), GroundBlock),
  TileBlock(Vector2(6, 5), PlatformBlock),
  TileBlock(Vector2(6, 7), Star),
  TileBlock(Vector2(7, 0), GroundBlock),
  TileBlock(Vector2(8, 0), GroundBlock),
  TileBlock(Vector2(8, 3), PlatformBlock),
  TileBlock(Vector2(9, 0), GroundBlock),
  TileBlock(Vector2(9, 1), WaterEnemy),
  TileBlock(Vector2(9, 3), PlatformBlock, last: true),
];

final segment5 = [
  TileBlock(Vector2(0, 0), GroundBlock),
  TileBlock(Vector2(1, 0), GroundBlock),
  TileBlock(Vector2(2, 0), GroundBlock),
  TileBlock(Vector2(4, 0), GroundBlock),
  TileBlock(Vector2(3, 4), PlatformBlock),
  TileBlock(Vector2(4, 4), PlatformBlock),
  TileBlock(Vector2(5, 4), PlatformBlock),
  TileBlock(Vector2(5, 0), GroundBlock),
  TileBlock(Vector2(5, 0), GroundBlock),
  TileBlock(Vector2(5, 5), WaterEnemy),
  TileBlock(Vector2(5, 6), Star),
  TileBlock(Vector2(7, 0), GroundBlock),
  TileBlock(Vector2(8, 0), GroundBlock),
  TileBlock(Vector2(9, 0), GroundBlock),
  TileBlock(Vector2(9, 0), GroundBlock, last: true),
];

final segment6 = [
  TileBlock(Vector2(0, 0), GroundBlock),
  TileBlock(Vector2(1, 0), GroundBlock),
  TileBlock(Vector2(2, 0), GroundBlock),
  TileBlock(Vector2(5, 2), PlatformBlock),
  TileBlock(Vector2(4, 3), Star),
  TileBlock(Vector2(4, 2), PlatformBlock),
  TileBlock(Vector2(6, 3), WaterEnemy),
  TileBlock(Vector2(5, 0), GroundBlock),
  TileBlock(Vector2(6, 2), PlatformBlock),
  TileBlock(Vector2(9, 3), PlatformBlock),
  TileBlock(Vector2(6, 3), Star),
  TileBlock(Vector2(7, 0), GroundBlock),
  TileBlock(Vector2(8, 0), GroundBlock),
  TileBlock(Vector2(9, 0), GroundBlock),
  TileBlock(Vector2(9, 0), GroundBlock),
  TileBlock(Vector2(9, 0), GroundBlock, last: true),
];

final segment7 = [
  TileBlock(Vector2(0, 0), GroundBlock),
  TileBlock(Vector2(1, 0), GroundBlock),
  TileBlock(Vector2(2, 3), PlatformBlock),
  TileBlock(Vector2(2, 0), GroundBlock),
  TileBlock(Vector2(3, 5), PlatformBlock),
  TileBlock(Vector2(4, 7), PlatformBlock),
  TileBlock(Vector2(5, 9), Star),
  TileBlock(Vector2(6, 7), PlatformBlock),
  TileBlock(Vector2(7, 5), PlatformBlock),
  TileBlock(Vector2(8, 3), PlatformBlock),
  TileBlock(Vector2(9, 0), GroundBlock, last: true),
];

final segment8 = [
  TileBlock(Vector2(0, 0), GroundBlock),
  TileBlock(Vector2(1, 0), GroundBlock),
  TileBlock(Vector2(2, 0), GroundBlock),
  TileBlock(Vector2(2, 1), WaterEnemy),
  TileBlock(Vector2(3, 0), GroundBlock),
  TileBlock(Vector2(3, 1), Star),
  TileBlock(Vector2(4, 0), GroundBlock),
  TileBlock(Vector2(5, 0), GroundBlock),
  TileBlock(Vector2(5, 1), PlatformBlock),
  TileBlock(Vector2(6, 0), GroundBlock),
  TileBlock(Vector2(7, 0), GroundBlock),
  TileBlock(Vector2(8, 0), GroundBlock),
  TileBlock(Vector2(9, 0), GroundBlock, last: true),
];

final segment9 = [
  TileBlock(Vector2(0, 0), GroundBlock),
  TileBlock(Vector2(1, 0), GroundBlock),
  TileBlock(Vector2(2, 0), GroundBlock),
  TileBlock(Vector2(3, 0), GroundBlock),
  TileBlock(Vector2(4, 0), GroundBlock),
  TileBlock(Vector2(5, 0), GroundBlock),
  TileBlock(Vector2(6, 0), GroundBlock),
  TileBlock(Vector2(7, 0), GroundBlock),
  TileBlock(Vector2(8, 0), GroundBlock),
  TileBlock(Vector2(9, 0), GroundBlock),
  TileBlock(Vector2(6, 6), WaterEnemy), // Midpoint enemy
  TileBlock(Vector2(4, 5), PlatformBlock),
  TileBlock(Vector2(5, 5), PlatformBlock),
  TileBlock(Vector2(6, 5), PlatformBlock),
  TileBlock(Vector2(5, 6), Star, last: true),
];

final segment10 = [
  TileBlock(Vector2(0, 0), GroundBlock),
  TileBlock(Vector2(1, 0), GroundBlock),
  TileBlock(Vector2(2, 0), GroundBlock),
  TileBlock(Vector2(3, 0), GroundBlock),
  TileBlock(Vector2(6, 1), WaterEnemy),
  TileBlock(Vector2(4, 0), GroundBlock),
  TileBlock(Vector2(5, 1), WaterEnemy),
  TileBlock(Vector2(5, 0), GroundBlock),
  TileBlock(Vector2(5, 2), PlatformBlock),
  TileBlock(Vector2(6, 3), PlatformBlock),
  TileBlock(Vector2(6, 0), GroundBlock),
  TileBlock(Vector2(7, 0), GroundBlock),
  TileBlock(Vector2(8, 0), GroundBlock),
  TileBlock(Vector2(8, 4), Star),
  TileBlock(Vector2(9, 0), GroundBlock, last: true),
];

final segment11 = [
  TileBlock(Vector2(0, 0), GroundBlock),
  TileBlock(Vector2(1, 0), GroundBlock),
  TileBlock(Vector2(2, 1), PlatformBlock),
  TileBlock(Vector2(3, 3), PlatformBlock),
  TileBlock(Vector2(4, 5), PlatformBlock),
  TileBlock(Vector2(5, 6), WaterEnemy),
  TileBlock(Vector2(6, 7), PlatformBlock),
  TileBlock(Vector2(7, 6), PlatformBlock),
  TileBlock(Vector2(8, 3), PlatformBlock),
  TileBlock(Vector2(9, 0), GroundBlock),
  TileBlock(Vector2(5, 8), Star, last: true),
];

final segment12 = [
  TileBlock(Vector2(0, 0), GroundBlock),
  TileBlock(Vector2(1, 0), GroundBlock),
  TileBlock(Vector2(2, 0), GroundBlock),
  TileBlock(Vector2(3, 0), GroundBlock),
  TileBlock(Vector2(4, 0), GroundBlock),
  TileBlock(Vector2(5, 0), GroundBlock),
  TileBlock(Vector2(6, 0), GroundBlock),
  TileBlock(Vector2(3, 1), PlatformBlock),
  TileBlock(Vector2(6, 1), WaterEnemy),
  TileBlock(Vector2(7, 1), PlatformBlock),
  TileBlock(Vector2(7, 0), GroundBlock),
  TileBlock(Vector2(10, 1), WaterEnemy),
  TileBlock(Vector2(8, 0), GroundBlock),
  TileBlock(Vector2(9, 0), GroundBlock),
  TileBlock(Vector2(8, 2), Star, last: true),
];

final segment13 = [
  TileBlock(Vector2(0, 0), GroundBlock),
  TileBlock(Vector2(1, 2), PlatformBlock),
  TileBlock(Vector2(2, 4), PlatformBlock),
  TileBlock(Vector2(3, 6), PlatformBlock),
  TileBlock(Vector2(4, 8), PlatformBlock),
  TileBlock(Vector2(5, 9), Star),
  TileBlock(Vector2(6, 8), PlatformBlock),
  TileBlock(Vector2(7, 6), PlatformBlock),
  TileBlock(Vector2(9, 4), WaterEnemy),
  TileBlock(Vector2(8.5, 3), PlatformBlock),
  TileBlock(Vector2(7.5, 3), PlatformBlock),
  TileBlock(Vector2(9, 0), GroundBlock, last: true),
];

final segment14 = [
  TileBlock(Vector2(0, 0), GroundBlock),
  TileBlock(Vector2(1, 0), GroundBlock),
  TileBlock(Vector2(2, 0), GroundBlock),
  TileBlock(Vector2(3.5, 2), PlatformBlock),
  TileBlock(Vector2(4.5, 2), PlatformBlock),
  TileBlock(Vector2(4, 7), Star),
  TileBlock(Vector2(5, 3), WaterEnemy),
  TileBlock(Vector2(6, 0), GroundBlock),
  TileBlock(Vector2(7, 0), GroundBlock),
  TileBlock(Vector2(8, 0), GroundBlock),
  TileBlock(Vector2(9, 0), GroundBlock, last: true),
];
