import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:star_quest/star_quest.dart';

import '../util/constants.dart';

class Enemy extends SpriteAnimationComponent with HasGameReference<StarQuestGame>{
  final Vector2 gridPosition;
  double xOffset;

  final Vector2 velocity = Vector2.zero();

  Enemy({
    required this.gridPosition,
    required this.xOffset,
  }) : super(size: Vector2.all(enemySize), anchor: Anchor.bottomLeft);

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('water_enemy.png'),
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.70,
        textureSize: Vector2.all(16),
      ),
    );

    position = Vector2((gridPosition.x * size.x) + xOffset,
        game.size.y - (gridPosition.y * size.y));

    add(RectangleHitbox(collisionType: CollisionType.passive));
    add(MoveEffect.by(
        Vector2(-2 * size.x, 0),
        EffectController(
          duration: 3,
          infinite: true,
          alternate: true,
        )));
  }

  @override
  void update(double dt) {
    velocity.x = game.objectSpeed;
    position += velocity * dt;
    if (position.x < -size.x || game.health <= 0) removeFromParent();

    super.update(dt);
  }
}