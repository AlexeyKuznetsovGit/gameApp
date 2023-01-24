import 'package:flame/components.dart';
import 'package:game_app/components/star.dart';
import 'package:game_app/game_app.dart';

class Background extends Component with HasGameRef<GameApp> {
  int nbStars;

  Background(this.nbStars);

  @override
  Future<void>? onLoad() {
    for (int i = 0; i < nbStars; i++) {
      add(Star());
    }
  }
}