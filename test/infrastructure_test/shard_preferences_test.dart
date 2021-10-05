import 'package:test/test.dart';
import 'package:vintage_games/infrastructure/favorits_prefs_games.dart';

void main() {
  group('test favorits', () {
    test('test set favorits', () async {
      await setFavoritsMap(id: 1, favoritCheck: true);

      expect(await getFavoritsMap(id: 1), true);
    });
  });
}
