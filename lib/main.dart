import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:star_quest/ember_quest.dart';

void main() {
  runApp(const GameWidget<EmberQuestGame>.controlled(
    gameFactory: EmberQuestGame.new,
  ));
}
