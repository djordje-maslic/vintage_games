import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:vintage_games/domain/game.dart';
import 'package:vintage_games/infrastructure/http_games.dart';

import 'http_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group('fetchGame', () {
    test('returns an List<Game> if the http call completes successfully',
        () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(
        client.get(Uri.parse('https://www.freetogame.com/api/games'), headers: {
          "Accept": "application/json",
          "Access-Control-Allow-Origin": "*"
        },),
      ).thenAnswer(
        (_) async =>
            http.Response('[{"id":1,"title":"game1", "thumbnail":"url"}]', 200),
      );

      expect(await fetchGame(client), isA<List<Game>>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get(Uri.parse('https://www.freetogame.com/api/games'),
          headers: {
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*"
          },),).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchGame(client), throwsException);
    });
  });
}
