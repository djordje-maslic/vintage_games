import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData.light().copyWith(
    indicatorColor: Colors.yellowAccent,
    colorScheme: const ColorScheme(
      primary: Colors.yellowAccent,
      primaryVariant: Colors.black,
      secondary: Colors.yellowAccent,
      secondaryVariant: Colors.yellowAccent,
      surface: Colors.yellowAccent,
      background: Colors.yellowAccent,
      error: Colors.yellowAccent,
      onPrimary: Colors.yellowAccent,
      onSecondary: Colors.yellowAccent,
      onSurface: Colors.yellowAccent,
      onBackground: Colors.yellowAccent,
      onError: Colors.yellowAccent,
      brightness: Brightness.light,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.yellowAccent,
      selectionColor: Colors.yellowAccent,
      selectionHandleColor: Colors.yellowAccent,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      titleTextStyle: TextStyle(color: Colors.yellowAccent),
    ),
    canvasColor: Colors.yellowAccent,
    backgroundColor: Colors.yellowAccent[100],
    scaffoldBackgroundColor: Colors.yellowAccent[100],
    cardColor: Colors.yellowAccent,
  );
}
