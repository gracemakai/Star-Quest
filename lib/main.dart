import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:star_quest/star_quest.dart';
import 'package:star_quest/overlays/game_over.dart';

import 'overlays/level_complete.dart';
import 'overlays/main_menu.dart';

double height = 0;
double width = 0;

void main() {
  runApp(Builder(
    builder: (context) {
      height = MediaQuery.of(context).size.height;
      width = MediaQuery.of(context).size.width;
      print('Screen height: $height, width: $width');
      return ScreenUtilInit(
          designSize: Size(width, height),
          minTextAdapt: true,
        builder: (context, child) {
          return GameWidget<StarQuestGame>.controlled(
            gameFactory: StarQuestGame.new,
            overlayBuilderMap: {
              'MainMenu': (_, game) => MainMenu(game: game),
              'GameOver': (_, game) => GameOver(game: game),
              'LevelComplete': (context, game) => LevelCompleteOverlay(
                onNextLevel: () {
                  game.overlays.remove('LevelComplete');
                  game.moveToNextLevel();
                },
              ),
            },
            initialActiveOverlays: const ['MainMenu'],
          );
        }
      );
    }
  ));
}
