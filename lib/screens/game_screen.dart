import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game_app/game_app.dart';

import '../components/game_over.dart';
import '../components/pause_button.dart';
import '../components/pause_menu.dart';

class GameScreen extends StatelessWidget {
  GameScreen({Key? key}) : super(key: key);

  GameApp _gameApp = GameApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: GameWidget(
          game: _gameApp,
          // Initially only pause button overlay will be visible.
          initialActiveOverlays: const [PauseButton.id],
          overlayBuilderMap: {
            PauseButton.id: (BuildContext context, GameApp gameRef) => PauseButton(
                  gameRef: gameRef,
                ),
            PauseMenu.id: (BuildContext context, GameApp gameRef) => PauseMenu(
                  gameRef: gameRef,
                ),
            GameOverMenu.id: (BuildContext context, GameApp gameRef) => GameOverMenu(
                  gameRef: gameRef,
                ),
          },
        ),
      ),
    );
  }
}
