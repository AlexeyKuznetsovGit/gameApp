import 'dart:math';

import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:game_app/game_app.dart';

class Star extends SpriteAnimationComponent with HasGameRef<GameApp> {
  static const speed = 10;

  Star({super.animation, super.position}) : super();

  late SpriteSheet spriteSheet;

  void oneRowStars() async {
    spriteSheet = SpriteSheet(image: await Images().load("stars.png"), srcSize: Vector2(9.0, 9.0));
    animation = spriteSheet.createAnimation(row: Random().nextInt(3) + 1, stepTime: (Random().nextInt(50) / 10) + 0.2);
    var size = Random().nextInt(10).toDouble() + 10;

    final starGap = gameRef.size.y;
    width = size;
    height = size;
    var x = Random().nextInt((gameRef.size.toRect().width - size).toInt()).toDouble();
    var y = starGap + Random().nextInt((gameRef.size.toRect().width - size).toInt()).toDouble();
    gameRef.add(Star());
    position = Vector2(x, y);
  }

  void initStars() async {
    spriteSheet = SpriteSheet(image: await Images().load("stars.png"), srcSize: Vector2(9.0, 9.0));
    animation = spriteSheet.createAnimation(row: Random().nextInt(3) + 1, stepTime: (Random().nextInt(50) / 10) + 0.2);
    var size = Random().nextInt(10).toDouble() + 10;
    var x = Random().nextInt((gameRef.size.toRect().width - size).toInt()).toDouble();
    var y = Random().nextInt((gameRef.size.toRect().height - size).toInt()).toDouble();

    width = size;
    height = size;
    position = Vector2(x, y);
    anchor = Anchor.center;
  }

  @override
  Future<void>? onLoad() async {
    initStars();
  }

  @override
  void update(double dt) {
    super.update(dt);
    y += dt * speed;
    if (y >= gameRef.size.y) {
      removeFromParent();
      oneRowStars();
    }
  }
}
