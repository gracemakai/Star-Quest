import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:star_quest/level_management/game_level.dart';
import 'package:star_quest/overlays/hud.dart';

import '../actors/ember.dart';
import '../actors/water_enemy.dart';
import '../managers/segment_manager.dart';
import '../objects/ground_block.dart';
import '../objects/platform_block.dart';
import '../objects/star.dart';
import '../star_quest.dart';

class LevelManager extends Component{
  int currentLevel = 1;
  int maxLevel = 3;
  late EmberPlayer _ember;
  late FlameGame gameRef;

  LevelManager(this.gameRef);

  void loadLevel(int level) {
    currentLevel = level;
    gameRef.children.whereType<GameLevel>().forEach((levelComponent) {
      levelComponent.removeFromParent();
    });

    final newLevel = GameLevel(currentLevel: currentLevel);
    gameRef.add(newLevel);
    initializeGame(false);
  }

  void nextLevel() {
    if (currentLevel < maxLevel) {
      for (var e in gameRef.world.children) {
        e.removeFromParent();
      }
      currentLevel++;
      loadLevel(currentLevel);
    }
  }

  void initializeGame(bool loadHud) {
    var segmentsToLoad = (gameRef.size.x / 640).ceil();
    segmentsToLoad = segmentsToLoad.clamp(0, levelOneSegments.length);

    for (var i = 0; i < segmentsToLoad; i++) {
      loadSegments(i, (i * 640).toDouble());
    }

    _ember = EmberPlayer(position: Vector2(40, gameRef.canvasSize.y - 128));

    gameRef.world.add(_ember);
    if (loadHud) {
      gameRef.world.add(Hud());
    }
  }

  void loadSegments(int segmentIndex, double xPositionOffset) {
    for (final block in levelTwoSegments[segmentIndex]) {
      switch (block.blockType) {
        case const (GroundBlock):
          gameRef.world.add(GroundBlock(
              gridPosition: block.gridPosition, xOffset: xPositionOffset));
        case const (PlatformBlock):
          gameRef.world.add(PlatformBlock(
              gridPosition: block.gridPosition, xOffset: xPositionOffset));
        case const (Star):
          gameRef.world.add(Star(gridPosition: block.gridPosition, xOffset: xPositionOffset));
        case const (WaterEnemy):
          gameRef.world.add(WaterEnemy(
              gridPosition: block.gridPosition, xOffset: xPositionOffset));
      }
    }
  }
}
