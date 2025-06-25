import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/services.dart';
import 'package:star_quest/actors/water_enemy.dart';
import 'package:star_quest/ember_quest.dart';
import 'package:star_quest/objects/ground_block.dart';
import 'package:star_quest/objects/platform_block.dart';

import '../objects/star.dart';

class EmberPlayer extends SpriteAnimationComponent
    with KeyboardHandler, CollisionCallbacks, HasGameReference<EmberQuestGame> {

  int horizontalDirection = 0; // -1 for left, 1 for right, 0 for no movement
  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 200;
  bool isOnGround = false;
  final Vector2 fromAbove = Vector2(0, -1);

  final double gravity = 15;
  final double jumpSpeed = 600;
  final double terminalVelocity = 150;

  bool hasJumped = false;
  bool hitByEnemy = false;

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
    add(CircleHitbox());
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {

    horizontalDirection = 0;
    horizontalDirection += (keysPressed.contains(LogicalKeyboardKey.keyA) || keysPressed.contains(LogicalKeyboardKey.arrowRight)) ? 1 : 0;
    horizontalDirection += (keysPressed.contains(LogicalKeyboardKey.keyD) || keysPressed.contains(LogicalKeyboardKey.arrowLeft)) ? -1 : 0;

    hasJumped = keysPressed.contains(LogicalKeyboardKey.space) || keysPressed.contains(LogicalKeyboardKey.arrowUp);

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

    velocity.y += gravity;

    if(hasJumped){
      if(isOnGround){
        velocity.y = -jumpSpeed;
        isOnGround = false;
      }
      hasJumped = false;
    }

    velocity.y = velocity.y.clamp(-jumpSpeed, terminalVelocity);

    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if(other is GroundBlock || other is PlatformBlock){
      if(intersectionPoints.length == 2){
        final mid = (intersectionPoints.elementAt(0) + intersectionPoints.elementAt(1)) / 2;

        final collisionNormal = absoluteCenter - mid;
        final separationDistance = (size.x / 2) - collisionNormal.length;
        collisionNormal.normalize();

        if(fromAbove.dot(collisionNormal) > 0.9){
          isOnGround = true;
        }

        position += collisionNormal.scaled(separationDistance);
      }
    }

    if(other is Star){
      other.removeFromParent();
    }

    if(other is WaterEnemy){
      hit();
    }

    super.onCollision(intersectionPoints, other);
  }

  void hit() {
    if(!hitByEnemy){
      hitByEnemy = true;
    }

    add(OpacityEffect.fadeOut(
      EffectController(
        alternate: true,
        duration: 0.1,
        repeatCount: 6,
      ),
    )..onComplete = (){
      hitByEnemy = false;
    });
  }
}
