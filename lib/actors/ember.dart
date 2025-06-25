import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:star_quest/ember_quest.dart';

class EmberPlayer extends SpriteAnimationComponent
    with KeyboardHandler, HasGameReference<EmberQuestGame> {

  int horizontalDirection = 0; // -1 for left, 1 for right, 0 for no movement
  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 200;

  EmberPlayer({
    required super.position,
  }) : super(
          size: Vector2.all(64),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('ember.png'),
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.12,
        textureSize: Vector2.all(16),
      ),
    );
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {

    horizontalDirection = 0;
    horizontalDirection += (keysPressed.contains(LogicalKeyboardKey.keyA) || keysPressed.contains(LogicalKeyboardKey.arrowRight)) ? 1 : 0;
    horizontalDirection += (keysPressed.contains(LogicalKeyboardKey.keyD) || keysPressed.contains(LogicalKeyboardKey.arrowLeft)) ? -1 : 0;

    return true;
  }

  @override
  void update(double dt) {
    velocity.x = horizontalDirection * moveSpeed;
    position += velocity * dt;

    if(horizontalDirection < 0 && scale.x > 0){
      flipHorizontally();
    }else if(horizontalDirection > 0 && scale.x < 0){
      flipHorizontally();
    }

    super.update(dt);
  }
}
