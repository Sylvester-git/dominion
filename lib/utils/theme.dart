import 'package:flutter/material.dart';

ThemeData getTheme() {
  return ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(10),

      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),

      filled: true,
      fillColor: Colors.black,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      hintStyle: TextStyle(color: Colors.white),
    ),
  );
}
