import 'package:flame/components.dart';
import 'package:game_app/game_app.dart';

class Player extends SpriteAnimationComponent with HasGameRef<GameApp> {
  JoystickComponent joystick;

  Player({required this.joystick});

  @override
  Future<void> onLoad() async {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('player.png'),
      SpriteAnimationData.sequenced(
        amount: 4,
        textureSize: Vector2(32, 48),
        stepTime: 0.2,
      ),
    );
    position = gameRef.size / 2;
    width = 80;
    height = 120;
    anchor = Anchor.center;
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (!joystick.delta.isZero()) {
      position.add(joystick.relativeDelta * 250 * dt);
    }

    position.clamp(
      Vector2.zero() + size / 2,
      gameRef.size - size / 2,
    );
  }

  void reset() {
    position = gameRef.size / 2;
  }
}
