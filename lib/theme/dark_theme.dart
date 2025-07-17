import 'package:flutter/material.dart';
import 'package:evently/theme/theme_app.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkTheme extends ThemeApp {
  @override
  Color get backgroundColor => Color(0xff101127);

  @override
  Color get primaryColor => Color(0xff5669FF);

  @override
  Color get textColor => Colors.white;

  @override
  ThemeData get themeData => ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColor,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16),
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    textTheme: TextTheme(
      labelLarge: GoogleFonts.inter(fontSize: 22, color: Colors.white),
      labelMedium: GoogleFonts.inter(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: GoogleFonts.inter(fontSize: 16, color: Colors.white),
    ),
  );
}
