import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/player.dart';

import 'components/background.dart';

class GameApp extends FlameGame with HasDraggables {
  GameApp();

  late Player _player;

  @override
  Future<void> onLoad() async {
    await images.loadAll(['bullet.png', 'enemy.png', 'explosion.png', 'player.png', 'stars.png', 'start.png']);
    add(Background(50));
    final joystick = JoystickComponent(
      anchor: Anchor.bottomLeft,
      position: Vector2(30, size.y - 30),
      // size: 100,
      background: CircleComponent(
        radius: 50,
        paint: Paint()..color = Colors.white.withOpacity(0.5),
      ),
      knob: CircleComponent(radius: 25),
    );
    add(joystick);

    _player = Player(joystick: joystick);
    add(_player);
  }

  void reset() {
    _player.reset();
  }

}
