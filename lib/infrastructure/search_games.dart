import 'package:vintage_games/domain/game.dart';

List<Game> searchGames(String input, List<Game> list) {
  final List<Game> result = [];

  for (int i = 0; i < list.length; i++) {
    if (list[i].title.toLowerCase().contains(
          input.toLowerCase(),
        )) {
      result.add(list[i]);
    }
  }

  return result;
}
