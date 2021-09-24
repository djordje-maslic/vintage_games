
class BrucesGame {
  final String name;
  final String image;

  const BrucesGame({required this.name, required this.image});
}

const List<BrucesGame> listOfGames = [
  BrucesGame(name: 'Game1', image: 'url'),
  BrucesGame(name: 'Game2', image: 'url'),
  BrucesGame(name: 'Game3', image: 'url'),
  BrucesGame(name: 'Game4', image: 'url'),
  BrucesGame(name: 'Game5', image: 'url'),
  BrucesGame(name: 'Game6', image: 'url'),
  BrucesGame(name: 'Game7', image: 'url'),
  BrucesGame(name: 'Game8', image: 'url'),
  BrucesGame(name: 'Game9', image: 'url'),
];

List<BrucesGame> searchGames(String input, List<BrucesGame> list) {
  final List<BrucesGame> result = [];

  for (int i = 0; i < list.length; i++) {
    if (list[i].name.toLowerCase().contains(
          input.toLowerCase(),
        )) {
      result.add(list[i]);
    }
  }

  return result;
}
