import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:star_quest/star_quest.dart';
import 'package:star_quest/overlays/game_over.dart';

import 'overlays/main_menu.dart';

void main() {
  runApp(GameWidget<StarQuestGame>.controlled(
    gameFactory: StarQuestGame.new,
    overlayBuilderMap: {
      'MainMenu': (_, game) => MainMenu(game: game),
      'GameOver': (_, game) => GameOver(game: game),
    },
    initialActiveOverlays: const ['MainMenu'],
  ));
}
