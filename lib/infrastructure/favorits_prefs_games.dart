import 'package:shared_preferences/shared_preferences.dart';



Future<SharedPreferences> initPreferances() async {
  return SharedPreferences.getInstance();
}

Future<void> setFavoritsMap({
  required int id,
  required bool favoritCheck,
}) async {
  final SharedPreferences _preferances = await initPreferances();
  await _preferances.setBool(id.toString(), favoritCheck);
}

Future<bool> getFavoritsMap({required int id}) async {
  final SharedPreferences _preferances = await initPreferances();
  return _preferances.getBool(id.toString()) ?? false;
}
