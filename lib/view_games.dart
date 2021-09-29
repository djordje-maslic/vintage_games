import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


List<Game> listOfGames = [
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

class Game {
  final int id;
  final String title;
  final String thumbnail;

  Game({
    required this.id,
    required this.title,
    required this.thumbnail,
  });

  factory Game.fromJson(dynamic jeson) {
    return Game(
      id: jeson['id'] as int,
      title: jeson['title'] as String,
      thumbnail: jeson['thumbnail'] as String,
    );
  }
}

List<Game> parseGame(String responsBody) {
  final parsed = jsonDecode(responsBody) as List<dynamic>;
  return parsed
      .map<Game>((json) => Game.fromJson(json))
      .toList()
      .sublist(0, 50);
}

Future<List<Game>> fetchGame() async {
  final http.Client client = http.Client();
  final http.Response response =
      await client.get(Uri.parse('https://www.freetogame.com/api/games'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return compute(parseGame, response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<SharedPreferences> initPreferances() async {
  return SharedPreferences.getInstance();
}

Future<void> setFavoritsMap(
    {required int id, required bool favoritCheck}) async {
  final SharedPreferences _preferances = await initPreferances();
  await _preferances.setBool(id.toString(), favoritCheck);
}

Future<bool> getFavoritsMap({required int id}) async {
  final SharedPreferences _preferances = await initPreferances();
  return _preferances.getBool(id.toString()) ?? false;
}
