import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:vintage_games/domain/game.dart';

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
