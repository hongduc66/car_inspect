import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    fontFamily: GoogleFonts.mulish().fontFamily,
    primaryColor: Colors.blueAccent,
    accentColor: Colors.purpleAccent,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 24,
        height: 1.3,
        fontWeight: FontWeight.w900,
        color: Colors.white,
      ),
      headline4: TextStyle(
        fontSize: 22,
        height: 1.3,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),
      headline5: TextStyle(
        fontSize: 20,
        height: 1.3,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headline6: TextStyle(
        fontSize: 18,
        height: 1.3,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        height: 1.3,
        color: Colors.black,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.black,
    ),
  );
}
