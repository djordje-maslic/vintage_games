import 'package:flutter/material.dart';
import 'package:vintage_games/view_games.dart';

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

class BuildImages extends StatefulWidget {
  final List<Game> listOfGamesNew;
  final Future<List<Game>> fatchGame;
  const BuildImages({
    required this.listOfGamesNew,
    required this.fatchGame,
    Key? key,
  }) : super(key: key);

  @override
  State<BuildImages> createState() => _BuildImagesState();
}

class _BuildImagesState extends State<BuildImages> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: FutureBuilder<List<Game>>(
          future: widget.fatchGame,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                ),
                itemCount: widget.listOfGamesNew.length,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    key: ValueKey(widget.listOfGamesNew[index].id),
                    onTap: () async {
                      final bool checkFavorits = await getFavoritsMap(
                          id: widget.listOfGamesNew[index].id);
                      {
                        setState(() {
                          setFavoritsMap(
                              id: widget.listOfGamesNew[index].id,
                              favoritCheck: !checkFavorits);
                        });
                      }
                    },
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(widget.listOfGamesNew[index].title),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.18,
                              child: FittedBox(
                                child: Image.network(
                                  widget.listOfGamesNew[index].thumbnail,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, object, stt) {
                                    return const Text('error');
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        AddFavoritesIcon(
                          gameId: widget.listOfGamesNew[index].id,
                        )
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return Text(
                'error',
                style: TextStyle(fontSize: MediaQuery.of(context).size.width),
              );
            }
          },
        ),
      ),
    );
  }
}

class AddFavoritesIcon extends StatelessWidget {
  final int gameId;
  const AddFavoritesIcon({required this.gameId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: getFavoritsMap(id: gameId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == false) {
            return const Positioned(
              bottom: 25,
              right: 10,
              child: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            );
          } else {
            return const Positioned(
              bottom: 25,
              right: 10,
              child: Icon(Icons.favorite, color: Colors.red),
            );
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
