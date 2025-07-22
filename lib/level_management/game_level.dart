import 'package:flame/components.dart';
import 'package:star_quest/managers/segment_manager.dart';
import 'package:star_quest/objects/ground_block.dart';
import 'package:star_quest/star_quest.dart';
import 'package:star_quest/util/colors.dart';

import '../actors/enemy.dart';
import '../objects/platform_block.dart';
import '../objects/star.dart';

class GameLevel extends Component with HasGameReference<StarQuestGame> {
  final int currentLevel;
  List<List<TileBlock>> currentSegments = [];

  GameLevel({required this.currentLevel});

  @override
  Future<void> onLoad() async {
    super.onLoad();
    switch (currentLevel) {
      case 1:
        game.setBackgroundColor(dayBackgroundColor);
        currentSegments = levelOneSegments;
        break;
      case 2:
        game.setBackgroundColor(nightBackgroundColor);
        currentSegments = levelTwoSegments;
        break;
      case 3:
        game.setBackgroundColor(underGroundBackgroundColor);
        currentSegments = levelThreeSegments;
        break;
      default:
        break;
    }
    _loadSegments();
  }

  void _loadSegments() {
    var segmentsToLoad = currentSegments.length;

    for (var i = 0; i < segmentsToLoad; i++) {
      final xOffset = (i * 640).toDouble();
      for (final block in currentSegments[i]) {
        switch (block.blockType) {
          case const (GroundBlock):
            game.world.add(GroundBlock(
                gridPosition: block.gridPosition,
                xOffset: xOffset,
                lastBlock: block.lastBlock));
          case const (PlatformBlock):
            game.world.add(PlatformBlock(
                gridPosition: block.gridPosition,
                xOffset: xOffset,
                lastBlock: block.lastBlock));
          case const (Star):
            game.world
                .add(Star(gridPosition: block.gridPosition, xOffset: xOffset));
          case const (Enemy):
            game.world.add(
                Enemy(gridPosition: block.gridPosition, xOffset: xOffset));
        }
      }
    }
  }
}
