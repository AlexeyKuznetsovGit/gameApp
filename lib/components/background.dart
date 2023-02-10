import 'dart:math';

import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:game_app/components/star.dart';
import 'package:game_app/game_app.dart';

class Background extends SpriteAnimationComponent with HasGameRef<GameApp> {
  final int nbStars;

  Background(this.nbStars);

  @override
  Future<void>? onLoad() async {
    for (int i = 0; i < nbStars; i++) {
      add(Star());
    }
  }
}
