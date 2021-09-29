import 'package:flutter/material.dart';
import 'package:vintage_games/presentation/my_app.dart';
import 'package:vintage_games/presentation/theme/theme.dart';
import 'package:vintage_games/view_games.dart';


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
