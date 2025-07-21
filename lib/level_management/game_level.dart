import 'dart:ui';

import 'package:flame/components.dart';
import 'package:star_quest/star_quest.dart';
import 'package:star_quest/util/colors.dart';

class GameLevel extends Component with HasGameReference<StarQuestGame> {
  int currentLevel = 1;

  void loadLevel(int level) {
    currentLevel = level;

    switch (level) {
      case 1:
        game.setBackgroundColor(dayBackgroundColor);
        break;
      case 2:
        game.setBackgroundColor(nightBackgroundColor);
        break;
      case 3:
        game.setBackgroundColor(underGroundBackgroundColor);
        break;
      default:
        currentLevel = 1;
        break;
    }
  }

  void resetLevel() {
    currentLevel = 1;
  }

  void nextLevel() {
    currentLevel++;
    loadLevel(currentLevel);
  }
}
