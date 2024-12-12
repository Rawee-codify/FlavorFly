

import 'package:flutter/material.dart';

class ThemeState {
  final ThemeData themeData;
  final bool isDark;

  ThemeState(this.themeData, this.isDark);

  static ThemeState get darkTheme => ThemeState(
        ThemeData.dark().copyWith(
            primaryColor: Colors.blueAccent,
            inputDecorationTheme: const InputDecorationTheme(
                fillColor: Colors.white, focusColor: Colors.lightBlue),
            textTheme: const TextTheme(
              labelLarge: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black),
              labelMedium: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white),
            )),
        true,
      );

  static ThemeState get lightTheme => ThemeState(
        ThemeData.light().copyWith(
            primaryColor: Colors.red,
            inputDecorationTheme: const InputDecorationTheme(
              fillColor: Colors.black,
              focusColor: Colors.blue,
            ),
            textTheme: const TextTheme(
              labelLarge: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.white),
              labelMedium: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.black),
            )),
        false,
      );
}
