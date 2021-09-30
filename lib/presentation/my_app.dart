import 'package:flutter/material.dart';
import 'package:vintage_games/domain/game.dart';
import 'package:vintage_games/infrastructure/http_games.dart';
import 'package:vintage_games/infrastructure/search_games.dart';
import 'package:vintage_games/presentation/wigets/build_images.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController controller = TextEditingController();
  List<Game> list = [];

  late Future<List<Game>> futureGame;

  @override
  void initState() {
    super.initState();
    futureGame = fetchGame();
    futureGame.then((value) => list.addAll(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: CustomScrollView(
          slivers: [
            DefaultTabController(
              length: 1,
              child: SliverAppBar(
                flexibleSpace: FlexibleSpaceBar(
                  background: Icon(
                    Icons.sports_esports_outlined,
                    size: MediaQuery.of(context).size.shortestSide * 0.8,
                  ),
                ),
                backgroundColor: Colors.blue[900],
                centerTitle: true,
                title: Text(
                  "Bruce’s Retro Games",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: MediaQuery.of(context).size.shortestSide * 0.08,
                  ),
                ),
                expandedHeight: 250,
                bottom: TabBar(
                  tabs: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          border: Border.all(),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: controller,
                            onChanged: (input) {
                              setState(() {
                                futureGame.then(
                                  (value) => list = searchGames(input, value),
                                );
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: 'search games',
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                floating: true,
              ),
            ),
            BuildImages(
              listOfGamesNew: list,
              fatchGame: futureGame,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
