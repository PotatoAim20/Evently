import 'package:evently/first_screen.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/theme/dark_theme.dart';
import 'package:evently/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(Evently());
}

class Evently extends StatelessWidget {
  Evently({super.key});

  final lightThemeApp = LightTheme();
  final darkThemeApp = DarkTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightThemeApp.themeData,
      darkTheme: darkThemeApp.themeData,
      themeMode: ThemeMode.light,

      debugShowCheckedModeBanner: false,

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('en'),

      routes: {FirstScreen.routeName: (context) => FirstScreen()},
      initialRoute: FirstScreen.routeName,
    );
  }
}
