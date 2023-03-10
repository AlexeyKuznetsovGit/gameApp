import 'package:flutter/material.dart';
import 'package:game_app/screens/game_screen.dart';
import 'package:game_app/screens/settings_screen.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Game title.
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Text(
                'Space Lancer',
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 20.0,
                      color: Colors.grey,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => GameScreen());
                },
                child: const Text('Play'),
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => SettingsScreen());
                },
                child: const Text('Settings'),
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Exit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
