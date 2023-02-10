import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:game_app/game_app.dart';

class Bullet extends SpriteAnimationComponent with HasGameRef<GameApp>, CollisionCallbacks {
  final double _speed = 450;
  Vector2 direction = Vector2(0, -1);

  @override
  Future<void>? onLoad() async {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('bullet.png'),
      SpriteAnimationData.sequenced(
        amount: 4,
        textureSize: Vector2(8, 16),
        stepTime: 0.2,
      ),
    );
    width = 16;
    height = 32;

    anchor = Anchor.center;
  }

  @override
  void onMount() {
    super.onMount();

    final shape = CircleHitbox.relative(
      0.4,
      parentSize: size,
      position: size / 2,
      anchor: Anchor.center,
    );
    add(shape);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

  }

  @override
  void update(double dt) {
    super.update(dt);
    position += direction * _speed * dt;
    if (position.y < 0) {
      removeFromParent();
    }
  }
}
