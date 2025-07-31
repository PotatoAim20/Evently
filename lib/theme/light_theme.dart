import 'package:flutter/material.dart';
import 'package:evently/theme/theme_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme extends ThemeApp {
  @override
  Color get backgroundColor => Color(0xffF2FEFF);

  @override
  Color get primaryColor => Color(0xff5669FF);

  @override
  Color get textColor => Colors.black;

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
        padding: EdgeInsets.all(16.r),
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: BorderSide(color: Color(0xff5669FF)),
        ),
      ),
    ),

    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   backgroundColor: primaryColor,
    //   selectedItemColor: Colors.white,
    //   unselectedItemColor: Colors.white,
    //   showSelectedLabels: true,
    //   showUnselectedLabels: true,
    // ),
    textTheme: TextTheme(
      labelLarge: GoogleFonts.inter(fontSize: 22.sp, color: Color(0xff1C1C1C)),
      labelMedium: GoogleFonts.inter(
        fontSize: 20.sp,
        color: Color(0xff1C1C1C),
        fontWeight: FontWeight.w700,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 16.sp,
        color: Color(0xff1C1C1C),
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
