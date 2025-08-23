import 'package:flutter/material.dart';

ThemeMode themeMode(bool value) {
  if (value == false) {
    return ThemeMode.light;
  } else {
    return ThemeMode.dark;
  }
}

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Colors.black),
      textStyle: WidgetStateProperty.all(const TextStyle(color: Colors.white)),
    ),
  ),
  brightness: Brightness.light,
  primaryColor: Colors.white70,
  textTheme: TextTheme(
    bodyLarge: const TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.grey[800]),
  ),
  cardColor: Colors.black12,
  primaryColorLight: Colors.black26,
  primaryColorDark: Colors.white,
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: Colors.blue.shade50),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white, //WidgetStateProperty.all(Colors.white),
      textStyle: const TextStyle(color: Colors.green),
    ),
  ),
  brightness: Brightness.dark,
  primaryColor: Colors.white10,
  textTheme: TextTheme(
    bodyLarge: const TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.grey[300]),
  ),
  cardColor: Colors.white12,
  primaryColorLight: Colors.white24,
  primaryColorDark: Colors.grey.shade900,
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.white12),
);
