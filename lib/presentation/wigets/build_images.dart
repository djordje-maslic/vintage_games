import 'package:flutter/material.dart';
import 'package:vintage_games/domain/game.dart';
import 'package:vintage_games/infrastructure/favorits_prefs_games.dart';
import 'package:vintage_games/presentation/wigets/add_favorites_icon.dart';

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
                        id: widget.listOfGamesNew[index].id,
                      );
                      {
                        setState(
                          () {
                            setFavoritsMap(
                              id: widget.listOfGamesNew[index].id,
                              favoritCheck: !checkFavorits,
                            );
                          },
                        );
                      }
                    },
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(widget.listOfGamesNew[index].title),
                            Expanded(
                              child: Image.network(
                                widget.listOfGamesNew[index].thumbnail,
                                fit: BoxFit.fill,
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
              return const Padding(
                padding: EdgeInsets.all(38.0),
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            } else {
              return Text(
                'Check internet conection...',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.shortestSide * 0.1,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
