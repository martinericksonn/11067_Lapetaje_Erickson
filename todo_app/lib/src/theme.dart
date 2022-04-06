// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionColor: Colors.black45,
      selectionHandleColor: Colors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: TextStyle(color: Colors.black45),
      labelStyle: TextStyle(color: Colors.black45),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
    primaryColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.white,
      secondary: Colors.black, // Your accent color
    ),
  );
}
