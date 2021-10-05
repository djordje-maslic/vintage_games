import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData.light().copyWith(
    indicatorColor: Colors.yellowAccent,
    colorScheme: ColorScheme(
      primary: Colors.yellowAccent,
      primaryVariant: Colors.black,
      secondary: Colors.blue,
      secondaryVariant: Colors.yellowAccent[700] ?? Colors.yellowAccent,
      surface: Colors.yellowAccent,
      background: Colors.yellowAccent,
      error: Colors.yellowAccent,
      onPrimary: Colors.blue[600] ?? Colors.blue,
      onSecondary: Colors.blue,
      onSurface: Colors.blue,
      onBackground: Colors.blue,
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
    cardColor: Colors.blue,
  );
}
