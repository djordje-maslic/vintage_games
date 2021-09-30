import 'package:flutter/material.dart';
import 'package:vintage_games/infrastructure/favorits_prefs_games.dart';

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
