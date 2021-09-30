import 'package:test/test.dart';
import 'package:vintage_games/domain/game.dart';
import 'package:vintage_games/infrastructure/search_games.dart';

void main() {
  test(
    'test search when finds game',
    () {
      expect(
        searchGames('game1', _listOfGames),
        [
          Game(
            title: 'Game1',
            thumbnail: 'url',
            id: 1,
          )
        ],
      );
    },
  );

  test(
    "test search when don't find any games",
    () {
      expect(
        searchGames('game999', _listOfGames),
        [],
      );
    },
  );
}


List<Game> _listOfGames = [
  Game(
    title: 'Game1',
    thumbnail: 'url',
    id: 1,
  ),
  Game(
    title: 'Game2',
    thumbnail: 'url',
    id: 2,
  ),
  Game(
    title: 'Game3',
    thumbnail: 'url',
    id: 3,
  ),
  Game(
    title: 'Game4',
    thumbnail: 'url',
    id: 4,
  ),
  Game(
    title: 'Game5',
    thumbnail: 'url',
    id: 5,
  ),
  Game(
    title: 'Game6',
    thumbnail: 'url',
    id: 6,
  ),
  Game(
    title: 'Game7',
    thumbnail: 'url',
    id: 7,
  ),
  Game(
    title: 'Game8',
    thumbnail: 'url',
    id: 8,
  ),
  Game(
    title: 'Game9',
    thumbnail: 'url',
    id: 9,
  ),
];
