import 'dart:ui';

import 'package:flame/components.dart';
import 'package:star_quest/star_quest.dart';
import 'package:star_quest/util/colors.dart';

class GameLevel extends Component with HasGameReference<StarQuestGame> {
  final int currentLevel;

  GameLevel({required this.currentLevel});

  @override
  Future<void> onLoad() async {
    switch (currentLevel) {
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
        break;
    }
  }
}
