import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  Locale locale = Locale('en');

  void changeTheme(bool isDark) {
    if (isDark) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  void changeLocale(bool isArabic) {
    if (isArabic) {
      locale = Locale('ar');
    } else {
      locale = Locale('en');
    }
    notifyListeners();
  }
}
