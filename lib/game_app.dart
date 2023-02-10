import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game_app/components/player.dart';

import 'components/background.dart';
import 'components/bullet.dart';

class GameApp extends FlameGame with HasDraggables {
  GameApp();

  late Timer bulletSpawner;
  late Player _player;

  @override
  Future<void> onLoad() async {
    void _spawnBullet() {
      var bullet = Bullet();
      bullet.position = _player.position.clone();
      bullet.position.y *= 0.9;
      add(bullet);
    }

    bulletSpawner = Timer(2, onTick: _spawnBullet, repeat: true);
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

  @override
  void onMount() {
    super.onMount();
    bulletSpawner.start();
  }

  @override
  void update(double dt) {
    super.update(dt);

    bulletSpawner.update(dt);
  }

  @override
  void onRemove() {
    super.onRemove();

    bulletSpawner.stop();
  }
}
