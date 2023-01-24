import 'package:flutter/material.dart';
import 'package:game_app/components/pause_menu.dart';
import 'package:game_app/game_app.dart';

class PauseButton extends StatelessWidget {
  static const String id = 'PauseButton';
  final GameApp gameRef;

  const PauseButton({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: TextButton(
        child: const Icon(
          Icons.pause_rounded,
          color: Colors.white,
        ),
        onPressed: () {
          gameRef.pauseEngine();
          gameRef.overlays.add(PauseMenu.id);
          gameRef.overlays.remove(PauseButton.id);
        },
      ),
    );
  }
}