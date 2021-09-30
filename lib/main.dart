import 'package:flutter/material.dart';
import 'package:vintage_games/infrastructure/favorits_prefs_games.dart';
import 'package:vintage_games/presentation/my_app.dart';
import 'package:vintage_games/presentation/theme/theme.dart';


Future main()async {
  WidgetsFlutterBinding.ensureInitialized();

   await initPreferances();

   runApp(
      MaterialApp(
        theme: themeData(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Skill Builder',
        home: MyApp(),
      ),
    );
}
