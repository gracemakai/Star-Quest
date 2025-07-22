import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:star_quest/level_management/game_level.dart';

import '../actors/ember.dart';

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
    initializeGame();
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

  bool isLastLevel() {
    return currentLevel == maxLevel;
  }

  void initializeGame() {
    _ember = EmberPlayer(position: Vector2(40, gameRef.canvasSize.y - 128));
    gameRef.world.add(_ember);
  }

  void resetGame() {
    for (var e in gameRef.world.children) {
      e.removeFromParent();
    }
    currentLevel = 1;
    loadLevel(currentLevel);
    initializeGame();
  }

}
