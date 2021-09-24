import 'package:test/test.dart';
import 'package:vintage_games/view_games.dart';

void main() {

  test(
    'test search when finds game',
    () {
      expect(
        searchGames('game1',listOfGames),
       [ const BrucesGame(name: 'Game1', image: 'url')],
      );
    },
  );

  test(
    "test search when don't find any games",
    () {
      expect(
        searchGames('game999',listOfGames),
       [],
      );
    },
  );
}
