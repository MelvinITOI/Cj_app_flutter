// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'dart:ui';

ThemeData buildThemeData() {
  final baseTheme = ThemeData(
    fontFamily: "Quicksand",
    primaryColor: primaryColor,
    primarySwatch: Colors.green,
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72),
      headline6: TextStyle(fontSize: 24),
      bodyText2: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black //here you can give the text color
        ),
  );

  return baseTheme.copyWith(
    primaryColor: primaryColor,
  );
}

const primaryFont = "Quicksand";
const primaryColor = const Color(0xFFd8f3dc);

final confirmBtnStyle = ElevatedButton.styleFrom(
    primary: Colors.green,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
